
`ttcpad` is a small utility to repack TrueType Collection (`ttc`) files so that the last byte of each page is not used, making fonts with multiple weights usable in [WDBFontOverwrite](https://github.com/zhuowei/WDBFontOverwrite).

## Things it doesn't do

`ttcpad` leaves the following things to already established utilities:
* Packing or renaming fonts – to create a TrueType Collection file from multiple font files, you can use existing utilities such as FontForge or `ttx`
* Handling TTF/OTF files – `ttcpad` is for TrueType Collections. Either pack them in a TTC archive or use the WOFF2 solution, which will probably work better for single fonts.

## Limitations & TODOs

* Currently, `ttcpad` does not handle cases where the `loca` table is larger than a page. This limits the number of glyphs to 4095 or 8191, depending on the `glyf` table size. This makes `ttcpad` not practical for fonts with large Unicode coverage, and specifically for CJK fonts. This will be addressed in the future. Meanwhile, it's possible to ignore this limitation using the `-f` flag, which will let a few unlucky glyphs remain corrupted, at the risk of potentially instability.
* The padding will make the file larger than the original file. You can somewhat mitigate this by using the `-d` flag to delete non-essential metadata. In the future, it will be possible to further reduce the size by removing hinting instructions (which are not used on Apple platforms anyway). The algorithm that rearranges the tables around could also be more optimal.
* I don't bother to update or fix any checksums that I might invalidate, Apple doesn't really care about them being invalid anyway.
* This wasn't heavily tested and makes several assumptions that don't have to hold for every font. After repacking a file, make sure it's rendered and opened correctly in Quick Look, FontForge, Glyphs.app, FontLab Studio, or whatever other software you can use to open fonts. If I managed to produce a corrupt file, let me know.