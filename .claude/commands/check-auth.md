---
description: Verify store auth is live without re-running init-store
---

Run a lightweight test query to confirm the current auth session is active:

```graphql
{ shop { name myshopifyDomain plan { displayName } } }
```

Use `shopify-plugin:shopify-admin-execution` to execute (no `--allow-mutations`).

**If the query succeeds:** report the store name and confirm we're good to proceed.

**If the query fails with an auth error:** re-authenticate with the full scope set:

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

Then run the test query again to confirm. Update `store-data/scopes-granted.md` with today's date if re-auth was needed.

> **Do not run `/init-store` again.** That command is for first-session setup only — it re-pulls the theme, re-runs the full audit, and overwrites CLAUDE.md. Auth token renewal is the only thing needed here.
