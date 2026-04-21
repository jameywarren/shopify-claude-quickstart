# Navigation & Site Structure — Lupine Field Coffee

## Primary Navigation

```
Home
├── Shop
│   ├── Whole Bean
│   ├── Subscriptions
│   ├── Brew Gear
│   └── Limited Releases
├── The Ledger        (custom page — pricing transparency)
├── Field Notes       (custom page — subscription landing)
├── About
└── Contact
```

## Footer Navigation
```
Column 1: Shop
  - Whole Bean
  - Subscriptions
  - Brew Gear
  - Limited Releases

Column 2: Story
  - About
  - The Ledger (transparency)
  - Origin Trips (blog category)

Column 3: Help
  - Shipping & Returns
  - Brewing Guides
  - Wholesale Inquiries
  - Contact
```

## Utility Navigation (top bar / account)
- Account / Login
- Cart
- Search
- [ ] Wishlist (not needed)
- [ ] Currency selector (US only for now)
- [ ] Language selector (English only)

## Collections Structure

**Top-level collections:**
- `whole-bean` — all whole bean SKUs
- `subscriptions` — Field Notes quarterly + monthly subscriptions
- `brew-gear` — Hario, Chemex, scales, kettles
- `limited-releases` — seasonal / micro-lot single origins

**Nested or filtered collections:**
- `single-origin` — subset of whole-bean, smart collection on tag `single-origin`
- `blends` — subset of whole-bean, smart collection on tag `blend`
- `decaf` — subset of whole-bean, smart collection on tag `decaf`

**Smart collection rules:**
- `single-origin` — product tag equals `single-origin`
- `blends` — product tag equals `blend`
- `decaf` — product tag equals `decaf`
- `limited-releases` — product type equals `Single Origin` AND tag `limited`

## Key Landing Pages

- **`/pages/the-ledger`** — Public pricing transparency log. Auto-generated from a metaobject so the merchant can update without dev help. This is the brand's marquee differentiator — link to it from the footer, About page, and individual product pages.
- **`/pages/field-notes`** — Subscription landing page. Designed to convert non-subscribers; standalone template, not the default page template.
- **`/blogs/origin-trips`** — Blog. Long-form posts from origin visits.

## Internal Linking Strategy

- Every product page links to The Ledger entry for that bean ("See what we paid for these beans →")
- Every origin product page links to its origin trip blog post if one exists
- About page links to The Ledger and Field Notes
- Subscription products cross-sell brew gear; brew gear cross-sells the most popular blend

## SEO Notes

- URL structure: keep Shopify defaults (`/products/{handle}`, `/collections/{handle}`)
- Need 301 redirects from old site:
  - `/coffee/*` → `/products/*` (handles match)
  - `/about-us` → `/pages/about`
  - `/subscribe` → `/pages/field-notes`
- Target keywords for collections: "Montana coffee roaster," "single origin coffee subscription," "transparent coffee sourcing"
