---
description: Re-anchor on project context after a context window clear
---

Stop. Work through these steps in order before proposing anything.

---

### Step 1 — Check git availability

```bash
git rev-parse --is-inside-work-tree 2>/dev/null && echo "git:yes" || echo "git:no"
```

---

### Step 2 — Reconstruct recent history

**If git is available**, run both:

```bash
git log --oneline -15
```
```bash
git diff HEAD~1 --stat
```

This gives a timestamped timeline of every push and session commit, plus exactly what changed last session. Read this before touching any prose files.

**If git is not available**, skip to Step 3.

**If both git and `docs/session-log.md` exist**, use both — git for the timeline and exact diffs, session-log for narrative context and open questions that don't show up in diffs.

---

### Step 3 — Re-read project state

1. Re-read `CLAUDE.md` completely — store handle, active theme, current build phase
2. Re-read `docs/session-log.md` if it exists — last 3 entries minimum. The most recent "Next Session: Start Here" is the first action.

---

### Step 4 — Load store data from local snapshots

Check which of these files exist and read them. Do not re-query the API if local data is available:

- `store-data/store-profile.md` — store config, installed apps, theme details
- `store-data/pages.json` — all pages and handles
- `store-data/navigation.json` — menu structure
- `store-data/collections.json` — collection handles and rules
- `store-data/products-index.csv` — product handles, titles, types, collections
- `store-data/metafield-definitions.json` — defined metafields by owner type
- `store-data/theme-sections.md` — section inventory

If none of these snapshots exist yet, note that and suggest running `/pull-store-data` after auth is confirmed.

---

### Step 5 — Verify auth

Run `/check-auth` to confirm the store session is live. If auth has lapsed, re-authenticate. Do not run `/init-store` — that is a first-session-only command.

---

### Step 6 — Report orientation

Tell me:
1. What store and theme are we working on?
2. What were we in the middle of? (from git log and/or session log)
3. What changed last session? (from git diff or session log)
4. What's the next concrete step?
5. Is local store data fresh enough, or does `/pull-store-data` need to run?

**Do not make any changes** until I confirm your understanding is correct.
