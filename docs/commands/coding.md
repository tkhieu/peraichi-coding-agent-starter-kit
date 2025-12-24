# Coding Commands

Commands for executing implementation plans.

## Overview

| Command | Mode | Testing | Use Case |
|---------|------|---------|----------|
| `/code` | Interactive | Yes | Step-by-step control |
| `/code:auto` | Automatic | Yes | Full plan execution |
| `/code:no-test` | Automatic | No | Skip testing phase |
| `/code:parallel` | Parallel | Yes | Fast multi-task execution |

## Commands

### /code

Interactive plan execution with phase-by-phase control.

```
/code
```

**Process:**
1. Reads active plan
2. Executes current phase
3. Pauses for review
4. Prompts for next phase

**Best for:** First-time implementations, learning the workflow.

### /code:auto

Automatic execution of all plan phases.

```
/code:auto
```

Or specify a plan:

```
/code:auto plans/241224-1030-user-auth
```

**Process:**
1. Reads plan (active or specified)
2. Executes all phases sequentially
3. Runs tests after each phase
4. Spawns code reviewer at end
5. Commits on success

**Execution per phase:**
```
Phase N:
├── Read phase-N.md
├── Implement tasks
├── Run tests
├── Self-review
└── Continue to N+1
```

**Best for:** Validated plans, trusted workflows.

### /code:no-test

Execute without running tests.

```
/code:no-test
```

**Process:**
- Same as `/code:auto` but skips test execution
- Still performs code review
- Use when tests don't exist yet

**Best for:** Greenfield projects, prototype phase.

### /code:parallel

Parallel task execution within phases.

```
/code:parallel
```

**Process:**
1. Analyzes phase tasks for dependencies
2. Groups independent tasks
3. Executes groups in parallel
4. Waits for completion before next group

**Example:**
```
Phase tasks:
├── Create user model      ─┐
├── Create auth service    ─┼─ Parallel group 1
├── Create login endpoint  ─┘
├── Add validation         ─── Depends on above
└── Write tests            ─── Depends on validation
```

**Requirements:** `claude-flow` MCP tools available.

**Best for:** Large phases with independent tasks.

## Execution Flow

### Standard Flow

```
/code:auto
    │
    ▼
┌─────────────────┐
│ Load Plan       │
└────────┬────────┘
         │
    ▼ (for each phase)
┌─────────────────┐
│ Read Phase File │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Execute Tasks   │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Run Tests       │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Self Review     │
└────────┬────────┘
         │
    (next phase)
         │
         ▼
┌─────────────────┐
│ Code Review     │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Commit Changes  │
└─────────────────┘
```

### Error Handling

If tests fail during execution:

1. Execution pauses
2. Error displayed
3. Options presented:
   - Fix and retry
   - Skip test (with warning)
   - Abort execution

Use `/fix:test` to debug failures.

## Integration with Plans

### Active Plan

Commands use the active plan by default:

```bash
# Set active plan
node .claude/scripts/set-active-plan.cjs plans/241224-auth

# Now /code:auto uses this plan
/code:auto
```

### Specify Plan

Override with explicit path:

```
/code:auto plans/241224-1030-user-auth
```

## Tips

- Run `/plan:validate` before `/code:auto` on complex plans
- Use `/code` first time to understand the workflow
- Use `/code:parallel` for phases with 5+ independent tasks
- Check plan status with `/plan:status` during execution
- If stuck, use `/fix:hard` to investigate

## Related

- [Planning Commands](/commands/planning) - Create plans
- [Fixing Commands](/commands/fixing) - Debug issues
- [SPARC Agents](/commands/sparc) - Specialized agents
