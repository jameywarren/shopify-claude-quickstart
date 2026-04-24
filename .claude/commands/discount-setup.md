---
description: Set up a discount code or automatic discount
---

Ask the following questions one at a time. Wait for each answer before moving on.

1. **What type of discount?**
   - Percentage off (e.g. 10% off)
   - Fixed amount off (e.g. $15 off)
   - Free shipping
   - Buy X get Y

2. **Code or automatic?**
   - A code customers enter at checkout (e.g. `WELCOME10`)
   - Automatic — applies without a code

3. **What does it apply to?**
   - Entire order
   - Specific collections or product types (ask which)
   - Minimum order value required? (ask the threshold)

4. **Usage limits?**
   - One use per customer?
   - Total redemption cap (e.g. first 100 uses only)?
   - Active date range — start date, end date (or ongoing)?

---

Once all answers are in, build the appropriate mutation validated by `shopify-plugin:shopify-admin`:

- Code + percentage/fixed → `discountCodeBasicCreate`
- Code + free shipping → `discountCodeFreeShippingCreate`
- Code + BXGY → `discountCodeBxgyCreate`
- Automatic + percentage/fixed → `discountAutomaticBasicCreate`
- Automatic + free shipping → `discountAutomaticFreeShippingCreate`

Show the full mutation before executing. **Do not run `--allow-mutations` until confirmed.**

After executing, verify by querying the discount to confirm it was created with the correct parameters.
