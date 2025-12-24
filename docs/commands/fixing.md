# Fixing Commands

Commands for debugging and fixing issues.

## Overview

| Command | Focus | Depth | Use Case |
|---------|-------|-------|----------|
| `/fix:fast` | Quick | Surface | Obvious issues |
| `/fix:hard` | Deep | Root cause | Complex bugs |
| `/fix:test` | Tests | Targeted | Test failures |
| `/fix:ci` | CI/CD | Pipeline | Build failures |
| `/fix:types` | Types | TypeScript | Type errors |
| `/fix:ui` | UI | Visual | UI bugs |
| `/fix:logs` | Logs | Analysis | Log-based debug |
| `/fix:parallel` | Multiple | Parallel | Many issues |

## Commands

### /fix:fast

Quick fix for obvious issues.

```
/fix:fast Button click not working
```

**Process:**
1. Searches for related code
2. Identifies likely cause
3. Applies fix
4. Runs quick test

**Best for:** Typos, missing imports, obvious bugs.

### /fix:hard

Deep investigation for complex bugs.

```
/fix:hard Users can't login after password reset
```

**Process:**
1. Traces backward through call stack
2. Identifies all related code paths
3. Analyzes data flow
4. Creates hypothesis
5. Tests hypothesis
6. Applies fix with defense-in-depth

**Debugging methodology:**
```
Error Location
     │
     ▼
Backward Trace
     │
     ▼
Root Cause Analysis
     │
     ▼
Multiple Layer Validation
     │
     ▼
Fix + Preventive Measures
```

**Best for:** Intermittent bugs, data issues, security problems.

### /fix:test

Fix failing tests.

```
/fix:test
```

Or specify test file:

```
/fix:test src/auth/__tests__/login.test.ts
```

**Process:**
1. Runs test suite
2. Identifies failures
3. Analyzes test expectations vs actual
4. Fixes code or test as appropriate
5. Re-runs to verify

**Best for:** Post-implementation test failures.

### /fix:ci

Fix CI/CD pipeline issues.

```
/fix:ci
```

**Requirements:** `gh` CLI installed and authenticated.

**Process:**
1. Fetches recent workflow runs via `gh`
2. Identifies failed jobs
3. Analyzes error logs
4. Fixes configuration or code
5. Pushes fix
6. Monitors re-run

**Common fixes:**
- Dependency version mismatches
- Environment variable issues
- Test timeouts
- Build configuration

**Best for:** GitHub Actions failures, deployment issues.

### /fix:types

Fix TypeScript type errors.

```
/fix:types
```

**Process:**
1. Runs `tsc --noEmit`
2. Parses type errors
3. Groups by file
4. Applies fixes:
   - Add missing types
   - Fix type mismatches
   - Update interfaces
5. Re-runs check

**Best for:** After refactoring, upgrading dependencies.

### /fix:ui

Fix UI and visual issues.

```
/fix:ui Modal not closing on backdrop click
```

**Process:**
1. Identifies UI component
2. Analyzes event handlers
3. Checks CSS/styling
4. Applies fix
5. Suggests visual verification

**Best for:** Interactive bugs, styling issues, accessibility.

### /fix:logs

Debug using log analysis.

```
/fix:logs path/to/error.log
```

**Process:**
1. Parses log file
2. Identifies error patterns
3. Correlates timestamps
4. Traces to source code
5. Suggests fixes

**Best for:** Production issues, async bugs.

### /fix:parallel

Fix multiple issues in parallel.

```
/fix:parallel
```

**Requirements:** `claude-flow` MCP tools.

**Process:**
1. Spawns analyzer agents
2. Each agent investigates one issue
3. Coordinates fixes
4. Avoids conflicts
5. Commits separately or together

**Best for:** Multiple unrelated bugs, post-merge fixes.

## Debugging Principles

### Root Cause First

Never patch symptoms. Always trace to root cause:

```
Symptom: Login button disabled
    │
    ▼
Surface cause: isLoading = true
    │
    ▼
Deeper: API call pending
    │
    ▼
Root cause: Network timeout not handled
    │
    ▼
Fix: Add timeout + error handling
```

### Defense in Depth

Apply fixes at multiple layers:

1. **Input validation** - Prevent bad data
2. **Business logic** - Handle edge cases
3. **Error handling** - Graceful failures
4. **Logging** - Debugging info
5. **Monitoring** - Detect recurrence

### Verification Gates

Before marking fixed:

- [ ] Root cause identified (not just symptom)
- [ ] Fix applied at correct layer
- [ ] Tests added/updated
- [ ] No regression in related code
- [ ] Error handling improved

## Tips

- Start with `/fix:fast` for simple issues
- Escalate to `/fix:hard` if quick fix fails
- Always verify fix doesn't break other tests
- Add test for the bug to prevent regression
- Use `/fix:logs` for production debugging

## Related

- [Coding Commands](/commands/coding) - Implementation
- [Debugging Skill](/reference/skills#debugging) - Methodology details
