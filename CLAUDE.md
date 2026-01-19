# Unified Development System: GSD + Say-Your-Harmony

> **CRITICAL: Understand the JOBS, not just the goal.**
>
> Before engineering anything, ensure you know the **concrete workflows** (jobs) the system performs.
> - Bad: "Build a question extraction system"
> - Good: "1. Fix existing — re-classify wrong entries. 2. Extract new — download → extract → match → upload"
>
> If PROJECT.md doesn't have a "Jobs It Does" section, ASK before proceeding.

---

You are enhanced with two complementary orchestration systems:
- **GSD (Get Shit Done)**: Project structure, roadmaps, milestones, persistent state
- **Say-Your-Harmony**: 4-phase workflow methodology, parallel execution, meta-analysis

---

## WHEN TO USE WHICH

| Situation | Use |
|-----------|-----|
| Starting a new project | `/gsd:new-project` |
| Planning a milestone/feature | `/gsd:plan-phase` |
| Executing planned work | `/gsd:execute-phase` or `/harmony` |
| Quick task (no roadmap needed) | `/harmony <task>` |
| Deep analysis of a problem | `/ultrathink <question>` |
| Debugging issues | `/gsd:debug` |
| Check progress | `/gsd:progress` |
| Generate session insights | `/meta` |

---

## Starting New Projects: Required Context

**When user runs `/gsd:new-project`, prompt them for this format if not provided:**

```
## What I'm Building
[1-2 sentences on the system/tool]

## The Jobs It Does
[List the concrete workflows — what does a user actually DO with this?]

1. **[Job name]** — [what it does]
2. **[Job name]** — [what it does]

## Why This Matters
[The core value — why does this exist?]

## Existing Context (if any)
[Links, repos, prior work, references]
```

**Example:**
```
Building: Pipeline to extract HSC exam questions and upload to QuestionBank2

Jobs:
1. Fix existing — re-classify questions with wrong/missing skills
2. Extract new — download papers, extract via vision AI, match to skills, upload

Why: Every question needs correct subskill mapping for targeted student practice

Existing: beam-portal scripts in ~/beam-portal/scripts/
```

**Why this matters:** Without concrete jobs, Claude may understand the goal but not the workflows — leading to questions mid-project that should have been answered upfront.

**Claude's responsibility:** If the user doesn't provide jobs/workflows, ASK before proceeding. Don't guess what the system does.

---

## GSD: Project-Level Orchestration

GSD manages the **macro level** - projects, milestones, phases, and persistent state.

### Key Commands
| Command | Description |
|---------|-------------|
| `/gsd:new-project` | Initialize project with roadmap |
| `/gsd:progress` | Check progress, route to next action |
| `/gsd:plan-phase` | Create detailed phase plan |
| `/gsd:execute-phase` | Execute phase with atomic commits |
| `/gsd:debug` | Systematic debugging with state |
| `/gsd:verify-work` | Validate built features |
| `/gsd:resume-work` | Resume from previous session |

### GSD Agents
- **gsd-planner**: Creates executable phase plans
- **gsd-executor**: Executes plans with atomic commits
- **gsd-verifier**: Validates goals achieved
- **gsd-debugger**: Scientific debugging method
- **gsd-codebase-mapper**: Analyzes codebase structure

---

## Say-Your-Harmony: Task-Level Methodology

Harmony manages the **micro level** - how to execute any development task.

### THE 4-PHASE MANDATE

```
┌─────────────┐    ┌─────────────┐    ┌─────────────────┐    ┌─────────────┐
│  PLANNING   │ →  │   DESIGN    │ →  │ IMPLEMENTATION  │ →  │  OPERATION  │
└─────────────┘    └─────────────┘    └─────────────────┘    └─────────────┘
     │                  │                    │                     │
     ▼                  ▼                    ▼                     ▼
 • Problem          • Architecture       • Parallel           • Deployment
 • Requirements     • Decisions         • Testing            • Verification
 • Information      • Tradeoffs         • Risk Analysis      • Meta-Analysis
```

### Key Commands
| Command | Description |
|---------|-------------|
| `/harmony <task>` | Activate full 4-phase workflow |
| `/plan` | Phase 1: Planning |
| `/design` | Phase 2: Design |
| `/build` | Phase 3: Implementation |
| `/operate` | Phase 4: Operation |
| `/meta` | Generate session meta-analysis |
| `/ultrathink` | Deep structured analysis |

### Harmony Agents
| Agent | Phase | Role | Model |
|-------|-------|------|-------|
| **planner** | Phase 1 | Problem definition, requirements | opus |
| **architect** | Phase 2 | Architecture, decisions, tradeoffs | opus |
| **builder** | Phase 3 | Parallel implementation, testing | sonnet |
| **operator** | Phase 4 | Deployment, verification | sonnet |
| **explorer** | Support | Fast codebase search | haiku |
| **meta-analyzer** | Support | Session analysis | opus |

---

## SYNTHESIS: Using Both Together

### Recommended Workflow

1. **Project Setup** (GSD)
   ```
   /gsd:new-project
   ```
   Creates roadmap, milestones, phases in `.planning/`

2. **Phase Planning** (GSD)
   ```
   /gsd:plan-phase
   ```
   Creates detailed PLAN.md for a phase

3. **Phase Execution** (Harmony methodology within GSD)
   ```
   /gsd:execute-phase
   ```
   The executor follows Harmony's 4-phase methodology internally

4. **Verification** (GSD)
   ```
   /gsd:verify-work
   ```
   Validates features match requirements

5. **Meta-Analysis** (Harmony)
   ```
   /meta
   ```
   Captures patterns and improvements

### Quick Tasks (No Roadmap)
For tasks that don't need project tracking:
```
/harmony implement user authentication
```
This runs the full 4-phase workflow without GSD overhead.

---

## Core Principles (Both Systems)

1. **NO SHORTCUTS**: Every task goes through proper phases
2. **PARALLEL EXECUTION**: Independent tasks run concurrently (4x efficiency)
3. **DECISION DOCUMENTATION**: Every choice has documented rationale
4. **PERSISTENT STATE**: GSD maintains context across sessions
5. **META-ANALYSIS**: Generate insights for continuous improvement
6. **VERIFY COMPLETION**: Check all criteria before marking done

---

## ⛔ MANDATORY VERIFICATION GATE

```
┌─────────────────────────────────────────────────────────────────┐
│  EVERY PHASE must pass /gsd:verify-work BEFORE proceeding.     │
│  NO EXCEPTIONS. This is a hard gate, not a suggestion.         │
└─────────────────────────────────────────────────────────────────┘
```

**The rule:** After completing any GSD phase execution:
1. Run `/gsd:verify-work <phase>`
2. Fix any gaps identified
3. Re-run verification until PASSED
4. ONLY THEN proceed to next phase

**Automated Testing:** For any verification test that can be run by Claude (CLI commands, file checks, etc.), run it automatically instead of prompting the user. Only ask the user to verify things that require human judgment (UI appearance, user experience, etc.).

**Enforcement:**
- `/gsd:progress` will not route to next phase if current phase lacks UAT
- Phase is NOT complete until verification passes
- Skipping verification = shipping bugs

**Why this matters:** Verification catches gaps between "code written" and "feature works". Without it, problems compound across phases.

---

## Communication Style

**Always provide "Also available" alternatives** when presenting next steps or completing phases:
- After any phase completion, suggest the primary next action AND 2-3 alternative paths
- Format: Primary recommendation first, then "Also available:" with alternatives
- Helps user understand their options without having to ask

Example:
```
## ▶ Next Up
**Phase 2: Migration** — copy beam-portal scripts
`/gsd:discuss-phase 2` — gather context first

**Also available:**
- `/gsd:plan-phase 2` — skip discussion, plan directly
- `/gsd:execute-phase 2` — skip to execution (if already planned)
```

---

## The Promise

Before concluding ANY work, verify:
- [ ] All phases completed (GSD or Harmony)
- [ ] Tests passing
- [ ] Critical risks addressed
- [ ] User request FULLY satisfied
- [ ] Meta-analysis generated (for significant work)
- [ ] **`/gsd:verify-work` run and passed** (MANDATORY - see gate above)

If ANY checkbox is unchecked, YOU ARE NOT DONE. Continue working.

**Remember: Phase complete ≠ Code written. Phase complete = Verification passed.**
