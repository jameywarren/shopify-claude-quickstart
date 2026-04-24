---
description: Pull the latest shopify-claude-quickstart changes from GitHub
---

First, detect which setup you're in by running:

```bash
git remote -v
```

Then follow the matching path:

---

**If `upstream` remote exists** (Path B — cloned template directly, remapped remotes):

```bash
git fetch upstream
git merge upstream/main
```

If there are merge conflicts, they'll most likely be in `CLAUDE.md` (which you've customized for your store). Resolve them manually — keep your STORE DETAILS and THEME NOTES, take the upstream version of everything else.

---

**If `origin` points to `shopify-claude-quickstart`** (working inside the template repo itself):

```bash
git pull origin main
```

---

**If neither applies** (client directory scaffolded via `setup.sh`):

Client directories are standalone snapshots — they have no link back to the template. You can't pull updates into them automatically.

To get improvements into a client project, open the `shopify-claude-quickstart/` source directory in a separate Claude Code session and run `/toolkit-update` there. Then manually port any changes that matter (new commands, CLAUDE.md additions) into the client directory.

Alternatively, re-read the README for the fork-with-upstream setup that keeps a client directory in sync.

---

After a successful pull, summarize what changed:
- New slash commands added
- Changes to CLAUDE.md that affect session behavior
- Changes to setup.sh
- Any breaking changes to existing commands

3–5 bullets. If nothing changed beyond minor fixes, say so.
