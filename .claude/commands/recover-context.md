---
description: Re-anchor on project context after a context window clear
---

Stop. Work through these steps in order before proposing anything.

### Step 1 — Re-read project state

1. Re-read `CLAUDE.md` completely — store handle, active theme, current build phase
2. Re-read `docs/session-log.md` — last 3 entries minimum. The most recent "Next Session: Start Here" is the first action.

### Step 2 — Load store data from local snapshots

Check which of these files exist and read them. Do not re-query the API if local data is available:

- `store-data/store-profile.md` — store config, installed apps, theme details
- `store-data/pages.json` — all pages and handles
- `store-data/navigation.json` — menu structure
- `store-data/collections.json` — collection handles and rules
- `store-data/products-index.csv` — product handles, titles, types
- `store-data/metafield-definitions.json` — defined metafields by owner type
- `store-data/theme-sections.md` — section inventory

If none of these snapshots exist yet, note that and suggest running `/pull-store-data` after auth is confirmed.

### Step 3 — Verify auth

Run `/check-auth` to confirm the store session is live. If auth has lapsed, re-authenticate. Do not run `/init-store` — that is a first-session-only command.

### Step 4 — Report orientation

Tell me:
1. What store and theme are we working on?
2. What were we in the middle of? (from session log)
3. What's the next concrete step?
4. Is local store data fresh enough, or does `/pull-store-data` need to run?

**Do not make any changes** until I confirm your understanding is correct.
