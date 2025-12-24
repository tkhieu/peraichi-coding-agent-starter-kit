# Architecture

Understanding how the AI Agent Starter is structured.

## High-Level Overview

```
┌─────────────────────────────────────────────────┐
│                  Claude Code CLI                 │
├─────────────────────────────────────────────────┤
│                   CLAUDE.md                      │
│              (Project Configuration)             │
├─────────────────────────────────────────────────┤
│                                                  │
│  ┌─────────────┐  ┌─────────────┐  ┌──────────┐ │
│  │  Commands   │  │   Skills    │  │ Workflows│ │
│  │  /plan:*    │  │  debugging  │  │ primary  │ │
│  │  /code:*    │  │  review     │  │ rules    │ │
│  │  /fix:*     │  │  planning   │  │ docs     │ │
│  │  /sparc:*   │  │  pair-prog  │  │          │ │
│  └─────────────┘  └─────────────┘  └──────────┘ │
│                                                  │
├─────────────────────────────────────────────────┤
│                    Hooks                         │
│          (Pre/Post Command, Commit)              │
├─────────────────────────────────────────────────┤
│                 Output Styles                    │
│          (Level 0-5 Verbosity)                   │
├─────────────────────────────────────────────────┤
│                  Claude-Flow                     │
│           (Parallel Execution MCP)               │
└─────────────────────────────────────────────────┘
```

## Components

### Commands

Slash commands define entry points for actions.

**Location:** `.claude/commands/`

**Structure:**
```
commands/
├── plan.md           # /plan
├── plan/
│   ├── fast.md       # /plan:fast
│   ├── hard.md       # /plan:hard
│   └── parallel.md   # /plan:parallel
```

**Command execution:**
1. User types `/command`
2. Claude reads command definition
3. Follows instructions in command file
4. May spawn sub-agents
5. Returns results

### Skills

Reusable knowledge modules.

**Location:** `.claude/skills/`

**Activation:** Automatic (context-based) or explicit

**Purpose:**
- Encapsulate domain knowledge
- Provide consistent patterns
- Enable code reuse

### Workflows

Development process definitions.

**Location:** `.claude/workflows/`

**Types:**
- `primary-workflow.md` - Main dev flow
- `development-rules.md` - Code standards
- `orchestration-protocol.md` - Multi-agent coordination

### Hooks

Extension points for custom behavior.

**Location:** `.claude/hooks/`

**Lifecycle:**
1. Pre-command
2. Command execution
3. Post-command
4. Pre-commit
5. Post-commit

### Output Styles

Response verbosity control.

**Location:** `.claude/output-styles/`

**Levels 0-5:** From ELI5 to expert mode

### Claude-Flow Integration

Parallel execution via MCP server.

**Capabilities:**
- Swarm topologies
- Parallel agent spawning
- Task orchestration
- Memory persistence

## Data Flow

### Planning Flow

```
User Request
    ↓
/plan:hard
    ↓
Spawn Researchers (parallel)
    ↓
Research Reports
    ↓
Planner Agent
    ↓
Plan Files (plans/)
```

### Execution Flow

```
Plan Files
    ↓
/code:auto
    ↓
Read Phase 1
    ↓
Implement
    ↓
Test
    ↓
Next Phase
    ↓
Code Review
    ↓
Complete
```

### Debugging Flow

```
Issue Report
    ↓
/fix:hard
    ↓
Reproduce
    ↓
Investigate
    ↓
Identify Root Cause
    ↓
Implement Fix
    ↓
Test
    ↓
Verify
```

## Directory Structure

```
project/
├── .claude/
│   ├── commands/      # Slash commands
│   ├── skills/        # Knowledge modules
│   ├── workflows/     # Process definitions
│   ├── output-styles/ # Verbosity levels
│   ├── hooks/         # Extension points
│   └── docs/          # Internal docs
├── docs/              # VitePress docs
├── plans/             # Generated plans
└── CLAUDE.md          # Project config
```

## Related

- [Design Principles](/concepts/design-principles) - Core philosophy
- [Claude-Flow Guide](/guides/claude-flow) - Parallel execution
