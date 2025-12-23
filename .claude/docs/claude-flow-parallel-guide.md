# Claude-Flow Parallel Execution Guide

## Quick Start

### Initialize Swarm
Use `swarm_init` to create multi-agent topology:
- `hierarchical`: Tree structure for coordinated tasks
- `mesh`: Peer-to-peer for independent parallel work
- `star`: Centralized coordinator pattern
- `ring`: Circular message passing

```javascript
swarm_init({
  topology: "hierarchical",
  strategy: "balanced",
  maxAgents: 8
})
```

### Spawn Agents in Parallel
Instead of sequential spawning (slow):
```javascript
agents_spawn_parallel({
  agents: [
    {type: "researcher", name: "research-1"},
    {type: "coder", name: "impl-1"},
    {type: "tester", name: "test-1"}
  ],
  maxConcurrency: 5,
  batchSize: 3
})
```
Result: 10-20x faster than sequential spawning.

### Orchestrate Tasks
```javascript
task_orchestrate({
  task: "Implement feature X",
  strategy: "parallel",  // or sequential, adaptive
  priority: "high",
  maxAgents: 3
})
```

## Patterns for /plan Command

### Pattern: Parallel Research
When `/plan:hard` needs multiple research threads:
1. Spawn researchers in parallel for different aspects
2. Use `mesh` topology for independent work
3. Aggregate results after all complete

### Pattern: Multi-Phase Planning
For `/plan:parallel` command:
1. Init swarm with `hierarchical` topology
2. Coordinator agent manages phase sequencing
3. Worker agents execute phases in parallel where deps allow

## Patterns for /code Command

### Pattern: Parallel Implementation
For `/code:parallel` with multiple files:
1. Spawn coder agents per independent module
2. Use `star` topology with coordinator
3. Sequential merge for conflict resolution

### Pattern: Test Parallelization
Step 3 (Testing) optimization:
1. Spawn tester agents per test suite
2. Use `parallel` strategy
3. Aggregate pass/fail results

## Performance Reference

| Operation | Sequential | Parallel | Speedup |
|-----------|------------|----------|---------|
| Agent spawn (5) | 5s | 0.3s | 16x |
| Research (3 topics) | 30s | 12s | 2.5x |
| Test suites (4) | 60s | 18s | 3.3x |

## MCP Tools Reference

| Tool | Purpose | Key Params |
|------|---------|------------|
| `swarm_init` | Create topology | topology, strategy, maxAgents |
| `agents_spawn_parallel` | Batch spawn | agents[], batchSize, maxConcurrency |
| `agent_spawn` | Single agent | type, name, capabilities |
| `task_orchestrate` | Run task | task, strategy, priority |
| `swarm_status` | Monitor health | swarmId |
| `swarm_monitor` | Real-time monitoring | swarmId, interval |
| `agent_list` | List active agents | swarmId |
| `agent_metrics` | Performance metrics | agentId |

## Agent Types

| Type | Use Case |
|------|----------|
| `researcher` | Information gathering, analysis |
| `coder` | Code implementation |
| `tester` | Test execution, validation |
| `analyst` | Data analysis, optimization |
| `coordinator` | Task orchestration |
| `optimizer` | Performance tuning |

## Integration Notes
- MCP tools available via claude-flow server
- Requires `claude-flow` MCP server configured
- Compatible with Claude Code CLI
- Memory persistence via `memory_usage` tool
