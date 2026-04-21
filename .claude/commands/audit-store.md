---
description: Full store audit → updates store-data/store-profile.md
---

Run a full store audit on the store identified in `CLAUDE.md`. Validate every GraphQL query with `shopify-plugin:shopify-admin` before executing with `shopify-plugin:shopify-admin-execution` (read-only — no `--allow-mutations` needed).

Discover and write to `store-data/store-profile.md`:

- Active theme name, ID (`gid://shopify/OnlineStoreTheme/...`), version, base theme
- All installed apps (name, function, scripts they inject, metafields they own)
- Existing metafield definitions (namespace, key, type, owner)
- Existing metaobject definitions
- Navigation menus (main + footer) — IDs and item types in use
- Collection structure (count, smart vs manual, key collections)
- Product catalog summary (count, variant complexity, metafield coverage)
- Script tags and third-party pixels
- Store config: markets, currencies, languages, plan tier, checkout type

Flag anything unusual that will affect build decisions: theme customizations, conflicting apps, metafield namespaces owned by apps, etc.

End with a 3-bullet summary of what's most important for the build ahead.
