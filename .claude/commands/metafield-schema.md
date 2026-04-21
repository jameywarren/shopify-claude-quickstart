---
description: Design a metafield schema for the catalog and output ready-to-run mutations
argument-hint: "[product-type]"
---

Design a metafield schema for products of type: **$ARGUMENTS** (or infer from the catalog if blank).

Based on what a merchant or customer would want to filter, display, or search by, recommend:

| Namespace | Key | Type | Where it shows | Priority (must/nice) |

Then output the `metafieldDefinitionCreate` GraphQL mutations, validated by `shopify-plugin:shopify-admin`. Each mutation in its own block, labeled with what it creates.

**Do not execute yet.** Show the mutations so I can review before we run them with `--allow-mutations`.
