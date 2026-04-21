---
description: Configure the hero section with brief-driven content
argument-hint: "<hero-section-filename>"
---

Using `store-data/theme/sections/$ARGUMENTS` (or auto-detect the hero section if no argument), configure the hero with:

- Headline from `client-brief/page-content.md`
- Voice matching `client-brief/voice-style-guide.md`
- CTA button text and destination
- Overlay, text color, and image settings appropriate for the brand (`client-brief/design-brief.md`)

Output:
1. The exact JSON settings block for the section in `templates/index.json`
2. The `themeFilesUpsert` mutation, validated by `shopify-plugin:shopify-admin`, ready to execute with `shopify store execute --allow-mutations`
3. Any schema additions needed if a setting doesn't exist yet

Show the mutation but **do not execute** until I confirm.
