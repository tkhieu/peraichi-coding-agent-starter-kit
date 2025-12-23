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
- `code-review` - Code review reception, requesting reviews, verification gates
- `debugging` - Systematic debugging, root cause tracing, defense-in-depth
- `ai-multimodal` - Image generation/analysis, video processing, audio transcription
- `media-processing` - FFmpeg video encoding, ImageMagick editing, background removal

## Claude-Flow Integration

For parallel agent execution, see `.claude/docs/claude-flow-parallel-guide.md`.

**MCP Tools:**
- `swarm_init` - Initialize multi-agent topology
- `agents_spawn_parallel` - 10-20x faster parallel spawning
- `task_orchestrate` - Parallel/sequential/adaptive strategies

## Workflows

Workflow guides in `./.claude/workflows/`:
- `primary-workflow.md` - Main development workflow
- `development-rules.md` - Code standards and practices
- `documentation-management.md` - Docs maintenance
- `orchestration-protocol.md` - Multi-agent coordination

Workflow steps:
1. **Plan First:** Use `/plan:hard` to create implementation plan
2. **Execute:** Use `/code:auto` to implement the plan
3. **Parallel:** Use claude-flow MCP tools for parallel processing
4. **CI/Testing:** See `DEVELOPMENT.md` for local workflow testing with `act`

## SPARC Commands

Available `/sparc:*` commands (16 total):
- `/sparc:specification` - Define requirements and specs
- `/sparc:pseudocode` - Write pseudocode structure
- `/sparc:architecture` - Design system architecture
- `/sparc:refinement` - Refine implementation details
- `/sparc:completion` - Finalize and test
- `/sparc:api` - API design and validation
- `/sparc:database` - Database schema design
- `/sparc:security` - Security architecture
- `/sparc:performance` - Performance optimization
- `/sparc:testing` - Test strategy design
- `/sparc:devops` - Deployment architecture
- `/sparc:monitoring` - Observability design
- `/sparc:migration` - Data/code migration strategy
- `/sparc:integration` - System integration design
- `/sparc:ui` - UI/UX architecture
- `/sparc:validation` - Validation and compliance

## Git Commands

Available `/git:*` commands (4 total):
- `/git:status` - Check current branch status
- `/git:commit` - Create commits with compliance checks
- `/git:branch` - Create and manage branches
- `/git:review` - Code review and PR management

## Review Commands

Available `/review:*` commands:
- `/review:codebase` - Full codebase review and analysis

## Fix Commands

Available `/fix:*` commands (8 total):
- `/fix:ci` - Fix CI/CD pipeline issues
- `/fix:fast` - Quick fix mode for simple issues
- `/fix:hard` - Deep investigation and comprehensive fix
- `/fix:logs` - Fix issues based on log analysis
- `/fix:parallel` - Parallel debugging for multiple issues
- `/fix:test` - Fix failing tests
- `/fix:types` - Fix TypeScript type errors
- `/fix:ui` - Fix UI/UX issues

## Test Commands

Available `/test:*` commands:
- `/test:ui` - Run UI component tests

## GitHub Actions Templates

Templates in `templates/github-actions/`:
- `pr-review.yml` - Automated PR review workflow (lint, type check, tests)
- `security-review.yml` - Security-focused review (dependency audit, secret scan)

Copy to `.github/workflows/` to enable.

## Plans

Keep plans in `./plans/` folder (root level, no nested subfolders):
```
plans/
├── {YYMMDD-HHmm-slug}/
│   ├── plan.md              # Overview with YAML frontmatter
│   ├── phase-01-*.md        # Phase implementation details
│   └── research/            # Research reports (optional)
└── reports/                 # Standalone reports
```

**Naming:** `{YYMMDD-HHmm}-{descriptive-slug}/`

## Documentation

Keep docs in `./docs/` folder:
- `project-overview-pdr.md` - Product requirements
- `code-standards.md` - Coding conventions
- `codebase-summary.md` - Architecture overview
