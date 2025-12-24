# Design Principles

Core principles guiding the AI Agent Starter.

## The Holy Trinity

### YAGNI - You Aren't Gonna Need It

**Don't implement features until they're actually needed.**

::: tip Principle
Build for today's requirements, not imagined future ones.
:::

**In practice:**
- Don't add "just in case" code
- Avoid premature abstraction
- Start simple, extend when needed
- Delete unused code

**Example:**
```javascript
// Bad: Over-engineered for hypothetical future
class UserFactory {
  createUser(type) {
    switch(type) {
      case 'admin': return new AdminUser();
      case 'super': return new SuperUser();
      case 'guest': return new GuestUser();
      // ... 10 more types never used
    }
  }
}

// Good: Simple, meets current needs
function createUser(data) {
  return new User(data);
}
```

### KISS - Keep It Simple, Stupid

**The simplest solution that works is usually the best.**

::: tip Principle
Complexity is the enemy of reliability.
:::

**In practice:**
- Favor readability over cleverness
- Prefer standard patterns
- Avoid "magic"
- If it's hard to explain, simplify

**Example:**
```javascript
// Bad: Clever but confusing
const result = data.reduce((a,c)=>({...a,[c.k]:c.v}),{});

// Good: Clear and obvious
const result = {};
for (const item of data) {
  result[item.key] = item.value;
}
```

### DRY - Don't Repeat Yourself

**Abstract when patterns repeat 3+ times.**

::: tip Principle
Every piece of knowledge should have one authoritative source.
:::

**In practice:**
- Wait for 3 repetitions before abstracting
- Don't DRY prematurely
- Prefer duplication over wrong abstraction
- Extract when pattern is stable

**Example:**
```javascript
// After 3rd repetition, extract
function formatUser(user) {
  return `${user.firstName} ${user.lastName}`;
}

// Use everywhere
console.log(formatUser(user1));
console.log(formatUser(user2));
console.log(formatUser(user3));
```

## Secondary Principles

### Fail Fast

Detect and report errors immediately.

```javascript
function processOrder(order) {
  // Validate early
  if (!order.items?.length) {
    throw new Error('Order has no items');
  }
  // Continue processing
}
```

### Explicit Over Implicit

Make behavior obvious.

```javascript
// Bad: Magic behavior
const result = process(data);  // What does this do?

// Good: Clear intent
const validatedData = validateUserInput(data);
const normalizedData = normalizeForDatabase(validatedData);
const result = saveToDatabase(normalizedData);
```

### Composition Over Inheritance

Build from small, focused pieces.

```javascript
// Prefer
const user = {
  ...baseEntity,
  ...authMixin,
  ...profileMixin,
};

// Over deep inheritance chains
```

### Single Responsibility

Each module does one thing well.

```
// Good: Focused modules
src/
├── auth/
│   ├── login.ts
│   ├── logout.ts
│   └── validate.ts
├── users/
│   ├── create.ts
│   ├── update.ts
│   └── delete.ts
```

## Code Quality

### File Size

Keep files under 200 lines.

**Why:**
- Easier to understand
- Faster to navigate
- Better for AI context
- Clearer responsibility

### Naming

Use descriptive, intention-revealing names.

```javascript
// Bad
const d = getData();
const u = d.map(x => x.n);

// Good
const users = fetchActiveUsers();
const userNames = users.map(user => user.name);
```

### Comments

Comment why, not what.

```javascript
// Bad: Describes what code does
// Increment counter
counter++;

// Good: Explains why
// Offset for 1-indexed pagination (API expects 1-based)
counter++;
```

## Testing Philosophy

### Test Behavior, Not Implementation

```javascript
// Bad: Tests implementation details
expect(user._hashPassword).toHaveBeenCalled();

// Good: Tests behavior
expect(user.authenticate('password')).toBe(true);
```

### No Mocks for Business Logic

Test real behavior, not simulations.

### Tests Are Documentation

Good tests explain expected behavior.

```javascript
describe('User Authentication', () => {
  it('allows login with correct password', () => {...});
  it('rejects login after 3 failed attempts', () => {...});
  it('resets lockout after 15 minutes', () => {...});
});
```

## Related

- [Architecture](/concepts/architecture) - System structure
- [Workflows](/guides/workflows) - Development patterns
