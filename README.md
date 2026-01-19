# Claude Config

Personal Claude Code configuration synced across devices.

## Quick Start

**See [QUICKREF.md](QUICKREF.md) for command cheat sheet.**

**Key concept:** When starting projects, always tell Claude the **concrete jobs** (workflows), not just goals:
- Bad: "Build a question extraction system"
- Good: "1. Fix existing — re-classify questions with wrong skills. 2. Extract new — download, extract, match, upload"

## What's Included

| Directory | Purpose |
|-----------|---------|
| `CLAUDE.md` | Global instructions (GSD + Harmony system) |
| `commands/` | Slash commands (`/gsd:*`, `/harmony`, etc.) |
| `get-shit-done/` | GSD workflows, templates, references |
| `agents/` | Custom agent definitions |
| `skills/` | Custom skills (`/ultrathink`, `/meta`, etc.) |
| `hooks/` | Event hooks |

## Setup on a New Device

### Windows (PowerShell as Admin)

```powershell
git clone git@github.com:YOUR_USERNAME/claude-config.git ~/claude-config
cd ~/claude-config
.\setup.ps1
```

### macOS / Linux / Git Bash

```bash
git clone git@github.com:YOUR_USERNAME/claude-config.git ~/claude-config
cd ~/claude-config
chmod +x setup.sh
./setup.sh
```

## Syncing Changes

**Easy way (use the sync script):**
```powershell
cd ~/claude-config
.\sync.ps1                    # Default message
.\sync.ps1 -Message "added X" # Custom message
```

**Manual way:**
```bash
git add .
git commit -m "update: description"
git push
```

On other devices, just run `.\sync.ps1` — it pulls then pushes.

The symlinks mean changes take effect immediately.

## What's NOT Synced

These stay local to each device (in `~/.claude/`):
- `history.jsonl` - conversation history
- `cache/` - local cache
- `.credentials.json` - auth tokens
- `settings.json` - device-specific settings
- `todos/` - active todo lists
- `file-history/` - file change tracking

## Merging Laptop Config

If your laptop has different GSD files, compare before overwriting:

```bash
# On laptop, after cloning
diff -r ~/.claude/get-shit-done ~/claude-config/get-shit-done
diff ~/.claude/CLAUDE.md ~/claude-config/CLAUDE.md
```

Then either:
- Run `setup.sh` to use the synced version
- Or manually merge differences first
