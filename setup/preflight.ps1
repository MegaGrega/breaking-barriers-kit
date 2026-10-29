# Hackathon laptop preflight. Run: powershell -ExecutionPolicy Bypass -File setup\preflight.ps1
# Checks only; installs nothing. Prints the install command for anything missing.

$checks = @(
    @{ Name = "git";       Cmd = "git --version";       Fix = "winget install Git.Git" },
    @{ Name = "node>=20.12"; Cmd = "node --version";    Fix = "winget install OpenJS.NodeJS.LTS" },
    @{ Name = "uv";        Cmd = "uv --version";        Fix = "powershell -c `"irm https://astral.sh/uv/install.ps1 | iex`"" },
    @{ Name = "python3.12 (via uv)"; Cmd = "uv python find 3.12"; Fix = "uv python install 3.12" },
    @{ Name = "aws cli v2"; Cmd = "aws --version";      Fix = "winget install Amazon.AWSCLI" },
    @{ Name = "agentcore"; Cmd = "agentcore --version"; Fix = "npm install -g @aws/agentcore" },
    @{ Name = "claude";    Cmd = "claude --version";    Fix = "see https://code.claude.com/docs" },
    @{ Name = "docker (optional)"; Cmd = "docker --version"; Fix = "optional: only for container templates" }
)

$missing = 0
foreach ($c in $checks) {
    $out = $null
    $exe = $c.Cmd.Split(" ")[0]
    if (Get-Command $exe -ErrorAction SilentlyContinue) {
        $ErrorActionPreference = "SilentlyContinue"
        $lines = @(Invoke-Expression $c.Cmd 2>$null)
        $ErrorActionPreference = "Continue"
        if ($LASTEXITCODE -eq 0 -and $lines.Count -gt 0) { $out = "$($lines[0])".Trim() }
    }
    if ($out) {
        Write-Host ("[ok]   {0,-22} {1}" -f $c.Name, $out) -ForegroundColor Green
    } else {
        Write-Host ("[MISS] {0,-22} -> {1}" -f $c.Name, $c.Fix) -ForegroundColor Yellow
        if ($c.Name -notlike "*optional*") { $missing++ }
    }
}

# Old pip starter toolkit shadows the npm agentcore CLI on Windows
$pipToolkit = (pip show bedrock-agentcore-starter-toolkit 2>$null)
if ($pipToolkit) {
    Write-Host "[WARN] pip bedrock-agentcore-starter-toolkit installed; it can shadow the npm agentcore CLI. pip uninstall bedrock-agentcore-starter-toolkit" -ForegroundColor Yellow
}

# AWS credentials (only meaningful once you have an account / event creds)
if (Get-Command aws -ErrorAction SilentlyContinue) {
    $id = aws sts get-caller-identity --output text 2>$null
    if ($LASTEXITCODE -eq 0) { Write-Host "[ok]   aws credentials        $id" -ForegroundColor Green }
    else { Write-Host "[info] no valid AWS credentials yet (expected until you paste event or personal creds)" }
    if (-not $env:AWS_REGION) { Write-Host "[info] AWS_REGION not set (agentcore and Claude Code on Bedrock need it), e.g. `$env:AWS_REGION='us-west-2'" }
}

# Skills installed?
$skillDir = Join-Path $HOME ".claude\skills"
foreach ($s in "nonprofit-discovery","agentcore-agent","demo-frontend","responsible-ai-review","production-handoff","pitch-builder") {
    if (Test-Path (Join-Path $skillDir "$s\SKILL.md")) { Write-Host "[ok]   skill $s" -ForegroundColor Green }
    else { Write-Host "[MISS] skill $s -> run setup\install-skills.ps1" -ForegroundColor Yellow; $missing++ }
}

Write-Host ""
if ($missing -eq 0) { Write-Host "Ready." -ForegroundColor Green } else { Write-Host "$missing required item(s) missing." -ForegroundColor Yellow }
