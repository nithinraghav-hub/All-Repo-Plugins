#!/bin/sh
# Product photos for the Genie Books Meta posts (see genie-books-meta-posts.md).
# Needs the Higgsfield CLI, signed in (`higgsfield auth login`). About 6.5 credits per image.
#
# What a real Genie Books book looks like (from the Base44 app):
#   - square 20x20cm (8x8in) book, softcover or hardcover, 30 interior pages
#   - front cover = full-bleed illustration of THE CHILD as the hero, title across the top
#     (e.g. "Mia and the Moonlight Forest"), "genie books by ToyGenie" logo bottom-right
#   - inside pages = the same illustrated child on every page (watercolour, cartoon or 3D style)
#
# References in ./refs:
#   photo-to-book.png    real child photo on a phone beside her matching illustrated book (the concept)
#   genie-books-logo.png the "genie books. by ToyGenie" wordmark for the cover
set -e
cd "$(dirname "$0")"
REFS="--image refs/photo-to-book.png --image refs/genie-books-logo.png"

BOOK="a square 20x20cm hardcover children's picture book whose front cover is a full-bleed soft watercolour illustration of that same child as the story hero, with the book title across the top of the cover and the 'genie books by ToyGenie' logo from the reference small in the bottom-right corner"
LIKENESS="the illustrated child in the book must clearly be the same child as the real child in the photo: same face, hair colour and hairstyle, skin tone and outfit colours"
STYLE="warm golden-hour natural light, cosy Australian family home, soft natural tones, authentic candid photo, no other readable text anywhere except the cover title and logo"

# photo-1: hero (Post 1): real child + her book
higgsfield product-photoshoot create --mode closeup_product_with_person $REFS --aspect_ratio 4:5 --count 2 \
  --prompt "A delighted 5-year-old girl with curly brown hair in a yellow cardigan sitting at a wooden table, holding up $BOOK titled 'Mia and the Moonlight Forest'; $LIKENESS; $STYLE"

# photo-2: photo-to-character transformation (Post 2)
higgsfield product-photoshoot create --mode conceptual_product $REFS --aspect_ratio 4:5 --count 2 \
  --prompt "A parent's hand holding a smartphone showing a real photo of a smiling 4-year-old boy with short dark hair; beside it on a wooden table stands $BOOK titled 'Leo's Dinosaur Discovery', showing the boy illustrated with friendly dinosaurs; $LIKENESS; $STYLE"

# photo-3: bedtime reading (Post 3): child sees themselves inside
higgsfield product-photoshoot create --mode closeup_product_with_person $REFS --aspect_ratio 4:5 --count 2 \
  --prompt "Parent and a 5-year-old girl with curly brown hair reading in bed under soft lamp light; the book lies open showing a double-page watercolour illustration of the same girl with a kangaroo in the Australian bush, and the girl points at her illustrated self with delight; the book is $BOOK; $LIKENESS; no text on the open pages; $STYLE"

# photo-4: Christmas gift (Post 4): unwrapping moment
higgsfield product-photoshoot create --mode closeup_product_with_person $REFS --aspect_ratio 4:5 --count 2 \
  --prompt "A 6-year-old boy with short sandy hair on Christmas morning, partly unwrapped kraft paper and red ribbon in his lap, gasping in surprise at $BOOK titled 'Noah's Christmas Adventure', its cover showing him in a festive Australian summer Christmas scene; Christmas tree lights softly blurred behind; $LIKENESS; $STYLE"

# photo-5: grandparents (Post 5)
higgsfield product-photoshoot create --mode closeup_product_with_person $REFS --aspect_ratio 1:1 --count 2 \
  --prompt "A grandmother and her 4-year-old granddaughter with black pigtails snuggled in an armchair reading $BOOK titled 'Ava and the Rainbow Kingdom', the cover showing the granddaughter riding a unicorn; $LIKENESS; $STYLE"

# photo-6: Story / Reel cover (Post 6)
higgsfield product-photoshoot create --mode closeup_product_with_person $REFS --aspect_ratio 9:16 --count 2 \
  --prompt "A joyful 5-year-old girl with curly brown hair holding $BOOK titled 'Mia and the Moonlight Forest' up beside her face, cover facing the camera, so her real face and her illustrated face are side by side; plain warm cream backdrop with empty space at the top and bottom for text overlay; $LIKENESS; $STYLE"
