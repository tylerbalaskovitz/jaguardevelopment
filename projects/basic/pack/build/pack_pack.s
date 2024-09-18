#NO_APP
	.text
	.even
	.globl	__Z9basicmainv
__Z9basicmainv:
	link.w %fp,#0
	move.l %a2,-(%sp)
	pea __ZL6buffer
	pea source_image
	jsr rapUnpack
	move.l sprite,%a0
	move.l #__ZL6buffer,44(%a0)
	moveq #1,%d0
	move.l %d0,4(%a0)
	addq.l #8,%sp
	lea _jsfVsync,%a2
.L2:
	clr.l -(%sp)
	jsr (%a2)
	addq.l #4,%sp
	clr.l -(%sp)
	jsr (%a2)
	addq.l #4,%sp
	jra .L2
	.globl	colliders
	.data
	.even
colliders:
	.long	raptor_collisionlist
	.globl	sprite
	.even
sprite:
	.long	RAPTOR_sprite_table
.lcomm __ZL6buffer,176000
