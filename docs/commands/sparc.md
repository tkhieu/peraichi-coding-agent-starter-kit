# SPARC Agents

16 specialized agents for different development tasks.

## What is SPARC?

SPARC = **S**pecification, **P**seudocode, **A**rchitecture, **R**efinement, **C**ompletion

A methodology breaking complex development into focused phases, each handled by specialized agents.

## Agent Overview

| Agent | Focus | Primary Use |
|-------|-------|-------------|
| `/sparc:specification` | Requirements | Define what to build |
| `/sparc:pseudocode` | Logic | Design algorithms |
| `/sparc:architecture` | Structure | System design |
| `/sparc:refinement` | Improvement | Optimize code |
| `/sparc:completion` | Finalization | Testing & polish |
| `/sparc:api` | Endpoints | API design |
| `/sparc:database` | Schema | Data modeling |
| `/sparc:security` | Protection | Security review |
| `/sparc:performance` | Speed | Optimization |
| `/sparc:testing` | Quality | Test strategy |
| `/sparc:devops` | Deployment | CI/CD & infra |
| `/sparc:monitoring` | Observability | Logging & metrics |
| `/sparc:migration` | Transitions | Data/code migration |
| `/sparc:integration` | Connections | System integration |
| `/sparc:ui` | Interface | UI/UX design |
| `/sparc:validation` | Compliance | Standards check |

## Core Agents

### /sparc:specification

Define requirements and specifications.

```
/sparc:specification User authentication system
```

**Output:**
- Functional requirements
- Non-functional requirements
- Constraints
- Acceptance criteria
- User stories

### /sparc:pseudocode

Design algorithm structure before coding.

```
/sparc:pseudocode Password reset flow
```

**Output:**
- Step-by-step logic
- Decision points
- Data transformations
- Error handling paths

### /sparc:architecture

Design system structure.

```
/sparc:architecture Microservices for e-commerce
```

**Output:**
- Component diagram
- Data flow
- Service boundaries
- Communication patterns
- Technology choices

### /sparc:refinement

Improve existing implementation.

```
/sparc:refinement src/services/auth.ts
```

**Focus areas:**
- Code clarity
- Performance
- Error handling
- Edge cases
- Maintainability

### /sparc:completion

Finalize and prepare for production.

```
/sparc:completion
```

**Actions:**
- Run full test suite
- Check coverage
- Verify documentation
- Review error handling
- Final security scan

## Specialized Agents

### /sparc:api

API design and validation.

```
/sparc:api User management endpoints
```

**Output:**
- Endpoint definitions
- Request/response schemas
- Authentication requirements
- Rate limiting rules
- Versioning strategy

### /sparc:database

Database schema design.

```
/sparc:database User and order tables
```

**Output:**
- Table schemas
- Relationships
- Indexes
- Migrations
- Query patterns

### /sparc:security

Security architecture review.

```
/sparc:security Review auth implementation
```

**Checks:**
- Authentication flows
- Authorization rules
- Input validation
- Encryption usage
- Secret management
- OWASP Top 10

### /sparc:performance

Performance optimization.

```
/sparc:performance API response times
```

**Focus:**
- Query optimization
- Caching strategy
- Load testing
- Resource usage
- Bottleneck identification

### /sparc:testing

Test strategy design.

```
/sparc:testing Payment processing module
```

**Output:**
- Test pyramid strategy
- Unit test patterns
- Integration test approach
- E2E scenarios
- Coverage targets

### /sparc:devops

Deployment and infrastructure.

```
/sparc:devops Production deployment pipeline
```

**Output:**
- CI/CD pipeline
- Environment configuration
- Scaling strategy
- Rollback procedures
- Health checks

### /sparc:monitoring

Observability design.

```
/sparc:monitoring User service monitoring
```

**Output:**
- Logging strategy
- Metrics collection
- Alerting rules
- Dashboard design
- Trace configuration

### /sparc:migration

Data and code migration.

```
/sparc:migration Migrate from v1 to v2 API
```

**Output:**
- Migration plan
- Rollback strategy
- Data transformation
- Compatibility layer
- Verification steps

### /sparc:integration

System integration design.

```
/sparc:integration Payment gateway integration
```

**Output:**
- Integration architecture
- API contracts
- Error handling
- Retry logic
- Circuit breaker patterns

### /sparc:ui

UI/UX architecture.

```
/sparc:ui Dashboard component structure
```

**Output:**
- Component hierarchy
- State management
- Styling approach
- Accessibility requirements
- Responsive design

### /sparc:validation

Standards and compliance check.

```
/sparc:validation Check GDPR compliance
```

**Checks:**
- Code standards
- Security compliance
- Accessibility (WCAG)
- Performance budgets
- Documentation completeness

## Using SPARC Workflow

### Full Development Cycle

```bash
# 1. Define requirements
/sparc:specification User profile feature

# 2. Design algorithm
/sparc:pseudocode Profile update logic

# 3. Design architecture
/sparc:architecture Profile service structure

# 4. Design database
/sparc:database Profile and preferences tables

# 5. Design API
/sparc:api Profile endpoints

# 6. Design tests
/sparc:testing Profile module tests

# 7. (Implement with /code:auto)

# 8. Refine implementation
/sparc:refinement src/services/profile.ts

# 9. Security review
/sparc:security Review profile service

# 10. Finalize
/sparc:completion
```

### Selective Usage

Use individual agents as needed:

```bash
# Just need API design
/sparc:api New webhook endpoints

# Just need security review
/sparc:security Audit auth module

# Just need test strategy
/sparc:testing Coverage for payment module
```

## Integration with claude-flow

SPARC agents can run in parallel using claude-flow:

```javascript
// Parallel execution
swarm_init({ topology: 'mesh' })

agents_spawn_parallel([
  { type: 'architect', name: 'system-design' },
  { type: 'analyst', name: 'security-review' },
  { type: 'tester', name: 'test-strategy' }
])
```

## Tips

- Start with `/sparc:specification` for new features
- Use `/sparc:architecture` before major refactoring
- Run `/sparc:security` before deploying new auth code
- Use `/sparc:validation` before major releases
- Combine agents for comprehensive coverage

## Related

- [SPARC Methodology Guide](/guides/sparc-methodology)
- [Claude-Flow Integration](/guides/claude-flow)
- [Planning Commands](/commands/planning)
