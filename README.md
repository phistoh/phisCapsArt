# phisCapsArt
WoW addon which changes the action bar cap arts on a per character basis. (Inspired by the original addons from SAM, ganders and Imithat)

## Usage
The addon automatically changes the action bar cap art either to a default or a character specific texture. You can change the texture via `/phiscapsart filename` or `/pca filename` (where filename should be given without file extension, e.g. `.tga`)

## File Description
- `phisCapsArt.lua` contains the main code
- `phisCapsArt.toc` is the standard WoW table-of-contents file containing addon information
- `images/` contains various textures which replace the vanilla action bar caps
    - `images/_tmp.pdn` is a paint.net template file to check the texture's measurements

## Changes
- **1.0.0b**: Update for Dragonflight; caps art now stored in saved variables instead of an extra table
- **0.9**: Initial upload