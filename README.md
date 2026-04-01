# Meridium Labs — Team Claude Code Config

Shared Claude Code configuration for the Meridium Labs team. Clone it, run the bootstrap, get a fully loaded setup with all the plugins, skills, and commands we use.

For a detailed walkthrough of what everything does, read **[GUIDE.md](GUIDE.md)**.

## Setup (New Device)

### Prerequisites

- **Claude Code CLI** installed: `npm install -g @anthropic-ai/claude-code`
- **Node.js** (v18+) and **npm**
- **Git**

### Steps

1. If `~/.claude/` already exists, back it up:
   ```
   mv ~/.claude ~/.claude-backup
   ```

2. Clone this repo as `~/.claude/`:
   ```
   git clone <repo-url> ~/.claude
   ```

3. Run the bootstrap:
   ```
   cd ~/.claude
   chmod +x bootstrap.sh
   ./bootstrap.sh
   ```

4. Start Claude Code. Done.

5. If your backup had a `.credentials.json`, copy it over:
   ```
   cp ~/.claude-backup/.credentials.json ~/.claude/
   ```

### If You Already Have a Working `~/.claude/`

Don't want to replace it entirely? Clone elsewhere and merge:

```
git clone <repo-url> /tmp/claude-team-config
cp /tmp/claude-team-config/CLAUDE.md ~/.claude/
cp /tmp/claude-team-config/settings.json ~/.claude/
cp -r /tmp/claude-team-config/commands/ ~/.claude/
cp -r /tmp/claude-team-config/skills/ ~/.claude/
cp /tmp/claude-team-config/bootstrap.sh ~/.claude/
cd ~/.claude && chmod +x bootstrap.sh && ./bootstrap.sh
```

## Keeping It Synced

After pulling changes:
```
cd ~/.claude
git pull
./bootstrap.sh   # only if plugins changed
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
