---
title: "VitePress Documentation Site"
description: "Comprehensive docs site for Claude Code AI Agent Starter with Diataxis framework"
status: in_progress
priority: P1
effort: 6h
branch: main
tags: [documentation, vitepress, diataxis]
created: 2024-12-24
---

# VitePress Documentation Site Plan

## Overview

Build a VitePress documentation site in `docs/` folder documenting the Claude Code AI Agent Starter. Site follows Diataxis framework (Tutorials, How-To, Reference, Explanations).

## Key Deliverables

1. VitePress configuration with navigation/sidebar
2. Getting Started tutorial
3. Command reference (40+ slash commands)
4. SPARC methodology guide (16 agents)
5. Workflow documentation
6. Skills reference
7. claude-flow integration guide

## Scope

**In Scope:**
- VitePress setup and config
- Sidebar/nav structure per Diataxis
- All slash commands documented
- SPARC agents explained
- Workflow guides
- Skills reference
- GitHub Pages deployment config

**Out of Scope:**
- Custom theme development
- Video tutorials
- Interactive code playgrounds
- Localization

## Architecture

```
docs/
├── .vitepress/
│   └── config.ts           # VitePress config
├── index.md                 # Landing page
├── getting-started/
│   ├── installation.md
│   ├── first-project.md
│   └── configuration.md
├── commands/
│   ├── planning.md          # /plan:* commands
│   ├── coding.md            # /code:* commands
│   ├── fixing.md            # /fix:* commands
│   ├── git.md               # /git:* commands
│   └── sparc.md             # /sparc:* commands
├── guides/
│   ├── sparc-methodology.md
│   ├── workflows.md
│   ├── claude-flow.md
│   └── pair-programming.md
├── reference/
│   ├── skills.md
│   ├── output-styles.md
│   └── hooks.md
└── concepts/
    ├── architecture.md
    └── design-principles.md
```

## Phases

| Phase | Description | Effort | Files | Status |
|-------|-------------|--------|-------|--------|
| 1 | VitePress Setup | 45min | 3 | DONE (2024-12-24) |
| 2 | Landing + Getting Started | 45min | 4 | DONE (2024-12-24) |
| 3 | Command Reference | 1.5h | 5 | |
| 4 | Guides | 1.5h | 4 | |
| 5 | Reference + Concepts | 1h | 5 | |
| 6 | Deploy Config | 30min | 2 | |

**Total:** ~6 hours, ~23 files

## Success Criteria

- [ ] `npm run docs:dev` starts local server
- [ ] All 40+ commands documented
- [ ] All 16 SPARC agents explained
- [ ] Clear navigation structure
- [ ] GitHub Actions deploy workflow ready

## Dependencies

- Node.js 18+
- VitePress (installed via npm)
- Existing `.claude/` content (source material)

## Risks

| Risk | Mitigation |
|------|------------|
| Large docs fill context | Use Grep for specific sections |
| Config complexity | Follow VitePress defaults |
| Stale docs | Link to source files where possible |

## Unresolved Questions

1. Should we use auto-sidebar plugin or manual config?
   - **Decision:** Manual config for better control
2. Include dark/light toggle?
   - **Decision:** Yes, VitePress default theme supports it
3. Version docs per release?
   - **Decision:** No, keep single version for now
