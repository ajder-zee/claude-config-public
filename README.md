# Meridium Labs — Team Claude Code Config

Shared Claude Code configuration for the Meridium Labs team. Clone it, run the bootstrap, get a fully loaded setup with all the plugins, skills, and commands we use.

For a detailed walkthrough of what everything does, read **[GUIDE.md](GUIDE.md)**.

## Setup

**Run all setup commands in Terminal (or your regular shell), not inside Claude Code or Cursor.** You're replacing the config directory that Claude Code reads from, so Claude Code can't be using it at the same time. Once setup is done, every future Claude Code session (Terminal, Cursor, VS Code, wherever) picks up the config automatically.

### Prerequisites

- **Node.js** (v18+) and **npm**
- **Git**
- **Claude Code CLI**: `npm install -g @anthropic-ai/claude-code`

If you've never run Claude Code before, run `claude` once in Terminal to create the initial `~/.claude/` directory and log in. Then quit Claude Code and continue with setup.

### First-Time Setup (no existing config)

If you've never customized Claude Code (or just ran it for the first time above):

```
mv ~/.claude ~/.claude-backup
git clone https://github.com/ajder-zee/claude-config-public.git ~/.claude
cd ~/.claude && chmod +x bootstrap.sh && ./bootstrap.sh
cp ~/.claude-backup/.credentials.json ~/.claude/
```

That last line copies your login credentials back. Without it, you'll need to log in again.

### Setup With Existing Config (merge approach)

If you already have a customized `~/.claude/` you don't want to lose:

```
git clone https://github.com/ajder-zee/claude-config-public.git /tmp/claude-team-config
cp /tmp/claude-team-config/CLAUDE.md ~/.claude/
cp /tmp/claude-team-config/settings.json ~/.claude/
cp -r /tmp/claude-team-config/commands/ ~/.claude/
cp -r /tmp/claude-team-config/skills/ ~/.claude/
cp /tmp/claude-team-config/bootstrap.sh ~/.claude/
cd ~/.claude && chmod +x bootstrap.sh && ./bootstrap.sh
```

This adds the team config on top of your existing setup without touching your credentials or personal files.

### After Setup

Open a new Claude Code session (in Terminal, Cursor, or wherever you use it). The plugins, skills, and commands are all loaded automatically. Try `/project-operations-setup` or ask Claude to "audit my CLAUDE.md" to confirm everything's working.

## Keeping It Synced

After the team config is updated, pull the latest:
```
cd ~/.claude
git pull
./bootstrap.sh   # only needed if plugins changed
```

## Contributing

Added a new skill, command, or plugin? Commit and push:
```
cd ~/.claude
git add -A
git commit -m "Added [thing]"
git push
```

See **[GUIDE.md](GUIDE.md)** for how to create skills and commands.
