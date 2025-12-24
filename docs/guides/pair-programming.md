# Pair Programming

Collaborative development modes with AI.

## Available Modes

### Driver Mode

**You code, AI navigates.**

Start with:
```
I'll drive. Help me implement [feature].
```

AI provides:
- Real-time suggestions
- Error catching
- Pattern recommendations
- Documentation pointers

**Best for:**
- Learning the codebase
- Complex logic implementation
- When you want to understand deeply

### Navigator Mode

**AI codes, you guide.**

Start with:
```
You drive. Implement [feature].
```

Your role:
- Provide direction
- Approve/reject suggestions
- Catch issues early
- Guide architecture

**Best for:**
- Well-understood features
- Boilerplate code
- When you know what you want

### Switch Mode

**Alternate roles.**

```
Let's switch. You drive now.
```

**Best for:**
- Long sessions
- Complex features
- When stuck

### TDD Mode

**Test-driven development.**

Start with:
```
Let's do TDD for [feature].
```

Cycle:
1. **Red** - Write failing test
2. **Green** - Minimum code to pass
3. **Refactor** - Clean up

**Best for:**
- Business logic
- Algorithm implementation
- High-quality requirements

### Mentor Mode

**Learning-focused sessions.**

```
Teach me about [topic] while we implement [feature].
```

AI:
- Explains concepts
- Shows patterns
- Answers questions
- Provides context

**Best for:**
- Learning new tech
- Unfamiliar codebases
- Junior developers

### Debug Mode

**Collaborative debugging.**

```
Let's debug this together: [issue]
```

Approach:
1. Reproduce issue
2. Form hypothesis
3. Test hypothesis
4. Implement fix
5. Verify

**Best for:**
- Complex bugs
- Learning debugging techniques
- Production issues

## Session Tips

### Starting Well

1. **Set context** - Share relevant files, logs, requirements
2. **Define scope** - Be specific about what to accomplish
3. **Choose mode** - Pick appropriate collaboration style

### During Session

1. **Communicate intent** - Explain your thinking
2. **Ask questions** - Don't assume
3. **Take breaks** - Long sessions lose focus
4. **Document decisions** - Capture rationale

### Ending Well

1. **Summarize progress** - What was accomplished
2. **List remaining** - What's left to do
3. **Commit work** - Don't lose progress

## Protocol: Receiving Feedback

When AI suggests changes:

1. **Evaluate technically** - Does it make sense?
2. **Verify** - Can you test it?
3. **Push back if needed** - Explain your reasoning

::: warning
Avoid performative agreement. "Great point!" without evaluation isn't helpful.
:::

## Protocol: Debugging

1. **Read the error** - Actually read it
2. **Reproduce** - Confirm the issue exists
3. **Investigate** - Find root cause, not symptoms
4. **Fix at source** - Don't mask the problem
5. **Verify** - Confirm fix works

::: warning
Don't guess. Investigate before fixing.
:::

## Example Sessions

### TDD Session

```
You: Let's do TDD for a password validator.

AI: Starting TDD. First test?

You: Password must be at least 8 characters.

AI: [Writes test: expect(validate("short")).toBe(false)]
    Test fails. Implementing minimum code...
    [Writes validation]
    Test passes. Refactor needed?

You: Looks good. Next: must have a number.

AI: [Writes next test, continues cycle]
```

### Debug Session

```
You: Let's debug. Users report login fails after password reset.

AI: Reproducing... Can you share error logs?

You: [Pastes logs]

AI: I see the token isn't being cleared after reset.
    Hypothesis: Old token conflicts with new password hash.

You: Makes sense. Check the reset flow.

AI: [Traces through code]
    Found it. Reset doesn't invalidate existing sessions.
    Should we add session invalidation to reset handler?

You: Yes, implement that.
```

## Related

- [Workflows](/guides/workflows) - Development patterns
- [Fixing Commands](/commands/fixing) - Debug commands
