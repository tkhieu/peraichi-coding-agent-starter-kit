---
title: "GitHub Actions CI for init-coding-agents.sh"
description: "Add ShellCheck + multi-OS testing workflow for dependency checker script"
status: completed
priority: P2
effort: 1h
branch: main
tags: [ci, github-actions, shell-testing]
created: 2025-12-23
---

# GitHub Actions Workflow: Test init-coding-agents.sh

## Overview

Create CI workflow to validate `init-coding-agents.sh` (168 lines) - dependency checker for Claude Code skills.

## Target Script Analysis

**Location:** `init-coding-agents.sh` (root)
**Purpose:** Check/install dependencies for Claude Code skills

| Category | Dependencies |
|----------|--------------|
| Required | Node.js, Python 3 |
| Optional | FFmpeg, ImageMagick, RMBG CLI, Claude-Flow |
| Python pkgs | google.genai, pypdf, docx, markdown, PIL, dotenv |
| Env vars | GEMINI_API_KEY |

**Key behaviors:**
- Uses `set +e` (always exits 0)
- OS detection: macOS, Linux, Windows
- `--install` flag triggers auto-installation
- Color-coded terminal output

## Workflow Design

```
.github/workflows/test-init-script.yml
```

### Jobs

1. **lint** (ubuntu-latest)
   - ShellCheck static analysis
   - Fast-fail gate for test job

2. **test** (matrix: ubuntu-latest, macos-latest)
   - Depends on lint job
   - Script syntax validation (`bash -n`)
   - Check mode execution (no --install)
   - Verify output contains expected dependency checks

### Scope Decisions (YAGNI)

| Include | Exclude |
|---------|---------|
| ShellCheck linting | BATS/shUnit2 (overkill) |
| Multi-OS matrix | Windows testing (complex) |
| Basic execution test | Mock/stub framework |
| Homebrew caching (macOS) | APT caching (rarely beneficial) |

## Phases

| Phase | File | Effort | Description |
|-------|------|--------|-------------|
| 01 | `phase-01-create-workflow.md` | 45m | Create workflow YAML + validation |

## Success Criteria

- [x] ShellCheck passes with no errors
- [x] Script runs successfully on Ubuntu + macOS
- [x] Output contains "Node.js" and "Python 3" checks
- [x] Non-zero exit on ShellCheck failure blocks test job
- [x] DEVELOPMENT.md documents act usage for local workflow testing

## Files to Create

```
.github/workflows/test-init-script.yml
DEVELOPMENT.md
```

## Risks

| Risk | Mitigation |
|------|------------|
| Script uses `set +e` (always exits 0) | Test output content, not exit code |
| Optional deps missing on CI runners | Expected behavior - verify warning output |

---

## Validation Summary

**Validated:** 2025-12-23
**Questions asked:** 3

### Confirmed Decisions
1. **Install mode testing:** Add install test job (user request)
2. **ShellCheck severity:** Error only (confirmed)
3. **Manual trigger:** Add workflow_dispatch (user request)

### Action Items (Plan Updates Required)
- [x] Add `workflow_dispatch` trigger to workflow
- [x] Add separate `test-install` job for `--install` mode testing
- [x] Update effort estimate (additional job adds ~15m)

---

## Completion Summary

**Status:** Completed on 2025-12-23 23:48
**Delivered:**
- GitHub Actions workflow with ShellCheck linting + multi-OS testing
- Manual trigger (`workflow_dispatch`) for on-demand runs
- Separate install-mode test job for dependency validation
- Documentation updates in DEVELOPMENT.md

## Unresolved Questions

None - scope is well-defined for minimal CI validation.
