---
description: Audit products for missing critical data
---

Audit the product catalog (read-only) and output a CSV per issue:

- Products missing descriptions (`body_html` empty or under 50 chars)
- Products missing images
- Products missing SEO title or meta description
- Products with no collection assignment
- Products with no tags
- Products missing key metafields (look at definitions in `store-data/store-profile.md`)

One CSV per issue type, named like `missing-descriptions.csv`, `missing-images.csv`, etc. Save them to `store-data/audits/` (create the directory if needed).
