---
name: parallel
description: Parallel execution for 4x efficiency
---

## Parallel Execution Mode

Fire multiple independent tasks simultaneously:
```typescript
// Single message, multiple Task calls
Task({ subagent_type: "builder", prompt: "Component A" })
Task({ subagent_type: "builder", prompt: "Component B" })
Task({ subagent_type: "builder", prompt: "Component C" })
```

Target: 4.25x efficiency gain via parallelization.
