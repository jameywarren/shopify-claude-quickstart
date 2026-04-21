---
description: One-time store setup — auth, theme pull, audit, fill CLAUDE.md
argument-hint: "[store.myshopify.com]"
---

You are running the **first-session setup** for a new Shopify store. Do all of the following in order. After each step, briefly report what happened.

**Store handle:** $ARGUMENTS

If no store handle was provided, ask the user for it before proceeding.

### Step 1 — Authenticate with the full scope set

Use `shopify-plugin:shopify-admin-execution`. Run:

```bash
shopify store auth --store {STORE}.myshopify.com --scopes \
  read_themes,write_themes,\
read_products,write_products,\
read_content,write_content,\
read_metaobjects,write_metaobjects,\
read_metaobject_definitions,write_metaobject_definitions,\
read_files,write_files,\
read_script_tags,write_script_tags,\
read_price_rules,write_price_rules,\
read_inventory,write_inventory,\
read_customers,read_orders,\
read_apps,read_locations
```

> **Scope notes (verified 2026-04):**
> - `read_metafield_definitions` / `write_metafield_definitions` — **NOT valid scopes.** Metafield access is gated by the owning resource (e.g. `read_products` covers product metafields).
> - `read_metafields` / `write_metafields` — **NOT valid scopes.** Same story.
> - `read_navigation` / `write_navigation` — **NOT valid scopes.** Navigation menus are covered by `read_content` / `write_content`.
> - `read_apps` is required for the `appInstallations` query (used by `/app-conflict-check`).
> - `read_locations` is required for any `locations` query.
> - OAuth will reject the entire scope list if any single scope is invalid, one error at a time, so adding an invalid scope blocks all auth.

Then update `store-data/scopes-granted.md` — record store handle, today's date, and mark each scope Granted: Y.

### Step 2 — Pull the current theme

```bash
mkdir -p store-data/theme && cd store-data/theme
shopify theme pull --store {STORE}.myshopify.com
cd -
```

### Step 3 — Audit the store

Use `shopify-plugin:shopify-admin` to validate, then `shopify-plugin:shopify-admin-execution` to query (no `--allow-mutations` needed). Discover:

- Active theme name, ID (`gid://shopify/OnlineStoreTheme/...`), version, base
- All installed apps (and what they inject)
- Existing metaobject definitions
- Navigation menus (main + footer) — IDs and item types
- Collection structure and count
- Product count and variant complexity
- Script tags and third-party pixels
- Markets, currencies, languages, plan tier

**Starter query (verified 2026-04 — validate with `shopify-plugin:shopify-admin` before running):**

```graphql
query {
  shop { name primaryDomain { url host } myshopifyDomain currencyCode plan { displayName } }
  themes(first: 50) { nodes { id name role processing } }
  productsCount { count precision }
  collectionsCount { count }
  appInstallations(first: 100) { nodes { id app { title } } }
  metaobjectDefinitions(first: 50) { nodes { id name type } }
  scriptTags(first: 50) { nodes { id src displayScope } }
  locations(first: 20) { nodes { id name } }
}
```

> **Schema notes (Admin API 2025-10+):** `productsCount` and `collectionsCount` are **top-level Query fields**, not fields on `Shop`. `OnlineStoreTheme` has no `previewable` field. `appInstallations` requires `read_apps`; `locations.name` requires `read_locations`. Validate any deviation with the `shopify-plugin:shopify-admin` skill before executing.

Metafield definitions are not a top-level query — they live on resource types (`Product.metafieldDefinitions`, `Collection.metafieldDefinitions`, etc.). Query them per owner type only if the build needs them.

Write findings to `store-data/store-profile.md`, overwriting the template.

### Step 4 — Fill in CLAUDE.md STORE DETAILS

Update the **STORE DETAILS** block at the bottom of `CLAUDE.md` with the discovered values: store handle, store name, active theme name, theme ID, theme base, primary market, currency, key apps.

### Step 5 — Report

Give me a 5-bullet summary:
1. Auth: success/failure and which scopes are granted
2. Theme: name, ID, base, version
3. Apps: count and which ones might affect builds
4. Catalog: product count, collection count, metafield count
5. Anything unusual to flag for the build

Do **not** propose any builds yet. The next step is `/brief-interview` (or `/brief-quick`) to capture what we're building.
