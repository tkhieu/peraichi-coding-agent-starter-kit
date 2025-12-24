# Installation

Get productive with Claude Code in 5 minutes.

## Prerequisites

**Required:**
- [Claude Code CLI](https://claude.ai/code) installed
- Git repository initialized
- Node.js 18+

**Recommended:**
- `claude-flow` - SPARC agents & parallel execution

```bash
npm install -g claude-flow@alpha
```

- `gh` - GitHub CLI for `/fix:ci` command

```bash
brew install gh  # macOS
```

## Setup Steps

### 1. Copy Configuration

Copy the `.claude/` directory to your project root:

```bash
cp -r path/to/starter/.claude ./
```

### 2. Configure Project

Copy and customize the main configuration:

```bash
cp CLAUDE.md.template CLAUDE.md
```

Edit `CLAUDE.md` to match your project structure.

### 3. Verify Installation

Start Claude Code and run:

```
/scout
```

Should display your project structure.

## Optional Dependencies

| Feature | Dependencies | Install |
|---------|--------------|---------|
| AI Multimodal | Python 3.x, google-genai | `pip install google-genai` |
| Media Processing | FFmpeg, ImageMagick | `brew install ffmpeg imagemagick` |
| Database Queries | psql | `brew install postgresql` |

## Next Steps

- [Your First Project](/getting-started/first-project) - Build something
- [Configuration](/getting-started/configuration) - Customize settings
