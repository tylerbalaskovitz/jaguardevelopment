#NO_APP
	.text
.LC0:
	.ascii "JagStudio\0"
	.even
	.globl	__Z9basicmainv
__Z9basicmainv:
	link.w %fp,#0
	movem.l #8248,-(%sp)
	moveq #1,%d0
	move.l %d0,_jsfFontIndx
	move.l %d0,_jsfFontSize
	pea 182.w
	pea 130.w
	jsr rapLocate
	move.l #.LC0,_js_r_textbuffer
	addq.l #8,%sp
	jsr _rapPrint
	lea jsfGetPad,%a3
	move.l #explode_sam_end,%d2
	sub.l #explode_sam-3,%d2
	lea zeroPlaySample,%a4
	lea _jsfVsync,%a2
	moveq #-4,%d0
	and.l %d0,%d2
	pea 1.w
	jsr (%a3)
	move.l %d0,__ZL4pad1
	move.l %d0,%d1
	and.l JAGPAD_UP,%d1
	addq.l #4,%sp
	jeq .L2
.L10:
	move.l sprite,%a0
	subq.w #2,200(%a0)
.L3:
	move.l %d0,%d1
	and.l JAGPAD_LEFT,%d1
	jeq .L4
.L11:
	move.l sprite,%a0
	subq.w #2,196(%a0)
.L5:
	and.l JAGPAD_B,%d0
	jne .L9
.L6:
	clr.l -(%sp)
	jsr (%a2)
	addq.l #4,%sp
.L12:
	pea 1.w
	jsr (%a3)
	move.l %d0,__ZL4pad1
	move.l %d0,%d1
	and.l JAGPAD_UP,%d1
	addq.l #4,%sp
	jne .L10
.L2:
	move.l %d0,%d1
	and.l JAGPAD_DOWN,%d1
	jeq .L3
	move.l sprite,%a0
	addq.w #2,200(%a0)
	move.l %d0,%d1
	and.l JAGPAD_LEFT,%d1
	jne .L11
.L4:
	move.l %d0,%d1
	and.l JAGPAD_RIGHT,%d1
	jeq .L5
	move.l sprite,%a0
	addq.w #2,196(%a0)
	and.l JAGPAD_B,%d0
	jeq .L6
.L9:
	clr.l -(%sp)
	pea 5.w
	move.l %d2,-(%sp)
	pea explode_sam
	pea 1.w
	jsr (%a4)
	lea (20,%sp),%sp
	clr.l -(%sp)
	jsr (%a2)
	addq.l #4,%sp
	jra .L12
	.globl	sprite
	.data
	.even
sprite:
	.long	RAPTOR_sprite_table
.lcomm __ZL4pad1,4
