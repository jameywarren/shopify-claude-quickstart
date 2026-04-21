---
description: Generate product descriptions in bulk from a framework
argument-hint: "<reference-to-product-list-or-collection>"
---

Using the product description framework (look in recent `docs/session-log.md` entries or ask me to point you at it), write descriptions for the products in: **$ARGUMENTS**

For each product:
- Pull the product title and key attributes via `shopify-plugin:shopify-admin-execution` (read-only)
- Generate a description following the framework
- Match voice from `client-brief/voice-style-guide.md`

Output as a CSV: `handle,body_html`

**Do NOT execute mutations.** Show the CSV first so I can review. Once approved, I'll tell you to write them via `productUpdate` with `--allow-mutations`.
