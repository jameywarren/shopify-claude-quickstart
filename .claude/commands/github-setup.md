---
description: Initialize a GitHub repo for this project and push the pulled theme as the first commit
---

Set up GitHub tracking for this project. Work through the steps below in order. At each step, report what happened before continuing.

---

## Step 1 — Initialize git (if not already done)

Check if this directory is already a git repo:

```bash
git rev-parse --is-inside-work-tree 2>/dev/null && echo "yes" || echo "no"
```

If not initialized:
```bash
git init && git checkout -b main
```

---

## Step 2 — Verify the .gitignore is correct

Read `.gitignore` and confirm it contains the binary asset rules (`.png`, `.jpg`, `.woff`, etc. inside `store-data/theme/assets/`). These large files should not be committed — Shopify hosts them.

If the rules are missing, add them now before committing anything.

---

## Step 3 — Initial commit

Stage and commit all project files:

```bash
git add -A
git status
```

Show me the staged file list. If it looks right (theme Liquid/JSON files, CLAUDE.md, commands, briefs — no large binaries), commit:

```bash
git commit -m "init: pulled theme + project scaffold

Theme pulled from Shopify. Project ready for build.

Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>"
```

---

## Step 4 — Create the GitHub repo

Check if the GitHub CLI (`gh`) is installed:

```bash
gh --version 2>/dev/null && echo "available" || echo "not found"
```

### If `gh` is available:

Check if already authenticated:
```bash
gh auth status 2>&1
```

If not authenticated, tell the user:
> "You'll need to log in to GitHub. Run `gh auth login` in your terminal — choose GitHub.com, then HTTPS or SSH based on your preference, and follow the prompts."

Wait for confirmation before continuing.

Once authenticated, create a private repo and push:
```bash
gh repo create {STORE-HANDLE}-shopify --private --source=. --remote=origin --push
```

Replace `{STORE-HANDLE}` with the actual store handle (e.g. `danbaileys-shopify`).

Report the repo URL when done.

---

### If `gh` is not available:

Tell the user:

> **Option A — Install the GitHub CLI (recommended):**
> 1. Go to [cli.github.com](https://cli.github.com) and install `gh` for your OS
> 2. Run `gh auth login` and follow the prompts
> 3. Come back and run `/github-setup` again
>
> **Option B — Create the repo manually on GitHub:**
> 1. Go to [github.com/new](https://github.com/new)
> 2. Name it `{STORE-HANDLE}-shopify` (e.g. `danbaileys-shopify`)
> 3. Set it to **Private**
> 4. Do **not** initialize with a README, .gitignore, or license — the project already has these
> 5. Click **Create repository**
> 6. Copy the repo URL (HTTPS or SSH)
> 7. Tell me the URL and I'll connect it

Once the user gives you the URL, run:
```bash
git remote add origin {URL}
git branch -M main
git push -u origin main
```

---

## Step 5 — Confirm and summarize

Report:
- Repo URL
- Files committed (count of .liquid, .json, and other text files)
- Any binary files that were correctly excluded
- Next step: remind the user that from now on, `/safe-push` will automatically commit changes to git after each Shopify push
