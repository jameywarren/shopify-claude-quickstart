---
description: Append today's session log entry with auto-pulled context
---

Before writing the log, gather context automatically:

1. Run `git diff --stat HEAD` to see what files changed this session
2. Run `git log --oneline -5` to see recent commits
3. Read `docs/session-activity.log` — the last SESSION START block shows how many turns this session had
4. Read `docs/session-log.md` to see the last entry (so you don't duplicate)

Then ask the user one question: **"What should I know about this session that git can't tell me?"** Wait for their answer before writing.

Now append a new entry to `docs/session-log.md` (newest at the top) covering this session:

---

**[Date] — Session Log**

- **What we did** — bullet list, specific file/template names, commands run
- **Files changed** — pulled from git diff, with a note on what changed and why
- **Decisions made** — and the reasoning, briefly
- **Open questions** — what's blocked, what needs client input, what's unresolved
- **Next session: start here** — the single first thing to pick up

---

Keep it dense and specific. Name files and line numbers instead of "updated some stuff."

After writing: clear the current session block from `docs/session-activity.log` by appending a `SESSION END: [timestamp]` line so the next session starts clean.
