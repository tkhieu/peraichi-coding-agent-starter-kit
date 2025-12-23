# GitHub Actions Best Practices for Shell Script Testing in CI/CD

## 1. Matrix Strategy for Multi-OS Testing (Ubuntu, macOS)

### Structure
The matrix strategy generates Cartesian product of all variable combinations, eliminating workflow duplication:

```yaml
jobs:
  test:
    runs-on: ${{ matrix.os }}
    strategy:
      matrix:
        os: [ubuntu-latest, macos-latest]
        shell-version: [bash]
      fail-fast: false
      max-parallel: 2
```

### Key Features
- **Fail-fast**: Enabled by default; disable with `fail-fast: false` to continue testing if one OS fails
- **max-parallel**: Limit concurrent jobs to control resource consumption (e.g., `max-parallel: 2`)
- **include/exclude**: Fine-tune combinations without hardcoding; include specific OS-dependent configs, exclude irrelevant ones

### OS-Specific Dependency Management
Use conditional steps based on `matrix.os` to handle OS differences:
```yaml
- name: Install dependencies (Ubuntu)
  if: runner.os == 'Linux'
  run: |
    sudo apt-get update
    sudo apt-get install -y required-package

- name: Install dependencies (macOS)
  if: runner.os == 'macOS'
  run: brew install required-package
```

[Source: Matrix strategy basics](https://runs-on.com/github-actions/the-matrix-strategy/) | [Advanced matrix usage](https://devopsdirective.com/posts/2025/08/advanced-github-actions-matrix/)

## 2. Testing Shell Scripts That Check System Dependencies

### ShellCheck for Static Analysis
Lint shell scripts before runtime to catch errors early:

```yaml
- name: Validate shell scripts
  uses: ludeeus/action-shellcheck@master
  with:
    scandir: './scripts'
    severity: error
    check_together: 'yes'
```

Prevents SC1090/SC1091 errors (source file not found) by checking all files together.

### Unit Testing Framework
Use `Generate Shell Script Unit Testing` action with shunit2 or bash-spec-2:
- Place test cases in `tests/init-script.shunit2` (test format specified by framework)
- Action automatically runs unit tests without manual sourcing
- Validates functions, return codes, and variable assignments

### Dependency Validation Approach
Create wrapper script to validate dependencies before execution:

```bash
# In shell script under test
check_command_exists() {
  command -v "$1" >/dev/null 2>&1 || {
    echo "Error: $1 not found" >&2
    return 1
  }
}

# Test in CI
check_command_exists "bash"
check_command_exists "git"
```

GitHub Actions runner images include common tools (git, curl, node); explicitly test for optional dependencies only.

[Source: ShellCheck action](https://github.com/marketplace/actions/shellcheck) | [Unit testing generation](https://github.com/marketplace/actions/generate-shell-script-unit-testing) | [Local testing with act](https://github.com/nektos/act)

## 3. Caching Strategies for Package Dependencies

### APT Packages (Ubuntu)
Use dedicated caching action to avoid re-installation overhead:

```yaml
- name: Cache APT packages
  uses: awalsh128/cache-apt-pkgs-action@latest
  with:
    packages: build-essential curl git
    version: 1.0

# Or manual with actions/cache
- uses: actions/cache@v4
  with:
    path: /var/cache/apt
    key: ${{ runner.os }}-apt-${{ hashFiles('**/requirements.apt') }}
```

**Performance tip**: Disable initramfs and manpage updates to save ~40 seconds:
```bash
sudo DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y package
```

### Homebrew Packages (macOS)
Cache compiled binaries between runs:

```yaml
- name: Cache Homebrew packages
  uses: actions/cache@v4
  with:
    path: ~/Library/Caches/Homebrew
    key: ${{ runner.os }}-brew-${{ hashFiles('**/requirements.brew') }}

# Or use dedicated action
- uses: tecolicom/actions-use-homebrew-tools@v1
  with:
    tools: jq,yq
```

### Cache Key Strategy
Use `hashFiles()` to invalidate cache when dependencies change:
```yaml
key: ${{ runner.os }}-${{ hashFiles('package-lock.json', 'requirements.apt') }}
restore-keys: |
  ${{ runner.os }}-
```

### Cache Limits
- Max 5GB per repo; oldest/least-accessed (~7 days) evicted first
- Keyed by exact match; restore-keys provide fallback

[Source: Official cache action](https://github.com/actions/cache) | [APT caching](https://github.com/marketplace/actions/cache-apt-packages) | [Homebrew caching](https://github.com/marketplace/actions/install-and-cache-homebrew-tools)

## 4. Workflow File Structure Best Practices

### Standard Layout
```yaml
name: Test Shell Scripts

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main]

defaults:
  run:
    shell: bash
    working-directory: ./scripts

jobs:
  shellcheck:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run ShellCheck
        uses: ludeeus/action-shellcheck@master

  test:
    needs: shellcheck
    runs-on: ${{ matrix.os }}
    strategy:
      matrix:
        os: [ubuntu-latest, macos-latest]
    steps:
      - uses: actions/checkout@v4
      - name: Setup dependencies
        run: |
          [dependency installation]
      - name: Run unit tests
        run: ./run-tests.sh
```

### 2025 Enhancement: YAML Anchors
Reduce duplication with anchors (newly available):

```yaml
defaults: &defaults
  run:
    shell: bash

jobs:
  test-linux:
    <<: *defaults
    runs-on: ubuntu-latest
```

### Key Configuration Guidelines
1. **Use `defaults.run`** to set shell & working-directory globally (reduces per-step config)
2. **Set `shell: bash`** explicitly for consistency across OS runners
3. **Use `-e -o pipefail`** flags in shell to fail on errors:
   ```yaml
   run: set -euo pipefail; ./script.sh
   ```
4. **Separate concerns**: Distinct jobs for lint → build → test → deploy
5. **Use `needs`** for job dependencies (runs sequentially when needed)
6. **Use `secrets` for credentials**: Reference as `${{ secrets.TOKEN }}`

### Recent Platform Improvements (2025)
- arm64-hosted runners for public repos
- macOS 15 and Windows 2025 images GA
- Actions Performance Metrics now GA for performance tracking
- GitHub Actions minutes usage: 11.5B in 2025 (35% YoY increase)

[Source: Workflow syntax docs](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions) | [YAML anchors feature](https://github.blog/changelog/2025-09-18-actions-yaml-anchors-and-non-public-workflow-templates/) | [Creating workflows](https://docs.github.com/en/actions/tutorials/create-an-example-workflow)

## Summary

**Matrix Strategy**: Use `strategy.matrix` with `fail-fast: false` for parallel multi-OS testing; conditionally manage OS-specific dependencies.

**Dependency Testing**: Combine ShellCheck (static) + unit test frameworks (dynamic) + dependency validation functions in shell scripts.

**Caching**: Use hashFiles-keyed caches with dedicated actions (awalsh128/cache-apt-pkgs, tecolicom/actions-use-homebrew-tools) to avoid 40+ second install overhead.

**Workflow Structure**: Leverage `defaults.run`, YAML anchors, `needs` for dependencies, and explicit `shell: bash` for clarity and consistency.

---

## Unresolved Questions

1. What is the exact overhead reduction percentage when using caching vs. fresh installs in typical CI/CD workflows?
2. Are there performance differences between `actions/cache@v4` and dedicated caching actions (e.g., cache-apt-pkgs)?
3. How do GitHub's latest Performance Metrics tools integrate with existing shell script testing workflows?
