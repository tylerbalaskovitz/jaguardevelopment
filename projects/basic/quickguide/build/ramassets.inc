.dphrase
TI4: incbin "build/TI4.bmp.gfxdata"
TI4_end:
.extern TI4
.dphrase
SPRITE_BUG2: incbin "build/bug2.bmp.gfxdata"
SPRITE_BUG2_end:
.extern SPRITE_BUG2
.dphrase
explode_sam: incbin "build/explosion.wav.raw"
.dc.b 0,0,0
explode_sam_end:
.extern explode_sam
.extern explode_sam_end
.dphrase
