# Template Improvements Log

> Capture friction points, better approaches, and ideas as you encounter them during real builds.
> These become the backlog for improving CLAUDE.md, the prompts library, and the folder structure.
> Low friction — raw notes are fine. Date and one line is enough.

---

## How to Use This File

**During a session:** When something doesn't work as expected, jot a one-liner here.
Don't overthink it. Example: "Claude tried to `shopify app dev` instead of `shopify store execute` — 2026-04-20"

**After a session:** Scan your notes and promote anything that's a real pattern into a
GitHub Issue on the template repo.

**Periodically:** Review issues and update CLAUDE.md or shopify-build-prompts.md accordingly.

---

## Active Issues / Friction Points

| Date | Build | Issue | Proposed Fix | Status |
|---|---|---|---|---|
| 2026-04-24 | Sonic Temple (toolkit test) | Theme push ordering: pushing section Liquid + dependent template JSON together fails if Shopify validates JSON before the new section schema is processed | Document "push section first, then template" in CLAUDE.md execution patterns and `/safe-push` | Fixed in CLAUDE.md + safe-push |
| 2026-04-24 | Sonic Temple (toolkit test) | Template/schema drift: `page.wall-of-sound.json` had stale block keys (`standard_pick`) not matching the Liquid (`standard_name`, `standard_url`) — nothing caught it until runtime | `/validate-templates` command to diff JSON block settings keys against section schema | Fixed — command added |
| 2026-04-24 | Sonic Temple (toolkit test) | `products-index.csv` missing collection membership — alt-text CSV was used as fallback but less reliable | Update `/pull-store-data` step 5 to join collection membership per product | Fixed in pull-store-data |
| 2026-04-24 | Sonic Temple (toolkit test) | No `/create-blog` command — had to create blogs ad-hoc despite being a common setup step | Add `/create-blog` command | Fixed — command added |
| 2026-04-24 | Sonic Temple (toolkit test) | Read-before-edit hook (`gsd-read-guard.js`) fires on every Edit even after the file was read at session start — redundant noise | Hook is in user global settings (GSD), not toolkit-owned. No fix from this side. | Out of scope |

---

## Ideas / Enhancements

| Date | Idea | Priority | Notes |
|---|---|---|---|
| | | | |

---

## Completed Improvements

| Date | What Changed | Which File | Triggered By |
|---|---|---|---|
| | | | |

---

## Patterns Across Builds

> Once you've done 3+ builds, note recurring patterns here.
> These are candidates for new prompts or CLAUDE.md rules.

-
