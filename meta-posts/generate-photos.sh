#!/bin/sh
# Product photos for the Genie Books Meta posts (see genie-books-meta-posts.md).
# Needs the Higgsfield CLI, signed in (`higgsfield auth login`).
#
# Optional: save a real photo of the printed book as meta-posts/book.jpg so every
# image shows your actual book; without it, Higgsfield designs a book itself.
set -e
cd "$(dirname "$0")"
REF=""
[ -f book.jpg ] && REF="--image book.jpg"

STYLE="warm golden-hour light, cosy Australian family home, soft natural tones, 8x8 inch square children's picture book"

# photo-1: hero (Post 1)
higgsfield product-photoshoot create --mode hero_banner $REF --aspect_ratio 4:5 --count 2 \
  --prompt "Personalised children's storybook 'Genie Books', hardcover, open on a wooden table showing a colourful illustrated page with a child as the hero; $STYLE"

# photo-2: photo-to-character transformation (Post 2)
higgsfield product-photoshoot create --mode conceptual_product $REF --aspect_ratio 4:5 --count 2 \
  --prompt "A hand holding a smartphone showing a real photo of a smiling 5-year-old child; beside it the open personalised storybook shows the same child as a matching illustrated storybook character on an adventure; $STYLE"

# photo-3: bedtime reading (Post 3)
higgsfield product-photoshoot create --mode closeup_product_with_person $REF --aspect_ratio 4:5 --count 2 \
  --prompt "Parent and young child reading the personalised storybook together in bed, child delightedly pointing at their own illustrated character on the page, soft bedside lamp glow; $STYLE"

# photo-4: Christmas gift (Post 4)
higgsfield product-photoshoot create --mode lifestyle_scene $REF --aspect_ratio 4:5 --count 2 \
  --prompt "Personalised children's storybook partly unwrapped from kraft paper with red ribbon, Christmas tree fairy lights softly blurred behind, festive summer-Christmas Australian living room; $STYLE"

# photo-5: grandparents (Post 5)
higgsfield product-photoshoot create --mode closeup_product_with_person $REF --aspect_ratio 1:1 --count 2 \
  --prompt "Close-up of a grandparent's hands holding the open personalised storybook showing an illustrated grandchild, cosy armchair, warm living-room light; $STYLE"

# photo-6: Story / Reel cover (Post 6)
higgsfield product-photoshoot create --mode lifestyle_scene $REF --aspect_ratio 9:16 --count 2 \
  --prompt "Joyful child holding the personalised storybook up to the camera with the cover facing out, plain warm cream backdrop, empty space at top and bottom for text overlay; $STYLE"
