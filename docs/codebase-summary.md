# Codebase Summary

## Project Overview

**Peraichi Claude Code AI Agent Starter** - A comprehensive framework for Claude Code with SPARC methodology, multi-agent orchestration, and intelligent automation.

### Project Type
- Documentation site (VitePress-based)
- Command-line tool framework
- AI agent orchestration starter template

### Current Phase
**Phase 1: VitePress Documentation Setup (Completed)**

Key accomplishments:
- Configured VitePress for static documentation generation
- Established site navigation structure
- Created landing page with feature overview
- Set up logo assets and public directory

## Project Structure

```
peraichi-ai-agent-starter/
├── docs/                          # VitePress documentation root
│   ├── .vitepress/
│   │   ├── config.ts              # VitePress configuration
│   │   ├── dist/                  # Build output (generated)
│   │   └── cache/                 # Build cache (generated)
│   ├── public/
│   │   └── logo.svg               # Site logo (placeholder)
│   ├── index.md                   # Landing page (hero layout)
│   ├── quick-start.md             # 5-minute setup guide
│   ├── project-overview-pdr.md    # Product Development Requirements
│   └── code-standards.md          # Code conventions
├── .claude/                       # Claude Code configuration
│   ├── commands/                  # Slash command definitions
│   ├── skills/                    # AI skill modules
│   ├── workflows/                 # Development workflows
│   └── hooks/                     # Git and execution hooks
├── .github/                       # GitHub Actions
├── .vscode/                       # VS Code settings
├── plans/                         # Implementation plans
├── templates/                     # GitHub Actions templates
├── package.json                   # Node.js dependencies (VitePress)
├── CLAUDE.md                      # Project instructions
├── DEVELOPMENT.md                 # Development guide
└── README.md                      # Project root documentation
```

## Technology Stack

### Core Dependencies
- **VitePress 1.6.4** - Static documentation site generator
- **Node.js 18+** - JavaScript runtime (for development)
- **npm** - Package manager

### Development Tools
- **Git** - Version control
- **GitHub Actions** - CI/CD pipeline templates
- **Claude Code CLI** - AI-powered development environment

### Optional Features
- **claude-flow** - Multi-agent orchestration
- **Python 3.x** - For AI multimodal features
- **FFmpeg/ImageMagick** - Media processing
- **PostgreSQL** - Database queries

## Key Files & Responsibilities

### Documentation System
| File | Purpose | Status |
|------|---------|--------|
| `docs/index.md` | Landing page (hero layout) | Complete |
| `docs/quick-start.md` | 5-minute setup guide | Complete |
| `docs/project-overview-pdr.md` | Product requirements | Template (needs content) |
| `docs/code-standards.md` | Code conventions | Baseline (expandable) |
| `docs/.vitepress/config.ts` | VitePress config | Complete |

### Configuration
| File | Purpose | Status |
|------|---------|--------|
| `package.json` | Build scripts, type module | Complete |
| `CLAUDE.md` | Project instructions & workflows | Complete |
| `DEVELOPMENT.md` | Dev workflow guide | Exists |

## VitePress Configuration Details

### Build Scripts (package.json)
```json
{
  "scripts": {
    "docs:dev": "vitepress dev docs",
    "docs:build": "vitepress build docs",
    "docs:preview": "vitepress preview docs"
  },
  "type": "module"
}
```

### Site Configuration
- **Title:** Peraichi Claude Code AI Agent Starter
- **Description:** Documentation for Claude Code AI Agent development framework
- **Theme:** GitHub light/dark with line numbers
- **Navigation:** 5 main sections (Home, Getting Started, Commands, Guides, Reference)
- **Sidebar:** Path-based organization with collapsible sections
- **Search:** Local search provider enabled
- **Footer:** MIT License, copyright 2024
- **Edit Link:** GitHub-based edit pattern

### Navigation Structure
```
Home
├── Getting Started
│   ├── Installation
│   ├── First Project
│   └── Configuration
├── Commands
│   ├── Planning
│   ├── Coding
│   ├── Fixing
│   ├── Git
│   └── SPARC Agents
├── Guides
│   ├── SPARC Methodology
│   ├── Workflows
│   ├── Claude-Flow
│   └── Pair Programming
├── Reference
│   ├── Skills
│   ├── Output Styles
│   └── Hooks
└── Concepts
    ├── Architecture
    └── Design Principles
```

## Content Coverage

### Completed Pages
1. **index.md** - Landing page with feature cards:
   - Quick Setup (5 minutes)
   - SPARC Agents (16 specialized agents)
   - Claude-Flow (multi-agent orchestration)
   - Smart Planning (research-driven)
   - Core features table

2. **quick-start.md** - Setup and commands guide:
   - Prerequisites (required, recommended, optional)
   - Setup steps
   - Essential commands by category
   - Output styles reference
   - Key principles (YAGNI, KISS, DRY)
   - Code review & debugging protocols
   - Pair programming modes

3. **code-standards.md** - Baseline conventions:
   - General guidelines
   - File organization
   - Code quality standards
   - Commit guidelines

### Pending Content (Planned Pages)
According to VitePress config, the following pages need creation:
- `getting-started/installation.md`
- `getting-started/first-project.md`
- `getting-started/configuration.md`
- `commands/planning.md`
- `commands/coding.md`
- `commands/fixing.md`
- `commands/git.md`
- `commands/sparc.md`
- `guides/sparc-methodology.md`
- `guides/workflows.md`
- `guides/claude-flow.md`
- `guides/pair-programming.md`
- `reference/skills.md`
- `reference/output-styles.md`
- `reference/hooks.md`
- `concepts/architecture.md`
- `concepts/design-principles.md`

### Missing Documentation
- `project-overview-pdr.md` - Currently a template with TODOs
- `system-architecture.md` - Not yet created
- `design-guidelines.md` - Not yet created
- `deployment-guide.md` - Not yet created
- `project-roadmap.md` - Not yet created

## Build & Deployment

### Local Development
```bash
npm install                    # Install dependencies
npm run docs:dev              # Start dev server
npm run docs:build            # Build static site
npm run docs:preview          # Preview build
```

### Output
- **Build directory:** `docs/.vitepress/dist/`
- **Build cache:** `docs/.vitepress/cache/`
- **Feature:** Clean URLs (no .html extension)

## Recent Changes (Phase 1)

### Added Files
1. **docs/.vitepress/config.ts** - Complete VitePress configuration
2. **docs/public/logo.svg** - Placeholder logo asset
3. **docs/index.md** - Landing page with hero layout and features

### Modified Files
1. **package.json**
   - Added VitePress scripts (docs:dev, docs:build, docs:preview)
   - Added "type": "module" (ES modules)
   - Added VitePress 1.6.4 to devDependencies

### Documentation Structure Updates
- Established docs/ as VitePress root
- Created .vitepress/ configuration directory
- Created public/ directory for static assets
- Configured sidebar navigation with multiple sections
- Set up path-based routing for organized content

## Next Steps for Phase 2

### High Priority
1. Create `system-architecture.md` - Document technical architecture
2. Fill in `project-overview-pdr.md` - Complete product requirements
3. Create all "Getting Started" pages
4. Create "Commands" reference pages
5. Document SPARC methodology in guides

### Medium Priority
1. Create design guidelines documentation
2. Create deployment guide
3. Add code examples to reference pages
4. Create architectural diagrams

### Documentation Standards to Maintain
- Progressive disclosure (basic to advanced)
- Code examples for all features
- Cross-references between related topics
- Consistent formatting and style
- Regular updates with codebase changes

## Code Standards Applied

### Documentation
- Markdown files use clear headers and table of contents
- Code blocks include syntax highlighting
- Examples are functional and tested
- Links are properly formatted and verified

### Project Configuration
- YAGNI principle: Include only necessary features
- KISS principle: Simple, clear configuration
- DRY principle: Reusable components and patterns
- Conventional commits for version control

## Dependencies & Integrations

### Direct Dependencies
- **vitepress@^1.6.4** - Documentation framework

### Development Tools
- Node.js 18+ required
- npm for package management

### Optional External Tools
- **claude-flow@alpha** - For multi-agent orchestration examples
- **GitHub CLI** - For integration documentation
- **Python 3.x** - For AI feature examples

## Metrics & Status

| Category | Status | Coverage |
|----------|--------|----------|
| VitePress Setup | Complete | 100% |
| Landing Page | Complete | 100% |
| Quick Start | Complete | 100% |
| Code Standards | Partial | 40% |
| Project PDR | Not Started | 0% |
| System Architecture | Not Started | 0% |
| Command Pages | Not Started | 0% |
| Guide Pages | Not Started | 0% |

## Unresolved Questions

1. Should documentation include video tutorials or just written guides?
2. What specific architectural diagrams should be included?
3. Should deployment guide cover multiple platforms (Docker, Vercel, GitHub Pages)?
4. How frequently should documentation be updated relative to feature releases?
