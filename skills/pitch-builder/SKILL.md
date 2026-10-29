---
name: pitch-builder
description: Build a short hackathon pitch mapped to the judging criteria (technical innovation, social impact potential, feasibility, presentation quality) - a story-led script with timings, slide outline, live-demo choreography, and a judge Q&A bank - then run a timed rehearsal critique. Use when the user asks for the pitch, presentation, slides, demo script, "what do we say", or wants to rehearse.
---

# Pitch builder

Day 3 ends with cross-city **virtual** presentations to judges and stakeholders. Assume a strict time limit; ask the user for it (default to 4 minutes + 3 minutes Q&A if unknown).

## Inputs
`docs/brief.md`, `docs/demo-script.md`, `docs/responsible-ai.md`, `docs/cost.md`, eval results, and the team's names/roles. Read whatever exists; ask for missing numbers rather than inventing them.

## Structure (4-minute default; scale proportionally)

| Time | Beat | Criterion it scores |
|---|---|---|
| 0:00–0:30 | **One person's story.** The persona from the brief, the moment the problem hits them. A real number from the nonprofit. | Social impact |
| 0:30–0:50 | **The problem at scale** + why current tools fail. One sentence from the nonprofit partner if possible. | Social impact |
| 0:50–2:40 | **Live demo of the golden path** — the same persona, problem solved. Narrate outcomes, not clicks. Show citations / tool results on screen. | Technical innovation, presentation |
| 2:40–3:10 | **How it works** — architecture in one diagram; the one clever thing (e.g. deterministic eligibility tool + grounded answers + guardrails). | Technical innovation |
| 3:10–3:40 | **Trust & feasibility** — eval numbers, guardrails, cost per month, path to production in the nonprofit's account. | Feasibility |
| 3:40–4:00 | **Impact ask/close** — the success metric at scale ("X hours back per week = Y more families served"), and what happens next. Return to the persona. | Social impact, presentation |

## Rules
- The nonprofit is the winner, not the team. Frame the pitch as the nonprofit's solution. If the nonprofit rep is willing, give them 20–30 seconds (opening story or closing "here's what this means for us"); nothing persuades judges more.
- Show empathy and dignity explicitly: one design choice that protects the beneficiary's dignity (no shame, no jargon, no forced sign-up) and why. UK judges praised exactly this.
- One idea per slide, ≤ 12 words of text per slide, big numbers, real screenshots.
- Every claim has a source: nonprofit's figure, our measurement, or labelled estimate.
- Say "we" and credit the nonprofit partner by name.
- Plan who says what. Hand-offs between speakers are short and rehearsed. Whoever built the demo drives it.
- Virtual delivery: share a single window, not the whole screen; test audio and screen share in the actual tool by Day 3 morning; backup video ready to play.

## Outputs
1. `docs/pitch-script.md` — word-for-word script with speaker names and timestamps (~130 spoken words per minute).
2. `docs/slides-outline.md` — slide by slide: title, visual, speaker note.
3. `docs/qa-bank.md` — 12 likely judge questions with 2-sentence answers. Always include: How do you prevent hallucinations? What does it cost the nonprofit per month? Who maintains it? What about privacy/HIPAA/FERPA? Why AI instead of a form/FAQ? How do you know it works? What would you build next? How does it handle languages/accessibility? What if AWS credits end? What did the nonprofit say about it?

## Rehearsal mode
If the user pastes a transcript or timings of a run-through: report overruns per beat, filler or jargon to cut, any claim without evidence, and the single change that most improves the next run. Be blunt and specific.
