---
description: Snapshot a section's current settings before making changes
argument-hint: "<section-filename>"
---

For `store-data/theme/sections/$ARGUMENTS`, output the complete current settings as JSON:

- Schema defaults (from the `{% schema %}` block)
- Live configured values from the theme editor (find every template that uses this section in `templates/*.json` and report the actual settings in use)

This is your "before" snapshot. Save it as `docs/snapshots/{section}-{YYYY-MM-DD}.json` so we have a rollback reference.
