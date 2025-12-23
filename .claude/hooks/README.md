# Hooks

Claude Code hooks for automated reminders and workflow enhancements.

## Available Hooks

### dev-rules-reminder.cjs

**Triggers:** On conversation start
**Purpose:** Reminds development principles (YAGNI, KISS, DRY)

This hook automatically injects development rules and session context at the start of each Claude Code conversation.

**Key Features:**
- Injects development rules from workflows
- Provides plan context and naming conventions
- Sets up validation mode for plans
- Reminds YAGNI/KISS/DRY principles

## Adding Custom Hooks

1. Create `.cjs` file in this directory
2. Export hook function following Claude Code hook specification
3. Register in `.claude/settings.json` or `.claude/settings.local.json`

### Hook Specification

```javascript
// Example hook structure
module.exports = async function(context) {
  // context.event - The triggering event
  // context.conversation - Current conversation context

  return {
    // Return modified context or additional instructions
    inject: "Additional instructions to inject"
  };
};
```

## Configuration

Hooks are configured in `.claude/settings.json`:

```json
{
  "hooks": {
    "conversation_start": ["./hooks/dev-rules-reminder.cjs"]
  }
}
```

## Dependencies

- Node.js runtime required for `.cjs` hooks
- Hooks execute in the Claude Code environment
