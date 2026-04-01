#!/bin/bash
# ============================================
# Meridium Labs Team Config — Setup Script
# ============================================
# Adds the team's Claude Code config (plugins,
# skills, commands) to your existing setup
# without overwriting anything you already have.
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/ajder-zee/claude-config-public/main/setup.sh | bash
#
# Or clone the repo first and run locally:
#   ./setup.sh
# ============================================

set -e

REPO_URL="https://github.com/ajder-zee/claude-config-public.git"
CLAUDE_DIR="$HOME/.claude"
TMP_DIR=$(mktemp -d)
TEAM_DIR="$TMP_DIR/team-config"

echo ""
echo "=== Meridium Labs — Claude Code Team Setup ==="
echo ""

# --- Pre-flight checks ---
if ! command -v node &> /dev/null; then
    echo "ERROR: Node.js not found. Install Node.js (v18+) first."
    exit 1
fi

if ! command -v git &> /dev/null; then
    echo "ERROR: Git not found. Install git first."
    exit 1
fi

# --- Clone repo to temp location ---
echo "Downloading team config..."
git clone --quiet "$REPO_URL" "$TEAM_DIR"
echo ""

# --- Ensure directories exist ---
mkdir -p "$CLAUDE_DIR/skills"
mkdir -p "$CLAUDE_DIR/commands"

# ==========================================
# 1. CLAUDE.md — append team section or create
# ==========================================
echo "--- CLAUDE.md ---"

if [ -f "$CLAUDE_DIR/CLAUDE.md" ]; then
    if grep -q "Meridium Labs — Team Claude Code Config" "$CLAUDE_DIR/CLAUDE.md" 2>/dev/null; then
        echo "  Team config already present — skipping"
    else
        echo "" >> "$CLAUDE_DIR/CLAUDE.md"
        echo "---" >> "$CLAUDE_DIR/CLAUDE.md"
        echo "" >> "$CLAUDE_DIR/CLAUDE.md"
        cat "$TEAM_DIR/CLAUDE.md" >> "$CLAUDE_DIR/CLAUDE.md"
        echo "  Appended team config below your existing content"
    fi
else
    cp "$TEAM_DIR/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"
    echo "  Created (no existing file found)"
fi

# ==========================================
# 2. settings.json — merge plugins and marketplaces
# ==========================================
echo "--- settings.json ---"

if [ -f "$CLAUDE_DIR/settings.json" ]; then
    node -e "
const fs = require('fs');
const team = JSON.parse(fs.readFileSync('$TEAM_DIR/settings.json', 'utf8'));
const user = JSON.parse(fs.readFileSync('$CLAUDE_DIR/settings.json', 'utf8'));

// Add team plugins (keeps all existing plugins intact)
user.enabledPlugins = { ...(user.enabledPlugins || {}), ...(team.enabledPlugins || {}) };

// Add team marketplaces (keeps all existing marketplaces intact)
user.extraKnownMarketplaces = { ...(user.extraKnownMarketplaces || {}), ...(team.extraKnownMarketplaces || {}) };

fs.writeFileSync('$CLAUDE_DIR/settings.json', JSON.stringify(user, null, 2) + '\n');
"
    echo "  Merged team plugins into your existing settings"
else
    cp "$TEAM_DIR/settings.json" "$CLAUDE_DIR/settings.json"
    echo "  Created (no existing file found)"
fi

# ==========================================
# 3. Skills — copy team skills, skip existing
# ==========================================
echo "--- Skills ---"

for skill_dir in "$TEAM_DIR/skills"/*/; do
    skill_name=$(basename "$skill_dir")
    if [ -d "$CLAUDE_DIR/skills/$skill_name" ]; then
        echo "  $skill_name — already exists, skipping"
    else
        cp -r "$skill_dir" "$CLAUDE_DIR/skills/$skill_name"
        echo "  $skill_name — added"
    fi
done

# ==========================================
# 4. Commands — copy team commands, skip existing
# ==========================================
echo "--- Commands ---"

for cmd_file in "$TEAM_DIR/commands"/*.md; do
    cmd_name=$(basename "$cmd_file")
    if [ -f "$CLAUDE_DIR/commands/$cmd_name" ]; then
        echo "  $cmd_name — already exists, skipping"
    else
        mkdir -p "$CLAUDE_DIR/commands"
        cp "$cmd_file" "$CLAUDE_DIR/commands/$cmd_name"
        echo "  $cmd_name — added"
    fi
done

# ==========================================
# 5. Copy bootstrap.sh and run it
# ==========================================
echo "--- Plugins ---"
echo ""

cp "$TEAM_DIR/bootstrap.sh" "$CLAUDE_DIR/bootstrap.sh"
chmod +x "$CLAUDE_DIR/bootstrap.sh"
cd "$CLAUDE_DIR"
./bootstrap.sh

# --- Cleanup ---
rm -rf "$TMP_DIR"

echo ""
echo "=== Setup complete ==="
echo ""
echo "What just happened:"
echo "  - Team plugins added to your settings (existing plugins untouched)"
echo "  - Team skills and commands copied in (existing ones untouched)"
echo "  - Team config appended to your CLAUDE.md (existing content untouched)"
echo "  - Plugins installed via bootstrap"
echo ""
echo "Open a new Claude Code session to start using the team config."
echo "Try '/project-operations-setup' or ask Claude to 'audit my CLAUDE.md' to verify."
echo ""
