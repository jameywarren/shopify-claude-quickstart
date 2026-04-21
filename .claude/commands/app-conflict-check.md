---
description: Flag installed apps that may conflict with theme/build changes
---

Review the installed apps in `store-data/store-profile.md` and flag any that:

- Inject scripts that might conflict with theme changes
- Own sections of the theme we shouldn't touch (e.g., review widgets, subscription apps)
- Have their own metafield namespaces we should know about (so we don't collide)
- Require specific Liquid variables, blocks, or app blocks to function
- Have known compatibility issues with the active theme base

Output a table: App | Risk | What to avoid | Safe to proceed?
