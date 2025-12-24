# Your First Project

Build a simple feature using the AI Agent workflow.

## Step 1: Plan the Feature

Start by creating an implementation plan:

```
/plan:hard Add user authentication with email/password
```

This spawns:
1. **Researcher agents** - Investigate auth patterns
2. **Planner agent** - Creates structured plan in `./plans/`

Wait for plan completion. Output appears in `plans/YYMMDD-HHMM-{slug}/`.

## Step 2: Review the Plan

Check the generated plan:

```
plans/
├── 241224-1030-user-auth/
│   ├── plan.md           # Overview with phases
│   ├── phase-01-*.md     # Phase details
│   └── research/         # Research reports
```

Review `plan.md` for scope and phases.

## Step 3: Execute the Plan

Run the implementation:

```
/code:auto
```

This:
1. Reads the active plan
2. Executes each phase sequentially
3. Runs tests after implementation
4. Spawns code reviewer

## Step 4: Handle Issues

If tests fail or issues arise:

```
/fix:test
```

For CI/CD pipeline issues:

```
/fix:ci
```

## Step 5: Commit Changes

When satisfied with implementation:

```
/git:cp Add user authentication feature
```

This:
1. Stages changes
2. Commits with message
3. Pushes to remote

## Tips

- Use `/plan` for simple features, `/plan:hard` for complex ones
- Review generated plans before executing
- Use `/code` instead of `/code:auto` for more control
- Run `/review:codebase` periodically for health checks

## Next Steps

- [SPARC Methodology](/guides/sparc-methodology) - Understand agent roles
- [Workflows](/guides/workflows) - Learn development patterns
