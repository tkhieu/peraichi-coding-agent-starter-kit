# Claude-Flow Integration

Parallel agent execution for faster development.

## What is Claude-Flow?

An MCP server enabling multi-agent coordination:
- Swarm topologies
- Parallel agent spawning
- Task orchestration
- Memory persistence

## Prerequisites

Install claude-flow:

```bash
npm install -g claude-flow@alpha
```

Configure MCP server in Claude Code settings.

## Topologies

### Hierarchical

Tree structure with coordinator.

```javascript
swarm_init({
  topology: "hierarchical",
  strategy: "balanced",
  maxAgents: 8
})
```

**Use for:** Coordinated tasks, phase-based work

### Mesh

Peer-to-peer, no central coordinator.

```javascript
swarm_init({
  topology: "mesh",
  strategy: "balanced",
  maxAgents: 8
})
```

**Use for:** Independent parallel research

### Star

Central hub with worker spokes.

```javascript
swarm_init({
  topology: "star",
  strategy: "balanced",
  maxAgents: 8
})
```

**Use for:** Aggregation tasks, result collection

### Ring

Circular message passing.

```javascript
swarm_init({
  topology: "ring",
  strategy: "balanced",
  maxAgents: 8
})
```

**Use for:** Pipeline processing

## Parallel Agent Spawning

Sequential spawning is slow. Use batch:

```javascript
agents_spawn_parallel({
  agents: [
    {type: "researcher", name: "research-oauth"},
    {type: "researcher", name: "research-jwt"},
    {type: "researcher", name: "research-security"}
  ],
  maxConcurrency: 5,
  batchSize: 3
})
```

**Result:** 10-20x faster than sequential.

## Task Orchestration

```javascript
task_orchestrate({
  task: "Research authentication patterns",
  strategy: "parallel",  // or sequential, adaptive
  priority: "high",
  maxAgents: 3
})
```

**Strategies:**
- `parallel` - All at once
- `sequential` - One after another
- `adaptive` - System decides based on load

## Patterns

### Parallel Research

When `/plan:hard` needs multiple research threads:

1. Init mesh topology
2. Spawn researchers in parallel
3. Each researches independently
4. Aggregate results

```javascript
swarm_init({topology: "mesh"})

agents_spawn_parallel({
  agents: [
    {type: "researcher", name: "api-research"},
    {type: "researcher", name: "security-research"},
    {type: "researcher", name: "performance-research"}
  ]
})

task_orchestrate({
  task: "Research OAuth implementation",
  strategy: "parallel"
})
```

### Multi-Phase Implementation

For `/code:parallel`:

1. Init star topology
2. Coordinator manages phases
3. Workers implement in parallel
4. Merge changes

```javascript
swarm_init({topology: "star"})

// Phase with independent tasks
agents_spawn_parallel({
  agents: [
    {type: "coder", name: "impl-models"},
    {type: "coder", name: "impl-routes"},
    {type: "coder", name: "impl-views"}
  ]
})
```

### Test Parallelization

```javascript
swarm_init({topology: "star"})

agents_spawn_parallel({
  agents: [
    {type: "tester", name: "test-unit"},
    {type: "tester", name: "test-integration"},
    {type: "tester", name: "test-e2e"}
  ]
})

task_orchestrate({
  task: "Run all test suites",
  strategy: "parallel"
})
```

## Performance Reference

| Operation | Sequential | Parallel | Speedup |
|-----------|------------|----------|---------|
| Agent spawn (5) | 5s | 0.3s | 16x |
| Research (3 topics) | 30s | 12s | 2.5x |
| Test suites (4) | 60s | 18s | 3.3x |

## MCP Tools Reference

| Tool | Purpose |
|------|---------|
| `swarm_init` | Create topology |
| `agents_spawn_parallel` | Batch spawn |
| `agent_spawn` | Single agent |
| `task_orchestrate` | Run task |
| `swarm_status` | Monitor health |
| `agent_list` | List agents |
| `agent_metrics` | Performance |
| `memory_usage` | Persistence |

## Related

- [SPARC Methodology](/guides/sparc-methodology) - Agent roles
- [Coding Commands](/commands/coding) - `/code:parallel`
