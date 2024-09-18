#NO_APP
	.text
.LC0:
	.ascii "Flash Cart Detection\0"
.LC1:
	.ascii "No Flash Detected\0"
.LC2:
	.ascii "Skunkboard Detected\0"
.LC3:
	.ascii "JagGD Detected\0"
	.even
	.globl	__Z9basicmainv
__Z9basicmainv:
	link.w %fp,#0
	movem.l #56,-(%sp)
	moveq #1,%d0
	move.l %d0,_jsfFontIndx
	move.l %d0,_jsfFontSize
	pea 182.w
	pea 64.w
	lea rapLocate,%a2
	jsr (%a2)
	move.l #.LC0,_js_r_textbuffer
	addq.l #8,%sp
	lea _rapPrint,%a3
	jsr (%a3)
	jsr rapFlashCheck
	move.l %d0,__ZZ9basicmainvE9flashType
	lea _jsfVsync,%a4
	pea 32.w
	pea 64.w
	jsr (%a2)
	move.l __ZZ9basicmainvE9flashType,%d0
	addq.l #8,%sp
	jeq .L7
.L2:
	moveq #1,%d1
	cmp.l %d0,%d1
	jeq .L8
	moveq #2,%d1
	cmp.l %d0,%d1
	jeq .L9
	clr.l -(%sp)
	jsr (%a4)
	addq.l #4,%sp
.L10:
	pea 32.w
	pea 64.w
	jsr (%a2)
	move.l __ZZ9basicmainvE9flashType,%d0
	addq.l #8,%sp
	jne .L2
.L7:
	move.l #.LC1,_js_r_textbuffer
	jsr (%a3)
	clr.l -(%sp)
	jsr (%a4)
	addq.l #4,%sp
	jra .L10
.L9:
	move.l #.LC3,_js_r_textbuffer
	jsr (%a3)
	clr.l -(%sp)
	jsr (%a4)
	addq.l #4,%sp
	jra .L10
.L8:
	move.l #.LC2,_js_r_textbuffer
	jsr (%a3)
	clr.l -(%sp)
	jsr (%a4)
	addq.l #4,%sp
	jra .L10
	.globl	colliders
	.data
	.even
colliders:
	.long	raptor_collisionlist
	.globl	sprite
	.even
sprite:
	.long	RAPTOR_sprite_table
.lcomm __ZZ9basicmainvE9flashType,4
