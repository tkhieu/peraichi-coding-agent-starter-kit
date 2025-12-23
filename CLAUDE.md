# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Slash Commands

Available commands in `.claude/commands/`:

### Planning
- `/plan` - Create implementation plans with research phases
- `/plan:fast` - Quick analysis without deep research
- `/plan:hard` - Full analysis with parallel research
- `/plan:parallel` - Multi-phase parallel planning
- `/plan:validate` - Validate existing plan integrity

### Implementation
- `/code` - Execute implementation plan step-by-step
- `/code:auto` - Auto-execute all phases without blocking gates
- `/code:no-test` - Skip testing phase
- `/code:parallel` - Parallel task execution within phase

## Skills

Skills available in `.claude/skills/`:
- `planning` - Plan creation, organization, and validation

## Claude-Flow Integration

For parallel agent execution, see `.claude/docs/claude-flow-parallel-guide.md`.

**MCP Tools:**
- `swarm_init` - Initialize multi-agent topology
- `agents_spawn_parallel` - 10-20x faster parallel spawning
- `task_orchestrate` - Parallel/sequential/adaptive strategies

## Workflows

1. **Plan First:** Use `/plan:hard` to create implementation plan
2. **Execute:** Use `/code:auto` to implement the plan
3. **Parallel:** Use claude-flow MCP tools for parallel processing

## Documentation

Keep docs in `./docs/` folder:
- `project-overview-pdr.md` - Product requirements
- `code-standards.md` - Coding conventions
- `codebase-summary.md` - Architecture overview
