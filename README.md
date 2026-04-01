# Meridium Labs — Team Claude Code Config

Shared Claude Code configuration for the Meridium Labs team. One script adds all the team's plugins, skills, and commands to your setup without touching anything you already have.

For a detailed walkthrough of what everything does, read **[GUIDE.md](GUIDE.md)**.

## Setup

**Run this in Terminal**, not inside Claude Code or Cursor. The script modifies the config directory that Claude Code reads from, so Claude Code shouldn't be running at the same time.

### Prerequisites

- **Node.js** (v18+) and **npm**
- **Git**
- **Claude Code CLI**: `npm install -g @anthropic-ai/claude-code`

If you've never run Claude Code before, run `claude` once in Terminal to create your initial `~/.claude/` directory and log in. Then quit and continue below.

### One-Line Install

```
curl -fsSL https://raw.githubusercontent.com/ajder-zee/claude-config-public/main/setup.sh | bash
```

That's it. The script:
- Adds the team's 9 plugins to your settings (your existing plugins stay)
- Copies 3 team skills and 1 slash command (skips any you already have)
- Appends the team config to your CLAUDE.md (your existing content stays at the top)
- Installs all plugins via the bootstrap

Nothing gets deleted or overwritten. It's purely additive.

### Manual Install (if you prefer)

```
git clone https://github.com/ajder-zee/claude-config-public.git /tmp/claude-team-config
cd /tmp/claude-team-config
./setup.sh
```

### After Setup

Open a new Claude Code session (Terminal, Cursor, VS Code, wherever). Everything's loaded. Try `/project-operations-setup` or ask Claude to "audit my CLAUDE.md" to verify.

## Keeping It Synced

When the team config is updated, re-run the setup:
```
curl -fsSL https://raw.githubusercontent.com/ajder-zee/claude-config-public/main/setup.sh | bash
```

The script is idempotent. Running it again won't duplicate anything.

## Contributing

Added a new skill, command, or plugin to the team config? Clone the repo, make your changes, commit and push:

```
git clone https://github.com/ajder-zee/claude-config-public.git /tmp/claude-team-config
cd /tmp/claude-team-config
# ... make changes ...
git add -A
git commit -m "Added [thing]"
git push
```

See **[GUIDE.md](GUIDE.md)** for how to create skills and commands.
