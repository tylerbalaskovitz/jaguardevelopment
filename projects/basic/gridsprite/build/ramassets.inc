.dphrase
tiles: incbin "build/hyptosis_tile-art-batch-1.bmp.gfxdata"
tiles_end:
tiles_clut: incbin "build/hyptosis_tile-art-batch-1.bmp.clut"
tiles_clut_end:
.extern tiles
.extern tiles_clut
.dphrase
scrbuf: incbin "build/playfield.bmp.gfxdata"
scrbuf_end:
.extern scrbuf
.extern scrbuf_end
.dphrase
gsprite: incbin "build/sprite.bmp.gfxdata"
gsprite_end:
.extern gsprite
.extern gsprite_end
.dphrase
