---
description: Propose a homepage layout grounded in the pulled theme + client brief
---

First, check `design/` for existing design artifacts:

- If `design/page-specs/homepage.md` exists — implementation decisions are already made. Use that spec as the source of truth and skip layout proposal. Go straight to mapping each module to the right theme section.
- If `design/mockups/` has a homepage image — treat it as design direction. Run `/design-intake homepage` first, then come back to implement.
- If `design/brand-system.md` is filled in — use it for all color, font, and voice decisions; it overrides the client brief for visual choices.
- If `design/` is empty — proceed from the brief, but flag at the end that no visual design direction has been captured yet and suggest running `/brand-system` before implementation.

Then read:
- `client-brief/design-brief.md`
- `client-brief/page-content.md`
- `client-brief/business-goals.md`
- `client-brief/voice-style-guide.md`
- (or `client-brief-QUICK.md` if the full brief isn't filled in)
- `store-data/theme-sections.md` if it exists, otherwise `store-data/theme/sections/`

Propose a homepage layout using **only** sections that exist in the pulled theme. For each section:

- Which section file to use (e.g., `sections/hero.liquid`)
- Why this section vs alternatives in the theme
- Exact settings to configure
- Content to populate from the brief
- Order in the template

Do **not** suggest custom sections unless no native section can do the job — and if you do, explain explicitly why.

Flag content gaps where the client needs to provide assets or copy. End with the recommended sequence to actually build it (which command/mutation runs first).
