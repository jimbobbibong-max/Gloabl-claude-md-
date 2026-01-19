# GSD Quick Reference

## Starting a Project

```
/gsd:new-project
```

**Provide this context for best results:**
```
## What I'm Building
[1-2 sentences]

## The Jobs It Does
1. **[Job name]** — [what it does]
2. **[Job name]** — [what it does]

## Why This Matters
[Core value]

## Existing Context
[Links, repos, references]
```

---

## Daily Workflow

| Command | When to Use |
|---------|-------------|
| `/gsd:progress` | Start of session — see where you are |
| `/gsd:resume-work` | Continue from previous session |
| `/gsd:plan-phase N` | Plan before building |
| `/gsd:execute-phase N` | Build what's planned |
| `/gsd:verify-work N` | Validate phase is done |

---

## Planning Commands

| Command | Purpose |
|---------|---------|
| `/gsd:discuss-phase N` | Clarify HOW to implement (before planning) |
| `/gsd:plan-phase N` | Create detailed execution plan |
| `/gsd:list-phase-assumptions N` | Surface Claude's assumptions |
| `/gsd:research-phase N` | Research before planning (standalone) |

---

## Execution Commands

| Command | Purpose |
|---------|---------|
| `/gsd:execute-phase N` | Execute all plans in phase |
| `/gsd:verify-work N` | Validate features work |
| `/gsd:debug` | Systematic debugging with state |

---

## Project Management

| Command | Purpose |
|---------|---------|
| `/gsd:add-phase` | Add phase to end of roadmap |
| `/gsd:insert-phase` | Insert urgent work between phases |
| `/gsd:remove-phase N` | Remove future phase |
| `/gsd:add-todo` | Capture idea as todo |
| `/gsd:check-todos` | List pending todos |

---

## Milestone Commands

| Command | Purpose |
|---------|---------|
| `/gsd:new-milestone` | Start new milestone cycle |
| `/gsd:audit-milestone` | Audit completion before archiving |
| `/gsd:complete-milestone` | Archive and prep for next |
| `/gsd:plan-milestone-gaps` | Create phases for audit gaps |

---

## Utility Commands

| Command | Purpose |
|---------|---------|
| `/gsd:help` | Show all commands |
| `/gsd:map-codebase` | Analyze existing codebase |
| `/gsd:pause-work` | Create handoff when pausing |
| `/gsd:update` | Update GSD to latest |
| `/gsd:whats-new` | See changelog |

---

## Harmony Commands (Quick Tasks)

| Command | Purpose |
|---------|---------|
| `/harmony <task>` | Full 4-phase workflow without GSD overhead |
| `/ultrathink <question>` | Deep structured analysis |
| `/meta` | Generate session insights |

---

## Typical Flow

```
/gsd:new-project          # Initialize with jobs/goals
    ↓
/gsd:progress             # See Phase 1
    ↓
/gsd:discuss-phase 1      # Clarify implementation
    ↓
/gsd:plan-phase 1         # Create execution plan
    ↓
/gsd:execute-phase 1      # Build it
    ↓
/gsd:verify-work 1        # Validate it works
    ↓
/gsd:progress             # See Phase 2...
```

---

## Tips

- **Always `/clear` between phases** — fresh context window
- **`/gsd:progress` is your home base** — run it when unsure
- **Verify before proceeding** — `/gsd:verify-work` catches gaps
- **Jobs > Goals** — tell Claude the concrete workflows, not just what you want
