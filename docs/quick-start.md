# Quick Start Guide

Get productive with Claude Code in 5 minutes.

## Prerequisites

- Claude Code CLI installed
- Git repository initialized
- Node.js 18+ (for hooks)

## Setup

1. Copy `.claude/` directory to your project
2. Copy `CLAUDE.md.template` → `CLAUDE.md`
3. Fill in template variables
4. Start Claude Code

## Essential Commands

### Planning
- `/plan` - Create implementation plan
- `/plan:hard` - Full analysis with research
- `/brainstorm` - Ideation session

### Coding
- `/code` - Execute plan step-by-step
- `/code:auto` - Auto-execute all phases
- `/fix` - Fix issues systematically
- `/debug` - Debug with root cause analysis

### Review
- `/review:codebase` - Full codebase review
- `/test:ui` - Run UI tests

### Git
- `/git:cm` - Quick commit
- `/git:cp` - Commit and push
- `/git:pr` - Create PR

### Exploration
- `/scout` - Explore codebase structure
- `/ask` - Ask questions about code

### SPARC Agents
- `/sparc:coder` - Implementation agent
- `/sparc:architect` - Architecture design
- `/sparc:reviewer` - Code review
- `/sparc:tester` - Testing agent
- `/sparc:tdd` - Test-driven development

## Output Styles

Change response verbosity in `.claude/output-styles/`:
- Level 0: ELI5 (non-technical)
- Level 1: Junior developer
- Level 2: Mid-level developer
- Level 3: Senior developer (default)
- Level 4: Tech lead
- Level 5: Expert mode (minimal)

## Key Principles

### YAGNI - You Aren't Gonna Need It
Don't add features until necessary.

### KISS - Keep It Simple, Stupid
Simplest solution wins.

### DRY - Don't Repeat Yourself
Abstract when patterns repeat 3+ times.

## Code Review Protocol

1. **No performative agreement** - No "Great point!" responses
2. **Verify before implementing** - Check suggestions technically
3. **Evidence before claims** - Run tests before saying "done"

## Debugging Protocol

1. **Read the error** - Actually read it
2. **Reproduce** - Confirm the issue
3. **Investigate** - Find root cause
4. **Fix at source** - Don't mask symptoms
5. **Verify** - Confirm fix works

## Pair Programming Modes

Available in `.claude/skills/pair-programming/`:
- **Driver**: You code, AI navigates
- **Navigator**: AI codes, you guide
- **Switch**: Alternate roles
- **TDD**: Test-first workflow
- **Mentor**: Learning-focused sessions

## GitHub Actions (Optional)

Copy `templates/github-actions/` to `.github/workflows/`:
- `pr-review.yml` - Automated PR review
- `security-review.yml` - Security scanning

## Getting Help

- `/ask [question]` - Ask Claude
- `/scout` - Explore codebase
- Check `docs/` for detailed guides
