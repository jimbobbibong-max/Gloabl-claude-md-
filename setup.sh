#!/bin/bash
# Claude Config Setup Script (Git Bash / WSL / macOS / Linux)
# Run this after cloning on a new device

set -e

SOURCE_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="$HOME/.claude"

echo "Claude Config Setup"
echo "==================="
echo ""
echo "Source: $SOURCE_DIR"
echo "Target: $TARGET_DIR"
echo ""

# Create .claude directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Items to sync
ITEMS="CLAUDE.md commands get-shit-done agents skills hooks"

for item in $ITEMS; do
    SOURCE_PATH="$SOURCE_DIR/$item"
    TARGET_PATH="$TARGET_DIR/$item"

    if [ -e "$SOURCE_PATH" ]; then
        # Backup existing if it's not already a symlink
        if [ -e "$TARGET_PATH" ] && [ ! -L "$TARGET_PATH" ]; then
            echo "Backing up existing $item to $item.backup"
            rm -rf "$TARGET_PATH.backup"
            mv "$TARGET_PATH" "$TARGET_PATH.backup"
        fi

        # Remove existing symlink if present
        if [ -L "$TARGET_PATH" ]; then
            rm "$TARGET_PATH"
        fi

        # Create symlink
        ln -s "$SOURCE_PATH" "$TARGET_PATH"
        echo "Linked: $item"
    else
        echo "Skipped: $item (not in repo)"
    fi
done

echo ""
echo "Setup complete!"
echo ""
echo "Your Claude config is now synced from: $SOURCE_DIR"
echo ""
echo "To update on this device: git pull"
echo "To push changes: git add . && git commit -m 'update' && git push"
