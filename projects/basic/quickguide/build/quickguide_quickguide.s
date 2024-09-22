#NO_APP
	.text
	.even
	.globl	__Z9basicmainv
__Z9basicmainv:
	link.w %fp,#0
	movem.l #12348,-(%sp)
	move.l #130,__ZL2tx
	move.l #182,__ZL2ty
	clr.l __ZL6scroll
	move.b #63,__ZL6winner
	clr.b __ZL6winner+1
	move.b #84,__ZL2v1
	move.b #121,__ZL2v1+1
	move.b #108,__ZL2v1+2
	move.b #101,__ZL2v1+3
	move.b #114,__ZL2v1+4
	clr.b __ZL2v1+5
	move.b #78,__ZL2v2
	move.b #97,__ZL2v2+1
	move.b #118,__ZL2v2+2
	move.b #114,__ZL2v2+3
	move.b #97,__ZL2v2+4
	move.b #106,__ZL2v2+5
	clr.b __ZL2v2+6
	move.b #76,__ZL2v3
	move.b #111,__ZL2v3+1
	move.b #118,__ZL2v3+2
	move.b #105,__ZL2v3+3
	move.b #110,__ZL2v3+4
	move.b #103,__ZL2v3+5
	clr.b __ZL2v3+6
	move.b #77,__ZL2v4
	move.b #97,__ZL2v4+1
	move.b #116,__ZL2v4+2
	move.b #116,__ZL2v4+3
	move.b #104,__ZL2v4+4
	move.b #101,__ZL2v4+5
	move.b #119,__ZL2v4+6
	clr.b __ZL2v4+7
	move.b #74,__ZL2v5
	move.b #111,__ZL2v5+1
	move.b #104,__ZL2v5+2
	move.b #110,__ZL2v5+3
	clr.b __ZL2v5+4
	move.b #67,__ZL2v6
	move.b #104,__ZL2v6+1
	move.b #114,__ZL2v6+2
	move.b #105,__ZL2v6+3
	move.b #115,__ZL2v6+4
	move.b #116,__ZL2v6+5
	move.b #105,__ZL2v6+6
	move.b #97,__ZL2v6+7
	move.b #110,__ZL2v6+8
	clr.b __ZL2v6+9
	moveq #1,%d0
	move.l %d0,_jsfFontIndx
	move.l %d0,_jsfFontSize
	lea jsfGetPad,%a5
	move.l #explode_sam_end,%d2
	sub.l #explode_sam-3,%d2
	move.l #zeroPlaySample,%d3
	lea _strcpy,%a3
	lea rapLocate,%a2
	lea _jsfVsync,%a4
	moveq #-4,%d0
	and.l %d0,%d2
	pea 1.w
	jsr (%a5)
	move.l %d0,__ZL4pad1
	move.l %d0,%d1
	and.l JAGPAD_UP,%d1
	addq.l #4,%sp
	jeq .L2
.L22:
	move.l sprite,%a0
	subq.w #2,204(%a0)
.L3:
	move.l %d0,%d1
	and.l JAGPAD_LEFT,%d1
	jeq .L4
.L23:
	move.l sprite,%a0
	subq.w #2,200(%a0)
.L5:
	move.l %d0,%d1
	and.l JAGPAD_B,%d1
	jne .L15
.L6:
	move.l %d0,%d1
	and.l JAGPAD_1,%d1
	jne .L16
.L7:
	move.l %d0,%d1
	and.l JAGPAD_2,%d1
	jne .L17
.L8:
	move.l %d0,%d1
	and.l JAGPAD_3,%d1
	jne .L18
.L9:
	move.l %d0,%d1
	and.l JAGPAD_4,%d1
	jne .L19
.L10:
	move.l %d0,%d1
	and.l JAGPAD_5,%d1
	jne .L20
.L11:
	and.l JAGPAD_6,%d0
	jne .L21
.L12:
	clr.l -(%sp)
	jsr (%a4)
	addq.l #4,%sp
.L24:
	pea 1.w
	jsr (%a5)
	move.l %d0,__ZL4pad1
	move.l %d0,%d1
	and.l JAGPAD_UP,%d1
	addq.l #4,%sp
	jne .L22
.L2:
	move.l %d0,%d1
	and.l JAGPAD_DOWN,%d1
	jeq .L3
	move.l sprite,%a0
	addq.w #2,204(%a0)
	move.l %d0,%d1
	and.l JAGPAD_LEFT,%d1
	jne .L23
.L4:
	move.l %d0,%d1
	and.l JAGPAD_RIGHT,%d1
	jeq .L5
	move.l sprite,%a0
	addq.w #2,200(%a0)
	move.l %d0,%d1
	and.l JAGPAD_B,%d1
	jeq .L6
	jra .L15
.L21:
	pea __ZL2v6
	pea __ZL6winner
	jsr (%a3)
	addq.l #4,%sp
	move.l __ZL2ty,(%sp)
	move.l __ZL2tx,-(%sp)
	jsr (%a2)
	moveq #1,%d0
	move.l %d0,__ZL6scroll
	addq.l #8,%sp
	clr.l -(%sp)
	jsr (%a4)
	addq.l #4,%sp
	jra .L24
.L20:
	pea __ZL2v5
	pea __ZL6winner
	jsr (%a3)
	addq.l #4,%sp
	move.l __ZL2ty,(%sp)
	move.l __ZL2tx,-(%sp)
	jsr (%a2)
	moveq #1,%d0
	move.l %d0,__ZL6scroll
	move.l __ZL4pad1,%d0
	addq.l #8,%sp
	and.l JAGPAD_6,%d0
	jeq .L12
	jra .L21
.L19:
	pea __ZL2v4
	pea __ZL6winner
	jsr (%a3)
	addq.l #4,%sp
	move.l __ZL2ty,(%sp)
	move.l __ZL2tx,-(%sp)
	jsr (%a2)
	moveq #1,%d0
	move.l %d0,__ZL6scroll
	move.l __ZL4pad1,%d0
	addq.l #8,%sp
	move.l %d0,%d1
	and.l JAGPAD_5,%d1
	jeq .L11
	jra .L20
.L18:
	pea __ZL2v3
	pea __ZL6winner
	jsr (%a3)
	addq.l #4,%sp
	move.l __ZL2ty,(%sp)
	move.l __ZL2tx,-(%sp)
	jsr (%a2)
	moveq #1,%d0
	move.l %d0,__ZL6scroll
	move.l __ZL4pad1,%d0
	addq.l #8,%sp
	move.l %d0,%d1
	and.l JAGPAD_4,%d1
	jeq .L10
	jra .L19
.L17:
	pea __ZL2v2
	pea __ZL6winner
	jsr (%a3)
	addq.l #4,%sp
	move.l __ZL2ty,(%sp)
	move.l __ZL2tx,-(%sp)
	jsr (%a2)
	moveq #1,%d0
	move.l %d0,__ZL6scroll
	move.l __ZL4pad1,%d0
	addq.l #8,%sp
	move.l %d0,%d1
	and.l JAGPAD_3,%d1
	jeq .L9
	jra .L18
.L16:
	pea __ZL2v1
	pea __ZL6winner
	jsr (%a3)
	addq.l #4,%sp
	move.l __ZL2ty,(%sp)
	move.l __ZL2tx,-(%sp)
	jsr (%a2)
	moveq #1,%d0
	move.l %d0,__ZL6scroll
	move.l __ZL4pad1,%d0
	addq.l #8,%sp
	move.l %d0,%d1
	and.l JAGPAD_2,%d1
	jeq .L8
	jra .L17
.L15:
	clr.l -(%sp)
	pea 5.w
	move.l %d2,-(%sp)
	pea explode_sam
	pea 1.w
	move.l %d3,%a0
	jsr (%a0)
	move.l __ZL4pad1,%d0
	lea (20,%sp),%sp
	move.l %d0,%d1
	and.l JAGPAD_1,%d1
	jeq .L7
	jra .L16
	.even
	.globl	__Z10BCX_TmpStrm
__Z10BCX_TmpStrm:
	link.w %fp,#0
	move.l #_BCX_TmpStr_buffer,%d0
	move.l 8(%fp),%d1
	move.l %d0,%a0
	clr.b (%a0,%d1.l)
	unlk %fp
	rts
	.even
	.globl	__Z5spacei
__Z5spacei:
	link.w %fp,#0
	move.l 8(%fp),%d0
	jle .L31
	lea _BCX_TmpStr_buffer,%a0
	clr.b (%a0,%d0.l)
	move.l %d0,-(%sp)
	pea 32.w
	move.l %a0,-(%sp)
	jsr _memset
	lea (12,%sp),%sp
	unlk %fp
	rts
.L31:
	clr.b _BCX_TmpStr_buffer+1
	move.l #_BCX_TmpStr_buffer,%d0
	unlk %fp
	rts
.LC0:
	.ascii " is the winner!\0"
.LC1:
	.ascii "Congrats!\0"
.LC2:
	.ascii "%s%s%s%s\0"
.LC3:
	.ascii "Who will be today's winner?\0"
.LC4:
	.ascii "%s\0"
	.even
	.globl	__Z10scrollTextPc
__Z10scrollTextPc:
	link.w %fp,#0
	move.l __ZL6scroll,%d0
	moveq #1,%d1
	cmp.l %d0,%d1
	jeq .L38
	tst.l %d0
	jeq .L39
.L36:
	unlk %fp
	rts
.L39:
	move.l __ZL2ty,-(%sp)
	move.l __ZL2tx,-(%sp)
	jsr rapLocate
	addq.l #4,%sp
	move.l #.LC3,(%sp)
	pea .LC4
	jsr ee_printf
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr _rapPrint
	unlk %fp
	rts
.L38:
	move.l 8(%fp),-(%sp)
	pea __ZL6winner
	jsr _strcpy
	move.l __ZL2tx,%d0
	subq.l #2,%d0
	move.l %d0,__ZL2tx
	addq.l #4,%sp
	move.l __ZL2ty,(%sp)
	move.l %d0,-(%sp)
	jsr rapLocate
	clr.b _BCX_TmpStr_buffer+2
	move.b #32,_BCX_TmpStr_buffer
	move.b #32,_BCX_TmpStr_buffer+1
	addq.l #4,%sp
	move.l #_BCX_TmpStr_buffer,(%sp)
	pea .LC0
	pea __ZL6winner
	pea .LC1
	pea .LC2
	jsr ee_printf
	move.l %d0,_js_r_textbuffer
	lea (20,%sp),%sp
	jsr _rapPrint
	move.l __ZL6scroll,%d0
	jne .L36
	jra .L39
	.even
	.globl	__Z11writeWinnerPc
__Z11writeWinnerPc:
	link.w %fp,#0
	move.l 8(%fp),-(%sp)
	pea __ZL6winner
	jsr _strcpy
	addq.l #4,%sp
	move.l __ZL2ty,(%sp)
	move.l __ZL2tx,-(%sp)
	jsr rapLocate
	moveq #1,%d0
	move.l %d0,__ZL6scroll
	addq.l #8,%sp
	unlk %fp
	rts
	.globl	_BCX_TmpStr_buffer
	.bss
_BCX_TmpStr_buffer:
	.skip 256
	.globl	colliders
	.data
	.even
colliders:
	.long	raptor_collisionlist
	.globl	sprite
	.even
sprite:
	.long	RAPTOR_sprite_table
.lcomm __ZL2tx,4
.lcomm __ZL2ty,4
.lcomm __ZL6scroll,4
.lcomm __ZL6winner,2048
.lcomm __ZL2v1,2048
.lcomm __ZL2v2,2048
.lcomm __ZL2v3,2048
.lcomm __ZL2v4,2048
.lcomm __ZL2v5,2048
.lcomm __ZL2v6,2048
.lcomm __ZL4pad1,4
