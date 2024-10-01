#NO_APP
	.text
.LC0:
	.ascii "hello from the text layer!\0"
.LC1:
	.ascii "Press Start\0"
	.even
	.globl	__Z9basicmainv
__Z9basicmainv:
	link.w %fp,#0
	movem.l #56,-(%sp)
	clr.l _jsfFontIndx
	clr.l _jsfFontSize
	pea 300.w
	pea 10.w
	lea rapLocate,%a3
	jsr (%a3)
	move.l #.LC0,_js_r_textbuffer
	addq.l #8,%sp
	lea _rapPrint,%a2
	jsr (%a2)
	lea _jsfVsync,%a4
.L2:
	clr.l _jsfFontIndx
	clr.l _jsfFontSize
	pea 215.w
	pea 110.w
	jsr (%a3)
	move.l #.LC1,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	clr.l -(%sp)
	jsr (%a4)
	addq.l #4,%sp
	clr.l _jsfFontIndx
	clr.l _jsfFontSize
	pea 215.w
	pea 110.w
	jsr (%a3)
	move.l #.LC1,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	clr.l -(%sp)
	jsr (%a4)
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
