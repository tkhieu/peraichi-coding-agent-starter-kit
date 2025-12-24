# Output Styles Reference

Control response verbosity and detail level.

## Overview

Six levels from non-technical explanations to minimal expert mode.

## Level 0: ELI5

**File:** `.claude/output-styles/coding-level-0-eli5.md`

**Audience:** Non-technical stakeholders

**Characteristics:**
- Simple language
- No jargon
- Analogies
- Step-by-step explanations
- Visual descriptions

**Example output:**
```
Think of authentication like a building security guard.
When you show your ID (password), the guard (server)
checks it against the list (database) and gives you
a visitor badge (token) to wear around.
```

---

## Level 1: Junior Developer

**File:** `.claude/output-styles/coding-level-1-junior.md`

**Audience:** New developers, students

**Characteristics:**
- Detailed explanations
- Code with comments
- Links to documentation
- Concept explanations
- Common mistakes highlighted

**Example output:**
```javascript
// Create a new user in the database
// We use 'await' because database operations are asynchronous
const user = await User.create({
  email: email,      // From the request body
  password: hash,    // Password after hashing (never store plain text!)
});

// Learn more: https://docs.example.com/user-creation
```

---

## Level 2: Mid-Level Developer

**File:** `.claude/output-styles/coding-level-2-mid.md`

**Audience:** Developers with 2-5 years experience

**Characteristics:**
- Balanced detail
- Some context
- Best practices mentioned
- Trade-offs discussed

**Example output:**
```javascript
const user = await User.create({ email, password: hash });
// Consider adding indexes on email for query performance
// See: src/models/user.ts for schema definition
```

---

## Level 3: Senior Developer (Default)

**File:** `.claude/output-styles/coding-level-3-senior.md`

**Audience:** Experienced developers

**Characteristics:**
- Concise
- Assumes knowledge
- Focus on important details
- Minimal explanation

**Example output:**
```javascript
const user = await User.create({ email, password: hash });
```

---

## Level 4: Tech Lead

**File:** `.claude/output-styles/coding-level-4-lead.md`

**Audience:** Technical leaders, architects

**Characteristics:**
- Architectural focus
- System implications
- Trade-off analysis
- Scaling considerations

**Example output:**
```
User creation: standard pattern. Consider:
- Rate limiting for signup abuse
- Email verification flow
- GDPR compliance for EU users
```

---

## Level 5: Expert

**File:** `.claude/output-styles/coding-level-5-god.md`

**Audience:** Domain experts

**Characteristics:**
- Minimal
- Code-focused
- No hand-holding
- Just the answer

**Example output:**
```javascript
await User.create({ email, password: hash });
```

---

## Setting Default Style

In `CLAUDE.md` or conversation:

```markdown
Use output level 3 (senior) for all responses.
```

Or reference style file:
```
Follow the style in .claude/output-styles/coding-level-3-senior.md
```

## Per-Request Override

```
[Level 1] Explain how this authentication works.
```

Or:
```
Explain this like I'm a junior developer.
```

## Related

- [Skills Reference](/reference/skills) - Available skills
- [Configuration](/getting-started/configuration) - Setup options
