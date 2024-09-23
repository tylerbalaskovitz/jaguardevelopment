.dphrase
BMP_PLAYER: incbin "build/_nyancat.bmp.gfxdata"
BMP_PLAYER_end:
BMP_PLAYER_clut: incbin "build/_nyancat.bmp.clut"
BMP_PLAYER_clut_end:
.extern BMP_PLAYER
.extern BMP_PLAYER_clut
.dphrase
BMP_ENEMY: incbin "build/_ufo.bmp.gfxdata"
BMP_ENEMY_end:
BMP_ENEMY_clut: incbin "build/_ufo.bmp.clut"
BMP_ENEMY_clut_end:
.extern BMP_ENEMY
.extern BMP_ENEMY_clut
.dphrase
Module1: incbin "ASSETS/sfx/mod/Module1.mod"
Module1_end:
.extern Module1
.extern Module1_end
.dphrase
Module2: incbin "ASSETS/sfx/mod/alf.mod"
Module2_end:
.extern Module2
.extern Module2_end
.dphrase
explode_sam: incbin "ASSETS/SFX/SND/EXPLODE.RAW"
explode_sam_end:
.extern explode_sam
.extern explode_sam_end
.dphrase
