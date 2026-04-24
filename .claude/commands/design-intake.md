---
description: Bridge a design mockup to a buildable Shopify implementation spec
argument-hint: "[page, e.g. 'homepage']"
---

You are turning a visual design into a buildable Shopify implementation plan. Design decisions are already made — your job is to translate them into theme-specific implementation specs, flag what can't be built natively, and save the output so future sessions don't have to re-derive it.

**Page:** $ARGUMENTS (default: homepage if not specified)

### Step 1 — Gather inputs

Read everything relevant before asking questions:
- `design/mockups/` — look for images matching the page name
- `design/brand-system.md` — palette, fonts, voice
- `design/page-specs/` — check if a spec already exists for this page
- `client-brief/design-brief.md` (or `client-brief-QUICK.md`)
- `store-data/theme/sections/` and `store-data/theme/blocks/` — what sections exist

Then ask only what you can't answer from the files:

1. If no mockup is visible in `design/mockups/`, ask: "Do you have a design file or mockup to share? Drop it in design/mockups/ and tell me the filename, or describe the layout."
2. "Are SVG assets (wordmark, icons) available in `design/assets/`?"
3. "Are fonts already loaded in the theme, or do they need to be added?"

Don't ask about things you can already see in the brief or brand system.

### Step 2 — Module inventory

Identify every distinct visual module in the design (e.g. nav, hero, featured collections, text+image, newsletter, footer). For each module:

| Module | Design intent | Theme section to use | Fit | Gap |
|--------|---------------|---------------------|-----|-----|
| Hero | Full-bleed image, headline, CTA | `sections/hero-banner.liquid` | Native | None |
| ... | | | | |

**Fit ratings:**
- **Native** — the theme section does this out of the box
- **Configure** — native section but needs specific settings or schema additions
- **Modify** — closest native section requires Liquid edits
- **Custom** — no native section can do this; new section required

Flag every "Modify" or "Custom" upfront. These are build-time decisions.

### Step 3 — Per-module implementation spec

For each module, write a spec block:

```
## [Module name]

**Design intent:** What the design shows and why it matters
**Section:** Which file handles this
**Settings:** The exact settings to configure (name: value)
**Content:** Headlines, copy, CTAs — exact text or "[Client to provide]"
**Assets:** Which images/SVGs are needed and whether they're available
**Gaps:** Anything the brief or design leaves ambiguous
**Custom code needed:** Yes/No — if yes, describe what
```

### Step 4 — Save and summarize

Save the full spec to `design/page-specs/{page}.md` (e.g. `design/page-specs/homepage.md`).

Then give a 3-line summary:
1. How many modules, how many are native vs. custom
2. What assets or copy are still missing before build can start
3. Suggested build order (usually: hero → nav → above-fold sections → below-fold → footer)

Next step: run `/implement-mockup-module [module-name]` to build the first module, or `/homepage-from-brief` if you want a layout proposal instead.
