# Page Content — Lupine Field Coffee

## Homepage

### Hero Section
**Headline:** Coffee with a paper trail.
**Subheadline:** *(none — the hero is a photograph plus one line. No subheading, no two-line copy block.)*
**CTA button text:** Read the ledger
**CTA destination:** `/pages/the-ledger`
**Background:** 6-second silent video loop of beans falling from the roaster (provided in `/assets/hero-roaster-loop.mp4`). Falls back to still image `/assets/hero-roaster-still.jpg` on mobile data save mode.

### Secondary Hero / Feature Section
**Headline:** This month, from Yirgacheffe
**Body:** A washed Ethiopian from the Konga cooperative. We paid $4.85/lb green, which is $1.20 above the C-market rate at time of purchase. The full breakdown is on the product page.
**CTA:** See this coffee → `/products/yirgacheffe-konga`

### Featured Collections
**Section headline:** Browse by how you brew
**Collections to feature:**
1. Whole Bean — `/collections/whole-bean`
2. Subscriptions — `/collections/subscriptions`
3. Brew Gear — `/collections/brew-gear`

### Brand Story / About Snippet
**Headline:** Why we publish what we paid
**Body:** Most coffee brands talk about "fair sourcing" without ever showing you a number. We do it differently — every bag we sell has a price-per-pound green cost, the date we bought it, and the markup that pays our roaster, our staff, and the lights. If we're going to ask you to pay $22 for a bag of beans, you should know where the money goes.
**CTA:** More about us → `/pages/about`

### Social Proof
**Review headline:** What people are saying
**Featured testimonials (3):**
1. "The first coffee subscription I haven't cancelled after three months. Their transparency about pricing is something I wish other brands did." — *Maya S., Bozeman MT*
2. "I bought a bag because I liked their writing. I kept buying because the coffee is genuinely better than anything I can get locally." — *Daniel R., Spokane WA*
3. "Lupine's Yirgacheffe was the best cup of pour-over I made all year." — *Jordan T., Denver CO*

### Email Signup / Newsletter
**Headline:** New coffees, in your inbox first
**Body/incentive:** Subscribers see new releases 48 hours before everyone else. We email twice a month, max. No discount codes, no gimmicks.
**Placeholder text:** your@email.com
**Button text:** Subscribe

---

## About Page

**Headline:** Lupine Field Coffee — a roastery in Missoula, MT.

**Story (full):**
Lupine Field Coffee was started in 2022 by Lena Marsh, a former NPR producer who
spent ten years reporting on supply chains and decided she'd rather build one she
could stand behind than write about ones she couldn't.

Every coffee we sell is purchased directly — either from a producer or a co-op we
have an ongoing relationship with. We don't buy through brokers, and we publish the
green coffee price we paid for every bean we sell. No other roaster in our region
does this, because it makes the math harder. We think it's the only honest way.

We roast in small batches in a converted warehouse on Toole Avenue. We don't have
a café — we sell wholesale to cafés we love and direct to people who want to brew
at home. That's the whole business. No franchising, no flagship store, no "second
location." Just better beans, sold honestly.

**Founder bio:**
Lena Marsh is the founder and head roaster. Before Lupine Field, she was a producer
at NPR's *Planet Money*, where she reported on commodity markets, including coffee.
She is a Q-grader and licensed cupping judge, and she has visited every farm we
buy from at least once.

**Mission statement:**
To make excellent coffee, and to make the supply chain behind it visible.

**Values (3–5):**
- **Transparency.** Every bag has its purchase price published.
- **Direct relationships.** No brokers. We meet every producer we buy from.
- **Quality without theater.** No tasting note theatrics, no "premium" marketing.
- **Pay people what they're worth.** Producers, staff, and ourselves.
- **Build something that lasts.** No outside investors. No exit plan.

---

## Contact Page

**Headline:** Get in touch
**Intro text:** Wholesale inquiries, press, or just questions about a bag — we read everything.
**Response time promise:** We reply to most messages within two business days. If it's been longer, your message probably went to the spam folder. Try again.

---

## Custom Pages

### The Ledger
**URL handle:** `the-ledger`
**Purpose:** The brand's marquee transparency page. A list of every coffee we've sold, the green price we paid, the date of purchase, and the retail markup. Auto-rendered from a `coffee_ledger_entry` metaobject.
**Content:** Header explaining the methodology (3 paragraphs), followed by a table of all entries (newest first). Each entry links to the product page. Footer explains the C-market reference rate methodology and links to the ICO website.

### Field Notes
**URL handle:** `field-notes`
**Purpose:** Conversion-focused landing page for the quarterly subscription.
**Content:** Hero ("Four bags a year. The best of what we're roasting."), a what's-included block, a "what subscribers got last quarter" gallery, FAQ (shipping, pause, cancel), CTA to the subscription product.

---

## Product Description Framework

**Format:**
1. One-sentence "what this is" — origin, processing, varietal, roast level
2. A short paragraph (3–4 sentences) on the producer or cooperative
3. Tasting impressions, written like a thoughtful diary entry — not wine notes
4. Brewing recommendation in a single line
5. The Ledger callout: "We paid $X.XX/lb green for these beans. See the full breakdown →"

**Must include:**
- Origin (country, region, farm/co-op name)
- Process (washed, natural, honey, etc.)
- Varietal
- Roast level (light / medium-light / medium)
- Recommended brew method
- Link to The Ledger entry

**Length:** 120–180 words. Strict ceiling — long descriptions are not what this customer wants.

**CTA or closing line:** "Available while the lot lasts." (No countdown, no "limited time" theatrics.)
