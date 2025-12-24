# Hooks Reference

Extend Claude Code behavior at specific points.

## Overview

Hooks run code at lifecycle events:
- Pre-command
- Post-command
- Pre-commit
- Post-commit
- Session start/end

## Location

`.claude/hooks/`

## Hook Types

### Pre-Command Hooks

Run before command execution.

```javascript
// .claude/hooks/pre-command.js
module.exports = async (context) => {
  const { command, args } = context;

  // Validate command
  if (command === 'code:auto' && !args.plan) {
    throw new Error('Plan path required');
  }

  // Continue execution
  return true;
};
```

### Post-Command Hooks

Run after command completion.

```javascript
// .claude/hooks/post-command.js
module.exports = async (context) => {
  const { command, result } = context;

  // Log execution
  console.log(`${command} completed: ${result.success}`);

  // Trigger follow-up actions
  if (command === 'code:auto' && result.success) {
    // Auto-commit or notify
  }
};
```

### Pre-Commit Hooks

Run before git commits.

```javascript
// .claude/hooks/pre-commit.js
module.exports = async (context) => {
  const { files } = context;

  // Check for secrets
  for (const file of files) {
    if (containsSecrets(file)) {
      throw new Error(`Secrets detected in ${file}`);
    }
  }

  return true;
};
```

### Session Hooks

Run at session start/end.

```javascript
// .claude/hooks/session-start.js
module.exports = async (context) => {
  // Load project context
  // Initialize memory
  // Set up environment
};

// .claude/hooks/session-end.js
module.exports = async (context) => {
  // Save state
  // Cleanup resources
  // Log session summary
};
```

## Context Object

Hooks receive context with:

```typescript
interface HookContext {
  command?: string;        // Current command
  args?: object;           // Command arguments
  files?: string[];        // Affected files
  result?: CommandResult;  // Execution result (post-hooks)
  session?: SessionInfo;   // Session information
  memory?: MemoryStore;    // Persistent memory
}
```

## Configuration

In `.claude/hooks/config.json`:

```json
{
  "hooks": {
    "pre-command": "./pre-command.js",
    "post-command": "./post-command.js",
    "pre-commit": "./pre-commit.js"
  },
  "enabled": true,
  "timeout": 5000
}
```

## Best Practices

1. **Keep hooks fast** - Long hooks slow down workflow
2. **Handle errors gracefully** - Catch and report, don't crash
3. **Use async/await** - Hooks are async by default
4. **Log sparingly** - Too much output is noise
5. **Test hooks** - They can break workflows if buggy

## Example: Pattern Block Hook

```javascript
// Blocks overly broad glob patterns
module.exports = async (context) => {
  const { pattern } = context.args;

  if (pattern === '**/*.md') {
    console.log('BLOCKED: Overly broad pattern');
    console.log('Use more specific: src/**/*.md');
    return false;
  }

  return true;
};
```

## Related

- [Skills Reference](/reference/skills) - Skill system
- [Configuration](/getting-started/configuration) - Hook setup
