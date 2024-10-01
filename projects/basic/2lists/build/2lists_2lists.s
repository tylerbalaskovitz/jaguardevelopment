#NO_APP
	.text
	.even
	.globl	__Z9basicmainv
__Z9basicmainv:
	link.w %fp,#0
	move.l %a3,-(%sp)
	move.l %a2,-(%sp)
	clr.l __ZL7frcount
	clr.l _jsfFontIndx
	clr.l _jsfFontSize
	pea 16.w
	pea 1.w
	pea BMP_PLAYER_clut
	lea jsfLoadClut,%a2
	jsr (%a2)
	addq.l #8,%sp
	moveq #16,%d1
	move.l %d1,(%sp)
	pea 2.w
	pea BMP_ENEMY_clut
	jsr (%a2)
	lea (12,%sp),%sp
	lea _jsfVsync,%a2
	lea rapSetActiveList,%a3
	move.l __ZL7frcount,%d0
	addq.l #1,%d0
	move.l %d0,__ZL7frcount
	moveq #120,%d1
	cmp.l %d0,%d1
	jeq .L7
.L2:
	cmp.l #240,%d0
	jeq .L4
	lsl.w #6,%d0
	move.w %d0,15728728
	clr.l -(%sp)
	jsr (%a2)
	addq.l #4,%sp
.L8:
	move.l __ZL7frcount,%d0
	addq.l #1,%d0
	move.l %d0,__ZL7frcount
	moveq #120,%d1
	cmp.l %d0,%d1
	jne .L2
.L7:
	clr.l -(%sp)
	jsr (%a2)
	moveq #1,%d0
	move.l %d0,(%sp)
	jsr (%a3)
	move.l __ZL7frcount,%d0
	lsl.w #6,%d0
	addq.l #4,%sp
	move.w %d0,15728728
	clr.l -(%sp)
	jsr (%a2)
	addq.l #4,%sp
	jra .L8
.L4:
	clr.l -(%sp)
	jsr (%a2)
	clr.l (%sp)
	jsr (%a3)
	clr.l __ZL7frcount
	addq.l #4,%sp
	clr.w %d0
	move.w %d0,15728728
	clr.l -(%sp)
	jsr (%a2)
	addq.l #4,%sp
	jra .L8
	.globl	colliders
	.data
	.even
colliders:
	.long	raptor_collisionlist
	.globl	sprite
	.even
sprite:
	.long	RAPTOR_sprite_table
.lcomm __ZL7frcount,4
