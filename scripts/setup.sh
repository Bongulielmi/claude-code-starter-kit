#!/bin/bash
# Claude Code Starter Kit — Setup Script
# Installs templates, commands, and MCP configs into your Claude Code environment

set -euo pipefail

CLAUDE_DIR="$HOME/.claude"
COMMANDS_DIR="$CLAUDE_DIR/commands"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "=== Claude Code Starter Kit Setup ==="
echo ""

# Create directories
mkdir -p "$COMMANDS_DIR"

# Install custom commands
echo "[1/3] Installing custom commands..."
INSTALLED_COMMANDS=0
for cmd in "$SCRIPT_DIR/commands/"*.md; do
    if [ -f "$cmd" ]; then
        name=$(basename "$cmd")
        if [ -f "$COMMANDS_DIR/$name" ]; then
            echo "  SKIP: $name (already exists)"
        else
            cp "$cmd" "$COMMANDS_DIR/$name"
            echo "  OK:   /$(basename "$name" .md)"
            INSTALLED_COMMANDS=$((INSTALLED_COMMANDS + 1))
        fi
    fi
done
echo "  Installed $INSTALLED_COMMANDS new commands"
echo ""

# Copy CLAUDE.md templates
echo "[2/3] Copying CLAUDE.md templates..."
TEMPLATES_DIR="$CLAUDE_DIR/templates"
mkdir -p "$TEMPLATES_DIR"
INSTALLED_TEMPLATES=0
for tpl in "$SCRIPT_DIR/templates/"CLAUDE-*.md; do
    if [ -f "$tpl" ]; then
        name=$(basename "$tpl")
        if [ -f "$TEMPLATES_DIR/$name" ]; then
            echo "  SKIP: $name (already exists)"
        else
            cp "$tpl" "$TEMPLATES_DIR/$name"
            echo "  OK:   $name"
            INSTALLED_TEMPLATES=$((INSTALLED_TEMPLATES + 1))
        fi
    fi
done
echo "  Installed $INSTALLED_TEMPLATES templates"
echo ""

# Copy MCP configs
echo "[3/3] Copying MCP server configs..."
MCP_DIR="$CLAUDE_DIR/mcp-configs"
mkdir -p "$MCP_DIR"
INSTALLED_CONFIGS=0
for cfg in "$SCRIPT_DIR/mcp-configs/"*.json; do
    if [ -f "$cfg" ]; then
        name=$(basename "$cfg")
        if [ -f "$MCP_DIR/$name" ]; then
            echo "  SKIP: $name (already exists)"
        else
            cp "$cfg" "$MCP_DIR/$name"
            echo "  OK:   $name"
            INSTALLED_CONFIGS=$((INSTALLED_CONFIGS + 1))
        fi
    fi
done
echo "  Installed $INSTALLED_CONFIGS MCP configurations"
echo ""

# Summary
echo "Setup complete!"
echo ""
echo "What was installed:"
echo "  Commands:  $INSTALLED_COMMANDS (use with /command-name in Claude Code)"
echo "  Templates: $INSTALLED_TEMPLATES (copy to your project root as CLAUDE.md)"
echo "  MCP:       $INSTALLED_CONFIGS (merge into ~/.claude/mcp.json)"
echo ""
echo "Quick start:"
echo "  1. Copy a template:  cp ~/.claude/templates/CLAUDE-nextjs.md ./CLAUDE.md"
echo "  2. Try a command:    Type /review in Claude Code to review your code"
echo "  3. Set up MCP:       Copy configs from ~/.claude/mcp-configs/ into ~/.claude/mcp.json"
echo ""
echo "Full documentation: See README.md in this directory"
