#!/usr/bin/env sh
# One-shot setup on any Mac/Linux/WSL/cloud-IDE machine that has Claude Code.
#   curl -fsSL https://raw.githubusercontent.com/MegaGrega/breaking-barriers-kit/main/setup/bootstrap.sh | sh
# Installs this kit and jmo-skills as Claude Code plugins (user scope). Safe to re-run.
set -e

if ! command -v claude >/dev/null 2>&1; then
  echo "Claude Code not found. Install it first: https://code.claude.com/docs (or: npm install -g @anthropic-ai/claude-code)"
  exit 1
fi

claude plugin marketplace add MegaGrega/breaking-barriers-kit || claude plugin marketplace update breaking-barriers-kit
claude plugin install breaking-barriers@breaking-barriers-kit

claude plugin marketplace add 23jmo/jmo-skills || claude plugin marketplace update jmo-skills
claude plugin install jmo-workflow@jmo-skills

command -v agentcore >/dev/null 2>&1 || echo "Tip: npm install -g @aws/agentcore"
command -v aws >/dev/null 2>&1 || echo "Tip: install AWS CLI v2"
echo "Done. Start a new Claude Code session; skills appear as /breaking-barriers:<skill> and /jmo-workflow:<skill>."
