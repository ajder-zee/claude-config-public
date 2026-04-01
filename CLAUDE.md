# Meridium Labs — Team Claude Code Config

This `~/.claude/` directory is a shared team config repo. Clone it, run the bootstrap, and you get a fully loaded Claude Code setup with all the plugins, skills, and commands the team uses.

**Tracked:** `CLAUDE.md`, `settings.json`, `commands/`, `skills/`, `agents/`, `bootstrap.sh`
**Gitignored:** credentials, session data, caches, plugin source code (downloaded at install)

## Installed Plugins & Integrations

**Plugins (user-scoped, all auto-load):**
- **data** (knowledge-work-plugins) — Data analysis, dashboards, SQL, visualization. Use `data:analyze`, `data:build-dashboard`, `data:write-query`, etc.
- **superpowers** — Workflow skills (brainstorming, TDD, debugging, plans, code review)
- **Notion** — Notion workspace integration
- **frontend-design** — UI/frontend building
- **commit-commands** — Git commit/push/PR workflows
- **code-simplifier** — Code refinement
- **skill-creator** — Skill development
- **explanatory-output-style** — Output formatting
- **plugin-dev** — Plugin creation, agents, hooks, MCP integration

**User-level commands:**
- `/project-operations-setup` — Set up standard project operational structure (DIRECTORY.md, MEMORY.md, PROGRESS TRACKER.md, Current State, CLAUDE.md integration)

**User-level skills:**
- **claude-md-improver** — Audit and improve CLAUDE.md files
- **create-cowork-plugin** — Guide plugin creation in cowork sessions
- **find-skills** — Help discover and install skills
- **skill-development** — Create and edit skills

## Personalizing Your Setup

This file is the team baseline. To add your own preferences (writing style, personal tools, custom workflows), create a section in this file or layer in your own rules. The team config gives you the tools; your additions make them yours.

See `GUIDE.md` for a full walkthrough of what everything does and how to use it.
