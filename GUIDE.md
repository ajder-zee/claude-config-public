# Meridium Labs — Claude Code Team Guide

This is the full walkthrough of everything in this repo: what each piece does, how to use it, and how to extend it. For setup, see [README.md](README.md) (it's one command).

---

## What This Repo Is

The team's shared Claude Code configuration. Run the setup script and it adds 9 plugins, 3 custom skills, and 1 slash command to your existing Claude Code setup. Nothing gets deleted or overwritten.

The config works in two layers:
- **Team layer** (from this repo): plugins, skills, commands, and a baseline `CLAUDE.md` that gets appended to yours
- **Personal layer** (whatever you already have): your own writing style rules, personal tools, workflow preferences. All untouched.

---

## Plugins

Plugins are pre-built packages that give Claude new capabilities. They load automatically every session. Here's what each one does and when it kicks in.

### superpowers

The workflow backbone. This plugin provides skills for structured approaches to common development tasks. Key skills:

- **Brainstorming** — Triggers before any creative work (building features, designing systems). Guides you through structured ideation before jumping to code.
- **Test-Driven Development (TDD)** — Triggers when implementing features. Write tests first, then implementation.
- **Systematic Debugging** — Triggers when hitting bugs or test failures. Structured root-cause analysis instead of guessing.
- **Writing Plans** — Triggers for multi-step tasks. Creates step-by-step implementation plans before touching code.
- **Executing Plans** — Takes a written plan and works through it methodically.
- **Code Review** — Triggers after completing features. Reviews work against the plan and coding standards.
- **Parallel Agents** — Splits independent tasks across multiple agents for speed.
- **Verification** — Runs before claiming work is done. Catches things you'd miss.

You don't call these directly. They activate based on context (what you're doing, what you ask for). If you're implementing a feature, superpowers will nudge toward TDD. If you're debugging, it'll pull in systematic debugging.

### data

For data work: analysis, visualization, SQL, dashboards. Key skills:

- `data:analyze` — Answer data questions, from quick lookups to full analyses
- `data:build-dashboard` — Build interactive HTML dashboards with charts and filters
- `data:create-viz` — Publication-quality Python visualizations
- `data:explore-data` — Profile a dataset to understand shape, quality, patterns
- `data:write-query` — Write optimized SQL for your dialect
- `data:validate` — QA an analysis before sharing (methodology, accuracy, bias)

**How to use:** Just ask data questions naturally. "How many users signed up last week?" or "Build me a dashboard showing monthly revenue." Claude picks the right skill.

### frontend-design

For building UIs. When you ask Claude to create a web page, component, or interface, this skill guides it toward high design quality rather than generic output. Covers layout, typography, color, spacing, responsiveness.

**How to use:** Ask for any frontend work. "Build a landing page for X" or "Create a settings panel." The skill activates automatically.

### commit-commands

Git workflow commands:

- `/commit` — Stage changes and create a commit with a well-written message
- `/commit-push-pr` — Commit, push, and open a pull request in one go
- `/clean_gone` — Clean up local branches that have been deleted on the remote

**How to use:** Type the slash command directly. `/commit` after finishing work, `/commit-push-pr` when you're ready to open a PR.

### Notion

Connects Claude to the Notion workspace. Claude can search, read, create, and update Notion pages and databases.

**How to use:** Reference Notion naturally. "Find the project brief in Notion" or "Create a new page in the Projects database." Requires Notion MCP to be connected (see MCP Servers below).

### code-simplifier

Reviews recently modified code for reuse opportunities, quality issues, and efficiency. Strips unnecessary complexity.

**How to use:** After writing code, ask Claude to simplify or review it. Or it may trigger automatically via superpowers' code review flow.

### explanatory-output-style

Makes Claude's output more educational. Adds brief insight blocks explaining implementation choices and patterns. Useful when you're working in unfamiliar territory and want to learn as you go.

**How to use:** Always active. Claude adds `★ Insight` blocks automatically when explaining code or making implementation decisions.

### skill-creator

For creating new skills. If you want to build a custom skill (for the team or yourself), this plugin guides the process: structure, metadata, testing, packaging.

**How to use:** "Create a skill for X" or "I want to build a skill that does Y."

### plugin-dev

For building Claude Code plugins from scratch. Covers plugin structure, agents, hooks, commands, MCP integration, and skill development within plugins.

**How to use:** "Create a plugin" or "Add an agent to my plugin." Mostly relevant if you're extending Claude Code's functionality at a deeper level.

---

## Custom Skills

Skills are lighter than plugins. They're markdown files that give Claude specialized knowledge for specific tasks. These three live in the `skills/` folder.

### claude-md-improver

**What it does:** Audits CLAUDE.md files in any project. Scans for all CLAUDE.md files, scores them against a quality rubric (commands, architecture clarity, gotchas, conciseness, currency, actionability), and proposes targeted improvements.

**When to use:** After setting up a new project, or periodically to keep your CLAUDE.md files sharp. Ask: "Audit my CLAUDE.md" or "Check the project CLAUDE.md."

**What it produces:** A quality report with scores per file, specific issues found, and proposed fixes shown as diffs.

### find-skills

**What it does:** Searches the open skills ecosystem for installable skills. If you need a capability that might already exist as a community skill, this helps you find and install it.

**When to use:** "Is there a skill for X?" or "Find me a skill that does Y." Also triggers when you're looking for specialized capabilities.

**What it produces:** Search results with install commands. Skills get installed globally via `npx skills add`.

### skill-development

**What it does:** Guides you through creating a new skill from scratch. Covers the full process: understanding use cases, planning resources, writing SKILL.md with proper metadata, progressive disclosure, validation.

**When to use:** When you want to create a new skill for the team. "Create a skill for X" or "I want to write a skill."

**What it produces:** A complete skill directory with SKILL.md, references, and any supporting files.

---

## Custom Commands

Commands are slash commands you type directly in Claude Code.

### /project-operations-setup

**What it does:** Scaffolds a standard project folder structure. Creates:

- `CLAUDE.md` — Project context and instructions for Claude
- `DIRECTORY.md` — Navigation map of all files and folders
- `MEMORY.md` — Institutional memory (decisions, learnings, open questions, assumptions)
- `PROGRESS TRACKER.md` — Operational status (current focus, workstreams, activity log)
- `Context Files/Current State.md` — Single-file session briefing (overwritten at milestones)

**When to use:** At the start of any new project. Run it once in the project folder.

**How it works:** Asks for the project name, checks what already exists (won't overwrite), creates missing files from templates, and sets up CLAUDE.md to reference everything.

**Why this structure matters:** These files give Claude persistent context across sessions. MEMORY.md captures decisions so they don't get relitigated. PROGRESS TRACKER.md tells Claude where things stand. Current State.md gives instant orientation. Without these, every session starts from scratch.

---

## The CLAUDE.md File

The setup script appends the team's `CLAUDE.md` content below whatever you already have. Your personal config stays at the top, team config below it. Claude reads the whole file, so both work together.

**To personalize:** Add your own rules anywhere above the team section (or edit it directly). Writing style preferences, personal tools, workflow rules. The team config gives you the baseline; everything above it is yours.

**Project-level vs global:** The global `~/.claude/CLAUDE.md` applies to all projects. Each project can also have its own `CLAUDE.md` with project-specific context. Claude reads both.

**`.claude.local.md`:** For personal preferences you don't want shared with the team. Gitignored by default.

---

## MCP Servers

MCP (Model Context Protocol) servers connect Claude to external tools. These aren't installed via this repo (they're configured per-user through Claude's settings), but the team commonly uses:

- **Gmail** — Read and draft emails
- **Google Calendar** — View, create, and manage calendar events
- **Slack** — Read channels, send messages, search
- **Notion** — Full workspace access (pages, databases, comments)

To connect an MCP server, configure it in Claude Code's settings or through the Claude desktop app.

---

## How to Extend This Setup

### Adding a New Skill

1. Create a folder in `skills/` with your skill name
2. Add a `SKILL.md` file with YAML frontmatter (`name` and `description` are required)
3. The description determines when Claude activates the skill, so be specific about trigger phrases
4. Optionally add `references/`, `examples/`, or `scripts/` subdirectories for supporting files
5. Commit and push

Example minimal skill:
```
skills/my-skill/
└── SKILL.md
```

Example SKILL.md:
```markdown
---
name: my-skill
description: This skill should be used when the user asks to "do X", "handle Y", or mentions Z.
---

# My Skill

[Instructions for Claude on how to handle this domain]
```

### Adding a New Command

1. Create a markdown file in `commands/` (filename becomes the slash command)
2. Write the instructions Claude should follow when the command is invoked
3. Use `$ARGUMENTS` placeholder if the command takes arguments
4. Commit and push

Example: `commands/my-command.md` becomes `/my-command`.

### Installing a New Plugin

1. Install via Claude Code: `claude plugins install plugin-name@marketplace`
2. The plugin config files update automatically
3. Add the install command to `bootstrap.sh` so other devices pick it up
4. Commit and push

---

## File Map

```
~/.claude/
├── CLAUDE.md              ← Global instructions (your config + team baseline appended)
├── GUIDE.md               ← This file
├── README.md              ← Quick setup reference
├── setup.sh               ← One-command install (additive, doesn't overwrite)
├── settings.json          ← Enabled plugins and marketplace config
├── bootstrap.sh           ← Installs plugins (called by setup.sh)
├── .gitignore             ← Keeps credentials and caches out of git
├── commands/
│   ├── project-operations-setup.md       ← /project-operations-setup command
│   └── project-operations-setup-guide.md ← Detailed guide for the command
├── skills/
│   ├── claude-md-improver/    ← CLAUDE.md auditing skill
│   │   ├── SKILL.md
│   │   └── references/        ← Quality criteria, templates, update guidelines
│   ├── find-skills/           ← Skill discovery
│   │   └── SKILL.md
│   └── skill-development/     ← Skill creation guidance
│       ├── SKILL.md
│       └── references/        ← Original skill-creator reference
└── agents/                    ← Custom agent definitions (empty, ready for use)
```
