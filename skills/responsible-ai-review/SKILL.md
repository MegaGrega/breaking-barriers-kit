---
name: responsible-ai-review
description: Review and harden a hackathon AI solution for vulnerable users - privacy (HIPAA, FERPA, COPPA, PII), safety guardrails, hallucination control, human escalation, bias, accessibility, and language access - and produce a small measured evaluation the team can put on a slide. Use when the user asks "is this safe", "guardrails", "what will judges ask about privacy", "evaluate the agent", or before presenting anything in health, education, or crisis response.
---

# Responsible AI review

Nonprofits serve people who are the least able to absorb an AI mistake. Judges and the nonprofit will ask about this. Turn it into a strength: show that the team **measured** it.

## 1. Risk scan (write `docs/responsible-ai.md`)

Read `docs/brief.md` and the agent code, then fill this table for the actual solution (not generic risks):

| Risk | Where it can happen in our flow | Severity (H/M/L) | Mitigation we built | Mitigation for production |
|---|---|---|---|---|

Always consider: wrong facts (eligibility, medical, legal, safety instructions); sensitive data entered by users; minors; crisis signals (self-harm, abuse, emergency) → must hand off to a human/hotline, never handle alone; over-reliance by staff; language/reading-level exclusion; bias across demographics or dialects; prompt injection via uploaded documents.

Regulatory flags (do not give legal advice, just flag): health data → HIPAA (Bedrock is HIPAA-eligible but the nonprofit needs a BAA with AWS for production); student records → FERPA; children under 13 → COPPA.

## 2. Mitigations to actually build (pick what fits, in this order)

1. **Deterministic tools for anything that must be right** (rules, numbers, dates).
2. **Grounding + citations**: answer only from retrieved sources for factual questions; say "I don't know, here's who to contact" otherwise.
3. **Amazon Bedrock Guardrails**: PII detection/redaction, denied topics (e.g. diagnosis, legal advice), content filters, contextual grounding check. Attach the guardrail ID to the model config.
4. **Human in the loop**: escalation tool/button with a clear handoff message; staff-review step before anything is sent to a client.
5. **Crisis detection**: a short check before the main response; if triggered, show the right hotline (988 in the US) and a human contact, stop generating.
6. **Data minimisation**: synthetic data only in the demo; no logging of message contents in production by default; retention note.
7. **Accessibility & language**: plain-language level (aim around grade 6 for public-facing), translation, screen-reader friendly UI.

## 3. Measured evaluation (the slide)

Create `tests/eval.jsonl` with 20–30 cases across: golden path (should succeed), edge cases, out-of-scope requests (should refuse/redirect), crisis signals (should escalate), PII pasted in (should be redacted/not echoed), a non-English request, and a prompt-injection attempt in an uploaded doc.

Write `tests/run_eval.py` that runs each case against the agent and grades it (exact checks where possible, otherwise an LLM-as-judge prompt with a rubric). Output a table: category, passed/total. Re-run after each mitigation and keep the before/after numbers — "guardrails took unsafe responses from 6/30 to 0/30" is a strong slide.

## 4. Q&A prep

Write 5 short answers the team can give on stage: hallucinations, privacy/HIPAA, what happens when it is wrong, bias, and why this needs AI at all (vs a form or FAQ).
