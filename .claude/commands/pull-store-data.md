---
description: Snapshot store content to local files for fast session recovery
---

Download current store content to `store-data/` so future sessions can read local files instead of re-querying the API. Run this after major content changes or when starting a new build phase.

Validate every query with `shopify-plugin:shopify-admin` before executing with `shopify-plugin:shopify-admin-execution` (read-only throughout — no `--allow-mutations`).

Add a `_pulled` timestamp field to each file so staleness is visible.

---

### 1. Pages → `store-data/pages.json`

```graphql
{
  pages(first: 250) {
    nodes {
      id handle title bodySummary
      createdAt updatedAt publishedAt
    }
  }
}
```

If `pageInfo.hasNextPage` is true, paginate until all pages are fetched.

---

### 2. Navigation → `store-data/navigation.json`

```graphql
{
  menus(first: 20) {
    nodes {
      id handle title
      items {
        id title url type
        items { id title url type }
      }
    }
  }
}
```

---

### 3. Blogs & posts → `store-data/blogs.json`

```graphql
{
  blogs(first: 20) {
    nodes {
      id handle title
      articles(first: 50, sortKey: PUBLISHED_AT, reverse: true) {
        nodes { id handle title publishedAt tags }
      }
    }
  }
}
```

---

### 4. Collections → `store-data/collections.json`

```graphql
{
  collections(first: 250) {
    nodes {
      id handle title productsCount { count }
      ruleSet { appliedDisjunctively rules { column relation condition } }
    }
  }
}
```

Paginate if needed.

---

### 5. Products index → `store-data/products-index.csv`

Fetch up to 500 products. If the catalog is larger (check `store-data/store-profile.md`), note the total count and fetch the first 500 sorted by `UPDATED_AT` descending so the most-recently-touched products are captured.

```graphql
{
  products(first: 250, sortKey: UPDATED_AT, reverse: true) {
    nodes {
      id handle title vendor productType tags status
      variantsCount { count }
      metafields(first: 5) { nodes { namespace key } }
    }
    pageInfo { hasNextPage endCursor }
  }
}
```

Fetch a second page if needed (up to 500 total). Write as CSV:
`id,handle,title,vendor,product_type,tags,status,variant_count,metafield_keys`

For catalogs over 500 products: note the total count and recommend running `/catalog-triage` for bulk operations that need full coverage.

---

### 6. Metafield definitions → `store-data/metafield-definitions.json`

Query metafield definitions for the resource types relevant to this store:

```graphql
{
  productMetafieldDefinitions: metafieldDefinitions(first: 50, ownerType: PRODUCT) {
    nodes { id namespace key name type { name } visibleToStorefrontApi }
  }
  variantMetafieldDefinitions: metafieldDefinitions(first: 50, ownerType: PRODUCTVARIANT) {
    nodes { id namespace key name type { name } visibleToStorefrontApi }
  }
  collectionMetafieldDefinitions: metafieldDefinitions(first: 50, ownerType: COLLECTION) {
    nodes { id namespace key name type { name } visibleToStorefrontApi }
  }
  pageMetafieldDefinitions: metafieldDefinitions(first: 50, ownerType: PAGE) {
    nodes { id namespace key name type { name } visibleToStorefrontApi }
  }
}
```

---

### After all files are written

Report:
- Files written and record counts for each
- Any queries that failed or returned partial results
- Timestamp of this pull

These files are gitignored — they're snapshots, not source of truth. Re-run `/pull-store-data` after significant content changes or if session-log.md notes the data is stale.
