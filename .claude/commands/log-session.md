---
description: Append today's session log entry with auto-pulled context
---

Before writing the log, gather context automatically:

1. Run `git log --oneline -5` if git is available — use this as the primary record of what was pushed/changed this session
2. Run `git diff --stat HEAD` to see any uncommitted local changes
3. Use `shopify-plugin:shopify-admin-execution` to query current themes and identify the dev theme used this session and whether anything was pushed to the live theme:
   ```graphql
   { themes(first: 20) { nodes { id name role } } }
   ```
4. Read `docs/session-activity.log` if it exists — the last SESSION START block shows how many turns this session had
5. Read `docs/session-log.md` to see the last entry (so you don't duplicate)

Then ask the user one question: **"What should I know about this session that git can't tell me?"** Wait for their answer before writing.

Now append a new entry into the **Current Sprint** section of `docs/session-log.md` (newest at the top of that section):

---

```
## YYYY-MM-DD — [Brief Session Title]

### What We Did
- [specific actions, files touched, commands run]

### Theme State
- Dev theme ID used: gid://shopify/OnlineStoreTheme/___
- Backup theme created: (gid://... or none)
- Pushed to live theme: Y / N

### Decisions Made
- [Decision] — **Why:** [rationale]

### Open Questions
-

### Blocked On
- (waiting on client assets / collaborator access / etc. — or "nothing")

### Next Session
- **Start here:** [the single first action]
```

---

Keep it dense. Name files and section names instead of "updated some stuff." Every Decisions Made entry must have a Why.

If the Current Sprint section has more than 3 entries, move the oldest one to the Archive section at the bottom.

After writing the log entry, append a `SESSION END: [timestamp]` line to `docs/session-activity.log` so the next session starts clean.

---

### Commit the session log (if git is available)

Check if git is initialized:

```bash
git rev-parse --is-inside-work-tree 2>/dev/null && echo "git:yes" || echo "git:no"
```

**If git is available**, stage and commit the session log:

```bash
git add docs/session-log.md docs/session-activity.log
git commit -m "session: YYYY-MM-DD — [same title as log entry]

Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>"
git push 2>/dev/null || true
```

Use the exact date and title from the log entry. The `git push` is best-effort — if no remote is connected yet, that's fine.

**If git is not available**, skip the commit step. The log file is the only record — remind the user to consider running `/github-setup` to enable version history.
