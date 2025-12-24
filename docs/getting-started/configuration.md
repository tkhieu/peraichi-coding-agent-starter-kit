# Configuration

Customize the AI Agent Starter for your project.

## CLAUDE.md

Main configuration file. Controls:
- Available commands
- Active skills
- Workflow preferences
- Output style

```markdown
# CLAUDE.md

## Slash Commands
- `/plan` - Create implementation plans
- `/code` - Execute plans
...
```

## Output Styles

Control response verbosity in `.claude/output-styles/`:

| Level | File | Audience |
|-------|------|----------|
| 0 | `coding-level-0-eli5.md` | Non-technical |
| 1 | `coding-level-1-junior.md` | Junior devs |
| 2 | `coding-level-2-mid.md` | Mid-level |
| 3 | `coding-level-3-senior.md` | Senior (default) |
| 4 | `coding-level-4-lead.md` | Tech leads |
| 5 | `coding-level-5-god.md` | Experts |

To change default, reference the style in your prompt or CLAUDE.md.

## Hooks

Configure hooks in `.claude/hooks/`:

```javascript
// .claude/hooks/pre-commit.js
module.exports = async (context) => {
  // Run before commits
}
```

See [Hooks Reference](/reference/hooks) for details.

## Skills Activation

Skills auto-activate based on context. To force activation:

```
Use the debugging skill to analyze this error
```

Available skills:
- `planning` - Plan creation and validation
- `code-review` - Review protocols
- `debugging` - Root cause analysis
- `pair-programming` - Collaborative modes
- `ai-multimodal` - Image/video processing
- `media-processing` - FFmpeg/ImageMagick

## Plans Directory

Plans stored in `./plans/`:

```
plans/
├── {YYMMDD-HHMM}-{slug}/
│   ├── plan.md
│   ├── phase-01-*.md
│   └── research/
└── reports/
```

Naming convention: Date-time prefix + descriptive slug.

## Environment Variables

| Variable | Purpose |
|----------|---------|
| `GEMINI_API_KEY` | AI Multimodal features |
| `ANTHROPIC_API_KEY` | Claude API access |
| `GITHUB_TOKEN` | GitHub CLI operations |

::: warning Security
Store secrets in `.env` and **verify it's in `.gitignore`**:

```bash
# Check .gitignore includes .env
grep -q "^\.env$" .gitignore || echo ".env" >> .gitignore
```
:::
