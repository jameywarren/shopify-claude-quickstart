---
description: Map a single design mockup module to a concrete Shopify theme implementation
argument-hint: "<module-name>"
---

You are implementing one module from a finalized design. Design decisions are already made — your job is translation, not proposal.

**Module:** $ARGUMENTS

If no module name was provided, list the files in `design/` and ask which one to implement.

### Step 1 — Read the design artifact

Look in `design/` for files matching the module name (e.g., `design/hero.*`, `design/hero/`). This may be:
- An image (`.png`, `.jpg`, `.webp`) — read it visually
- A spec file (`.md`, `.txt`, `.json`) — read the contents
- A folder — read everything inside

Also read:
- `client-brief/design-brief.md` (or `client-brief-QUICK.md`) for colors, fonts, spacing intent
- `client-brief/voice-style-guide.md` for any copy in the module

### Step 2 — Identify the matching theme section

Scan `store-data/theme/sections/` and `store-data/theme/blocks/` for the section(s) that best implement this module. State:
- Which section file you're using and why
- Whether it's a native fit, a close fit, or a stretch — be honest
- If it's a stretch: what gap exists and whether a schema addition can close it vs. requiring custom code

Do **not** propose a new custom section unless no native section can do the job. If you must, say so explicitly.

### Step 3 — Output the implementation

Produce three things:

**1. Settings mapping** — a table or annotated list: design element → section setting → value. Every visible design decision should map to a named setting.

**2. JSON settings block** — the exact JSON for this section in `templates/index.json`, ready to paste or upsert. Use real values from the design, not placeholders.

**3. Upsert mutation** — validated by `shopify-plugin:shopify-admin`, ready to run:

```bash
shopify store execute --store {STORE}.myshopify.com --allow-mutations \
  --query 'mutation themeFilesUpsert(...) { ... }'
```

Show the mutation but **do not execute** until confirmed.

### Step 4 — Flag gaps

List anything that blocks clean execution:
- Images referenced in the design that aren't yet uploaded to Shopify Files
- Copy the client still needs to provide
- Settings the section schema doesn't support (and whether a schema addition is needed)
- Any ordering dependency (e.g., this section must come after another)

End with one sentence: what needs to happen before this module can be pushed live.
