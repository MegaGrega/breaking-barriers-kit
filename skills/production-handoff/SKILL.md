---
name: production-handoff
description: Produce the "path to production" package for a hackathon solution that may be deployed into a nonprofit's own AWS account - architecture diagram, monthly cost estimate at the nonprofit's real scale, security notes, runbook for non-technical staff, and a handoff README. Use when the user asks for an architecture diagram, cost estimate, feasibility slide, deployment plan, README, or "how would the nonprofit run this".
---

# Production handoff

Winning solutions are advanced toward deployment in the nonprofit's own AWS environment. "Feasibility" is judged on whether a small nonprofit could actually run and afford this. Most teams skip it; doing it well is a differentiator.

## 1. Architecture diagram — `docs/architecture.md`

Read the code and `agentcore/agentcore.json`; diagram what actually exists, not an aspirational system. Mermaid `flowchart LR`, max ~10 nodes: users → frontend → AgentCore Runtime (agent) → Bedrock model / Knowledge Base / tools → data stores. Mark demo-only pieces (replay mode, synthetic data) with a dashed style. Also export a PNG for slides if `mmdc` (mermaid-cli) is available; otherwise tell the user to paste it into mermaid.live.

## 2. Cost estimate — `docs/cost.md`

- Get usage assumptions from the brief (users/month, conversations/user, messages/conversation, avg tokens in/out, documents indexed).
- Look up **current** prices (AWS pricing pages or the AWS Pricing API) for the exact model and services used. Do not quote prices from memory; cite the source and date.
- Table: service, unit, unit price, monthly quantity, monthly cost. Give low / expected / high scenarios.
- Call out cost levers: smaller model for routine turns, prompt caching, avoid always-on resources (e.g. OpenSearch Serverless minimums), AWS nonprofit credit programs (AWS Imagine Grant, nonprofit credit program — tell the user to verify current eligibility).
- One-line takeaway for the slide, e.g. "≈ $X/month for 2,000 families".

## 3. Security & operations — `docs/operations.md`

- Least-privilege IAM for the runtime; no secrets in the repo (Secrets Manager / AgentCore Identity).
- Where data lives, retention, who can access logs; HIPAA/FERPA notes from the responsible-ai doc.
- Monitoring: CloudWatch / AgentCore Observability, a budget alarm (AWS Budgets) at a dollar amount the nonprofit chose.
- Runbook for a non-developer: how to update the documents the agent knows about, how to change the system prompt text, what to do if it gives a bad answer, who to call.

## 4. Handoff README

`README.md` with: what it does (2 sentences), demo GIF/screenshot, architecture link, prerequisites, deploy in ≤5 commands (`agentcore deploy` based), configuration, cost link, known limitations, next steps (prioritised), team contacts.

## 5. Slide text

Produce a "Path to production" slide: 3 bullets (deploy steps already automated, monthly cost, what the nonprofit's staff need to do) + "Week 1 / Month 1 / Month 3" plan.
