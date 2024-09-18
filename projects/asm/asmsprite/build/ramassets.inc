.dphrase
BMP_BACKDROP: incbin "build/BACKDROP.BMP.gfxdata"
BMP_BACKDROP_end:
.extern BMP_BACKDROP
.dphrase
BMP_PLAYER: incbin "build/PLAYER.BMP.gfxdata"
BMP_PLAYER_end:
BMP_PLAYER_clut: incbin "build/PLAYER.BMP.clut"
BMP_PLAYER_clut_end:
.extern BMP_PLAYER
.extern BMP_PLAYER_clut
.dphrase
BMP_ENEMY: incbin "build/ENEMY.BMP.gfxdata"
BMP_ENEMY_end:
BMP_ENEMY_clut: incbin "build/ENEMY.BMP.clut"
BMP_ENEMY_clut_end:
.extern BMP_ENEMY
.extern BMP_ENEMY_clut
.dphrase
