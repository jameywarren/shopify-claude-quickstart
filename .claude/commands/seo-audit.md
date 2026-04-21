---
description: Audit meta titles/descriptions for homepage, top collections, and PDPs
---

Review meta titles and descriptions for:
- Homepage
- Top 3 collections (by product count or by what's in nav)
- A representative sample of product pages

Compare against `client-brief/business-goals.md` (target keywords, customer language) and `client-brief/voice-style-guide.md`.

Score each page 1–10. Output a priority fix list as a CSV: `page_handle,current_title,suggested_title,current_description,suggested_description,priority`.

Ready to apply via `shopify store execute --allow-mutations`. Show the list first; do not execute.
