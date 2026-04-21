# shopify-claude-quickstart — Project Context

> This file is loaded automatically by Claude Code at the start of every session.
> It tells you what this project is, what tools to use, and the rules for working here.

---

## TOOLKIT ORIENTATION (Read This Every Session)

You are working with the **Shopify Dev plugin** (often called the "Shopify AI Toolkit") —
skills and CLI capabilities that connect you directly to the Shopify platform.

### Core rules

- This is a **store operations** project — operating an existing Shopify store.
- **Validate every GraphQL operation** with `shopify-plugin:shopify-admin` *before* executing it with `shopify-plugin:shopify-admin-execution`.
- **Mutations require `--allow-mutations`** on `shopify store execute`. Without that flag, only queries run. This is the primary safety guardrail — respect it.
- **Prefer built-in theme sections** (Dawn, Horizon, OS 2.0) over custom Liquid whenever a native section can do the job.
- **Use the toolkit, don't reinvent it.** The skills are already installed.

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

### Building & auditing

| Command | What it does |
|---|---|
| `/audit-store` | Refresh `store-data/store-profile.md` |
| `/section-inventory` | Catalog all theme sections, ranked for the brand |
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
├── store-data/
│   ├── theme/                  ← Pulled via shopify theme pull (gitignored)
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

1. **Native theme sections** — always check if a built-in section can do the job
2. **Existing custom sections already in the theme** — check pulled theme first
3. **Modified native sections** — extend via `settings_schema` before writing new code
4. **New custom sections** — only when native sections genuinely cannot achieve the goal

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

## STORE DETAILS

```
Store handle:     _____________________.myshopify.com
Store name:       _____________________
Active theme:     _____________________
Active theme ID:  gid://shopify/OnlineStoreTheme/_____________
Theme base:       _____________________ (Dawn / Horizon / Refresh / Sense / Craft / custom)
Primary market:   United States
Currency:         USD
Languages:        English
Plan:             Basic
Key apps:         _____________________
```

> The defaults above (US / USD / English / Basic) are common for new stores — overwrite if different. The `/init-store` command will fill the rest in automatically.
