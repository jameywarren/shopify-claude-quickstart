---
description: Build the main navigation menu from the brief
---

Build the main navigation menu based on `client-brief/navigation.md`.

Output the `menuUpdate` GraphQL mutation for `shopify store execute --allow-mutations`. Important conventions:

- Use `type: "HTTP"` for items unless the resource is verified to exist (typed lookups like `PAGE`, `COLLECTION`, `BLOG` fail without a matching `resourceId`)
- Pass items without `id` to replace the full list
- Look up the main menu ID from `store-data/store-profile.md`

Validate the mutation with `shopify-plugin:shopify-admin` first. Flag any link destinations that don't exist yet in the store. **Do not execute** until I confirm.
