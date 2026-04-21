---
description: Add a metafield display to the product page
argument-hint: "<namespace.key>"
---

I want to display the metafield **$ARGUMENTS** on the product page.

Steps:
1. Locate the product detail section in `store-data/theme/sections/` (typically `main-product.liquid`)
2. Determine the best place to render this metafield based on its type and what the brief says about PDP priority
3. Show me the exact Liquid code to insert and the line where it goes
4. If the section schema needs an addition (toggle to show/hide, label override), include that
5. Validate the Liquid via `shopify-plugin:shopify-liquid` before showing me

Then output the `themeFilesUpsert` mutation that writes the modified section, validated by `shopify-plugin:shopify-admin`. **Do not execute until I confirm.**
