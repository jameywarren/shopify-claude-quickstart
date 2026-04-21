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

## 30-second tour

```bash
# Clone the template (once)
git clone https://github.com/jameywarren/shopify-claude-quickstart.git
cd shopify-claude-quickstart

# Create a new client folder (sibling to the template)
./setup.sh acme-coffee
# (prompts for store handle, runs git init, drops you ready)

cd ../acme-coffee
claude
```

In Claude Code:

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
├── setup.sh                    ← Per-client scaffold script
├── .claude/
│   ├── settings.json           ← SessionStart hook prints the orientation
│   └── commands/               ← 24 slash commands (the prompt library)
│       ├── init-store.md
│       ├── brief-interview.md
│       ├── brief-quick.md
│       ├── audit-store.md
│       ├── homepage-from-brief.md
│       ├── pdp-audit.md
│       ├── metafield-schema.md
│       ├── nav-build.md
│       ├── seo-audit.md
│       ├── safe-push.md
│       ├── log-session.md
│       └── ...
├── client-brief/               ← Empty templates (full brief)
├── client-brief-EXAMPLE/       ← Completed example brief (Lupine Field Coffee)
├── client-brief-QUICK.md       ← Single-file lightweight brief (alt path)
├── store-data/
│   ├── theme/                  ← Pulled theme files (gitignored)
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
- (Optional) `shopify-plugin:shopify-functions`, `shopify-plugin:shopify-hydrogen`, `shopify-plugin:shopify-polaris-*`

> If the marketplace ID for the plugin changes, check Shopify's official docs for the
> current install command. The CLAUDE.md in this template still works as long as the
> skills are available under the `shopify-plugin:` namespace.

---

## Per-client setup with `setup.sh`

```bash
# Default: full 5-file client brief
./setup.sh acme-coffee

# Lightweight: single-file quick brief (for small jobs)
./setup.sh acme-tweak --quick

# Seed brief from an existing client (overlap is common)
./setup.sh new-coffee-co --from ../acme-coffee
```

The script:
1. Copies the template to a sibling folder named for the client
2. Removes `setup.sh` and the unused brief variant
3. Prompts for the store handle and prefills CLAUDE.md
4. Runs `git init` and creates an initial commit
5. Tells you exactly what to type in Claude Code

---

## How a typical first session looks

After running `setup.sh acme-coffee` and opening Claude Code in that folder:

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

## Design philosophy

**Native sections first.** Dawn, Horizon, and other Shopify themes have powerful
configurable sections. The template instructs Claude to use them before writing
custom Liquid.

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
Shopify service based in Bozeman, Montana. kahakai takes over store operations for
merchants who'd rather run their business than run their backend. This template is
the infrastructure we use to do it.

If this saves you time, consider starring the repo. If you need someone to just
handle your store, [book a call](https://cal.com/kahakai/30min).
