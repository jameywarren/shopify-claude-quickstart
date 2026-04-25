---
description: Check template JSON block settings keys against their section schema — catches drift before it reaches the store
argument-hint: "[template-glob]"
---

Validate that every block referenced in the theme's template JSON files has settings keys that match what the section schema actually defines. This catches the case where a section's Liquid was updated (settings renamed or removed) but the template JSON still references old key names.

Work entirely from local files in `store-data/theme/`. No API calls needed.

---

## Step 1 — Find templates to check

If `$ARGUMENTS` is provided, use it as a glob (e.g. `templates/page.*.json`).
Otherwise check all templates: `templates/*.json` and `templates/customers/*.json`.

---

## Step 2 — For each template

Parse the JSON. For every section entry and every block entry within it:

1. Identify the block `type` (this maps to a section or block file in the theme)
2. Collect every `settings` key present in the template JSON for that block
3. Find the corresponding section file: check `sections/{type}.liquid`, then `blocks/{type}.liquid`
4. Parse the `{% schema %}` tag from that Liquid file and extract all defined setting `id` values
5. Compare: flag any settings key in the JSON that does **not** appear in the schema's setting ids

---

## Step 3 — Report

For each mismatch found:

```
DRIFT: templates/page.wall-of-sound.json
  Section: sections/featured-collection.liquid
  Block type: standard_pick (line 47)
  Stale keys in JSON:  standard_pick
  Current keys in schema: standard_name, standard_url
```

If no mismatches: "All templates valid — no schema drift detected."

**Do not modify any files.** Output only. Run `/safe-push` or fix the JSON manually after reviewing the report.
