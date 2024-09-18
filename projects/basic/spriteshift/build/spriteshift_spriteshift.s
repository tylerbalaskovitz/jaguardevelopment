#NO_APP
	.text
.LC0:
	.ascii "JagStudio - SpriteShift\0"
.LC1:
	.ascii "Move Left to see offscreen sprite\0"
	.even
	.globl	__Z9basicmainv
__Z9basicmainv:
	link.w %fp,#0
	movem.l #56,-(%sp)
	moveq #1,%d0
	move.l %d0,_jsfFontIndx
	move.l %d0,_jsfFontSize
	pea 182.w
	pea 80.w
	lea rapLocate,%a3
	jsr (%a3)
	move.l #.LC0,_js_r_textbuffer
	addq.l #8,%sp
	lea _rapPrint,%a2
	jsr (%a2)
	clr.l _jsfFontIndx
	clr.l _jsfFontSize
	pea 200.w
	pea 30.w
	jsr (%a3)
	move.l #.LC1,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	lea jsfGetPad,%a3
	lea rapSpriteShift,%a4
	lea _jsfVsync,%a2
	clr.l __ZL6xshift
	clr.l __ZL6yshift
	pea 1.w
	jsr (%a3)
	move.l %d0,__ZL4pad1
	move.l %d0,%d1
	and.l JAGPAD_UP,%d1
	addq.l #4,%sp
	jeq .L2
.L12:
	move.l #-131072,__ZL6yshift
.L3:
	move.l %d0,%d1
	and.l JAGPAD_LEFT,%d1
	jeq .L4
.L13:
	move.l #-131072,__ZL6xshift
	move.l #-131072,%d1
	move.l __ZL6yshift,%d0
.L8:
	pea 3.w
	pea 1.w
	move.l %d0,-(%sp)
	move.l %d1,-(%sp)
	jsr (%a4)
	lea (16,%sp),%sp
.L9:
	clr.l -(%sp)
	jsr (%a2)
	addq.l #4,%sp
	clr.l __ZL6xshift
	clr.l __ZL6yshift
	pea 1.w
	jsr (%a3)
	move.l %d0,__ZL4pad1
	move.l %d0,%d1
	and.l JAGPAD_UP,%d1
	addq.l #4,%sp
	jne .L12
.L2:
	move.l %d0,%d1
	and.l JAGPAD_DOWN,%d1
	jeq .L3
	move.l #131072,__ZL6yshift
	move.l %d0,%d1
	and.l JAGPAD_LEFT,%d1
	jne .L13
.L4:
	and.l JAGPAD_RIGHT,%d0
	jeq .L6
	move.l #131072,__ZL6xshift
	moveq #2,%d1
	swap %d1
	move.l __ZL6yshift,%d0
	jra .L8
.L6:
	move.l __ZL6xshift,%d1
	move.l __ZL6yshift,%d0
	tst.l %d1
	jne .L8
	tst.l %d0
	jeq .L9
	pea 3.w
	pea 1.w
	move.l %d0,-(%sp)
	move.l %d1,-(%sp)
	jsr (%a4)
	lea (16,%sp),%sp
	jra .L9
	.globl	colliders
	.data
	.even
colliders:
	.long	raptor_collisionlist
	.globl	sprite
	.even
sprite:
	.long	RAPTOR_sprite_table
.lcomm __ZL6xshift,4
.lcomm __ZL6yshift,4
.lcomm __ZL4pad1,4
