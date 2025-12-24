# Skills Reference

Modular capabilities that activate based on context.

## Overview

Skills are specialized knowledge modules. They auto-activate when relevant or can be explicitly invoked.

## Available Skills

### planning

**Location:** `.claude/skills/planning/`

Plan creation, organization, and validation.

**Activates when:**
- Using `/plan:*` commands
- Discussing project planning
- Creating implementation strategies

**Capabilities:**
- Plan structure templates
- Phase organization
- Dependency management
- Effort estimation

**Explicit activation:**
```
Use the planning skill to create a migration plan.
```

---

### code-review

**Location:** `.claude/skills/code-review/`

Code review reception, verification gates.

**Activates when:**
- Using review commands
- Receiving PR feedback
- Discussing code quality

**Capabilities:**
- Review protocol
- Verification gates
- Feedback evaluation
- Push-back guidance

**Key rules:**
- No performative agreement
- Verify before implementing
- Evidence before claims

---

### debugging

**Location:** `.claude/skills/debugging/`

Systematic debugging, root cause tracing.

**Activates when:**
- Using `/fix:*` commands
- Encountering errors
- Analyzing logs

**Capabilities:**
- Root cause analysis
- Stack trace interpretation
- Log analysis patterns
- Defense-in-depth strategies

**Protocol:**
1. Read the error
2. Reproduce
3. Investigate
4. Fix at source
5. Verify

---

### pair-programming

**Location:** `.claude/skills/pair-programming/`

Collaborative development modes.

**Activates when:**
- Collaborative coding sessions
- TDD requests
- Mentoring sessions

**Modes:**
| Mode | You | AI |
|------|-----|-----|
| Driver | Code | Navigate |
| Navigator | Guide | Code |
| Switch | Alternate | Alternate |
| TDD | Test cycle | Test cycle |
| Mentor | Learn | Teach |
| Debug | Collaborate | Collaborate |

---

### ai-multimodal

**Location:** `.claude/skills/ai-multimodal/`

Image, video, and audio processing with AI.

**Requires:**
- Python 3.x
- `google-genai` package
- `GEMINI_API_KEY` environment variable

**Activates when:**
- Image analysis requests
- Video processing
- Audio transcription

**Capabilities:**
- Image description
- Video frame analysis
- Audio transcription
- Document OCR

---

### media-processing

**Location:** `.claude/skills/media-processing/`

FFmpeg, ImageMagick, background removal.

**Requires:**
- FFmpeg
- ImageMagick
- rmbg-cli

**Activates when:**
- Media conversion
- Image editing
- Video encoding

**Capabilities:**
- Video encoding (H.264, H.265, VP9)
- Image manipulation
- Background removal
- Format conversion

---

## Skill Activation

### Automatic

Skills activate based on:
- Command context (`/fix` -> debugging)
- Conversation topic
- File types mentioned

### Explicit

Force activation:
```
Use the debugging skill to analyze this error.
```

### Multiple

Skills can combine:
```
Use debugging and code-review skills to fix and review this code.
```

## Creating Custom Skills

Add to `.claude/skills/`:

```
.claude/skills/my-skill/
├── skill.md        # Main instructions
├── examples/       # Example usage
└── templates/      # Templates if needed
```

In `skill.md`:
```markdown
# My Custom Skill

## When to Activate
- Trigger conditions

## Capabilities
- What it can do

## Instructions
- How to behave
```

## Related

- [Hooks Reference](/reference/hooks) - Extension points
- [Output Styles](/reference/output-styles) - Verbosity control
