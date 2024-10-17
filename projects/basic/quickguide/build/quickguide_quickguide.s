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
	move.b #84,__ZL7players
	move.b #121,__ZL7players+1
	move.b #108,__ZL7players+2
	move.b #101,__ZL7players+3
	move.b #114,__ZL7players+4
	clr.b __ZL7players+5
	move.b #76,__ZL7players+2048
	move.b #111,__ZL7players+2049
	move.b #118,__ZL7players+2050
	move.b #105,__ZL7players+2051
	move.b #110,__ZL7players+2052
	move.b #103,__ZL7players+2053
	clr.b __ZL7players+2054
	move.b #74,__ZL7players+4096
	move.b #111,__ZL7players+4097
	move.b #104,__ZL7players+4098
	move.b #110,__ZL7players+4099
	clr.b __ZL7players+4100
	move.b #78,__ZL7players+6144
	move.b #97,__ZL7players+6145
	move.b #118,__ZL7players+6146
	move.b #114,__ZL7players+6147
	move.b #97,__ZL7players+6148
	move.b #106,__ZL7players+6149
	clr.b __ZL7players+6150
	move.b #77,__ZL7players+8192
	move.b #97,__ZL7players+8193
	move.b #116,__ZL7players+8194
	move.b #116,__ZL7players+8195
	clr.b __ZL7players+8196
	move.b #67,__ZL7players+10240
	move.b #104,__ZL7players+10241
	move.b #114,__ZL7players+10242
	move.b #105,__ZL7players+10243
	move.b #115,__ZL7players+10244
	move.b #116,__ZL7players+10245
	move.b #105,__ZL7players+10246
	move.b #97,__ZL7players+10247
	move.b #110,__ZL7players+10248
	clr.b __ZL7players+10249
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
	jeq .L15
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
	jne .L16
.L6:
	move.l %d2,%d0
	and.l JAGPAD_2,%d0
	jne .L17
.L7:
	move.l %d2,%d0
	and.l JAGPAD_3,%d0
	jne .L18
.L8:
	move.l %d2,%d0
	and.l JAGPAD_4,%d0
	jne .L19
.L9:
	move.l %d2,%d0
	and.l JAGPAD_5,%d0
	jne .L20
.L10:
	move.l %d2,%d0
	and.l JAGPAD_6,%d0
	jne .L21
.L11:
	and.l JAGPAD_STAR,%d2
	jne .L22
.L12:
	clr.l -(%sp)
	jsr (%a3)
	move.l __ZL9scrolling,%d0
	move.l __ZL2ty,%a0
	move.l __ZL2tx,%d1
	addq.l #4,%sp
.L23:
	moveq #1,%d2
	cmp.l %d0,%d2
	jne .L2
.L15:
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
.L24:
	pea 1.w
	jsr (%a4)
	move.l %d0,%d2
	move.l %d0,__ZL4pad1
	and.l JAGPAD_1,%d0
	addq.l #4,%sp
	jeq .L6
	jra .L16
.L22:
	pea __ZL7players
	pea __ZL6winner
	jsr (%a2)
	moveq #1,%d2
	move.l %d2,__ZL9scrolling
	addq.l #8,%sp
	clr.l -(%sp)
	jsr (%a3)
	move.l __ZL9scrolling,%d0
	move.l __ZL2ty,%a0
	move.l __ZL2tx,%d1
	addq.l #4,%sp
	jra .L23
.L21:
	pea __ZL7players+10240
	pea __ZL6winner
	jsr (%a2)
	moveq #1,%d1
	move.l %d1,__ZL9scrolling
	addq.l #8,%sp
	and.l JAGPAD_STAR,%d2
	jeq .L12
	jra .L22
.L20:
	pea __ZL7players+8192
	pea __ZL6winner
	jsr (%a2)
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	move.l %d2,%d0
	and.l JAGPAD_6,%d0
	jeq .L11
	jra .L21
.L19:
	pea __ZL7players+6144
	pea __ZL6winner
	jsr (%a2)
	moveq #1,%d1
	move.l %d1,__ZL9scrolling
	addq.l #8,%sp
	move.l %d2,%d0
	and.l JAGPAD_5,%d0
	jeq .L10
	jra .L20
.L18:
	pea __ZL7players+4096
	pea __ZL6winner
	jsr (%a2)
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	move.l %d2,%d0
	and.l JAGPAD_4,%d0
	jeq .L9
	jra .L19
.L17:
	pea __ZL7players+2048
	pea __ZL6winner
	jsr (%a2)
	moveq #1,%d1
	move.l %d1,__ZL9scrolling
	addq.l #8,%sp
	move.l %d2,%d0
	and.l JAGPAD_3,%d0
	jeq .L8
	jra .L18
.L16:
	pea __ZL7players
	pea __ZL6winner
	jsr (%a2)
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	move.l %d2,%d0
	and.l JAGPAD_2,%d0
	jeq .L7
	jra .L17
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
	jra .L24
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
	jeq .L41
	move.l __ZL2ty,-(%sp)
	move.l __ZL2tx,-(%sp)
	jsr rapLocate
	move.l #.LC3,_js_r_textbuffer
	addq.l #8,%sp
	jsr _rapPrint
	move.l -4(%fp),%d2
	unlk %fp
	rts
.L41:
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
	jcc .L36
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
.L42:
	move.l -4(%fp),%d2
	unlk %fp
	rts
.L36:
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
	jra .L42
	.even
	.globl	__Z9WriteNamev
__Z9WriteNamev:
	link.w %fp,#0
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
.lcomm __ZL6winner,2048
.lcomm __ZL2tx,4
.lcomm __ZL2ty,4
.lcomm __ZL7players,12288
.lcomm __ZL9scrolling,4
.lcomm __ZL4pad1,4
.lcomm __ZL6spaces,4
