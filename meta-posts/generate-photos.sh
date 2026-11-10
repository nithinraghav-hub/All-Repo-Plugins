#!/bin/sh
# Product photos for the Genie Books Meta posts (see genie-books-meta-posts.md).
# Needs the Higgsfield CLI, signed in (`higgsfield auth login`).
#
# References in ./refs come from your store and books.toygenie.com.au:
#   Hardcover.png / Softcover.png  real Genie Books cover mockups (red moon-and-bunny cover)
#   photo-to-book.png              existing "Mila and the Moonlight Forest" transformation ad
set -e
cd "$(dirname "$0")"
HC="--image refs/Hardcover.png"
SC="--image refs/Softcover.png"
MILA="--image refs/photo-to-book.png"

STYLE="warm golden-hour light, cosy Australian family home, soft natural tones; any visible book pages use soft watercolour storybook illustration; keep the Genie Books cover design and gold lamp logo exactly as in the reference"

# photo-1: hero (Post 1)
higgsfield product-photoshoot create --mode hero_banner $HC --aspect_ratio 4:5 --count 2 \
  --prompt "The Genie Books hardcover personalised storybook standing on a wooden table beside a second copy lying open on a colourful illustrated page; $STYLE"

# photo-2: photo-to-character transformation (Post 2)
higgsfield product-photoshoot create --mode restyle $MILA --aspect_ratio 4:5 --count 2 \
  --prompt "Same concept as the reference (child's photo on a phone beside the matching illustrated storybook) recomposed vertically for an Instagram feed post, with no handwritten notes; $STYLE"

# photo-3: bedtime reading (Post 3)
higgsfield product-photoshoot create --mode closeup_product_with_person $HC --aspect_ratio 4:5 --count 2 \
  --prompt "Parent and young child reading the Genie Books storybook together in bed, child delightedly pointing at the page, soft bedside lamp glow; $STYLE"

# photo-4: Christmas gift (Post 4)
higgsfield product-photoshoot create --mode lifestyle_scene $HC --aspect_ratio 4:5 --count 2 \
  --prompt "The Genie Books storybook partly unwrapped from kraft paper with a red ribbon, Christmas tree fairy lights softly blurred behind, summer-Christmas Australian living room; $STYLE"

# photo-5: grandparents (Post 5)
higgsfield product-photoshoot create --mode closeup_product_with_person $SC --aspect_ratio 1:1 --count 2 \
  --prompt "Close-up of a grandparent's hands holding the Genie Books softcover storybook, cosy armchair, warm living-room light; $STYLE"

# photo-6: Story / Reel cover (Post 6)
higgsfield product-photoshoot create --mode lifestyle_scene $HC --aspect_ratio 9:16 --count 2 \
  --prompt "Joyful child holding the Genie Books storybook up to the camera with the cover facing out, plain warm cream backdrop, empty space at top and bottom for text overlay; $STYLE"
