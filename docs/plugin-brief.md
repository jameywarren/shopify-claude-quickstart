# Claude Code Plugin — Product Brief

## What we're building

A Claude Code plugin version of shopify-claude-quickstart that merchants can install directly inside Claude Code with no terminal, no git, no setup.sh. One install, start working on their store.

## Why

The current toolkit is for developers and agencies — it requires git clone and bash. Merchants won't do that. The Claude Code plugin marketplace is the right distribution channel for non-technical users: open Claude Code, find the plugin, click install, done.

## How it differs from the current toolkit

| Current toolkit | Plugin version |
|---|---|
| Per-client folders with isolated CLAUDE.md | Global skills available in any session |
| setup.sh scaffolds folder structure | Bootstrap skill creates files in current directory |
| Slash commands in .claude/commands/ | Skills invoked by name |
| Designed for agencies managing multiple clients | Designed for merchants on their own store |

Both can coexist — the GitHub template stays for agencies, the plugin serves merchants.

## Architecture

Follows the Shopify AI Toolkit pattern:
- GitHub repo with `plugin.json`, `skills/` directory, SKILL.md per command
- Each current slash command becomes a skill
- CLAUDE.md content is embedded across relevant skills (no per-project file needed)
- A `shopify-store-setup` bootstrap skill creates design/, store-data/, docs/ on first run
- Submitted to Claude Code plugin marketplace

## Skills to port (from current commands)

**Setup:**
- `shopify-store-setup` — bootstraps folder structure in current directory (replaces setup.sh + CLAUDE.md)
- `shopify-init-store` — auth, theme pull, audit (current /init-store)
- `shopify-brief-interview` — conversational brief capture
- `shopify-brief-quick` — single-file brief

**Design pipeline:**
- `shopify-brand-system` — capture visual identity
- `shopify-design-intake` — mockup → implementation spec
- `shopify-implement-module` — build one module at a time

**Building:**
- `shopify-homepage` — homepage from brief + design
- `shopify-section-inventory` — catalog theme sections
- `shopify-pdp-audit`, `shopify-nav-build`, `shopify-seo-audit`, etc.

**End of session:**
- `shopify-log-session` — auto-pull git context, write log

## Key decisions before building

1. **Plugin name** — "Shopify Store Builder"? Needs to be distinct from the Shopify AI Toolkit
2. **Marketplace submission** — requires Anthropic approval; timeline unknown
3. **Shopify plugin dependency** — the toolkit depends on the Shopify AI Toolkit skills (shopify-admin, shopify-admin-execution). Document this as a prerequisite or find a way to bundle it.
4. **Store context** — currently lives in CLAUDE.md STORE DETAILS block. In plugin form, needs a different persistence mechanism (a store-profile.md the bootstrap skill creates)

## What to do first when picking this up

1. Read Claude Code plugin docs to confirm skills can create files in current directory
2. Port one skill end-to-end (shopify-init-store is the right test) and install locally
3. Confirm the Shopify plugin dependency works alongside your plugin
4. Port remaining skills once the pattern is proven
5. Submit to marketplace
