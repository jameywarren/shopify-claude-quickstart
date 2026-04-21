---
description: Audit pulled theme for common performance issues
---

Review `store-data/theme/` for common performance issues:

- Render-blocking scripts in `layout/theme.liquid` and section files
- Unoptimized image loading (missing `loading="lazy"`, missing `width`/`height`)
- Unused sections or snippets adding weight
- JavaScript that could be deferred
- App scripts loading synchronously
- Liquid that runs heavy operations in a loop

Output a prioritized fix list. For each: file, line, issue, recommended fix, estimated impact (S/M/L).
