# <Team name> — <Nonprofit> — AWS Breaking Barriers 2026 (Seattle)

Drop this file in the team repo root on Day 1 and fill the brackets. Claude Code reads it at the start of every session.

## What we are building
<2–3 sentences from docs/brief.md: persona, job to be done, golden path.>

Source of truth for scope: `docs/brief.md`. If a request is outside "MVP (the golden path)" there, say so before building it.

## Timeline (hard deadlines)
- Day 1 (Tue Nov 3): brief agreed, agent answers golden-path prompt locally, UI skeleton.
- Day 2 (Wed Nov 4), 12:00: golden path works end to end locally. 17:00: deployed to AgentCore OR decision to demo locally; eval v1 run.
- Day 3 (Thu Nov 5), 11:00: feature freeze. Only bug fixes, demo recording, pitch after this. 12:00: backup video recorded.

## Stack
- Agent: Strands Agents on Amazon Bedrock AgentCore Runtime (scaffolded with `agentcore create --template agent-python-strands`) in `app/agent/`.
- Model: <inference profile id> in <region>.
- Frontend: <Streamlit | Vite+React> in `app/ui/`.
- Data: synthetic only, in `data/seed/`. Never commit real client data or credentials.

## Commands
- Run agent locally: `agentcore dev --mode browser`
- Run UI: <command>
- Eval: `uv run python tests/run_eval.py`
- Deploy: `agentcore deploy`

## Conventions
- Small commits to `main` often; one feature branch per person only if two people touch the same file.
- Anything that must be correct (eligibility, numbers, dates) lives in a deterministic tool, not the prompt.
- Every factual answer shows its source.
- Keep `DEMO_MODE=replay` working at all times after Day 2 noon.
- AWS credentials are temporary and live only in environment variables.

## Team
| Name | Lane | Strengths |
|---|---|---|
| | Agent backend | |
| | Demo UI | |
| | Data / knowledge base | |
| | Pitch & nonprofit liaison | |
