# SPARC Methodology

SPARC is a structured approach to software development using specialized AI agents.

## What is SPARC?

**S**pecification - **P**seudocode - **A**rchitecture - **R**efinement - **C**ompletion

A systematic methodology where each phase has dedicated agent support.

## The Five Phases

### 1. Specification

**Agent:** `/sparc:specification`

Define what you're building:
- Requirements gathering
- Constraint identification
- Success criteria
- Scope boundaries

```
/sparc:specification User authentication system
```

### 2. Pseudocode

**Agent:** `/sparc:pseudocode`

Design before coding:
- High-level algorithm
- Data flow
- State transitions
- Error handling paths

```
/sparc:pseudocode OAuth login flow
```

### 3. Architecture

**Agent:** `/sparc:architecture`

System design:
- Component structure
- API contracts
- Database schema
- Integration points

```
/sparc:architecture Authentication service architecture
```

### 4. Refinement

**Agent:** `/sparc:refinement`

Implementation and iteration:
- Code implementation
- Performance tuning
- Edge case handling
- Code review

```
/sparc:refinement Optimize token validation
```

### 5. Completion

**Agent:** `/sparc:completion`

Finalize delivery:
- Testing
- Documentation
- Deployment prep
- Handoff

```
/sparc:completion Finalize OAuth implementation
```

## When to Use SPARC

| Scenario | Recommended |
|----------|-------------|
| New feature | Yes |
| Bug fix | No (use /fix:*) |
| Refactoring | Partial (R and C phases) |
| Spike/POC | Partial (S and P phases) |
| Documentation | No (use /sparc:documenter directly) |

## Agent Collaboration

Agents can work together:

```bash
# Research phase
/sparc:specification Payment gateway requirements

# Architecture based on research
/sparc:architecture Payment integration design

# Implementation
/sparc:refinement Implement payment flow

# Quality
/sparc:testing Test payment edge cases
/sparc:completion Final review
```

## Best Practices

1. **Don't skip phases** - Each builds on previous
2. **Keep phases focused** - Don't overload single phase
3. **Review between phases** - Validate before proceeding
4. **Document decisions** - Capture rationale for architecture choices
5. **Iterate within phases** - Refinement is expected

## Integration with Commands

SPARC works with planning commands:

```bash
# /plan:hard uses SPARC internally
/plan:hard Build payment system
# -> Runs specification analysis
# -> Creates architecture design
# -> Plans implementation phases
```

## Related

- [SPARC Agents Reference](/commands/sparc) - All 16 agents
- [Workflows](/guides/workflows) - Development patterns
