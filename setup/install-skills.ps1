# Copies the kit's skills into ~/.claude/skills so they work in any project.
# Run: powershell -ExecutionPolicy Bypass -File setup\install-skills.ps1

$src = Join-Path $PSScriptRoot "..\skills"
$dst = Join-Path $HOME ".claude\skills"
New-Item -ItemType Directory -Force $dst | Out-Null

Get-ChildItem $src -Directory | ForEach-Object {
    $target = Join-Path $dst $_.Name
    if (Test-Path $target) { Write-Host "updating  $($_.Name)" } else { Write-Host "installing $($_.Name)" }
    New-Item -ItemType Directory -Force $target | Out-Null
    Copy-Item (Join-Path $_.FullName "*") $target -Recurse -Force
}
Write-Host "Done. Start a new Claude Code session to pick them up."
