#NO_APP
	.text
.LC0:
	.ascii " is the winner!\0"
.LC1:
	.ascii "Congratulations!\0"
.LC2:
	.ascii "%s%s%s%s\0"
.LC3:
	.ascii "Who will be today's winner?\0"
	.even
	.globl	__Z9basicmainv
__Z9basicmainv:
	link.w %fp,#0
	movem.l #15932,-(%sp)
	clr.b __ZL6winner
	moveq #38,%d0
	move.l %d0,__ZL2tx
	move.l #182,__ZL2ty
	move.b #84,__ZL2p1
	move.b #121,__ZL2p1+1
	move.b #108,__ZL2p1+2
	move.b #101,__ZL2p1+3
	move.b #114,__ZL2p1+4
	clr.b __ZL2p1+5
	move.b #76,__ZL2p2
	move.b #111,__ZL2p2+1
	move.b #118,__ZL2p2+2
	move.b #105,__ZL2p2+3
	move.b #110,__ZL2p2+4
	move.b #103,__ZL2p2+5
	clr.b __ZL2p2+6
	move.b #74,__ZL2p3
	move.b #111,__ZL2p3+1
	move.b #104,__ZL2p3+2
	move.b #110,__ZL2p3+3
	clr.b __ZL2p3+4
	move.b #78,__ZL2p4
	move.b #97,__ZL2p4+1
	move.b #118,__ZL2p4+2
	move.b #114,__ZL2p4+3
	move.b #97,__ZL2p4+4
	move.b #106,__ZL2p4+5
	clr.b __ZL2p4+6
	move.b #77,__ZL2p5
	move.b #97,__ZL2p5+1
	move.b #116,__ZL2p5+2
	move.b #116,__ZL2p5+3
	clr.b __ZL2p5+4
	move.b #67,__ZL2p6
	move.b #104,__ZL2p6+1
	move.b #114,__ZL2p6+2
	move.b #105,__ZL2p6+3
	move.b #115,__ZL2p6+4
	move.b #116,__ZL2p6+5
	move.b #105,__ZL2p6+6
	move.b #97,__ZL2p6+7
	move.b #110,__ZL2p6+8
	clr.b __ZL2p6+9
	clr.l __ZL9scrolling
	clr.l _jsfFontIndx
	moveq #1,%d1
	move.l %d1,_jsfFontSize
	move.b #38,%d1
	move.w #182,%a0
	clr.b %d0
	move.l #rapLocate,%d3
	move.l #_strlen,%d6
	move.l #_BCX_TmpStr_buffer,%d5
	move.l #ee_printf,%d4
	lea _rapPrint,%a5
	lea _jsfVsync,%a3
	lea jsfGetPad,%a4
	lea _strcpy,%a2
	moveq #1,%d2
	cmp.l %d0,%d2
	jeq .L14
.L2:
	move.l %a0,-(%sp)
	move.l %d1,-(%sp)
	move.l %d3,%a0
	jsr (%a0)
	move.l #.LC3,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a5)
	pea 1.w
	jsr (%a4)
	move.l %d0,%d2
	move.l %d0,__ZL4pad1
	and.l JAGPAD_1,%d0
	addq.l #4,%sp
	jne .L15
.L6:
	move.l %d2,%d0
	and.l JAGPAD_2,%d0
	jne .L16
.L7:
	move.l %d2,%d0
	and.l JAGPAD_3,%d0
	jne .L17
.L8:
	move.l %d2,%d0
	and.l JAGPAD_4,%d0
	jne .L18
.L9:
	move.l %d2,%d0
	and.l JAGPAD_5,%d0
	jne .L19
.L10:
	and.l JAGPAD_6,%d2
	jne .L20
.L11:
	clr.l -(%sp)
	jsr (%a3)
	move.l __ZL9scrolling,%d0
	move.l __ZL2ty,%a0
	move.l __ZL2tx,%d1
	addq.l #4,%sp
.L21:
	moveq #1,%d2
	cmp.l %d0,%d2
	jne .L2
.L14:
	subq.l #2,%d1
	move.l %d1,__ZL2tx
	move.l __ZL2ty,-(%sp)
	move.l %d1,-(%sp)
	move.l %d3,%a0
	jsr (%a0)
	pea __ZL6winner
	move.l %d6,%a0
	jsr (%a0)
	lea (12,%sp),%sp
	moveq #8,%d1
	cmp.l %d0,%d1
	jcc .L3
	clr.l __ZL6spaces
	clr.b _BCX_TmpStr_buffer+1
	pea _BCX_TmpStr_buffer
	pea .LC0
	pea __ZL6winner
	pea .LC1
	pea .LC2
	move.l %d4,%a0
	jsr (%a0)
	move.l %d0,_js_r_textbuffer
	lea (20,%sp),%sp
	jsr (%a5)
	clr.l -(%sp)
	jsr (%a3)
	addq.l #4,%sp
.L22:
	pea 1.w
	jsr (%a4)
	move.l %d0,%d2
	move.l %d0,__ZL4pad1
	and.l JAGPAD_1,%d0
	addq.l #4,%sp
	jeq .L6
	jra .L15
.L20:
	pea __ZL2p6
	pea __ZL6winner
	jsr (%a2)
	moveq #1,%d1
	move.l %d1,__ZL9scrolling
	addq.l #8,%sp
	clr.l -(%sp)
	jsr (%a3)
	move.l __ZL9scrolling,%d0
	move.l __ZL2ty,%a0
	move.l __ZL2tx,%d1
	addq.l #4,%sp
	jra .L21
.L19:
	pea __ZL2p5
	pea __ZL6winner
	jsr (%a2)
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	and.l JAGPAD_6,%d2
	jeq .L11
	jra .L20
.L18:
	pea __ZL2p4
	pea __ZL6winner
	jsr (%a2)
	moveq #1,%d1
	move.l %d1,__ZL9scrolling
	addq.l #8,%sp
	move.l %d2,%d0
	and.l JAGPAD_5,%d0
	jeq .L10
	jra .L19
.L17:
	pea __ZL2p3
	pea __ZL6winner
	jsr (%a2)
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	move.l %d2,%d0
	and.l JAGPAD_4,%d0
	jeq .L9
	jra .L18
.L16:
	pea __ZL2p2
	pea __ZL6winner
	jsr (%a2)
	moveq #1,%d1
	move.l %d1,__ZL9scrolling
	addq.l #8,%sp
	move.l %d2,%d0
	and.l JAGPAD_3,%d0
	jeq .L8
	jra .L17
.L15:
	pea __ZL2p1
	pea __ZL6winner
	jsr (%a2)
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	move.l %d2,%d0
	and.l JAGPAD_2,%d0
	jeq .L7
	jra .L16
.L3:
	moveq #2,%d2
	move.l %d2,__ZL6spaces
	clr.b _BCX_TmpStr_buffer+2
	move.b #32,_BCX_TmpStr_buffer
	move.l %d5,%a0
	move.b #32,1(%a0)
	move.l #_BCX_TmpStr_buffer,%d5
	pea _BCX_TmpStr_buffer
	pea .LC0
	pea __ZL6winner
	pea .LC1
	pea .LC2
	move.l %d4,%a0
	jsr (%a0)
	move.l %d0,_js_r_textbuffer
	lea (20,%sp),%sp
	jsr (%a5)
	clr.l -(%sp)
	jsr (%a3)
	addq.l #4,%sp
	jra .L22
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
	jle .L29
	lea _BCX_TmpStr_buffer,%a0
	clr.b (%a0,%d0.l)
	move.l %d0,-(%sp)
	pea 32.w
	move.l %a0,-(%sp)
	jsr _memset
	lea (12,%sp),%sp
	unlk %fp
	rts
.L29:
	clr.b _BCX_TmpStr_buffer+1
	move.l #_BCX_TmpStr_buffer,%d0
	unlk %fp
	rts
	.even
	.globl	__Z12AssignWinnerPc
__Z12AssignWinnerPc:
	link.w %fp,#0
	move.l 8(%fp),-(%sp)
	pea __ZL6winner
	jsr _strcpy
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	unlk %fp
	rts
	.even
	.globl	__Z12ScrollStringPc
__Z12ScrollStringPc:
	link.w %fp,#0
	move.l %d2,-(%sp)
	move.l 8(%fp),%d2
	moveq #1,%d0
	cmp.l __ZL9scrolling.l,%d0
	jeq .L39
	move.l __ZL2ty,-(%sp)
	move.l __ZL2tx,-(%sp)
	jsr rapLocate
	move.l #.LC3,_js_r_textbuffer
	addq.l #8,%sp
	jsr _rapPrint
	move.l -4(%fp),%d2
	unlk %fp
	rts
.L39:
	move.l __ZL2tx,%d0
	subq.l #2,%d0
	move.l %d0,__ZL2tx
	move.l __ZL2ty,-(%sp)
	move.l %d0,-(%sp)
	jsr rapLocate
	move.l %d2,-(%sp)
	jsr _strlen
	lea (12,%sp),%sp
	moveq #8,%d1
	cmp.l %d0,%d1
	jcc .L34
	clr.l __ZL6spaces
	clr.b _BCX_TmpStr_buffer+1
	pea _BCX_TmpStr_buffer
	pea .LC0
	move.l %d2,-(%sp)
	pea .LC1
	pea .LC2
	jsr ee_printf
	move.l %d0,_js_r_textbuffer
	lea (20,%sp),%sp
	jsr _rapPrint
	clr.l -(%sp)
	jsr _jsfVsync
	addq.l #4,%sp
.L40:
	move.l -4(%fp),%d2
	unlk %fp
	rts
.L34:
	moveq #2,%d0
	move.l %d0,__ZL6spaces
	clr.b _BCX_TmpStr_buffer+2
	move.b #32,_BCX_TmpStr_buffer
	move.b #32,_BCX_TmpStr_buffer+1
	pea _BCX_TmpStr_buffer
	pea .LC0
	move.l %d2,-(%sp)
	pea .LC1
	pea .LC2
	jsr ee_printf
	move.l %d0,_js_r_textbuffer
	lea (20,%sp),%sp
	jsr _rapPrint
	clr.l -(%sp)
	jsr _jsfVsync
	addq.l #4,%sp
	jra .L40
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
.lcomm __ZL6winner,2048
.lcomm __ZL2tx,4
.lcomm __ZL2ty,4
.lcomm __ZL2p1,2048
.lcomm __ZL2p2,2048
.lcomm __ZL2p3,2048
.lcomm __ZL2p4,2048
.lcomm __ZL2p5,2048
.lcomm __ZL2p6,2048
.lcomm __ZL9scrolling,4
.lcomm __ZL4pad1,4
.lcomm __ZL6spaces,4
