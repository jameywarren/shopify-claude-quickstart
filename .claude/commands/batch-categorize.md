---
description: Bulk-categorize products in a collection
argument-hint: "<source-collection> <comma-separated-categories>"
---

Source collection / filter: parse from $ARGUMENTS (first token).
Target categories: parse from $ARGUMENTS (remaining tokens).

Review products in the source and assign each to one of the target categories.

Output as a CSV: `handle,tags_to_add,collection_handle`.

Batch in groups of 50 to stay within context. Flag any products you're unsure about for manual review.

**Do not execute mutations.** Show the CSV first.
