#!/usr/bin/env sh
# One-shot setup on any Mac/Linux/WSL/cloud-IDE machine that has Claude Code.
#   curl -fsSL https://raw.githubusercontent.com/MegaGrega/breaking-barriers-kit/main/setup/bootstrap.sh | sh
# Installs (user scope, safe to re-run):
#   breaking-barriers   this kit
#   jmo-workflow        23jmo/jmo-skills
#   interfaces          jakubkrehel/skills (UI review, accessibility, copy, states, variants)
#   cognitive-accessibility + accessible-content   Owl-Listener/inclusive-design-skills
#   7 skills from emilkowalski/skills (animation review, break-ui, library picks, mobile feel)
set -e

if ! command -v claude >/dev/null 2>&1; then
  echo "Claude Code not found. Install it first: https://code.claude.com/docs (or: npm install -g @anthropic-ai/claude-code)"
  exit 1
fi

add_marketplace() { claude plugin marketplace add "$1" || claude plugin marketplace update "$2"; }

add_marketplace MegaGrega/breaking-barriers-kit breaking-barriers-kit
claude plugin install breaking-barriers@breaking-barriers-kit

add_marketplace 23jmo/jmo-skills jmo-skills
claude plugin install jmo-workflow@jmo-skills

add_marketplace jakubkrehel/skills interfaces
claude plugin install interfaces@interfaces

add_marketplace Owl-Listener/inclusive-design-skills inclusive-design-skills
claude plugin install cognitive-accessibility@inclusive-design-skills
claude plugin install accessible-content@inclusive-design-skills

# Emil Kowalski's skills are not a plugin; copy the chosen ones into ~/.claude/skills.
tmp=$(mktemp -d)
git clone -q --depth 1 https://github.com/emilkowalski/skills "$tmp/emil"
for s in emil-design-eng review-animations find-animation-opportunities improve-animations break-ui pick-ui-library mobile-native; do
  mkdir -p "$HOME/.claude/skills/$s"
  cp -R "$tmp/emil/skills/$s/." "$HOME/.claude/skills/$s/"
done
rm -rf "$tmp"

command -v agentcore >/dev/null 2>&1 || echo "Tip: npm install -g @aws/agentcore"
command -v aws >/dev/null 2>&1 || echo "Tip: install AWS CLI v2"
echo "Done. Start a new Claude Code session to pick up the skills."
