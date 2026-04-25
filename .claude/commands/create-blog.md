---
description: Create a new blog on the store
argument-hint: "<handle> <title>"
---

Create a blog with the handle and title from `$ARGUMENTS` (first token = handle, rest = title).

## Step 1 — Check for existing blog

Query first to avoid duplicates:

```graphql
{
  blogs(first: 20) {
    nodes { id handle title }
  }
}
```

If a blog with the same handle already exists, report it and stop. Do not create a duplicate.

## Step 2 — Create

```graphql
mutation blogCreate($blog: BlogCreateInput!) {
  blogCreate(blog: $blog) {
    blog { id handle title }
    userErrors { field message }
  }
}
```

Variables:
```json
{
  "blog": {
    "handle": "<handle>",
    "title": "<title>"
  }
}
```

Run with `--allow-mutations`.

## Step 3 — Confirm

Report the created blog's `id`, `handle`, and `title`.
Remind me to update `store-data/blogs.json` by re-running `/pull-store-data`.
