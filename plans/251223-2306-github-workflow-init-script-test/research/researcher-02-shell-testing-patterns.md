# Research Report: Shell Script Testing Patterns & CI/CD Best Practices

**Date:** 2025-12-23
**Sources Consulted:** 10+ authoritative references
**Search Terms:** shell testing frameworks, bash error handling, CI/CD patterns, mocking/stubbing, dependency checking

---

## Executive Summary

Shell script testing requires explicit frameworks (BATS, shUnit2, ShellSpec) rather than ad-hoc approaches. Dependency checkers demand strict error handling via `set -euo pipefail` + trap patterns. Mock/stub tools (bash_shell_mock, stub.sh, bats-mock) enable testing without system tools. Exit codes must be checked explicitly in CI—non-zero exits fail entire jobs unless caught. YAGNI principle: use minimal test framework matching your needs; Don't test what you don't own.

---

## Key Findings

### 1. Testing Framework Selection

**BATS (Bash Automated Testing System)**
- TAP-compliant, Bash-only, simplest learning curve
- Popular in production (most GitHub stars)
- Limitation: cannot mock via shell aliases; use bats-mock library for stubs
- Source: [ShellSpec Comparison](https://shellspec.info/comparison.html), [HackerOne Guide](https://www.hackerone.com/blog/testing-bash-scripts-bats-practical-guide)

**shUnit2**
- xUnit-compatible, works with any POSIX shell
- Minimal dependencies, excellent for portability
- Lacks built-in mocking; workaround: use PATH manipulation for stubs
- Lifecycle: `oneTimeSetUp()` → `setUp()` → test → `tearDown()`
- Source: [GitHub shunit2](https://github.com/kward/shunit2)

**ShellSpec**
- Pure POSIX shell, supports nested blocks + parameterized tests
- Native mocking/stubbing support (critical advantage)
- Best for complex dependency scenarios
- Source: [ShellSpec Docs](https://shellspec.info/comparison.html)

**Consensus:** shUnit2 for general use (features+portability), BATS for simplicity, ShellSpec for mocking-heavy tests.

### 2. Dependency Checking Patterns

**Error Handling Requirement:**
```bash
#!/bin/bash
set -euo pipefail
trap 'echo "Error on line $LINENO: $(caller)"' ERR

# Dependency array pattern
REQUIRED_DEPS=(docker node python3)
for cmd in "${REQUIRED_DEPS[@]}"; do
  if ! command -v "$cmd" &>/dev/null; then
    echo "FATAL: $cmd not found"
    exit 1
  fi
done
```

**Exit Code Semantics:**
- Exit 0 = success; non-zero = failure
- CI pipelines halt on non-zero exit unless caught (`|| true`)
- Pipelines default return last command's exit code; `pipefail` fixes this
- Source: [Dojo Five CI Exit Codes](https://dojofive.com/blog/how-ci-pipeline-scripts-and-exit-codes-interact/)

**Optional vs Required Dependencies:**
```bash
# Optional: ignore failure
optional_check() {
  command -v optional_tool &>/dev/null || echo "Warning: optional_tool not found"
}

# Required: fail hard
required_check() {
  if ! command -v required_tool &>/dev/null; then
    echo "FATAL: required_tool missing" >&2
    exit 1
  fi
}
```

### 3. Strict Mode (`set -euo pipefail`)

| Flag | Effect | Caveat |
|------|--------|--------|
| `-e` | Exit on error | Ignores errors in conditionals, subshells, pipelines (use with `-o pipefail`) |
| `-u` | Fail on unbound var | Catches typos in variable names |
| `-o pipefail` | Fail if any pipe stage fails | Must pair with `-e` to be effective |
| `-x` | Debug: echo commands | Use for CI logs only |

**Critical Limitation:** `((counter++))` fails when counter=0 (arithmetic returns 0). Workaround: `((counter++)) || true`

Source: [Namehero Best Practices](https://www.namehero.com/blog/how-to-use-set-e-o-pipefail-in-bash-and-why/), [Xygeni Analysis](https://xygeni.io/blog/set-e-in-bash-why-your-script-fails-without-warning/)

### 4. Mock/Stub Patterns for Unavailable Tools

**PATH Manipulation (Portable)**
```bash
# Create stub directory
mkdir -p stubs
echo '#!/bin/bash
echo "stubbed output"
exit 0' > stubs/missing_tool
chmod +x stubs/missing_tool

# Prepend to PATH in test
export PATH="$(pwd)/stubs:$PATH"
missing_tool  # Runs stub, not system tool
```

**Tool Options:**
- **bash_shell_mock:** Full mock framework; records call counts/args
  - Source: [Capital One bash_shell_mock](https://github.com/capitalone/bash_shell_mock)
- **stub.sh:** Minimal stub helper; validates call patterns
  - Source: [stub.sh](https://github.com/jimeh/stub.sh)
- **bats-mock:** BATS-specific; plan-based mocking
  - Source: [bats-mock](https://github.com/jasonkarns/bats-mock)

**Function Stubbing (No Dependencies)**
```bash
original_command() { /usr/bin/real_command "$@"; }

# In test: replace function
original_command() { echo "test output"; return 0; }
```

### 5. Test Isolation & Non-Modular Scripts

**Isolation Issues:**
- Aliases, functions, bash options, variables leak between tests
- Solution: wrap each test in subshell or use `unset` cleanup
- setUp/tearDown lifecycle prevents contamination

**Non-Modular Scripts:**
- Many scripts execute sequentially, not independently
- Recommendation: selectively disable assertions for specific lines
- Consider refactoring into functions (better testability)
- Source: [LeadingAgile Part Three](https://www.leadingagile.com/2018/10/unit-testing-shell-scriptspart-three/)

---

## Implementation Recommendations

### Quick Pattern (Dependency Checker Init Script)

```bash
#!/bin/bash
set -euo pipefail
trap 'echo "Init failed on line $LINENO" >&2; exit 1' ERR

check_dependencies() {
  local missing=()
  local deps=(git node npm docker)

  for dep in "${deps[@]}"; do
    if ! command -v "$dep" &>/dev/null; then
      missing+=("$dep")
    fi
  done

  if [[ ${#missing[@]} -gt 0 ]]; then
    echo "FATAL: Missing required tools: ${missing[*]}" >&2
    return 1
  fi
  return 0
}

check_dependencies
echo "All dependencies OK"
```

### GitHub Actions Test Integration

```yaml
name: Test Init Script

on: [push]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3

      - name: Run tests with shUnit2
        run: |
          ./scripts/init.sh  # Exit non-zero on failure
          echo "Init script validation passed"
        shell: bash

      - name: Mock unavailable tool
        run: |
          mkdir -p ./mocks
          echo '#!/bin/bash' > ./mocks/unavailable_cmd
          echo 'exit 0' >> ./mocks/unavailable_cmd
          chmod +x ./mocks/unavailable_cmd
          PATH="$(pwd)/mocks:$PATH" ./scripts/test_init.sh
        shell: bash
```

### Testing Checklist

- [ ] Use `set -euo pipefail` + trap in entry scripts
- [ ] Validate required dependencies before continuing
- [ ] Return explicit exit codes (0 success, 1+ failure)
- [ ] Mock external tools via PATH manipulation or stubs
- [ ] Use setUp/tearDown for test isolation
- [ ] Test both success and failure paths
- [ ] Run ShellCheck for syntax validation
- [ ] Document exit code semantics in README

---

## References

**Testing Frameworks:**
- [ShellSpec Framework Comparison](https://shellspec.info/comparison.html)
- [shUnit2 GitHub](https://github.com/kward/shunit2)
- [BATS Testing Guide](https://www.hackerone.com/blog/testing-bash-scripts-bats-practical-guide)
- [Testing in Bash Comparison](https://github.com/dodie/testing-in-bash)

**Error Handling & Exit Codes:**
- [Namehero: set -e pipefail](https://www.namehero.com/blog/how-to-use-set-e-o-pipefail-in-bash-and-why/)
- [RedHat: Bash Error Handling](https://www.redhat.com/sysadmin/bash-error-handling)
- [Xygeni: set -e Pitfalls](https://xygeni.io/blog/set-e-in-bash-why-your-script-fails-without-warning/)
- [CI Exit Code Interaction](https://dojofive.com/blog/how-ci-pipeline-scripts-and-exit-codes-interact/)

**Mocking & Stubbing:**
- [bash_shell_mock](https://github.com/capitalone/bash_shell_mock)
- [stub.sh](https://github.com/jimeh/stub.sh)
- [bats-mock](https://github.com/jasonkarns/bats-mock)
- [Bourne Shell Unit Testing](https://github.com/zofrex/bourne-shell-unit-testing)

**CI/CD Patterns:**
- [Trendyol: Dependency Check at CI/CD](https://medium.com/trendyol-tech/dependency-check-at-ci-cd-pipeline-17020e15b391)
- [Expedia: DevOps with Bash](https://medium.com/expedia-group-tech/using-bash-for-devops-7046eed1aa63)

---

## Unresolved Questions

1. **Project-specific:** Does peraichi-ai-agent-starter init script need mock testing for Docker/Node, or real dependency validation only?
2. **Framework choice:** Is minimal PATH-stubbing sufficient, or does complexity justify BATS + bats-mock investment?
3. **CI strategy:** Should init validation run in GitHub Actions setup step (pre-check) or in job step (fail-safe)?
4. **Non-modular considerations:** Are init script's sequential checks testable in isolation, or require integration tests?
