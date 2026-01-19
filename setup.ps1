# Claude Config Setup Script (Windows PowerShell)
# Run this after cloning on a new device

$ErrorActionPreference = "Stop"

$SOURCE_DIR = $PSScriptRoot
$TARGET_DIR = "$env:USERPROFILE\.claude"

Write-Host "Claude Config Setup" -ForegroundColor Cyan
Write-Host "===================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Source: $SOURCE_DIR"
Write-Host "Target: $TARGET_DIR"
Write-Host ""

# Create .claude directory if it doesn't exist
if (!(Test-Path $TARGET_DIR)) {
    New-Item -ItemType Directory -Path $TARGET_DIR | Out-Null
    Write-Host "Created $TARGET_DIR" -ForegroundColor Green
}

# Items to sync
$items = @(
    "CLAUDE.md",
    "commands",
    "get-shit-done",
    "agents",
    "skills",
    "hooks"
)

foreach ($item in $items) {
    $sourcePath = Join-Path $SOURCE_DIR $item
    $targetPath = Join-Path $TARGET_DIR $item

    if (Test-Path $sourcePath) {
        # Backup existing if it's not already a symlink
        if ((Test-Path $targetPath) -and !((Get-Item $targetPath).Attributes -band [IO.FileAttributes]::ReparsePoint)) {
            $backupPath = "$targetPath.backup"
            Write-Host "Backing up existing $item to $item.backup" -ForegroundColor Yellow
            if (Test-Path $backupPath) {
                Remove-Item -Recurse -Force $backupPath
            }
            Move-Item $targetPath $backupPath
        }

        # Remove existing symlink if present
        if (Test-Path $targetPath) {
            Remove-Item $targetPath -Force -Recurse
        }

        # Create symlink (requires admin on Windows, or Developer Mode enabled)
        try {
            if (Test-Path $sourcePath -PathType Container) {
                New-Item -ItemType Junction -Path $targetPath -Target $sourcePath | Out-Null
            } else {
                New-Item -ItemType SymbolicLink -Path $targetPath -Target $sourcePath | Out-Null
            }
            Write-Host "Linked: $item" -ForegroundColor Green
        } catch {
            Write-Host "Failed to create symlink for $item. Copying instead..." -ForegroundColor Yellow
            Copy-Item -Recurse $sourcePath $targetPath
            Write-Host "Copied: $item" -ForegroundColor Green
        }
    } else {
        Write-Host "Skipped: $item (not in repo)" -ForegroundColor Gray
    }
}

Write-Host ""
Write-Host "Setup complete!" -ForegroundColor Green
Write-Host ""
Write-Host "Your Claude config is now synced from: $SOURCE_DIR" -ForegroundColor Cyan
Write-Host ""
Write-Host "To update on this device: git pull" -ForegroundColor Cyan
Write-Host "To push changes: git add . && git commit -m 'update' && git push" -ForegroundColor Cyan
