#NO_APP
	.text
.LC0:
	.ascii "Scaling Example\0"
.LC1:
	.ascii "DPAD = Change X/Y Scale\0"
.LC2:
	.ascii "B    = Reset Scale to 1:1\0"
.LC3:
	.ascii "Scale X:\0"
.LC4:
	.ascii "Scale Y:\0"
.LC5:
	.ascii "    \0"
.LC6:
	.ascii "%d\0"
	.even
	.globl	__Z9basicmainv
__Z9basicmainv:
	link.w %fp,#0
	movem.l #8252,-(%sp)
	clr.l __ZL4pad1
	moveq #32,%d0
	move.l %d0,__ZL6scaleX
	move.l %d0,__ZL6scaleY
	move.b #1,%d0
	move.l %d0,_jsfFontIndx
	move.l %d0,_jsfFontSize
	pea 182.w
	pea 90.w
	lea rapLocate,%a3
	jsr (%a3)
	move.l #.LC0,_js_r_textbuffer
	addq.l #8,%sp
	lea _rapPrint,%a2
	jsr (%a2)
	clr.l _jsfFontIndx
	clr.l _jsfFontSize
	pea 40.w
	pea 32.w
	jsr (%a3)
	move.l #.LC1,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	pea 56.w
	pea 32.w
	jsr (%a3)
	move.l #.LC2,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	pea 100.w
	pea 32.w
	jsr (%a3)
	move.l #.LC3,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	pea 130.w
	pea 32.w
	jsr (%a3)
	move.l #.LC4,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	pea 16.w
	pea 1.w
	pea SHIP_clut
	jsr jsfLoadClut
	move.l sprite,%a0
	moveq #-1,%d0
	move.l %d0,84(%a0)
	lea (12,%sp),%sp
	move.l #jsfGetPad,%d2
	lea ee_printf,%a4
	lea _jsfVsync,%a5
	pea 1.w
	move.l %d2,%a0
	jsr (%a0)
	move.l %d0,__ZL4pad1
	move.l %d0,%d1
	and.l JAGPAD_RIGHT,%d1
	addq.l #4,%sp
	jeq .L2
.L9:
	move.l __ZL6scaleX,%d1
	cmp.l #227,%d1
	jgt .L2
	addq.l #1,%d1
	move.l %d1,__ZL6scaleX
.L3:
	move.l %d0,%d1
	and.l JAGPAD_UP,%d1
	jeq .L4
.L10:
	move.l __ZL6scaleY,%d1
	cmp.l #227,%d1
	jgt .L4
	addq.l #1,%d1
	move.l %d1,__ZL6scaleY
.L5:
	and.l JAGPAD_B,%d0
	jeq .L6
	moveq #32,%d0
	move.l %d0,__ZL6scaleX
	move.l %d0,__ZL6scaleY
.L6:
	moveq #1,%d0
	move.l %d0,_jsfFontIndx
	pea 100.w
	pea 104.w
	jsr (%a3)
	move.l #.LC5,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	pea 100.w
	pea 104.w
	jsr (%a3)
	addq.l #4,%sp
	move.l __ZL6scaleX,(%sp)
	pea .LC6
	jsr (%a4)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	pea 130.w
	pea 104.w
	jsr (%a3)
	move.l #.LC5,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	pea 130.w
	pea 104.w
	jsr (%a3)
	addq.l #4,%sp
	move.l __ZL6scaleY,(%sp)
	pea .LC6
	jsr (%a4)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	move.l sprite,%a0
	move.l __ZL6scaleX,88(%a0)
	move.l __ZL6scaleY,92(%a0)
	clr.l -(%sp)
	jsr (%a5)
	addq.l #4,%sp
	pea 1.w
	move.l %d2,%a0
	jsr (%a0)
	move.l %d0,__ZL4pad1
	move.l %d0,%d1
	and.l JAGPAD_RIGHT,%d1
	addq.l #4,%sp
	jne .L9
.L2:
	move.l %d0,%d1
	and.l JAGPAD_LEFT,%d1
	jeq .L3
	move.l __ZL6scaleX,%d1
	jle .L3
	subq.l #1,%d1
	move.l %d1,__ZL6scaleX
	move.l %d0,%d1
	and.l JAGPAD_UP,%d1
	jne .L10
.L4:
	move.l %d0,%d1
	and.l JAGPAD_DOWN,%d1
	jeq .L5
	move.l __ZL6scaleY,%d1
	jle .L5
	subq.l #1,%d1
	move.l %d1,__ZL6scaleY
	jra .L5
	.globl	colliders
	.data
	.even
colliders:
	.long	raptor_collisionlist
	.globl	sprite
	.even
sprite:
	.long	RAPTOR_sprite_table
.lcomm __ZL4pad1,4
.lcomm __ZL6scaleX,4
.lcomm __ZL6scaleY,4
