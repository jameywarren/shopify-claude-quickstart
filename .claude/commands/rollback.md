---
description: Plan a rollback to a previous theme/state
argument-hint: "<date-or-change-description>"
---

I need to roll back to before: **$ARGUMENTS**

1. Check `docs/session-log.md` for any backup theme IDs or snapshots from around that time
2. Check `docs/snapshots/` for any saved section settings
3. Use `shopify-plugin:shopify-admin-execution` (read-only) to list all themes on the store via the `themes` query — backup themes might already exist
4. Walk me through the safest rollback path, ranked by risk

**Do not roll back automatically.** Output the plan; I'll choose.
