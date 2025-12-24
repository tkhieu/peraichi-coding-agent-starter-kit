# Planning Commands

Commands for creating implementation plans with research and analysis.

## Overview

| Command | Complexity | Agents | Use Case |
|---------|------------|--------|----------|
| `/plan` | Simple | 1 planner | Quick features |
| `/plan:fast` | Minimal | 1 analyzer | Rapid analysis |
| `/plan:hard` | Complex | 2+ researchers + planner | Multi-phase features |
| `/plan:parallel` | Complex | Parallel researchers | Large scope |
| `/plan:validate` | - | 1 validator | Pre-implementation check |
| `/plan:continue` | - | Resume | Continue existing plan |
| `/plan:status` | - | - | Check plan progress |
| `/plan:list` | - | - | List all plans |

## Commands

### /plan

Simple planning for straightforward features.

```
/plan Add a logout button to the header
```

**Process:**
1. Analyzes codebase structure
2. Creates single-phase plan
3. Outputs to `plans/YYMMDD-HHMM-{slug}/`

**Best for:** Single-file changes, small features, bug fixes.

### /plan:fast

Quick analysis without deep research.

```
/plan:fast Add loading spinner to button
```

**Process:**
1. Quick codebase scan
2. Identifies relevant files
3. Creates minimal plan
4. No research phase

**Best for:** Obvious changes, UI tweaks, simple additions.

### /plan:hard

Complex planning with research phase.

```
/plan:hard Implement user authentication with OAuth2
```

**Process:**
1. Spawns researcher agents for investigation
2. Analyzes existing patterns
3. Creates multi-phase plan
4. Includes risk assessment

**Output structure:**
```
plans/YYMMDD-HHMM-{slug}/
├── plan.md           # Overview
├── phase-01-*.md     # Phase details
├── phase-02-*.md
└── research/
    └── researcher-01-report.md
```

**Best for:** Multi-file changes, new systems, integrations.

### /plan:parallel

Parallel research for large scope planning.

```
/plan:parallel Build a complete e-commerce checkout system
```

**Process:**
1. Spawns multiple researchers in parallel
2. Consolidates findings
3. Creates comprehensive plan
4. May produce 5+ phases

**Best for:** Large features, system rewrites, major integrations.

### /plan:validate

Validate assumptions before implementation.

```
/plan:validate
```

**Process:**
1. Reads active plan
2. Identifies decision points
3. Asks clarifying questions
4. Documents answers in plan

**Use when:** Before running `/code:auto` on complex plans.

### /plan:continue

Resume work on existing plan.

```
/plan:continue plans/241224-1030-user-auth
```

**Process:**
1. Loads specified plan
2. Sets as active plan
3. Shows current status
4. Ready for `/code` commands

### /plan:status

Check progress of active plan.

```
/plan:status
```

**Shows:**
- Current phase
- Completed tasks
- Remaining work
- Blockers if any

### /plan:list

List all plans in project.

```
/plan:list
```

**Shows:**
- Plan name and date
- Status (active/completed/abandoned)
- Phase count

## Plan Output

Plans follow consistent structure:

### plan.md

```markdown
# Plan: Feature Name

## Overview
Brief description of what will be built.

## Phases
1. Phase 1 - Setup
2. Phase 2 - Core implementation
3. Phase 3 - Testing

## Risks
- Risk 1: Description
- Risk 2: Description

## Validation Summary
(Added after /plan:validate)
```

### phase-XX-*.md

```markdown
# Phase XX: Phase Name

## Objective
What this phase accomplishes.

## Tasks
- [ ] Task 1
- [ ] Task 2

## Files to Modify
- path/to/file.ts

## Acceptance Criteria
- Criterion 1
- Criterion 2
```

## Tips

- Use `/plan` for quick features (< 1 hour)
- Use `/plan:hard` for anything touching 3+ files
- Always `/plan:validate` before `/code:auto` on complex plans
- Review generated plans before execution
- Plans are git-ignored by default

## Related

- [Coding Commands](/commands/coding) - Execute plans
- [SPARC Methodology](/guides/sparc-methodology) - Agent roles
