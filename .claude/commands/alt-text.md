---
description: Generate SEO-optimized image alt text for products in a collection
argument-hint: "<collection-handle>"
---

For products in collection: **$ARGUMENTS** — generate alt text for all product images.

Rules:
- Include product name, key attribute, and brand name
- Under 125 characters
- No keyword stuffing
- Voice consistent with `client-brief/voice-style-guide.md`

Output as CSV: `product_handle,image_src,alt_text`. Ready for bulk update via `productImageUpdate` once approved.
