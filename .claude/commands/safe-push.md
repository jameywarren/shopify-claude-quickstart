---
description: Pre-flight checklist before pushing theme changes to live
---

Before pushing any theme changes to the live theme, run through:

1. Were changes tested on a dev theme first? (find recent `shopify theme push --theme` commands in `docs/session-log.md`)
2. Are there console errors in any changed sections?
3. Does the Liquid validate cleanly via `shopify-plugin:shopify-liquid`?
4. Hardcoded strings that should be settings or translations?
5. Missing schema translations for any new settings?
6. Any in-flight metafield/metaobject changes that haven't been applied yet?

Report all issues. If all clear, confirm "ready to push" and output the exact push command for the live theme.

**Push ordering — if pushing a section and a template that references it together:**

Push in two steps. Shopify validates template JSON before resolving new section schemas, so pushing both at once can fail with a block-key error even when the files are correct.

```bash
# Step 1: section Liquid first
shopify theme push --path store-data/theme --store {STORE}.myshopify.com --theme LIVE_THEME_ID --force \
  --only sections/changed.liquid

# Step 2: template JSON after
shopify theme push --path store-data/theme --store {STORE}.myshopify.com --theme LIVE_THEME_ID --force \
  --only templates/changed.json
```

For unrelated files (no section/template dependency), a single push is fine:
```bash
shopify theme push --path store-data/theme --store {STORE}.myshopify.com --theme LIVE_THEME_ID --force \
  --only sections/a.liquid sections/b.liquid
```

> **`--force` is required for live theme pushes.** Claude Code runs non-interactively — the Shopify CLI prompt "Push theme files to the live theme?" has no TTY to answer and exits with code 1. `--force` bypasses it. Dev theme pushes don't need it.

The `--path store-data/theme` flag is required — omitting it causes "not in a theme directory" errors.

Do not push yourself — I push.

---

## After the user confirms the push succeeded

Check if this project has a git remote:

```bash
git remote -v 2>/dev/null
```

**If a remote exists** — commit the pushed files automatically:

```bash
git add store-data/theme/
git status
```

Show the staged files, then commit with a message derived from what was pushed (use the filenames from the `--only` list):

```bash
git commit -m "theme: {brief description of what changed}

Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>"
git push
```

Example messages: `theme: update hero subheading and CTA copy`, `theme: add ski landing page template`, `theme: fix product grid spacing on mobile`.

**If no remote exists** — ask: *"No GitHub repo connected yet. Want to run /github-setup to enable version history?"*
