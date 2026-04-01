# Project Operations Setup Guide

> Reference for scaffolding any new project folder with the standard operational structure. Covers all files, templates, and CLAUDE.md integration.

---

## Execution Rules

- **If a file already exists in the project folder, do not overwrite it.** Flag it to the user (e.g., "MEMORY.md already exists — skipping") and move on.
- **If CLAUDE.md already exists, do not overwrite.** Instead, propose adding the integration blocks (Memory & Progress, Context Files) to the existing file and get approval before editing.
- **If Context Files/ folder already exists, do not recreate.** Only create missing files inside it.
- **Always set up CLAUDE.md to reference all project files.** The CLAUDE.md is the entry point — if it doesn't reference a file, Claude won't know it exists.
- **Ask the user for the project name** before creating files — it's used in headings across all templates.
- **After setup is complete, run the `claude-md-improver` skill** to audit the CLAUDE.md and ensure it meets quality standards. If the skill suggests improvements, present them to the user for approval.

---

## What Gets Created

Every project gets this structure:

```
Project Folder/
├── CLAUDE.md                          ← Project context + instructions for Claude
├── DIRECTORY.md                       ← Navigation map of all files and folders
├── MEMORY.md                          ← Decisions, learnings, assumptions
├── PROGRESS TRACKER.md                ← Current status, activity log, milestones
└── Context Files/
    ├── Current State.md               ← Single-file session briefing (overwritten at milestones)
    └── (other context files as needed)
```

| File | Purpose |
|------|---------|
| `CLAUDE.md` | Project context and instructions. Claude reads this every session. |
| `DIRECTORY.md` | Navigation map of the project. Maps every file and folder with descriptions and reading guidance. |
| `MEMORY.md` | Institutional memory — decisions (with rationale), learnings, open questions, assumptions. |
| `PROGRESS TRACKER.md` | Operational status — current focus, workstreams, activity log, upcoming milestones, blockers. |
| `Context Files/Current State.md` | Single-file session briefing. Overwritten after each milestone. Captures what exists now, key patterns, gotchas, and key files. |
| `Context Files/` | Folder for all supporting context documents — briefs, requirements, reference material. |

---

## 1. MEMORY.md

**Purpose:** The "what we know and why" file. Consulted when revisiting past decisions or looking for patterns.

### Template

```markdown
# [Project Name] — Memory

> Institutional memory of this project. Captures what we know, what we decided, and why.
> **Last updated:** YYYY-MM-DD

## Instructions for Claude

- **Always ask for confirmation before writing to this file.** Propose the exact edit, get approval, then write.
- **Decisions need rationale.** The "why" is the valuable part — a decision without rationale is useless for future reference.
- **Learnings must be specific and actionable.** "Hiring is hard" is not a learning. "Candidates from X background struggle with Y" is.
- **Don't infer decisions or learnings from documents.** Only record what the user explicitly states or confirms through conversation.
- **Open Questions → Decisions/Learnings.** When a question is resolved, move the answer to the appropriate section and remove from Open Questions.
- **Assumptions are things we're betting on but haven't validated.** When an assumption is confirmed or disproven, move it to Learnings with the outcome.
- **Learnings sub-categories are flexible.** Add, rename, or remove categories as the project evolves. Don't force entries into existing categories.
- **Updates to this file's format, instructions, or structure are not loggable events.** Just update the Last updated date.
- **Update Last updated date whenever this file is modified.**

---

## Decisions

| Date | Decision | Rationale |
|------|----------|-----------|

---

## Learnings

### [Category 1]
- *(none yet)*

### [Category 2]
- *(none yet)*

---

## Open Questions

- *(none yet)*

---

## Assumptions

- *(none yet)*
```

### Section purposes:
- **Decisions** — what we chose + why. Rationale prevents relitigating the same debates.
- **Learnings** — what we discovered through doing the work. Grouped by area, categories are flexible.
- **Open Questions** — parking lot. When resolved, answer migrates to Decisions or Learnings.
- **Assumptions** — what we're betting on but haven't proven. When validated/disproven, moves to Learnings with the outcome.

---

## 2. PROGRESS TRACKER.md

**Purpose:** The "where are we and what's next" file. Consulted when starting a session or checking execution status.

### Template

```markdown
# [Project Name] — Progress Tracker

> Operational status of the project. Where we are, what's moving, what's next.
> **Last updated:** YYYY-MM-DD

## Instructions for Claude

- **Always ask for confirmation before writing to this file.** Propose the exact edit, get approval, then write.
- **Never infer entries from existing documents.** Only log what the user explicitly confirms happened.
- **Activity Log captures outcomes — things shipped or achieved that moved the project forward.** Not every task or process step belongs here. Log what you'd want to see when looking back at what the project actually accomplished.
- **Current Focus should be tight.** Only what's actively being worked on right now — not the full project scope.
- **Workstreams only lists what's in motion or directly blocked by something in motion.** Don't list future-state workstreams that aren't yet relevant.
- **Upcoming Milestones are outcomes, not tasks.** "First analyst onboarded" not "Schedule interviews." This section may not always be filled — that's fine.
- **Updates to the tracker itself (format, instructions, structure) are not logged in Activity Log.** Just update the Last updated date.
- **Update Last updated date whenever this file is modified.**

---

## Current Focus

---

## Workstreams

| Workstream | Status | Owner | Notes |
|------------|--------|-------|-------|

---

## Activity Log

| Date | What happened |
|------|---------------|

---

## Upcoming Milestones

<!-- 1-2 steps ahead — the next meaningful outcomes the project is heading toward. Not tasks, but what "done" looks like next. May not always be filled. -->

---

## Blockers

- *(none currently)*
```

### Section purposes:
- **Current Focus** — 1-3 bullets max. What's top-of-mind right now.
- **Workstreams** — dashboard of what's active. Cross-references to detailed trackers where they exist.
- **Activity Log** — reverse chronological. One line per entry. Outcomes and achievements only.
- **Upcoming Milestones** — 1-2 steps ahead. What "done" looks like next. May not always be filled.
- **Blockers** — anything stalling progress. Remove when resolved.

---

## 3. DIRECTORY.md (Document Repository)

**Purpose:** The "what lives where" file. A navigation map of the entire project directory. Consulted when starting a session or looking for a specific file. Unlike CLAUDE.md (which is instructions), this is purely a structural reference.

### Template

```markdown
# [Project Name] — Directory

> What lives where in this project. Read this to orient yourself before doing any work.
>
> **Last updated:** YYYY-MM-DD

---

## Root Files

| File | What it is | When to read |
|------|-----------|-------------|
| `CLAUDE.md` | Project context and behavioral rules for Claude. | Every session start. Contains the rules you operate under. |
| `DIRECTORY.md` | This file. Project structure reference. | When you need to find a specific file or understand the project layout. |
| `MEMORY.md` | Institutional memory: decisions (with rationale), learnings, open questions, assumptions. | Every session start. Tells you what's been decided and why. |
| `PROGRESS TRACKER.md` | Operational status: current focus, workstreams, activity log, milestones, blockers. | Every session start. Tells you where the project stands. |

**Update rules:** MEMORY.md and PROGRESS TRACKER.md require explicit user approval before any write. See CLAUDE.md for the full protocol.

---

## Context Files/

Supporting documents that provide background, specifications, and pointers to external sources. Read these when you need deeper context beyond what MEMORY.md and PROGRESS TRACKER.md provide.

| File | What it covers | When to read |
|------|---------------|-------------|
| `Current State.md` | Single-file session briefing. What exists now, key patterns, gotchas, key files. Overwritten after each milestone. | Every session start, after MEMORY.md and PROGRESS TRACKER.md. |

<!-- Add rows as context files are created. Remove this comment once populated. -->
```

### When to update:
- **Add rows** whenever a new file or folder is created in the project
- **Remove rows** when files are deleted or moved
- The "When to read" column is optional but strongly recommended; it tells Claude when to pull a file into context
- Keep it flat for small projects. Add subsections (like `## designs/`, `## scripts/`) as the project grows

### Adaptation notes:
- For code projects, include folders like `src/`, `tests/`, `docs/` with their purposes
- For document-heavy projects, focus on the Context Files contents and any subfolders
- The "When to read" column can be dropped if the project is small enough that descriptions alone are sufficient

---

## 4. Context Files / Current State.md

**Purpose:** A single-file briefing that gets **overwritten** (not appended) after each major milestone or phase change. Gives Claude instant orientation on what exists right now, without reading the full history. Think of it as "if Claude woke up with amnesia, this is what it needs to know to start working."

### Template

```markdown
# Current State

> Single-file briefing for new sessions. Overwritten after each milestone.
> For historical context, decision rationale, or activity log, see MEMORY.md and PROGRESS TRACKER.md at project root.
>
> **Last updated:** YYYY-MM-DD ([milestone/phase name])

---

## Current Phase

**[Phase/milestone name and status.]** Brief description of where things stand.

### Before You Start Working

<!-- 3-5 bullets: branch state, environment setup, credentials, dependencies, anything a new session needs to know before touching anything -->

1. [Key setup step or prerequisite]
2. [Key setup step or prerequisite]

---

## What Exists

**[Summary of what's been built/created so far.]**

<!-- Group by milestone, phase, or logical area. For each item, describe what it does, not just that it exists. Be concrete: "5 page shells with sidebar navigation" not "basic UI". -->

### [Phase/Area 1]
- [Concrete description of what was built or created]
- [Another deliverable or artifact]

### [Phase/Area 2]
- [Concrete description]

---

## Key Patterns

<!-- How things work in this project. Not exhaustive documentation, just the patterns someone needs to follow when adding new work. For code projects: data flow, file conventions, testing approach. For document projects: file naming, review process, where things go. -->

- **[Pattern name]:** [How it works]
- **[Pattern name]:** [How it works]

---

## Gotchas

<!-- Things that will bite you if you don't know about them. Sync issues, naming traps, tool quirks, environment-specific behavior. Each entry should save someone 15+ minutes of debugging. -->

- **[Gotcha]:** [What happens and how to avoid it]

---

## Key Files Quick Reference

<!-- The 10-20 most important files. Not a full directory listing (that's DIRECTORY.md), just the files someone will need 80% of the time. -->

| File | What it does |
|------|-------------|
| `[path]` | [Description] |
```

### When to update:
- **Overwrite** after each major milestone, phase completion, or significant infrastructure change
- This file is meant to be **replaced**, not appended to. The old content is gone. That's the point: it stays current.
- MEMORY.md and PROGRESS TRACKER.md capture history. Current State captures *now*.

### Adaptation notes:
- For **code projects**: "What Exists" maps features, "Key Patterns" covers architecture conventions, "Gotchas" covers technical traps, "Key Files" lists the most-touched source files
- For **document/ops projects**: "What Exists" maps deliverables and systems built, "Key Patterns" covers process conventions, "Gotchas" covers workflow traps, "Key Files" lists the most-referenced documents
- The "Before You Start Working" section is critical for code projects (branch, env, deps) and optional for document projects. Drop it if it adds no value.
- "Gotchas" may be empty at project start. That's fine; it'll fill naturally.

---

## 5. CLAUDE.md Setup

Every project needs a `CLAUDE.md` that references all project files. If one already exists, **first run the `claude-md-improver` skill to audit it** — understand what's there and what's missing before making changes. Then propose adding the integration blocks below (with user approval). If creating fresh, use this structure:

```markdown
# [Project Name] — Project Context

## What This Project Is

[1-2 sentence description of the project — what it is and what it's trying to achieve.]
```

Then add the following blocks:

### Memory & Progress block

```markdown
## Project Memory & Progress (Foundational — Read Every Session)

These two files are the living foundation of this project. **Read both at the start of every session** before doing any work.

- **[MEMORY.md](MEMORY.md)** — Institutional memory. Decisions (with rationale), learnings, open questions, and assumptions.
- **[PROGRESS TRACKER.md](PROGRESS%20TRACKER.md)** — Operational status. Current focus, workstream status, activity log, upcoming milestones, blockers.

### Update Protocol

- **Never write to either file without explicit user approval.** No exceptions.
- **Flag potential updates at the logical end of a workstream.** When a piece of work concludes — a decision is made, a task is completed, something is learned, a question is resolved — collect all relevant updates and present them to the user in a single batch.
- **Present updates clearly before writing.** Show the exact proposed additions/changes to each file (which section, what content) and wait for explicit approval before making any edit.
- **Do not update mid-stream.** Accumulate potential updates as the work progresses, then present them together at the natural conclusion point.
- **Each file has its own instructions at the top** — follow those in addition to this protocol.
```

### Project Directory block

```markdown
## Project Directory

**[DIRECTORY.md](DIRECTORY.md)** maps every file and folder in this project with descriptions and reading guidance. Read it to understand what lives where. When you need to find something, start there.
```

### Context Files block

```markdown
## Context Files

All supporting context documents live in the `Context Files/` subfolder. Refer to these as needed:

- **[Current State.md](Context%20Files/Current%20State.md)** — Single-file session briefing. What exists now, key patterns, gotchas, and key files. Overwritten after each milestone. Read this at the start of every session for a quick orientation.
```
