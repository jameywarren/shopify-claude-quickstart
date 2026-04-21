---
description: Triage a large catalog before any cleanup work
argument-hint: "[approximate-product-count]"
---

I have a catalog of approximately **$ARGUMENTS** products. Before any cleanup work, I need to understand what we're working with.

Using `shopify-plugin:shopify-admin-execution` (read-only) to query the catalog:

1. Identify natural product categories from titles alone
2. Flag products with missing, duplicate, or malformed titles
3. Estimate how many distinct product types exist
4. Recommend a metafield + collection architecture appropriate for this catalog size
5. Propose a phased enrichment plan — what to do first, second, third

**Do not make any changes.** Output a plan for review.
