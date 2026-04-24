---
description: Capture brand visual system conversationally, save to design/brand-system.md
---

You are capturing the visual identity of this client's brand. Ask questions one at a time. Wait for an answer before moving to the next question. Don't ask all questions at once.

The goal is to fill `design/brand-system.md` with enough specificity that any implementation decision — section layout, color application, font pairing, copy tone — can be made without asking again.

Start by reading:
- `client-brief/design-brief.md` (or `client-brief-QUICK.md`) — to avoid re-asking what's already documented
- `design/brand-system.md` — to see what's already filled in and only ask about gaps

Then work through these questions, skipping anything already answered:

**Colors**
1. What are the primary and secondary brand colors? (Hex values preferred — if they say a color name or describe it, push for hex.)
2. What's the background color for most pages? Dark, light, or neutral?
3. Is there an accent or call-to-action color that's different from the primary?

**Typography**
4. What fonts does the brand use? (Separate display/headline font from body font if different.)
5. Are these Google Fonts, Adobe Fonts, a custom font file, or a Shopify-native font?
6. Any rules about font weight or size hierarchy? (E.g. "headings are always thin weight", "body is 16px/1.6")

**Visual Feel**
7. Share 2–3 URLs of sites or brands this should feel like. What specifically do you like about them?
8. Share 1–2 examples of what this brand should NOT look like. What would feel wrong?

**Voice in Visual Context**
9. One sentence: what emotion should someone feel 5 seconds after landing on the homepage?
10. Any visual rules that are non-obvious? (E.g. "never use stock photography", "all images are black and white", "we never use rounded corners")

After all questions are answered:

Write a complete `design/brand-system.md` using the template format. Be specific — hex codes not color names, exact font names not categories. Flag any gaps where the client still needs to provide an asset (e.g. "SVG wordmark not yet received").

Confirm the file is written, then suggest the next step: if mockups exist in `design/mockups/`, run `/design-intake`. If not, run `/homepage-from-brief` to get a layout proposal grounded in the brand system.
