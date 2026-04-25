---
description: Normalize messy metafield values across the catalog — audit-first, never blind-mutate
argument-hint: "<namespace.key>"
---

Normalize the metafield `$ARGUMENTS` across all products. Work in four explicit phases. **Do not skip ahead.**

---

## Phase 1 — Audit (read-only)

Query all products that have this metafield set. Collect every distinct value with its count.

Output as a markdown table:

| Current value | Count |
|---|---|
| Fly Fishing | 412 |
| fly fishing | 87 |
| Fly Fish | 23 |
| fishing | 11 |
| … | … |

Save to `store-data/audits/metafield-{namespace}-{key}-values.md`.

**Stop here. Do not proceed to Phase 2 until I confirm.**

---

## Phase 2 — Canonical mapping

Propose a canonical value list. Map every current value to its canonical form. Show as a table:

| Current value | → Canonical |
|---|---|
| Fly Fishing | Fly Fishing |
| fly fishing | Fly Fishing |
| Fly Fish | Fly Fishing |
| fishing | Fly Fishing |

Flag any values you're unsure about for my review. I may override any mapping.

Save the proposed mapping to `store-data/audits/metafield-{namespace}-{key}-mapping.md`.

**Stop here. Do not proceed to Phase 3 until I confirm the mapping.**

---

## Phase 3 — Export current state

Before touching anything, export all current metafield values to a snapshot file.

Query all products with this metafield and write a CSV: `handle,product_id,current_value`.

Save to `store-data/exports/metafield-{namespace}-{key}-before-{YYYY-MM-DD}.csv`.

This is the rollback source. **Confirm the export completed before Phase 4.**

---

## Phase 4 — Apply (mutations, batches of 50)

Only after I say "apply":

- Process products in batches of 50
- For each batch: run `productUpdate` mutations with `--allow-mutations`
- Report progress after each batch: `Batch N/M complete — X products updated, Y errors`
- On any error: stop, report the error in full, wait for instruction before continuing
- After all batches: output a summary with total updated, total skipped (already canonical), total errors

**Do not start Phase 4 without explicit "apply" confirmation from me.**
