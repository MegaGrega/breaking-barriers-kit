# One-shot setup on any Windows machine that has Claude Code.
#   irm https://raw.githubusercontent.com/MegaGrega/breaking-barriers-kit/main/setup/bootstrap.ps1 | iex
# Installs this kit and jmo-skills as Claude Code plugins (user scope). Safe to re-run.

if (-not (Get-Command claude -ErrorAction SilentlyContinue)) {
    Write-Host "Claude Code not found. Install it first: https://code.claude.com/docs"
    return
}

claude plugin marketplace add MegaGrega/breaking-barriers-kit
if ($LASTEXITCODE -ne 0) { claude plugin marketplace update breaking-barriers-kit }
claude plugin install breaking-barriers@breaking-barriers-kit

claude plugin marketplace add 23jmo/jmo-skills
if ($LASTEXITCODE -ne 0) { claude plugin marketplace update jmo-skills }
claude plugin install jmo-workflow@jmo-skills

if (-not (Get-Command agentcore -ErrorAction SilentlyContinue)) { Write-Host "Tip: npm install -g @aws/agentcore" }
if (-not (Get-Command aws -ErrorAction SilentlyContinue)) { Write-Host "Tip: winget install Amazon.AWSCLI" }
Write-Host "Done. Start a new Claude Code session; skills appear as /breaking-barriers:<skill> and /jmo-workflow:<skill>."
