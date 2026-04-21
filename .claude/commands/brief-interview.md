---
description: Conversational interview that fills in all 5 client brief files
---

You are running the **client brief interview**. Your job is to fill in every file in `client-brief/` (`business-goals.md`, `design-brief.md`, `voice-style-guide.md`, `navigation.md`, `page-content.md`) by having a real conversation with the user — not by handing them a form.

### Rules of engagement

- **Read `client-brief-EXAMPLE/`** first to understand the level of specificity that makes briefs useful.
- **Check existing brief files.** If a section already has substantive content, skip the question and confirm with the user instead of overwriting.
- **One question at a time.** Wait for the answer before moving on. Do not paste a wall of questions.
- **Probe vague answers.** If they say "modern and clean," ask "what reference stores feel right?" or "name something you'd hate to look like."
- **Use the user's actual words** when filling files. Don't paraphrase into marketing copy.
- **Group questions by file** — finish business-goals.md before moving to design-brief.md, etc.
- **Skip what doesn't apply.** Single-product brand? Don't grind through nav structure.
- **Stop and write** every 5–8 questions so progress is committed and the user can see what you've captured.

### Question flow (adapt as needed)

**Block 1 — business-goals.md (start here, it shapes everything else)**
1. What does this business sell, and to whom?
2. Where are sales coming from today? (revenue stage, primary channel)
3. What does success look like 12 months from now? Be specific — a number, a milestone.
4. Who is the ideal buyer? (one paragraph, not a persona)
5. What's the #1 conversion action that matters? Subscription, purchase, email signup?
6. Who are 2–3 competitors, and what makes you different?
7. Any constraints I should know? Budget, timeline, must-have apps, things you refuse to do?

**Block 2 — voice-style-guide.md (do this before design — voice constrains design)**
8. Describe your brand's voice in 3–5 adjectives.
9. If your brand were a person, who would they be? (specific — a job, a personality)
10. List 3 words or phrases competitors use that you'd never use.
11. Paste 2–3 sentences of writing that nails your voice (from anywhere — your About page, an email, a tweet).

**Block 3 — design-brief.md**
12. Three reference stores you admire (URLs).
13. Three things you want to *avoid* visually.
14. Primary brand colors? Typography preferences?
15. What's the homepage hero supposed to *do* — what's the one message?
16. Any photography or media you already have? Or do we need to plan for that?

**Block 4 — navigation.md**
17. What are the 4–6 items in your main nav?
18. Any custom pages that aren't in a typical Shopify store? (e.g. a methodology page, a price-transparency page)
19. Are there old URLs we need to redirect from?

**Block 5 — page-content.md**
20. Do you have hero copy written? If yes, paste it. If no, draft based on what we've captured.
21. About page story — paste it or give me a 2-minute version I can shape.
22. What's a typical product description supposed to include? Length, must-haves, closing line?

### Output

After each block, write the affected file(s) and confirm with the user before moving to the next block. At the end, give a 3-bullet summary:
- What's locked in
- What's still TBD (and which file(s) need follow-up)
- Recommended next command (usually `/audit-store` if they haven't run `/init-store`, otherwise `/homepage-from-brief`)
