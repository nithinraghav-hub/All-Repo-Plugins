# ToyGenie Shopify Theme Guide — "ToyGenie Storybook"

Reference guide to the **live (published) theme** on www.toygenie.com.au.
Read this before any design, copy, content or code work on the ToyGenie store.

- **Snapshot taken:** 7 Nov 2026, from the Shopify Admin API (theme files read directly)
- **Theme:** `ToyGenie Storybook` — `gid://shopify/OnlineStoreTheme/187854160090` (role `MAIN`)
- **Theme last updated:** 6 Nov 2026
- **Built on:** Shopify "Base" theme v0.1.0 (Tailwind CSS v4, block-first Liquid; not a Theme Store theme)
- **Store:** ToyGenie · www.toygenie.com.au · AUD · Australia · support@toygenie.com.au

> If the live theme changes (a new theme gets published, or the brand moves), re-check the theme ID
> and the "Source of truth" files listed below before trusting this guide. The theme's own
> `DESIGN.md` and `AGENTS.md` win over this document when they disagree.

---

## 1. Brand in one paragraph

ToyGenie sells **personalised keepsake gifts for kids (ages 0–10) and pets**: AI-personalised
storybooks (**Genie Books**), photo paint-by-numbers kits (**Genie Canvas**), custom wall decor,
kids' toys and learning, pet gifts (**Genie Fur Babies**), craft supplies, and a newer range of
**wooden automata and magnetic levitation** pieces. The people buying are parents, grandparents and pet owners.
They should feel **delight, warmth and trust**: "this was made just for them."

**Design thesis:** *A storybook come to life.* Warm cream pages, coral-red ink, a dash of sunshine
yellow, and rounded, friendly type that makes every gift feel like the hero of its own adventure.
It was built to match the Genie Books site (books.toygenie.com.au).

| Feeling | How the theme delivers it |
|---|---|
| Wonder | Hero art styled as storybook objects (tilted book covers with a book shadow), lots of whitespace, the mascot logo |
| Warmth | Cream paper background (#FDFAF4) and oatmeal bands (#F8F1E5). Never stark white |
| Playful but grown-up | Fredoka 600 headings, DM Sans body text, no cartoon clutter |
| Trust | Reassurance lines ("Preview before you pay"), thin warm borders, clear coral buttons |
| Personal | Copy talks to "your child / your fur baby". The second line of a heading is in coral |

---

## 2. Design tokens (live values)

### Colours

| Name | Hex | Token / utility | Use |
|---|---|---|---|
| Story cream | `#FDFAF4` | `--color-surface` · `bg-surface` | Page background (setting `color_palette.surface`) |
| Ink | `#141414` | `--color-on-surface` · `text-on-surface` | All main text (`on_surface`) |
| Oatmeal | `#F8F1E5` | `--color-surface-secondary` · `bg-surface-secondary` | Recessed bands: How it works, footer, collection intro (`surface_2`) |
| Genie coral | `#D6362F` | `--color-accent` / `--color-interactive` · `text-accent`, `bg-interactive` | Primary buttons, links, highlighted heading words, announcement bar. White text on it passes (4.76:1) |
| Sunshine | `#FFC933` | `--color-sunshine` · `bg-sunshine` | **Background highlights only**: tags, step-number chips, callout band, "Personalised for you" badge. Ink text on it, never white or coral |
| Sunshine soft | `#FFF1C7` | `--color-sunshine-soft` · `bg-sunshine-soft` | Hero glow circle, benefit icon chips |
| Warm hairline | `#E3DBD0` | `--color-border` · `border-border` | Borders, dividers |
| Muted ink | `#66605A` | `--color-on-surface-secondary` · `text-on-surface-secondary` | Secondary text (≥4.5:1 on cream and oatmeal) |
| Sale | `#DC2626` | `text-sale` | Sale price |
| Compare | `#6B7280` | `text-compare` | Struck-through compare-at price |

Supporting values: success `#059669`, warning `#D97706`, critical `#DC2626`, info `#2563EB`,
overlays `rgb(0 0 0 / .95|.7|.5)`. Browser/PWA theme colour: `#141414`.
App colours chosen to match: Wishlist Hero buttons and icons use `#E8433D` on `#FAE3B8`.

### Typography

| Role | Font | Notes |
|---|---|---|
| Headings | **Fredoka 600** (`fredoka_n6`) | line-height 1.08–1.2, letter-spacing −0.01em, sentence case, `text-wrap: balance` |
| Body | **DM Sans 400** (`dm_sans_n4`) | line-height 1.625–1.7, `text-wrap: pretty` |

Size settings are heading `md` (anchor 50px) and paragraph `sm` (anchor 14px). That produces:

| Class | Size | Use |
|---|---|---|
| `type-display` | 62.5px (homepage hero shrinks it to ~2.6rem on mobile) | Hero H1, collection H1 |
| `type-heading-xl` | 50px (mobile overrides to 2rem) | Section titles, product H1 |
| `type-heading-lg` | 40px | Callout and automata titles |
| `type-heading-md` | 32.5px | Rich-text headings |
| `type-heading-sm` | 25px (often shrunk with `text-base`) | Card/step titles, footer headings |
| `type-body-lg` | 16.5px | Hero subtitle, collection description, price |
| `type-body` | 14px | Default paragraph |
| `type-body-sm` | 11.5px | Labels, reassurance lines, badges |
| `type-overline` | 10.9px, uppercase, 0.14em tracking, 500 weight | Kickers and product-type tags only (used sparingly, often `font-bold`) |

Don't add fonts outside these two theme font settings.

### Shape, spacing, shadow, motion

- **Radius:** buttons `rounded` (0.5rem, `rounded-button`), cards `rounded` (0.5rem, `rounded-card`),
  form inputs `rounded` (0.5rem, `rounded-input`). Book-cover objects use `rounded-[4px_10px_10px_4px]`.
- **Page width:** `max-w-page` = 80rem (1280px). Gutters are `px-margin` (min 1rem plus the safe area), and `md:px-10`.
- **Section rhythm:** `py-14 md:py-20` (bands) / `py-16 md:py-24` (content regions); hero `pt-10 md:pt-16`.
- **Touch target:** `size-touch-target` = 2.75rem (44px).
- **Shadows:** `shadow-book` (soft drop plus a page-edge offset, only for storybook objects),
  `shadow-soft` (`0 6px 20px rgb(20 20 20/.05)`, for CTAs, badges and banners). Everything else is flat with hairline borders.
- **Motion:** gentle and storybook-like. Cards lift 2px on hover (`motion-safe:hover:-translate-y-0.5`),
  buttons press to 0.97 (`active:scale-[0.97]`), grids fade in with a stagger (`stagger-fade-in`). Entrances take about 300ms with
  `--ease-ui: cubic-bezier(0.16,1,0.3,1)` and exits about 200ms. Drawers use `--ease-drawer: cubic-bezier(0.32,0.72,0,1)`.
  Motion always sits behind `motion-safe:` and respects reduced-motion settings. **No hover zoom on card images**
  (the only allowed exception is the product-page gallery zoom, 1.03).

---

## 3. Theme settings (Theme editor → Theme settings)

| Group | Setting id | Live value |
|---|---|---|
| Social | `social_youtube` | https://www.youtube.com/@TOYGENIE.STORES |
| | `social_facebook` | https://www.facebook.com/toygenie.com.au |
| | `social_instagram` | https://www.instagram.com/toygenie.au/ |
| | `social_linkedin` | https://www.linkedin.com/company/toygenie |
| Book creator | `book_creator_url` | https://books.toygenie.com.au/ |
| | `book_creator_page` | page `personalised-storybooks` |
| Favicon | `favicon` | ToyGenie_Favicon_Transparent (PNG) |
| Colours | `color_palette` | surface #FDFAF4 · on_surface #141414 · surface_2 #F8F1E5 · accent #D6362F · interactive #D6362F |
| Fonts | `type_primary_font` / `type_heading_font` | dm_sans_n4 / fredoka_n6 |
| Type sizes | `type_scale_paragraph_size` / `type_scale_heading_size` | sm / md |
| Radius | buttons / cards / forms | rounded / rounded / rounded |

`snippets/theme-styles.liquid` turns these settings into CSS variables on `:root` at runtime. They always override
the defaults in `config/styles.css`. The button text colour is chosen automatically: white if the
interactive colour's brightness is ≤128, otherwise black.

---

## 4. Installed app embeds (`settings_data.json`)

| App | What it does on the theme |
|---|---|
| **Judge.me Reviews** | Core embed plus a cart-drawer widget. Star badge under the product title, a full review widget in the "What families are saying" section, and badges on product cards |
| **Wishlist Hero** | Heart icon in the header that links to `/a/wishlist-hero/wishlist#hero-wishlist`. Icon on `.product-card`, placed right, coral `#E8433D` on `#FAE3B8` |
| **Customily** | Product personaliser (the add-to-cart button is not disabled while it loads) |
| **Gelato Print on Demand** | Product personaliser (personalise tab shown) |
| **JetPrint Print on Demand** | App embed |
| **Rep AI (ChatGPT concierge)** | Chat widget |
| **Google & YouTube** | Store widget, bottom-left |

---

## 5. Page anatomy

### Global shell (`layout/theme.liquid`)
1. **Announcement bar:** full-width coral strip (`bg-interactive`) with a star icon.
   "Turn Your Loved Ones Into Art. Personalised Keepsakes." plus "Made in Australia." (the second part is hidden on mobile).
2. **Header:** cream with a hairline bottom border. Mascot logo on the left (`Toy_Genie_Logo_without_Background.svg`, height 56).
   Main menu in the centre (menu `main-menu`, multi-level hover dropdowns, a mobile drawer below `md`). On the right:
   language/country selector, search (predictive search dialog, up to 8 products), favourites (Wishlist Hero),
   account (`<shopify-account>`), and a cart button with a coral count badge that opens the cart drawer.
3. **"Get the ToyGenie app" pill:** a sunshine pill under the header icons (PWA install via `manifest.json`).
   It's hidden on the book-creator page and also offered as a link in the footer.
4. **Cart drawer:** line items, discount list and discount-code field, total, and a coral **Checkout** button
   (`name="checkout"`). Accelerated checkout buttons appear below it.
5. **Footer:** oatmeal band in 3 columns:
   - Logo (height 64) and tagline "Personalised gifts for little heroes and fur babies.", with round social icons
   - "Help & info" with the `footer` menu (first 5 links)
   - "Say hello" with support@toygenie.com.au and a "Get the app" link

   Below that, a hairline sub-footer with © year, the store policies and the "Powered by Shopify" link.

**Redirect rule:** the old collection `genie-books-learning` instantly redirects to the
book-creator page (`settings.book_creator_page`), except inside the theme editor.

### Homepage (`templates/index.liquid`), in order
1. **Hero:** copy on the left, storybook stage on the right.
   - Kicker "Little heroes. Big adventures."
   - H1 "Your little one." with a coral second line, "Their own adventure."
   - Subtitle, a coral CTA "Shop personalised books" (goes to the book creator), and a text link "Turn a photo into art" (goes to Genie Canvas)
   - ✓ reassurance lines "Made from your own photo" and "Gifts for ages 0–10 and fur babies"
   - The stage shows two tilted cover images (`genie-hero-maya-detective-book.png` is the LCP image, with
     `genie-hero-superhero-painting-v2.png` behind it) over a sunshine-soft circle, plus a note card "They're not just in the story. **They're the hero.**"
     and a sunshine badge "One of a kind. Just like them."
   - A 3-up benefits rail sits under a hairline: Wonderfully personal / Approved by you / A keepsake, not just a gift.
2. **Wooden automata band:** a sunshine card with a coral "Exclusive new range" ribbon badge (with sheen and
   twinkling stars), the heading "Wooden automata & **magnetic levitation.**", a CTA, a free-shipping seal
   (`free-shipping-australia-wide-badge.png`), and a marquee that scrolls forever through every product in
   collection `wooden-automata`. It pauses on hover and becomes a swipe row when reduced motion is on.
3. **How it works:** oatmeal band. "From a photo **to a keepsake**", with 4 step cards on cream that each have a sunshine
   number chip: Pick their gift → Share a photo → Make it just right → Let the magic arrive.
4. **Worlds:** "A world of **little wonders**", six square collection tiles:

   | Tile | Collection handle | Tag |
   |---|---|---|
   | Genie Books | `genie-books-learning` (links to the book creator) | Ages 2–10 |
   | Genie Canvas | `genie-canvas` | From your photo |
   | Wall decor | `genie-wall-decor` | Made to order |
   | Kids' play | `genie-kids-play` | Play & learn |
   | Fur babies | `genie-fur-babies` | Fur babies |
   | Craft | `craft-and-create-supplies` | Get creative |
5. **Genie Books feature:** a wide 21:9 photo (`Mila_s_Magical_Ocean_Adventure.png`), the heading
   "Same little one. **A bigger adventure.**" and a CTA "Create their book".
6. **Featured collection:** "Little wonders, **loved by families**". Product grid from collection `featured`
   (falls back to all products).
7. **Callout:** sunshine band with the genie mascot (`genie_books_mascot_Transparent_background.png`),
   "Got a favourite photo?" and a CTA "Start with a photo" (goes to Genie Canvas).

### Product page (`templates/product.liquid`)
- **Layout:** gallery and info side by side (`product-grid` = 1.25fr / 1fr from 768px up). On mobile the
  gallery is an edge-to-edge swipe strip. On desktop it's a grid with the first image spanning two columns, a
  "See all N photos" toggle, and a full-screen zoom dialog. Videos and YouTube/Vimeo embeds are supported.
- **"Personalised for you" badge** (sunshine pill with ★) on the first image when the product title contains
  *custom*, *personalis* or *personaliz*.
- **Info column:**
  - Product type as an overline, the H1 title (`type-heading-xl`), the Judge.me star badge and the price
  - Variant picker, quantity selector (follows the quantity rules) and a coral "Add to cart" button
  - Under the button, a reassurance card: "Secure checkout" with payment logos, and "Here to help"
- **Pre-orders:** products tagged `coming-soon` show "Pre-order now" when available and "Coming soon" when not.
  The ship date comes from the metafield `custom.preorder_ship_date`.
- **Sections below:** How it works (only on personalised products) → "The full **story**" (the description, with a sticky
  intro and a help card) → "What families **are saying**" (Judge.me) → "You might **also love**" (4 products from
  the product's first collection that has more than one product, skipping `featured`).

### Collection page (`templates/collection.liquid`)
- **Intro band** on oatmeal: kicker "Shop the collection", the collection title in `type-display`, the description,
  and a sunshine pill with the product count ("N little wonders").
- **Banner image** on the right. There's a landscape banner for each collection:
  `collection-banner-canvas|decor|kids|pets|craft.png`. Other collections use the square collection image instead.
- **Filters:** a drawer with filter groups, sort, and partial-rendered results (`collection-grid`).
- **Product cards:** square image on `bg-surface-secondary`, title (2 lines max), Judge.me badge and price.
  Badges: a coral "PRE-ORDER" / "COMING SOON" pill top-right for `coming-soon`, and a sunshine "★ Personalised for you"
  pill top-left for custom/personalised titles. Cards lift 2px on hover.

### Other templates
| Template | Notes |
|---|---|
| `page.book-creator` | The Genie Books app (`books.toygenie.com.au?embedded=1`) in a full-height iframe between header and footer. Has a "Open it in a new tab" fallback. Not indexed by search engines. The app only works on www.toygenie.com.au |
| `page.contact` | "Say hello" / "We'd love to hear from you" form (name, email, phone, message), plus an order-tracking hint |
| `page` | Rich-text page plus a help card ("Still have a question?" / "Email us") |
| `list-collections` | "Explore every world" |
| `blog` / `article` | Kicker "Stories & ideas" |
| `search`, `cart`, `404` ("Oops, this page wandered off."), `password`, `gift_card` | Standard pages styled with the brand |

---

## 6. Voice and copy

- Warm, short and parent-facing. Speak to "your little one", "their story", "fur babies".
- Headings are in **two parts**: a plain first line, then a **coral** second line
  (e.g. "From a photo / **to a keepsake**", "You might / **also love**").
- Use reassurance lines: "Approved by you", "Preview the little details before it's made", "Made in Australia".
- Australian spelling: personalised, favourite, colour.
- Product counts read "little wonders"; the gallery CTA is "See all N photos".
- All storefront copy lives in `locales/en.default.json` (keys like `home.hero.title`, `product.story_title`).
  To reword copy, edit the translation key or the text block in the theme editor. Don't hardcode it.

---

## 7. Design Dos and Don'ts

**Do**
- Make coral the single action colour. Use sunshine only as a background highlight, with ink text on it.
- Put the second line of hero and section headings in coral (`text-accent`).
- Keep imagery bright, child-centred, illustrated or warm lifestyle.
- Use cream for content and oatmeal for recessed bands. Use the `type-*` classes for all copy.
- Keep contrast at 4.5:1 for body text, 3:1 for large text and UI cues.

**Don't**
- Put white or coral text on sunshine.
- Use stark white pages or grey neutrals (`bg-stone-*`, raw `#fff`).
- Add floating blobs, confetti or sticker decals.
- Zoom images on card hover.
- Use raw hex or arbitrary values where a token exists (`bg-[#...]`, `rounded-[14px]`).
- Add fonts outside Fredoka and DM Sans.

---

## 8. How the theme is built (rules for editing code)

The theme uses its own conventions, unlike typical Shopify themes. The full rules are in the theme's `AGENTS.md`. The essentials:

1. **No `sections/` folder, no JSON templates, no `{% section %}`, no `{% stylesheet %}` / `{% javascript %}`.**
   Templates are `.liquid` files and they are the source of truth.
2. **Block-first composition:** `template → container block → blocks/snippets/markup`. Each page region is
   its own `{% block 'container', class: '...' %}`. Block files never call other blocks.
3. **All editable copy is a `text` block**:
   `{% block 'text', tag: 'h2', variant: 'type-heading-xl' %}{{ 'key' | t }}{% endblock %}`.
   Images, products and collections a merchant may swap are picker settings on blocks.
4. **Styling = Tailwind v4 utilities in the markup** plus theme tokens. The authored stylesheet is
   `config/styles.css`. `assets/styles.min.css` is **generated, so never hand-edit it**. It's recompiled by
   Canvas/Sidekick; the classic "Edit code" screen does **not** recompile it.
5. **Variants** are full class names: `variant: 'button-primary'`, `variant: 'type-body-sm'`.
   Buttons: `button-primary | button-secondary | button-outline | button-ghost | button-surface | custom`.
6. **JavaScript:** one custom element per file (`assets/s-*.js`), invoker commands
   (`commandfor` / `command="--remove"`), partial rendering (`{% partial 'cart-items' %}`) for live updates.
   Never hardcode `/cart` and similar paths; pass `routes.*` through `data-*` attributes.
7. **Commerce contracts:** checkout buttons use `name="checkout"`, `input[name="id"]` holds the selected variant,
   prices use money filters, and quantity controls honour `quantity_rule`.
8. **RTL-safe:** use logical utilities (`ms-/me-/ps-/pe-`, `start-/end-`, `text-start`), and wrap prices and codes in `<bdi>`.
9. **Partials JS depends on (don't rename):** `cart-count`, `cart-drawer`, `cart-drawer-count`, `cart-drawer-footer`,
   `predictive-results`, `predictive-meta`, `product-title`, `product-form`, `collection-grid`.

### File map
| Area | Files |
|---|---|
| Layout | `layout/theme.liquid`, `layout/password.liquid` |
| Templates | `index`, `product`, `collection`, `list-collections`, `search`, `cart`, `page`, `page.contact`, `page.book-creator`, `blog`, `article`, `404`, `password`, `gift_card` |
| Blocks | `basic-menu`, `button`, `card`, `collection-tile`, `container`, `featured-collection`, `footer`, `gift-card`, `header`, `image`, `link`, `logo`, `main-menu`, `pagination`, `predictive-search`, `price`, `quantity-selector`, `richtext`, `text`, `variant-picker`, `video` |
| Snippets | cart (`cart-drawer`, `cart-line-item`, `cart-discount-*`), `drawer`, filters (`filters`, `filter-group`, `filter-value`), `localization-form`, `meta-tags`, `mobile-nav-drawer`, `share-row`, `swatch`, `card-video`, `placeholder-texture`, `lcp-preload`, `import-map`, `theme-styles`, `theme-type-scale-variables`, `theme-scripts`, a11y helpers |
| JS (custom elements) | `s-cart`, `s-dialog`, `s-live-form`, `s-mobile-nav`, `s-nav-dropdown`, `s-predictive-search`, `s-product-form`, `s-variant-picker`, `s-product-image-zoom`, `s-product-share`, `s-quantity-selector`, `s-video`, `s-gift-card`, `s-localization-dropdown`, `s-notification`, `s-view-event`, `s-book-creator`, `s-install-app` |
| Styles | `config/styles.css` (source), `assets/styles.min.css` (generated) |
| Design docs in theme | `DESIGN.md` (brand contract), `AGENTS.md` (code rules) |
| Icons | `assets/icon-*.svg` (account, arrows, cart, check, chevrons, heart, menu, minus/plus, search, share/social, tag, trash, x) |
| Locales | `locales/en.default.json` (storefront copy) plus about 35 other languages |

### Brand images referenced by the theme (Shopify Files)
`Toy_Genie_Logo_without_Background.svg` (logo), `ToyGenie_Favicon_Transparent_…png` (favicon/app icon),
`genie-hero-maya-detective-book.png`, `genie-hero-superhero-painting-v2.png`,
`Mila_s_Magical_Ocean_Adventure.png`, `genie_books_mascot_Transparent_background.png`,
`free-shipping-australia-wide-badge.png`, `collection-banner-{canvas,decor,kids,pets,craft}.png`.

---

## 9. Other (unpublished) themes on the store

| Theme | ID | Note |
|---|---|---|
| Updated copy of ToyGenie - Remove Coming Soon B… | 187328954586 | Theme Store #2481, older |
| ToyGenie Theme (updated) | 187758608602 | Theme Store #2481 |
| ToyGenie Atelier: Midnight and Porcelain | 187826798810 | Custom dark/porcelain concept |
| ToyGenie - Trim photo-marquee weight (draft) | 187852521690 | Theme Store #2481 draft |

---

## 10. Quick checklist for new work

- [ ] Cream page, ink text, coral for every action, sunshine only behind ink text
- [ ] Fredoka 600 headings with a coral second line; DM Sans body; `type-*` classes
- [ ] Rounded 0.5rem buttons and cards, hairline `border-border`, `shadow-soft` used sparingly
- [ ] Copy is warm, Australian English, and about the child or pet; strings live in locale keys or text blocks
- [ ] Regions wrapped in `container`; no sections/JSON templates; utilities only; never edit `styles.min.css`
- [ ] Motion behind `motion-safe:`, 2px lift, 0.97 press, no image zoom on cards
- [ ] Contrast ≥4.5:1; RTL-safe logical utilities; Judge.me and Wishlist Hero hooks preserved on cards
