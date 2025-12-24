# Development Workflows

Standard workflows for common development scenarios.

## Planning Workflow

For new features or significant changes.

### Step 1: Research & Plan

```bash
/plan:hard <feature description>
```

Wait for plan creation in `./plans/`.

### Step 2: Review Plan

Check generated files:
- `plan.md` - Overview, scope, phases
- `phase-*.md` - Detailed phase instructions
- `research/` - Background research

### Step 3: Execute

```bash
/code:auto
# or for controlled execution:
/code
```

### Step 4: Test & Review

Tests run automatically. For manual review:

```bash
/sparc:testing Run additional tests
/sparc:completion Final review
```

### Step 5: Commit

```bash
/git:cp <commit message>
```

---

## Bug Fix Workflow

For resolving reported issues.

### Step 1: Reproduce

```bash
/debug <issue description>
```

### Step 2: Investigate

```bash
/fix:hard <issue description>
```

For simpler issues:
```bash
/fix:fast <issue description>
```

### Step 3: Fix & Test

Agent implements fix and runs tests.

### Step 4: Verify

```bash
/fix:test  # Ensure no regressions
```

### Step 5: Commit

```bash
/git:commit fix: <description>
```

---

## CI/CD Fix Workflow

When pipeline fails.

### Step 1: Get Failure Details

```bash
/fix:ci
```

### Step 2: Analyze

Agent fetches logs, identifies root cause.

### Step 3: Fix

Agent implements fix based on analysis.

### Step 4: Push & Verify

```bash
/git:cp Fix CI pipeline
```

Monitor pipeline for success.

---

## Code Review Workflow

### Receiving Reviews

When you receive feedback:

1. **Don't agree performatively** - Actually evaluate suggestions
2. **Test suggestions** - Verify they work before implementing
3. **Push back if needed** - Explain why if suggestion doesn't fit

### Requesting Reviews

```bash
/review:codebase  # Full codebase review
```

---

## Pair Programming Workflow

### Driver Mode

You write code, AI navigates:

```
I'll be the driver. Help me implement user login.
```

AI provides:
- Architecture guidance
- Pattern suggestions
- Error catching

### Navigator Mode

AI writes code, you guide:

```
You drive. Implement login form with validation.
```

You provide:
- Direction
- Corrections
- Approval

### TDD Mode

Test-first development:

```
Let's use TDD for the payment service.
```

Flow:
1. Write failing test
2. Implement minimum code
3. Refactor
4. Repeat

---

## Documentation Workflow

### After Feature Complete

```bash
/sparc:completion Update docs for new feature
```

### Periodic Maintenance

```bash
/review:codebase  # Includes doc review
```

---

## Workflow Selection Guide

| Situation | Workflow |
|-----------|----------|
| New feature | Planning |
| Bug report | Bug Fix |
| CI failure | CI/CD Fix |
| PR feedback | Code Review |
| Learning codebase | Pair Programming |
| Feature shipped | Documentation |

## Related

- [Planning Commands](/commands/planning) - Create plans
- [Fixing Commands](/commands/fixing) - Debug issues
- [Pair Programming](/guides/pair-programming) - Collaboration modes
