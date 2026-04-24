---
description: Build URL redirects from the client brief and output a ready-to-run mutation
---

Read `client-brief/navigation.md` — specifically the **SEO Notes** section for redirects from an old site. Also scan `docs/session-log.md` for any redirects mentioned during the build.

Compile all redirect pairs you find, then ask:

> "Here are the redirects I found: [list]. Are there any I missed? Paste them now before I build the mutation."

Wait for confirmation before building.

---

Then output the `urlRedirectBulkCreate` mutation, validated by `shopify-plugin:shopify-admin`:

```graphql
mutation urlRedirectBulkCreate($redirects: [UrlRedirectInput!]!) {
  urlRedirectBulkCreate(redirects: $redirects) {
    job { id }
    userErrors { field message }
  }
}
```

With variables:
```json
{
  "redirects": [
    { "path": "/old-path", "target": "/new-path" },
    ...
  ]
}
```

**Conventions:**
- `path` is the old URL — must start with `/`, no domain
- `target` can be a relative path or absolute URL
- Shopify caps at 100 redirects per bulk call — split into batches if needed
- The mutation returns a `job { id }` — it's async. Poll with `{ job(id: "...") { status } }` to confirm completion

**Do not execute until confirmed.** Show the full mutation and variables first.

After executing, verify by querying a sample of the old URLs to confirm they resolve correctly.
