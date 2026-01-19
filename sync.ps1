# Claude Config Sync Script (Windows PowerShell)
# Quick sync: pull remote changes, push local changes

param(
    [string]$Message = "update config"
)

$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

Write-Host ""
Write-Host "Claude Config Sync" -ForegroundColor Cyan
Write-Host "==================" -ForegroundColor Cyan
Write-Host ""

# Check for local changes
$status = git status --porcelain
$hasChanges = $status.Length -gt 0

# Pull first
Write-Host "Pulling remote changes..." -ForegroundColor Yellow
git pull --rebase 2>&1 | ForEach-Object { Write-Host "  $_" }

if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Write-Host "Pull failed! Resolve conflicts manually." -ForegroundColor Red
    exit 1
}

# Push local changes if any
if ($hasChanges) {
    Write-Host ""
    Write-Host "Local changes detected:" -ForegroundColor Yellow
    git status --short | ForEach-Object { Write-Host "  $_" -ForegroundColor Gray }

    Write-Host ""
    Write-Host "Pushing: $Message" -ForegroundColor Yellow

    git add .
    git commit -m $Message
    git push

    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "Pushed successfully!" -ForegroundColor Green
    }
} else {
    Write-Host ""
    Write-Host "No local changes to push." -ForegroundColor Gray
}

Write-Host ""
Write-Host "Sync complete!" -ForegroundColor Green
Write-Host ""
