---
name: demo-frontend
description: Build a fast, accessible, demo-proof frontend for a hackathon AI agent, with a golden-path script, seeded synthetic data, streaming responses, and a replay mode so the live demo survives bad wifi, throttling, or expired credentials. Use when the user wants a UI, a demo, a web app for the agent, "make it look real", or to rehearse/protect the live demo.
---

# Demo frontend

The demo is what judges remember. A plain UI that never fails beats a beautiful one that hangs on stage.

## Choose the stack (decide in 2 minutes)

- **Vite + React + Tailwind + Motion** (default): the only option that leaves room for real polish, animation, and a phone-first layout. Call the agent through a tiny FastAPI proxy (same Python repo as the agent) that streams with Server-Sent Events; never put AWS credentials in the browser. Use the `pick-ui-library` skill before hand-rolling any component (toasts, command menu, charts).
- **Streamlit**: fallback when nobody on the team will own the frontend, or the agent is still not working by Day 2 noon. Chat UI in ~40 lines (`st.chat_input`, `st.chat_message`, `st.write_stream`), but almost no control over motion or visual detail.

Recommend React, confirm with the user, and go.

## Must-haves

1. **Golden path first.** Build exactly the MVP flow from `docs/brief.md`, screen by screen, from the persona's point of view. No settings pages, no login (fake a signed-in persona).
2. **Seeded synthetic data** in `data/seed/` that matches the persona (names, cases, inventory, locations). Never real client data.
3. **Streaming** responses and a visible "working on it" state with what the agent is doing ("checking eligibility rules…", "searching program guide…"). Latency feels shorter when it is narrated.
4. **Show the evidence**: render citations and tool results (a card, table, or map) beside the answer. This is where "technical innovation" becomes visible.
5. **Replay mode.** `DEMO_MODE=live|record|replay`:
   - `record`: run the golden path live, save each request/response (including streamed chunks and tool outputs) to `data/recordings/*.json`.
   - `replay`: serve the recordings with realistic delays, no network or AWS needed.
   - The UI must not show which mode is active, except a tiny dot in a corner only the presenter knows about.
6. **Accessibility and inclusion** (these score on social impact): large base font, high contrast, works at 375px width, keyboard usable, language toggle if the persona needs it (Amazon Translate or ask the model), plain-language reading level, alt text.
7. **One "before vs after" moment**: a screen or toggle that shows the old workflow time vs the new one, using the brief's success metric.

## Motion that earns its place in an agent demo

Spend animation on the AI's waiting time and the evidence, not on decoration:
- Streamed text that appears smoothly, not in jerky chunks.
- A step indicator that narrates tool calls as they happen ("checking eligibility rules…" → ✓).
- Citations and result cards entering after the answer, so the eye follows cause → effect.
- The before/after moment (old workflow time vs new) as the one orchestrated animation.
Everything else stays still. Respect `prefers-reduced-motion`.

## Polish pass (Day 2 evening → Day 3 10:30, time-boxed)

Run only after the golden path works end to end. Use these skills in this order if they are installed; skip any that are missing. Stop at feature freeze no matter where you are.

1. `interfaces:state-machine`: render every state of the main chat/result component (idle, thinking, streaming, tool running, error, empty, long answer). Fix the ugly ones first; this is where agent demos look broken.
2. `break-ui` (or `interfaces:break`): worst-case data — long names, non-Latin text, zero results. Fix anything the golden path could hit.
3. `interfaces:better-interface`: one ranked report across accessibility, layout, copy, type, color, polish. Do the top 5 only.
4. `cognitive-accessibility:simplify` and `accessible-content:rewrite`: plain language and lower cognitive load on every screen the persona sees. This is the dignity story judges reward.
5. `find-animation-opportunities`, then build the 2–3 best with `jmo-workflow:animate`, then `review-animations` on what you built.
6. `interfaces:better-accessibility`: keyboard, focus, screen reader, zoom. Quick wins only.
7. `mobile-native`: only if the persona uses a phone.

Commit before each step so a bad polish change can be reverted in one command.

## Demo safety checklist (do by Day 3 noon)

- [ ] Golden path recorded in `replay` and tested with wifi OFF.
- [ ] Backup screen recording (60–90 s) of the full golden path saved locally AND in a cloud drive.
- [ ] Browser zoom set so text is readable on a projector / screen share; notifications off; bookmarks bar hidden; second tab with the architecture diagram.
- [ ] Fresh credentials pasted 30 minutes before presenting if demoing live.
- [ ] The person driving the demo has run it 3 times end to end.

## Output

Create the app, a `README.md` "How to run the demo" section (3 commands max), and `docs/demo-script.md`: each click and each sentence the presenter says, with target seconds per step.
