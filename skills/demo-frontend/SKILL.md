---
name: demo-frontend
description: Build a fast, accessible, demo-proof frontend for a hackathon AI agent, with a golden-path script, seeded synthetic data, streaming responses, and a replay mode so the live demo survives bad wifi, throttling, or expired credentials. Use when the user wants a UI, a demo, a web app for the agent, "make it look real", or to rehearse/protect the live demo.
---

# Demo frontend

The demo is what judges remember. A plain UI that never fails beats a beautiful one that hangs on stage.

## Choose the stack (decide in 2 minutes)

- **Streamlit** (default): Python, same repo as the agent, chat UI in ~40 lines (`st.chat_input`, `st.chat_message`, `st.write_stream`). Pick this unless the team has a dedicated frontend person.
- **Vite + React + Tailwind**: if the end user is on a phone, the nonprofit wants a branded look, or a frontend dev on the team prefers it. Call the agent through a tiny FastAPI/Express proxy; never put AWS credentials in the browser.

Ask the user which, recommend Streamlit, and go.

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

## Demo safety checklist (do by Day 3 noon)

- [ ] Golden path recorded in `replay` and tested with wifi OFF.
- [ ] Backup screen recording (60–90 s) of the full golden path saved locally AND in a cloud drive.
- [ ] Browser zoom set so text is readable on a projector / screen share; notifications off; bookmarks bar hidden; second tab with the architecture diagram.
- [ ] Fresh credentials pasted 30 minutes before presenting if demoing live.
- [ ] The person driving the demo has run it 3 times end to end.

## Output

Create the app, a `README.md` "How to run the demo" section (3 commands max), and `docs/demo-script.md`: each click and each sentence the presenter says, with target seconds per step.
