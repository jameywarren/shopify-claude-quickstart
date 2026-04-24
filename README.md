# shopify-claude-quickstart

A Claude Code project template for building and customizing Shopify stores using the
**Shopify Dev plugin** (the "Shopify AI Toolkit"). One folder per client. From clone
to first useful work in under 30 minutes.

---

## Why this exists

Using Claude Code with the Shopify plugin is powerful, but every new session means
re-explaining the toolkit, the store, and the client. That kills momentum.

This template gives Claude Code:

- A persistent **CLAUDE.md** loaded automatically every session
- **Slash commands** in `.claude/commands/` — type `/audit-store` instead of pasting a prompt
- A **`/brief-interview`** command that captures the client brief conversationally
- A **`/init-store`** command that handles auth, theme pull, audit, and fills in CLAUDE.md
- A **`setup.sh`** scaffold that creates a clean per-client folder in seconds

End result: from `git clone` to "Claude Code knows your client and your store" in three commands.

---

## Getting started — two paths

### Path A: Agency / multiple clients (recommended)

Use `setup.sh` to scaffold an isolated folder per client. Each client gets its own git
repo with no connection to the template — clean, private, and independent.

```bash
# Clone the template (once)
git clone https://github.com/jameywarren/shopify-claude-quickstart.git
cd shopify-claude-quickstart

# Create a new client folder at clients/acme-coffee/
./setup.sh acme-coffee
# (prompts for store handle, runs git init, prints next steps)

cd clients/acme-coffee
claude
```

To keep the template current, open a session in `shopify-claude-quickstart/` and run
`/toolkit-update`. Client folders are independent snapshots — they don't auto-update,
but they also never get surprise merge conflicts.

### Path B: Single project / want automatic updates

Clone the template directly as your project folder, then remap the remotes so client
work goes to a private repo and template updates come from `upstream`:

```bash
git clone https://github.com/jameywarren/shopify-claude-quickstart sonic-temple
cd sonic-temple
git remote rename origin upstream            # template updates come from here
gh repo create --private sonic-temple --push # client work goes to private repo
claude
```

To pull template improvements later:

```bash
git fetch upstream
git merge upstream/main
```

`/toolkit-update` in this setup runs `git fetch upstream && git merge upstream/main`.
Merge conflicts can happen if you've customized `CLAUDE.md` — resolve them manually.

---

## In Claude Code (both paths)

```
/init-store acme-coffee.myshopify.com    Authenticates, pulls theme, audits store
/brief-interview                          Fills in client-brief/ from a conversation
/homepage-from-brief                      Proposes a homepage grounded in brief + theme
/safe-push                                Pre-flight before pushing changes live
/log-session                              Captures today's work
```

That's the whole loop.

---

## What's included

```
shopify-claude-quickstart/
├── CLAUDE.md                   ← Loaded by Claude Code every session
├── VERSION                     ← Template version (copied to .toolkit-version in each client scaffold)
├── setup.sh                    ← Per-client scaffold script
├── .claude/
│   ├── settings.json           ← SessionStart hook + update check
│   └── commands/               ← 35+ slash commands
│       ├── init-store.md           First-session setup
│       ├── brief-interview.md      Conversational brief capture (full)
│       ├── brief-quick.md          8-question lightweight brief
│       ├── brand-system.md         Visual identity capture
│       ├── design-intake.md        Mockup → implementation spec
│       ├── implement-mockup-module.md  Build one module at a time
│       ├── audit-store.md          Full store audit
│       ├── homepage-from-brief.md  Layout proposal from brief + theme
│       ├── pdp-audit.md            Product page audit
│       ├── metafield-schema.md     Design + generate metafield mutations
│       ├── nav-build.md            Build navigation menus
│       ├── seo-audit.md            Meta titles + descriptions
│       ├── launch-checklist.md     Pre-launch verification (payments, domain, analytics...)
│       ├── redirect-build.md       Build URL redirects from the brief
│       ├── discount-setup.md       Set up discount codes or automatic discounts
│       ├── image-upload.md         Upload images to Shopify Files
│       ├── create-pages.md         Generate pre-launch stub pages (FAQ, Privacy, etc.)
│       ├── safe-push.md            Pre-flight before going live
│       ├── log-session.md          Append session log entry
│       ├── recover-context.md      Re-anchor after context confusion
│       ├── toolkit-update.md       Pull latest template changes
│       └── ...
├── client-brief/               ← Empty templates (fill via /brief-interview)
├── client-brief-EXAMPLE/       ← Completed example brief (Lupine Field Coffee) — removed by default,
│                                  keep with ./setup.sh <name> --include-example
├── client-brief-QUICK.md       ← Single-file lightweight brief (alt path)
├── design/
│   ├── README.md
│   ├── brand-system.md         ← Palette, fonts, voice (generated by /brand-system)
│   ├── mockups/                ← PNGs, screenshots, design artifacts
│   ├── assets/                 ← SVG wordmarks, logos, icons
│   └── page-specs/             ← Module specs (generated by /design-intake)
├── store-data/
│   ├── theme/                  ← Pulled theme files (gitignored)
│   ├── theme-sections.md       ← Section inventory (generated by /section-inventory)
│   ├── store-profile.md        ← Auto-populated by /init-store
│   └── scopes-granted.md       ← Auth scope tracker
├── docs/
│   ├── session-log.md          ← Running log across sessions
│   └── improvements.md         ← Friction log → template backlog
├── LICENSE
└── .gitignore
```

---

## Prerequisites

- [Claude Code](https://claude.ai/code) installed
- [Shopify CLI 3.93+](https://shopify.dev/docs/api/shopify-cli) (`npm install -g @shopify/cli`)
- Node.js 18+
- A Shopify store you have admin access to
- The **Shopify Dev plugin** installed in Claude Code

### Installing the Shopify plugin in Claude Code

In Claude Code, run `/plugin` and install the Shopify plugin from the marketplace.
After install you should see these skills available:

- `shopify-plugin:shopify-admin` — Admin GraphQL search + validation
- `shopify-plugin:shopify-admin-execution` — `shopify store auth` + `shopify store execute` workflow
- `shopify-plugin:shopify-liquid` — Liquid template authoring + validation
- `shopify-plugin:shopify-dev` — general Shopify developer docs

> If the marketplace ID for the plugin changes, check Shopify's official docs for the
> current install command. The CLAUDE.md in this template still works as long as the
> skills are available under the `shopify-plugin:` namespace.

---

## `setup.sh` options

```bash
# Default: full 5-file client brief, creates clients/<name>/
./setup.sh acme-coffee

# Lightweight: single-file quick brief (for small jobs)
./setup.sh acme-tweak --quick

# Keep client-brief-EXAMPLE/ as a reference (removed by default)
./setup.sh acme-coffee --include-example

# Seed brief from an existing client (overlap is common)
./setup.sh new-coffee-co --from ../clients/acme-coffee
```

The script:
1. Creates `clients/<name>/` from the template
2. Records the template version in `.toolkit-version`
3. Removes `setup.sh`, unused brief variants, and (by default) `client-brief-EXAMPLE/`
4. Prompts for the store handle and prefills CLAUDE.md
5. Runs `git init` and creates an initial commit
6. Prints the git remote setup command for a private repo

---

## How a typical first session looks

After running `setup.sh acme-coffee` and opening Claude Code in `clients/acme-coffee/`:

```
(SessionStart hook prints the orientation)

You: /init-store acme-coffee.myshopify.com

Claude: [authenticates, pulls theme, audits store, writes store-profile.md,
         fills in CLAUDE.md STORE DETAILS, reports a 5-bullet summary]

You: /brief-interview

Claude: First, what does this business sell, and to whom?
You: ...
Claude: Where are sales coming from today?
You: ...
[20 minutes of conversation, all 5 brief files written]

You: /homepage-from-brief

Claude: [proposes layout using only sections from the pulled theme,
         flags content gaps]

You: /safe-push

Claude: [runs the pre-flight checklist, gives the exact push command]

You: /log-session

Claude: [appends today's entry to session-log.md]
```

For a small one-off job, swap `/brief-interview` for `/brief-quick` and run with
`./setup.sh acme-tweak --quick`.

---

## What this toolkit does and doesn't do

After `/init-store` + `/homepage-from-brief`, it's easy to look at the dev theme and think the work is done. It isn't. Without visual design input, the output is a correctly-structured Shopify theme populated with client copy — not a store that looks like the brand.

**This toolkit handles:** strategy → structure → implementation mechanics. Theme sections, metafields, navigation, catalog, GraphQL mutations — all the Shopify-specific work.

**Visual design is a separate input.** It lives in `design/` and has to come from somewhere — a designer, a Figma file, a mockup, or a `/brand-system` interview. Until `design/brand-system.md` and `design/page-specs/` are filled in, the output will look like a generic Shopify store with your client's words on it.

The pipeline is: brief → brand system → design spec → implementation. The toolkit covers all four steps, but steps 2 and 3 require design input that only you or the client can provide.

---

## Design philosophy

**Native sections first.** Every theme ships with powerful configurable sections.
The template instructs Claude to use them before writing custom Liquid.

**Design-grounded, not brief-guessing.** Layout proposals check `design/` before
falling back to the brief. If a spec exists, it's followed. If it doesn't, that gap
is flagged explicitly.

**Brief-grounded.** Every suggestion traces back to the client brief. No generic
recommendations.

**Validate, then execute.** GraphQL is validated with `shopify-admin` before being
run by `shopify-admin-execution`. Mutations require explicit `--allow-mutations`.
No "oops" mutations in production.

**Slash commands over prompt-pasting.** Every common task is a `/command`. The
prompt library lives in `.claude/commands/` — improving it is a single file edit.

---

## Workflow tips

- **Use a development theme** for all changes: `shopify theme push --theme DEV_THEME_ID --store CLIENT.myshopify.com`. Never push directly to live until ready.
- **Run `/log-session`** at the end of every working session. Two minutes saves you twenty next time.
- **Shell quoting:** `shopify store execute --query '...'` breaks on apostrophes in copy values. Use `--variables "$(cat /tmp/vars.json)"` with a Python-generated JSON file for any mutation that writes product descriptions, metafields, or other text content.
- **Validate before executing.** Mutation names change between API versions without warning. Always run `shopify-plugin:shopify-admin` validation before building a mutation — never write mutation names from memory.
- **Capture friction in `docs/improvements.md`** when something doesn't work the way you expected. That file is the backlog for improving this template.
- **Commit your brief, not your theme.** `store-data/theme/` is gitignored; it's regenerated via `shopify theme pull`.

---

## Contributing

Slash commands are the easiest contribution — each is a single Markdown file in
`.claude/commands/`. Add a new command, open a PR. Same for improvements to
CLAUDE.md or the brief templates.

---

## License

MIT — see [LICENSE](./LICENSE). Use it, fork it, build your business on it.

---

## Who made this

Built by [Jamey Warren](https://kahak.ai) of [kahakai](https://kahak.ai) — a managed
Shopify service based in Livingston, Montana. kahakai takes over store operations for
merchants who'd rather run their business than run their backend. This template is
the infrastructure we use to do it.

If this saves you time, consider starring the repo. If you need someone to just
handle your store, [book a call](https://cal.com/kahakai/30min).
