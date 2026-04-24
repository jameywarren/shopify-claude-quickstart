---
description: Append today's session log entry with auto-pulled context
---

Before writing the log, gather context automatically:

1. Run `git diff --stat HEAD` and `git log --oneline -5` to see what changed
2. Use `shopify-plugin:shopify-admin-execution` to query current themes and identify the dev theme used this session and whether anything was pushed to the live theme:
   ```graphql
   { themes(first: 20) { nodes { id name role } } }
   ```
3. Read `docs/session-activity.log` — the last SESSION START block shows how many turns this session had
4. Read `docs/session-log.md` to see the last entry (so you don't duplicate)

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

After writing: append a `SESSION END: [timestamp]` line to `docs/session-activity.log` so the next session starts clean.
