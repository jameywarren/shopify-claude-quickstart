# shopify-claude-quickstart — Project Context

> This file is loaded automatically by Claude Code at the start of every session.
> It tells you what this project is, what tools to use, and the rules for working here.

---

## TOOLKIT ORIENTATION (Read This Every Session)

You are working with the **Shopify Dev plugin** (often called the "Shopify AI Toolkit") —
skills and CLI capabilities that connect you directly to the Shopify platform.

> **Prerequisite:** The `shopify-plugin:shopify-*` skills must be installed and enabled. Nearly every command in this toolkit depends on them. If they aren't available, install the Shopify Dev plugin from the Claude Code plugin marketplace before proceeding.

### Core rules

- This is a **store operations** project — operating an existing Shopify store.
- **Validate every GraphQL operation** with `shopify-plugin:shopify-admin` *before* executing it with `shopify-plugin:shopify-admin-execution`.
- **Mutations require `--allow-mutations`** on `shopify store execute`. Without that flag, only queries run. This is the primary safety guardrail — respect it.
- **Prefer the active theme's own sections and blocks** over custom Liquid whenever an existing primitive can do the job. Check `store-data/theme/sections/` (and `store-data/theme/blocks/` for block-based themes) first — regardless of whether the theme is Dawn, Horizon, Craft, Impulse, Impact, or any other OS 2.0 theme.
- **Use the toolkit, don't reinvent it.** The skills are already installed.
- **At session start, read `docs/session-log.md`** (last entry) before proposing anything. Open questions and the "Next Session" action from the previous session take priority over fresh suggestions.
- **Before any theme edit, read the THEME NOTES section** at the bottom of this file. It records quirks discovered in previous sessions — re-discovering them wastes time.

### Out of scope — do NOT do these here

- Building Shopify apps or scaffolding a custom app
- Setting up OAuth flows or API credential management
- Creating `shopify.app.toml`, `shopify.web.toml`, or any app config files
- Any `shopify app *` CLI commands (only `shopify store *` and `shopify theme *` are used here)
- Building Hydrogen storefronts, custom checkouts, or webhooks (unless the brief explicitly requires one)

If a task requires something out of scope, **flag it** rather than starting down that path.

### Available skills (via the Shopify plugin)

- `shopify-plugin:shopify-admin` — Admin GraphQL search + validation
- `shopify-plugin:shopify-admin-execution` — `shopify store auth` + `shopify store execute` workflow
- `shopify-plugin:shopify-liquid` — Liquid template authoring + validation
- `shopify-plugin:shopify-dev` — general Shopify developer docs
- (Use only if the brief calls for them) `shopify-plugin:shopify-functions`, `shopify-plugin:shopify-hydrogen`, `shopify-plugin:shopify-polaris-*`

---

## SLASH COMMANDS — START HERE

This project ships with slash commands in `.claude/commands/`. **Use them instead of pasting prompts.** Type `/` in Claude Code to see the full list.

### First session on a new store

```
/init-store STORE.myshopify.com    Auth, theme pull, audit, fill CLAUDE.md
/brief-interview                   Fill in client-brief/ conversationally
   (or)
/brief-quick                       Single-file lightweight brief for small jobs
```

### Returning to an in-progress project

```
/recover-context                   Re-anchor on where we left off
```

### Design pipeline

```
/brand-system                      Capture brand visual system → design/brand-system.md
/design-intake [page]              Map a mockup to a buildable spec → design/page-specs/
/implement-mockup-module [module]  Implement one design module at a time
```

### Building & auditing

| Command | What it does |
|---|---|
| `/audit-store` | Refresh `store-data/store-profile.md` |
| `/section-inventory` | Catalog all theme sections → `store-data/theme-sections.md` |
| `/app-conflict-check` | Flag installed apps that may conflict |
| `/homepage-from-brief` | Propose a homepage layout from the brief + theme |
| `/hero-config <section>` | Configure the hero section with brief-driven content |
| `/conversion-audit` | Score above-the-fold against business goals |
| `/pdp-audit [type]` | Audit the product page template |
| `/product-framework` | Design a product description framework + 3 examples |
| `/bulk-descriptions <ref>` | Generate descriptions for a list of products |
| `/metafield-schema [type]` | Design metafield schema + ready-to-run mutations |
| `/collections-from-brief` | Propose a collection structure |
| `/nav-build` | Build the main navigation menu |
| `/seo-audit` | Audit and propose meta titles + descriptions |
| `/blog-plan [duration]` | Generate a content plan |
| `/catalog-triage [count]` | Triage a large catalog before cleanup |
| `/batch-categorize <src> <cats>` | Bulk-categorize products |
| `/alt-text <collection>` | Generate SEO image alt text |
| `/missing-data-audit` | Audit catalog for missing data |
| `/section-snapshot <file>` | Snapshot a section's settings before changes |
| `/add-metafield-to-pdp <ns.key>` | Add a metafield display to the PDP |
| `/theme-perf-audit` | Audit pulled theme for performance issues |

### Safety & end-of-session

```
/scope-check [task]                Verify auth scopes cover the task
/safe-push                         Pre-flight checklist before pushing live
/rollback <when>                   Plan a rollback to a previous state
/log-session                       Append today's session log entry
```

---

## PROJECT STRUCTURE

```
.
├── CLAUDE.md                   ← You are here (loaded every session)
├── .claude/
│   ├── settings.json           ← SessionStart hook
│   └── commands/               ← Slash commands (each .md = one command)
├── client-brief/               ← Fill these in for the client (full brief)
│   ├── business-goals.md
│   ├── design-brief.md
│   ├── voice-style-guide.md
│   ├── navigation.md
│   └── page-content.md
├── client-brief-EXAMPLE/       ← Completed reference brief — read once for tone
├── client-brief-QUICK.md       ← Single-file lightweight brief (or)
├── design/                     ← Visual design inputs (required reading for any UI work)
│   ├── README.md               ← What goes in this folder
│   ├── brand-system.md         ← Palette, fonts, typography, voice (generated by /brand-system)
│   ├── mockups/                ← PNGs, screenshots, design artifacts
│   ├── assets/                 ← SVG wordmarks, logos, icons
│   └── page-specs/             ← Module-by-module specs (generated by /design-intake)
├── store-data/
│   ├── theme/                  ← Pulled via shopify theme pull (gitignored)
│   ├── theme-sections.md       ← Section inventory (generated by /section-inventory)
│   ├── store-profile.md        ← Auto-populated audit
│   └── scopes-granted.md       ← Auth scope tracker
├── docs/
│   ├── session-log.md          ← Append after every session
│   └── improvements.md         ← Friction log → template backlog
├── setup.sh                    ← Per-client scaffold script (template only)
├── LICENSE
└── .gitignore
```

> Note: only one of `client-brief/` (full) or `client-brief-QUICK.md` (quick) will be present per client — the `setup.sh` script removes whichever isn't being used.

---

## EXECUTION PATTERNS

### Validate-then-execute (the only correct pattern)

```
1. Draft GraphQL operation
2. Validate with shopify-plugin:shopify-admin (catch schema errors before they cost you)
3. Execute with shopify-plugin:shopify-admin-execution
   - Reads:     shopify store execute --store X --query '...'
   - Mutations: shopify store execute --store X --query '...' --allow-mutations
```

### Theme file upsert (write a section/template/snippet to the live theme)

```bash
VARIABLES=$(jq -n \
  --arg themeId "gid://shopify/OnlineStoreTheme/THEME_ID" \
  --rawfile content "store-data/theme/templates/index.json" \
  '{ themeId: $themeId, files: [{ filename: "templates/index.json", body: { type: "TEXT", value: $content } }] }')

shopify store execute --store {STORE_HANDLE}.myshopify.com --allow-mutations \
  --query 'mutation themeFilesUpsert($files: [OnlineStoreThemeFilesUpsertFileInput!]!, $themeId: ID!) { themeFilesUpsert(files: $files, themeId: $themeId) { upsertedThemeFiles { filename } userErrors { field message } } }' \
  --variables "$VARIABLES"
```

### Theme push (alternative: bulk push from local pulled theme)

```bash
shopify theme push --store {STORE_HANDLE}.myshopify.com --theme DEV_THEME_ID
```

Always push to a **development theme first**, never directly to the live theme.

---

## DESIGN PRINCIPLES

### Theme section preference order

Always work from the **active theme's own primitives** — the sections and blocks that shipped with the theme the client is actually running, whether that's Dawn, Horizon, Craft, Impulse, Impact, Symmetry, or anything else.

1. **Existing sections in the pulled theme** — check `store-data/theme/sections/` first. Use what's there.
2. **Existing blocks in the pulled theme** — for block-based OS 2.0 themes, check `store-data/theme/blocks/` and compose sections via blocks before writing new section code.
3. **Extend existing sections** — add settings via `settings_schema` on an existing section before creating a new file.
4. **Modified copies of existing sections** — when the original must stay untouched, duplicate and modify.
5. **New custom sections** — only when nothing in the theme can achieve the goal. State this explicitly when recommending a new section.

### Skeleton theme builds — not recommended

Shopify's Skeleton theme is a blank-canvas developer framework. It has no catalog pages, no PDP layout, no cart, no search, and no commerce primitives — every feature has to be written from scratch. This makes it impractical for merchant-facing retainer work where speed and reliability matter.

**Do not use Skeleton for client stores.** If a design is too bespoke for Dawn or Horizon, evaluate premium themes (Impact, Prestige, Symmetry, Broadcast) before reaching for Skeleton. A premium theme with the right section set will get to a polished result faster than building from nothing.

If a store is already on Skeleton, flag it immediately and recommend migrating to a premade theme before the build goes further.

### Design artifacts — check before proposing anything visual

Before any UI work, check `design/` for:
- `design/brand-system.md` — palette, fonts, voice rules. If present, this overrides anything in the client brief for visual decisions.
- `design/page-specs/` — module-by-module implementation specs. If a spec exists for the page you're building, implement it; don't re-propose.
- `design/mockups/` — visual references. If a mockup is present, implementation should match it.

If `design/` is empty or missing, flag that visual design direction hasn't been captured yet. Suggest `/brand-system` before proposing layouts, so output is grounded in actual brand choices rather than generic Shopify defaults.

### When suggesting layouts

- Ground every layout suggestion in actual sections from the pulled theme
- Name the section file (e.g., `sections/hero.liquid`), not a generic description
- If recommending a section that doesn't exist, say so explicitly and explain why a native one won't work

### Content & voice

- All copy suggestions match the voice style guide in `client-brief/voice-style-guide.md` (or section 4 of `client-brief-QUICK.md`)
- Flag content gaps where the client needs to provide assets or copy

---

## SAFETY RULES

- **Always pull before push** — never overwrite the theme without a fresh pull.
- **Test on a dev theme** — push to a non-published theme first, then publish.
- **`--allow-mutations` is opt-in** — never add it as a default flag. Type it deliberately.
- **No bulk destructive operations** without explicit confirmation in the conversation.
- **Log every store-data change** in `docs/session-log.md` (or run `/log-session`).

---

## CURRENT BUILD PHASE

> Update this as the project advances. One-line each.

**Phase:** (Setup / Brief / Design / Build / Launch)
**Active work:**
**Last session:**

---

## STORE DETAILS

```
Store handle:     _____________________.myshopify.com
Store name:       _____________________
Active theme:     _____________________
Active theme ID:  gid://shopify/OnlineStoreTheme/_____________
Theme base:       _____________________ (Dawn / Horizon / Refresh / Sense / Craft / Skeleton / custom)
Primary market:   United States
Currency:         USD
Languages:        English
Plan:             Basic
Key apps:         _____________________
```

> The defaults above (US / USD / English / Basic) are common for new stores — overwrite if different. The `/init-store` command will fill the rest in automatically.

---

## THEME NOTES

> Populated by `/init-store` and updated as quirks are discovered. Theme-specific limitations, gotchas, and non-obvious behavior. Add a note here whenever a theme quirk bites you — prevents the same issue next session.

_(none yet — run `/init-store` to populate)_
