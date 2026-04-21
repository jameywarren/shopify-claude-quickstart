---
description: Audit the product page template for the brand and product type
argument-hint: "[product-type, e.g. 'apparel']"
---

Review `store-data/theme/templates/product.json` and `store-data/theme/sections/main-product.liquid` (or whichever section renders product details) against best practices for **$ARGUMENTS** products.

If no product type was provided, infer from `client-brief/business-goals.md` and the catalog summary in `store-data/store-profile.md`.

Tell me:
- What's missing from the PDP?
- What's redundant or in the wrong order?
- What's not aligned with the brand voice or visual direction?
- Mobile-specific issues?

Prioritize recommendations by conversion impact. For each: name the section, the change, and roughly how big a lift it is (S/M/L).
