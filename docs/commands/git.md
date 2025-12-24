# Git Commands

Commands for git operations and version control.

## Overview

| Command | Action | Use Case |
|---------|--------|----------|
| `/git:status` | View status | Check working tree |
| `/git:commit` | Create commit | Stage and commit changes |
| `/git:branch` | Manage branches | Create, switch, delete |
| `/git:review` | Code review | PR review and management |

## Commands

### /git:status

Check current repository status.

```
/git:status
```

**Shows:**
- Current branch
- Staged changes
- Unstaged modifications
- Untracked files
- Ahead/behind remote

**Output example:**
```
Branch: feature/user-auth
Status: 3 files modified, 1 staged

Staged:
  M src/auth/login.ts

Modified:
  M src/auth/logout.ts
  M src/components/Header.tsx

Untracked:
  ? src/auth/__tests__/login.test.ts
```

### /git:commit

Create a commit with compliance checks.

```
/git:commit Add user authentication
```

Or shorthand for commit + push:

```
/git:cp Add user authentication
```

**Process:**
1. Runs pre-commit checks (if configured)
2. Stages relevant files
3. Creates commit with message
4. Optionally pushes to remote

**Commit message format:**
```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

**Types:**
- `feat` - New feature
- `fix` - Bug fix
- `docs` - Documentation
- `refactor` - Code refactoring
- `test` - Adding tests
- `chore` - Maintenance

**Example:**
```
/git:commit feat(auth): Add OAuth2 login support
```

### /git:branch

Create and manage branches.

```
/git:branch feature/new-dashboard
```

**Actions:**
- Create new branch from current
- Switch to existing branch
- Delete merged branches
- List all branches

**Naming convention:**
```
feature/description    - New features
fix/description        - Bug fixes
refactor/description   - Refactoring
docs/description       - Documentation
```

**Examples:**
```
/git:branch feature/user-auth
/git:branch fix/login-redirect
/git:branch --delete old-feature
```

### /git:review

Code review and PR management.

```
/git:review
```

Or review specific PR:

```
/git:review 123
```

**Process:**
1. Fetches PR details
2. Analyzes changes
3. Checks for issues:
   - Security vulnerabilities
   - Performance concerns
   - Code style violations
   - Missing tests
4. Provides feedback
5. Optionally approves/requests changes

**Review checklist:**
- [ ] No security vulnerabilities
- [ ] Tests cover new code
- [ ] No console.log/debug statements
- [ ] Error handling present
- [ ] Documentation updated
- [ ] No hardcoded secrets

## Workflows

### Feature Development

```bash
# 1. Create feature branch
/git:branch feature/user-profile

# 2. Implement feature
/code:auto

# 3. Commit changes
/git:commit feat(profile): Add user profile page

# 4. Push and create PR
/git:cp
```

### Bug Fix

```bash
# 1. Create fix branch
/git:branch fix/login-error

# 2. Fix the bug
/fix:hard Login fails for new users

# 3. Commit with reference
/git:commit fix(auth): Handle null user on first login

Fixes #123

# 4. Push
/git:cp
```

### Code Review

```bash
# 1. Review PR
/git:review 456

# 2. Address feedback if needed
/fix:fast Review feedback items

# 3. Commit fixes
/git:commit fix: Address review feedback

# 4. Push updates
/git:cp
```

## Integration

### Pre-commit Hooks

Commands respect `.claude/hooks/` configuration:

```javascript
// .claude/hooks/pre-commit.js
module.exports = async (context) => {
  // Run linting
  // Run type checking
  // Verify tests pass
}
```

### Branch Protection

Commands warn about:
- Direct commits to `main`/`master`
- Force pushes
- Missing PR reviews

## Tips

- Use descriptive branch names
- Keep commits atomic (one logical change)
- Reference issues in commit messages
- Review your own changes before committing
- Use `/git:status` frequently to stay oriented

## Related

- [Coding Commands](/commands/coding) - Implementation
- [Hooks Reference](/reference/hooks) - Git hooks configuration
