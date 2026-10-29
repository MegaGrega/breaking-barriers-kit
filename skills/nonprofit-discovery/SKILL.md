---
name: nonprofit-discovery
description: Turn raw notes from a nonprofit deep-dive (hackathon Day 1) into a one-page problem brief, a scoped MVP, ranked solution concepts scored against the judging criteria, and the next questions to ask the nonprofit rep. Use when the user pastes meeting notes, a transcript, a nonprofit's website or docs, or says "problem statement", "scope this", "what should we build", or "deep-dive".
---

# Nonprofit discovery → problem brief

Goal: in under 30 minutes after the nonprofit session, the team has ONE shared written answer to "who are we helping, with what, and how will we know it worked". The person who writes this brief steers the team. Make it good enough that teammates adopt it as-is.

How this event is won: the **nonprofit** is what wins (credits and build support go to the charity, e.g. Bookmark Reading Charity was "selected as London winner" in the UK edition). So the target is a solution the nonprofit's own rep will champion to the judges and actually adopt. Past judges praised a solution for supporting vulnerable children "without shame" — empathy and dignity for the end beneficiary count as much as technical depth. Every section below should serve those two things.

## Inputs

Whatever the user has: typed notes, a pasted transcript, photos of whiteboards, the nonprofit's website or public reports. If the nonprofit's site is given, read it for mission, programs, people served, scale, and any published numbers.

If the user is still IN the session, first print the **live question list** below so they can ask them now.

## Live question list (ask the nonprofit rep)

Rank by what is still unknown. Never ask more than 6 at once.

1. Walk me through the last time this problem happened. Who was involved, what did they do step by step, how long did it take?
2. Who would use our tool day to day: staff, volunteers, or the people you serve directly? On what device? With what connection?
3. What does it cost you today (staff hours per week, people turned away, wait time)? Is there a number you report to funders?
4. What data exists, where does it live (spreadsheets, a CRM like Salesforce NPSP, paper, email), and can we get a sanitized sample or should we synthesize it?
5. What is sensitive? (health info, minors, immigration status, location of vulnerable people)
6. What languages and reading levels do the people you serve need?
7. Who on your side would maintain this after the hackathon? How technical are they? What monthly AWS spend is realistic?
8. What have you tried before, and why did it not stick?
9. If we could only demo one thing on Thursday, what would make you say "we would use that tomorrow"?
10. How do the people you serve feel when they hit this problem (embarrassed, scared, overwhelmed, distrustful of tech)? What would make a tool feel respectful to them?
11. What would you want to be able to tell your board or funders about this in 6 months?

## Output: write `docs/brief.md`

Use exactly these sections. Keep the whole file to one screen if possible. Use the nonprofit's own words where you can and mark anything you inferred with `(assumption)`.

```markdown
# <Nonprofit> — <one-line problem>

## Who we serve
One persona for the demo: name, role, situation, device, language. One sentence of their day.

## The job to be done
"When <situation>, <persona> needs to <job>, so that <outcome>."

## Dignity
How the persona feels today, and the design principle that protects their dignity (e.g. "never label a child as behind", "no forms before help", "works without an account").

## Today (the painful workflow)
3–6 steps as they happen now, with the time or cost of each where known.

## Constraints
- Users' tech comfort / devices / connectivity
- Data: what exists, sensitivity (HIPAA, FERPA, COPPA, PII), what we will use in the demo (sanitized or synthetic)
- Who maintains it after; realistic monthly budget
- Language and accessibility needs

## Success metric
One number we can claim, e.g. "intake time 25 min → 5 min" or "advisers answer 80% of policy questions without escalation". Say how we would measure it.

## MVP (the golden path)
The ONE end-to-end flow we will demo, as 4–7 numbered steps from the persona's point of view.

## Not building (out of scope)
Explicit list. This protects the team from scope creep on Day 2.

## Open questions
Ranked; who can answer each.
```

## Then: 3 solution concepts

After the brief, propose three concepts (different shapes, not variations of one). For each:
- One sentence pitch, which persona it serves, and the golden path.
- AWS mapping (Bedrock model, AgentCore Runtime/Memory/Gateway, Knowledge Base, Transcribe/Translate/Textract, etc.) — only what the MVP truly needs.
- Score 1–5 on each judging criterion: **technical innovation, social impact potential, feasibility, presentation quality**, plus **deployability** (can this realistically run in the nonprofit's own AWS account with their staff?). Note: winners are advanced toward deployment in the beneficiary's environment, so deployability is a hidden criterion.
- Biggest risk and how to de-risk it by end of Day 1.

Recommend one. Prefer the concept whose demo can show a real before/after for one person over the one with the most AI, and the one the nonprofit rep is visibly most excited about. Before the team commits, the user should show the rep the top 1–2 concepts and get a reaction; record it in the brief.

## Also produce

A 3-sentence version of the brief the user can read aloud to the team, and a one-line Slack/Teams message offering it: "I wrote up what we heard from <nonprofit> — brief + 3 options here: <link>. Happy to change anything."
