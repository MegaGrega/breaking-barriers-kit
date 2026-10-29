# One-shot setup on any Windows machine that has Claude Code.
#   irm https://raw.githubusercontent.com/MegaGrega/breaking-barriers-kit/main/setup/bootstrap.ps1 | iex
# Installs (user scope, safe to re-run):
#   breaking-barriers   this kit
#   jmo-workflow        23jmo/jmo-skills
#   interfaces          jakubkrehel/skills (UI review, accessibility, copy, states, variants)
#   cognitive-accessibility + accessible-content   Owl-Listener/inclusive-design-skills
#   7 skills from emilkowalski/skills (animation review, break-ui, library picks, mobile feel)

if (-not (Get-Command claude -ErrorAction SilentlyContinue)) {
    Write-Host "Claude Code not found. Install it first: https://code.claude.com/docs"
    return
}

function Add-Marketplace($repo, $name) {
    claude plugin marketplace add $repo
    if ($LASTEXITCODE -ne 0) { claude plugin marketplace update $name }
}

Add-Marketplace "MegaGrega/breaking-barriers-kit" "breaking-barriers-kit"
claude plugin install breaking-barriers@breaking-barriers-kit

Add-Marketplace "23jmo/jmo-skills" "jmo-skills"
claude plugin install jmo-workflow@jmo-skills

Add-Marketplace "jakubkrehel/skills" "interfaces"
claude plugin install interfaces@interfaces

Add-Marketplace "Owl-Listener/inclusive-design-skills" "inclusive-design-skills"
claude plugin install cognitive-accessibility@inclusive-design-skills
claude plugin install accessible-content@inclusive-design-skills

# Emil Kowalski's skills are not a plugin; copy the chosen ones into ~/.claude/skills.
# Short temp path: Windows git fails on long clone paths.
$tmp = Join-Path $env:SystemDrive "bbk-tmp-$(Get-Random)"
git clone -q --depth 1 https://github.com/emilkowalski/skills "$tmp\emil"
foreach ($s in "emil-design-eng","review-animations","find-animation-opportunities","improve-animations","break-ui","pick-ui-library","mobile-native") {
    $dst = Join-Path $HOME ".claude\skills\$s"
    New-Item -ItemType Directory -Force $dst | Out-Null
    Copy-Item "$tmp\emil\skills\$s\*" $dst -Recurse -Force
}
Remove-Item $tmp -Recurse -Force

if (-not (Get-Command agentcore -ErrorAction SilentlyContinue)) { Write-Host "Tip: npm install -g @aws/agentcore" }
if (-not (Get-Command aws -ErrorAction SilentlyContinue)) { Write-Host "Tip: winget install Amazon.AWSCLI" }
Write-Host "Done. Start a new Claude Code session to pick up the skills."
