---
description: Pre-launch verification — payments, domain, redirects, email, analytics, apps, mobile
---

Run a systematic pre-launch check. For each area, determine pass/fail by querying the store or reading the brief. Flag anything that blocks going live.

Read first:
- `client-brief/business-goals.md` — target apps, constraints, launch date
- `store-data/store-profile.md` — installed apps, store config
- `docs/session-log.md` — what was done this build

Use `shopify-plugin:shopify-admin-execution` for queries (read-only throughout).

---

### 1. Payments

- Is a payment provider connected and not in test mode?
- Does checkout accept a test order end-to-end?
- Are payment methods correct for the target market?

### 2. Domain & SSL

- Is the custom domain connected and DNS propagated?
- Is www → apex (or apex → www) redirect configured?
- Is SSL active?
- Is the storefront password removed?

### 3. Theme

- Is the correct theme published as the live theme?
- Run `/safe-push` to confirm the live theme passed its pre-flight.
- Are dev/backup themes labeled and not cluttering the theme list?

### 4. Email Notifications

- Have transactional templates been customized? (Order confirmation, shipping notification at minimum.)
- Do they match the brand voice in `client-brief/voice-style-guide.md`?
- Is the sender email a domain-verified address (not the default Shopify relay)?

### 5. Redirects

- Are all redirects from `client-brief/navigation.md` (SEO Notes) live?
- Verify the 3 most critical old URLs return 301s, not 404s.
- If redirects haven't been built yet, run `/redirect-build` now.

### 6. Legal Pages

- Privacy Policy published and linked in the footer?
- Refund Policy published?
- Shipping Policy and Terms of Service present if required by the market?

Check that these aren't still Shopify placeholder text — query `pages` for these handles and flag if body is under 200 characters.

### 7. Shipping

- Shipping zones configured for all target markets?
- Rates match what was agreed (free over threshold, calculated, flat)?
- Test order reaches checkout with the correct shipping option displayed?

### 8. Analytics & Tracking

For each item, check whether it's in `store-data/store-profile.md` as installed and configured:

- GA4 (Google Analytics or manual pixel)?
- Meta Pixel if required by brief?
- TikTok Pixel if required?
- Klaviyo tracking script active (list created, welcome flow tested)?

### 9. Apps

For each app in `store-data/store-profile.md`:
- Configured, not just installed?
- Any app-specific requirements met? (Recharge: subscription products published, webhook verified. Klaviyo: list connected, welcome flow active. Review app: first round of reviews seeded?)

### 10. Mobile

- Homepage, PDP, and checkout render correctly at 390px viewport?
- Sticky ATC (if present) works on mobile?
- No console errors on key pages?

### 11. SEO Baseline

- `robots.txt` set to allow indexing?
- Sitemap accessible at `/sitemap.xml`?
- Meta titles and descriptions set on homepage and top 3 collections?

---

Output a checklist table:

| Area | Status | Action Required |
|---|---|---|

Mark each **PASS**, **FAIL**, or **NEEDS REVIEW**. List blockers clearly at the top.

If everything passes: output "Store is ready to launch" and the exact `shopify theme push` command to push the live theme if it hasn't already been published.
