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
read_metafield_definitions,write_metafield_definitions,\
read_files,write_files,\
read_script_tags,write_script_tags,\
read_price_rules,write_price_rules,\
read_inventory,write_inventory,\
read_customers,read_orders,\
read_navigation,write_navigation
```

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
- Existing metafield definitions (namespace, key, type, owner)
- Existing metaobject definitions
- Navigation menus (main + footer) — IDs and item types
- Collection structure and count
- Product count and variant complexity
- Script tags and third-party pixels
- Markets, currencies, languages, plan tier

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
