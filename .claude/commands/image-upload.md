---
description: Upload an image or file to Shopify Files for use in theme sections or metafields
argument-hint: "<public-URL or local-file-path>"
---

Upload an image to Shopify Files so it can be referenced in theme settings, metafields, or page content.

**Source:** $ARGUMENTS

---

### If a public URL was provided

Use `fileCreate` directly. Validate with `shopify-plugin:shopify-admin`, then execute:

```graphql
mutation {
  fileCreate(files: [{
    originalSource: "https://...",
    contentType: IMAGE
  }]) {
    files {
      ... on MediaImage {
        id
        image { url }
      }
    }
    userErrors { field message }
  }
}
```

### If a local file path was provided

Shopify requires a staged upload for local files. Use this three-step sequence:

**Step 1 — Get a pre-signed upload URL:**
```graphql
mutation {
  stagedUploadsCreate(input: [{
    resource: FILE,
    filename: "filename.jpg",
    mimeType: "image/jpeg",
    httpMethod: PUT
  }]) {
    stagedTargets {
      url
      resourceUrl
      parameters { name value }
    }
    userErrors { field message }
  }
}
```

**Step 2 — Upload to the staged URL:**
```bash
curl -X PUT "STAGED_URL" \
  -H "Content-Type: image/jpeg" \
  --data-binary @/path/to/file.jpg
```

**Step 3 — Create the file record:**
```graphql
mutation {
  fileCreate(files: [{
    originalSource: "RESOURCE_URL_FROM_STEP_1",
    contentType: IMAGE
  }]) {
    files {
      ... on MediaImage { id image { url } }
    }
    userErrors { field message }
  }
}
```

---

After a successful upload, report:
- The file `id` — needed for metafield values (`{ type: "file_reference", value: "gid://..." }`)
- The CDN URL — for use in theme settings or content blocks

If this is a key brand asset (logo, hero image, wordmark), add it to `store-data/store-profile.md` under a new **Uploaded Files** section.
