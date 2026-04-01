#!/bin/bash
# ============================================
# Meridium Labs Team Config - Bootstrap Script
# ============================================
# Run this after cloning the repo to a new
# device. It installs plugins and marketplaces
# so your Claude Code setup matches the team config.
#
# Usage:
#   cd ~/.claude
#   chmod +x bootstrap.sh
#   ./bootstrap.sh
# ============================================

set -e

echo ""
echo "=== Meridium Labs Team Config - Bootstrap ==="
echo ""

# --- Pre-flight check ---
if ! command -v claude &> /dev/null; then
    echo "ERROR: Claude Code CLI not found."
    echo ""
    echo "Install it first:"
    echo "  npm install -g @anthropic-ai/claude-code"
    echo ""
    echo "Then re-run this script."
    exit 1
fi

echo "Claude Code CLI found: $(which claude)"
echo ""

# --- Install Plugin Marketplaces ---
echo "--- Installing plugin marketplaces ---"
echo ""

echo "Adding: anthropics/claude-plugins-official"
claude plugins marketplace add anthropics/claude-plugins-official 2>/dev/null || echo "  (already added or failed, continuing)"

echo "Adding: anthropics/knowledge-work-plugins"
claude plugins marketplace add anthropics/knowledge-work-plugins 2>/dev/null || echo "  (already added or failed, continuing)"

echo ""

# --- Install Plugins ---
echo "--- Installing plugins ---"
echo ""

PLUGINS=(
    "superpowers@claude-plugins-official"
    "frontend-design@claude-plugins-official"
    "commit-commands@claude-plugins-official"
    "code-simplifier@claude-plugins-official"
    "Notion@claude-plugins-official"
    "explanatory-output-style@claude-plugins-official"
    "skill-creator@claude-plugins-official"
    "data@knowledge-work-plugins"
    "plugin-dev@claude-plugins-official"
)

for plugin in "${PLUGINS[@]}"; do
    echo "Installing: $plugin"
    claude plugins install "$plugin" 2>/dev/null || echo "  (failed or already installed, continuing)"
done

# --- Install npx-managed skills ---
echo ""
echo "--- Installing npx-managed skills ---"
echo ""

echo "Installing: create-cowork-plugin"
npx skills add anthropics/knowledge-work-plugins@create-cowork-plugin -g -y 2>/dev/null || echo "  (failed or already installed, continuing)"

echo ""
echo "=== Bootstrap complete ==="
echo ""
echo "Your Claude Code config is ready."
echo "Start a new Claude Code session to pick up all changes."
echo ""
