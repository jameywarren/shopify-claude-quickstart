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

Report all issues. If all clear, confirm "ready to push" and output the exact push command for the live theme:

```bash
shopify theme push --path store-data/theme --store {STORE}.myshopify.com --theme LIVE_THEME_ID
```

To push only changed files (faster, safer):
```bash
shopify theme push --path store-data/theme --store {STORE}.myshopify.com --theme LIVE_THEME_ID \
  --only sections/changed.liquid templates/changed.json
```

The `--path store-data/theme` flag is required — omitting it causes "not in a theme directory" errors.

Do not push yourself — I push.
