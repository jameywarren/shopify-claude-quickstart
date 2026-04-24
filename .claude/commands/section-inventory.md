---
description: Inventory of theme sections, ranked by usefulness for the brand
argument-hint: "[brand-type, e.g. 'lifestyle product brand']"
---

Pull the current theme into `store-data/theme/` if not already pulled, then list every section in `sections/` as a table:

| Filename | Section name (from schema) | What it does | Key settings | Block types | Used in any current template? |

Sort by most useful for: **$ARGUMENTS** (if no argument provided, infer from the client brief).

Highlight any sections that map directly to homepage, PDP, or collection page needs identified in `client-brief/design-brief.md` or `client-brief/page-content.md`.

Save the full table to `store-data/theme-sections.md`, overwriting if it exists. This file is the persistent section reference for all future sessions — other commands read it instead of re-scanning the theme directory.
