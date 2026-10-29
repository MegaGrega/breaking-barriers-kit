# Breaking Barriers Kit

Claude Code skills for the AWS Breaking Barriers 2026 AI for Good hackathon (Seattle, Nov 3–5).

| Skill | Use it for |
|---|---|
| `nonprofit-discovery` | Deep-dive questions, then notes → one-page brief, scoped MVP, concepts scored on the judging criteria |
| `agentcore-agent` | Scaffold, run, and deploy a Strands agent on Bedrock AgentCore in a temporary event account |
| `demo-frontend` | React golden-path UI with synthetic data, streaming, citations, record/replay so the demo can't die, and a time-boxed polish pass |
| `responsible-ai-review` | Risk table, Bedrock Guardrails, crisis escalation, measured eval for a slide |
| `production-handoff` | Architecture diagram, monthly cost at the nonprofit's scale, runbook, handoff README |
| `pitch-builder` | Story-led script mapped to the criteria, slide outline, judge Q&A, rehearsal critique |

## Install anywhere

The bootstrap installs this kit plus the design and accessibility skills the polish pass in `demo-frontend` uses:

| From | What |
|---|---|
| [23jmo/jmo-skills](https://github.com/23jmo/jmo-skills) | `jmo-workflow` plugin: interview, animate, better-ui, and more |
| [jakubkrehel/skills](https://github.com/jakubkrehel/skills) | `interfaces` plugin: better-interface, state-machine, break, better-accessibility, better-writing, variant |
| [Owl-Listener/inclusive-design-skills](https://github.com/Owl-Listener/inclusive-design-skills) | `cognitive-accessibility` and `accessible-content` plugins: plain language, simplify, readable content |
| [emilkowalski/skills](https://github.com/emilkowalski/skills) | 7 skills: emil-design-eng, review-animations, find-animation-opportunities, improve-animations, break-ui, pick-ui-library, mobile-native |

Mac / Linux / cloud IDE:
```sh
curl -fsSL https://raw.githubusercontent.com/MegaGrega/breaking-barriers-kit/main/setup/bootstrap.sh | sh
```

Windows:
```powershell
irm https://raw.githubusercontent.com/MegaGrega/breaking-barriers-kit/main/setup/bootstrap.ps1 | iex
```

Or manually:
```sh
claude plugin marketplace add MegaGrega/breaking-barriers-kit
claude plugin install breaking-barriers@breaking-barriers-kit
```

No Claude Code on the machine? Each `skills/*/SKILL.md` is plain markdown. Paste it into whatever assistant you have (for example as a Kiro steering file) and it still works as a playbook.

## Also here
- `templates/CLAUDE.md`: drop into the team repo on Day 1.
- `setup/preflight.ps1`: checks git, Node, uv, Python 3.12, AWS CLI, AgentCore CLI, Claude Code, and the skills.
- `field-guide.html`: countdown, playbook, idea patterns, day-by-day targets.

MIT licensed.
