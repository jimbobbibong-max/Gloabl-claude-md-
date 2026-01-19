#!/bin/bash
# Claude Config Sync Script (Git Bash / macOS / Linux)
# Quick sync: pull remote changes, push local changes

set -e
cd "$(dirname "$0")"

MESSAGE="${1:-update config}"

echo ""
echo "Claude Config Sync"
echo "=================="
echo ""

# Check for local changes
HAS_CHANGES=$(git status --porcelain)

# Pull first
echo "Pulling remote changes..."
git pull --rebase

# Push local changes if any
if [ -n "$HAS_CHANGES" ]; then
    echo ""
    echo "Local changes detected:"
    git status --short

    echo ""
    echo "Pushing: $MESSAGE"

    git add .
    git commit -m "$MESSAGE"
    git push

    echo ""
    echo "Pushed successfully!"
else
    echo ""
    echo "No local changes to push."
fi

echo ""
echo "Sync complete!"
echo ""
