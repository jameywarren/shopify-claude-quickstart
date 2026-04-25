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
read_locations
```

> **Scope notes (verified 2026-04):**
> - `read_metafield_definitions` / `write_metafield_definitions` — **NOT valid scopes.** Metafield access is gated by the owning resource (e.g. `read_products` covers product metafields).
> - `read_metafields` / `write_metafields` — **NOT valid scopes.** Same story.
> - `read_navigation` / `write_navigation` — **NOT valid scopes.** Navigation menus are covered by `read_content` / `write_content`.
> - `read_apps` — **DO NOT include.** It is a protected scope requiring special Partner Dashboard approval. Including it in the scope list causes OAuth to fail for the entire auth request with `missing_shopify_permission: read_apps`. App data can be retrieved by asking the client to list their installed apps from the Shopify admin.
> - `read_locations` is required for any `locations` query.
> - OAuth will reject the entire scope list if any single scope is invalid or unapproved, so one bad scope blocks all auth.

Then update `store-data/scopes-granted.md` — record store handle, today's date, and mark each scope Granted: Y.

### Step 2 — Pull the current theme

`shopify theme pull` uses your Shopify Partner account login, not the `shopify store auth` session. You must have collaborator or staff access to the store before this step will work.

**Before running this step:** confirm you have accepted collaborator access to the store. If not, send a collaborator request from your Partner Dashboard (Partners → Stores → Send collaborator request) and ask the client to approve it. Request at minimum: Themes, Products, Content.

```bash
mkdir -p store-data/theme && cd store-data/theme
shopify theme pull --store {STORE}.myshopify.com
cd -
```

> If theme pull fails with "don't have access to this dev store", your collaborator request hasn't been approved yet — there is no workaround.

### Step 3 — Audit the store

Use `shopify-plugin:shopify-admin` to validate, then `shopify-plugin:shopify-admin-execution` to query (no `--allow-mutations` needed). Discover:

- Active theme name, ID (`gid://shopify/OnlineStoreTheme/...`), version, base
- All installed apps (and what they inject) — ask the client to share their app list if `appInstallations` is unavailable
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
  metaobjectDefinitions(first: 50) { nodes { id name type } }
  scriptTags(first: 50) { nodes { id src displayScope } }
  locations(first: 20) { nodes { id name } }
}
```

> **Schema notes (Admin API 2025-10+):** `productsCount` and `collectionsCount` are **top-level Query fields**, not fields on `Shop`. `OnlineStoreTheme` has no `previewable` field. `locations.name` requires `read_locations`. Validate any deviation with the `shopify-plugin:shopify-admin` skill before executing.
>
> **`appInstallations` is omitted** — it requires the protected `read_apps` scope (Partner Dashboard approval needed). Ask the client to share their app list from Shopify admin → Apps, or skip this step and add apps manually to `store-profile.md`.

Metafield definitions are not a top-level query — they live on resource types (`Product.metafieldDefinitions`, `Collection.metafieldDefinitions`, etc.). Query them per owner type only if the build needs them.

Write findings to `store-data/store-profile.md`, overwriting the template.

### Step 4 — Fill in CLAUDE.md STORE DETAILS and THEME NOTES

Update the **STORE DETAILS** block in `CLAUDE.md` with the discovered values: store handle, store name, active theme name, theme ID, theme base, primary market, currency, key apps.

Then update the **THEME NOTES** section with anything non-obvious about this theme. At minimum document:
- Theme name, version, and developer (e.g. "Impact 7.0.1 by Maestrooo")
- Whether it's a block-based OS 2.0 theme or section-based
- Any sections with unusual behavior or naming that differs from Dawn conventions
- Known limitations discovered during the audit

**If the active theme is Skeleton**: flag it immediately and recommend the developer migrate to a premade theme before the build proceeds. Skeleton has no catalog pages, PDP, cart, or commerce primitives — it's not suitable for merchant-facing work.

Example notes:
```
- Impact 7.0.1 (Maestrooo) — block-based OS 2.0 theme. Sections live in sections/ but most layout is driven by blocks inside sections.
- The "Announcement bar" section is called `announcement-bar.liquid` not `header-announcement.liquid`.
- No native "image with text" section — closest is `shoppable-section.liquid` which adds product links.
```

Add more notes here throughout the build whenever you hit a theme quirk.

### Step 5 — Report

Give me a 5-bullet summary:
1. Auth: success/failure and which scopes are granted
2. Theme: name, ID, base, version
3. Apps: count and which ones might affect builds
4. Catalog: product count, collection count, metafield count
5. Anything unusual to flag for the build

### Step 6 — Offer GitHub tracking

Ask the user:

> "Want to track this theme in a private GitHub repo? You'll get full version history — so you can always roll back to a previous heading, layout, or setting. I can set it up now."

If they say yes, run `/github-setup`. If they say no, note they can run `/github-setup` at any time.

Do **not** propose any builds yet. The next step is `/brief-interview` (or `/brief-quick`) to capture what we're building.
