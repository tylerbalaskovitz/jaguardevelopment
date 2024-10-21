#NO_APP
	.text
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
	jle .L6
	lea _BCX_TmpStr_buffer,%a0
	clr.b (%a0,%d0.l)
	move.l %d0,-(%sp)
	pea 32.w
	move.l %a0,-(%sp)
	jsr _memset
	lea (12,%sp),%sp
	unlk %fp
	rts
.L6:
	clr.b _BCX_TmpStr_buffer+1
	move.l #_BCX_TmpStr_buffer,%d0
	unlk %fp
	rts
.LC0:
	.ascii "% .15G\0"
	.even
	.globl	__Z6Squarei
__Z6Squarei:
	link.w %fp,#0
	move.l 8(%fp),%d0
	move.l %d0,-(%sp)
	move.l %d0,-(%sp)
	jsr ___mulsi3
	addq.l #4,%sp
	move.l %d0,(%sp)
	jsr ___floatsidf
	move.l %d1,(%sp)
	move.l %d0,-(%sp)
	pea .LC0
	jsr ee_printf
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	jsr _rapPrint
	unlk %fp
	rts
	.even
	.globl	__Z18selectWinnerKeypadi
__Z18selectWinnerKeypadi:
	link.w %fp,#0
	move.l %d2,-(%sp)
	move.l 8(%fp),%d2
	move.l %d2,%d0
	and.l JAGPAD_1,%d0
	jne .L18
	move.l %d2,%d0
	and.l JAGPAD_2,%d0
	jne .L19
.L11:
	move.l %d2,%d0
	and.l JAGPAD_3,%d0
	jne .L20
.L12:
	move.l %d2,%d0
	and.l JAGPAD_4,%d0
	jne .L21
.L13:
	move.l %d2,%d0
	and.l JAGPAD_5,%d0
	jne .L22
.L14:
	and.l JAGPAD_6,%d2
	jne .L23
.L16:
	move.l -4(%fp),%d2
	unlk %fp
	rts
.L23:
	pea __ZL7players+10240
	pea __ZL6winner
	jsr _strcpy
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	move.l -4(%fp),%d2
	unlk %fp
	rts
.L22:
	pea __ZL7players+8192
	pea __ZL6winner
	jsr _strcpy
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	and.l JAGPAD_6,%d2
	jeq .L16
	jra .L23
.L21:
	pea __ZL7players+6144
	pea __ZL6winner
	jsr _strcpy
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	move.l %d2,%d0
	and.l JAGPAD_5,%d0
	jeq .L14
	jra .L22
.L20:
	pea __ZL7players+4096
	pea __ZL6winner
	jsr _strcpy
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	move.l %d2,%d0
	and.l JAGPAD_4,%d0
	jeq .L13
	jra .L21
.L19:
	pea __ZL7players+2048
	pea __ZL6winner
	jsr _strcpy
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	move.l %d2,%d0
	and.l JAGPAD_3,%d0
	jeq .L12
	jra .L20
.L18:
	pea __ZL7players
	pea __ZL6winner
	jsr _strcpy
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	move.l %d2,%d0
	and.l JAGPAD_2,%d0
	jeq .L11
	jra .L19
.LC1:
	.ascii " is the winner!\0"
.LC2:
	.ascii "Congratulations!\0"
.LC3:
	.ascii "%s%s%s%s\0"
.LC4:
	.ascii "Who will be today's winner?\0"
	.even
	.globl	__Z9basicmainv
__Z9basicmainv:
	link.w %fp,#0
	movem.l #16188,-(%sp)
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
	clr.l __ZL12screenNumber
	clr.l _jsfFontIndx
	moveq #1,%d1
	move.l %d1,_jsfFontSize
	pea 12.w
	jsr __Z6Squarei
	move.l %d0,__ZL9scrolling
	addq.l #4,%sp
	lea jsfGetPad,%a3
	move.l #rapLocate,%d4
	move.l #_strlen,%d7
	move.l #_BCX_TmpStr_buffer,%d5
	move.l #ee_printf,%d6
	move.l #_rapPrint,%d3
	lea _jsfVsync,%a2
	lea __Z18selectWinnerKeypadi,%a5
	lea _cls,%a4
	pea 1.w
	jsr (%a3)
	move.l %d0,%d2
	move.l %d0,__ZL4pad1
	addq.l #4,%sp
	tst.l __ZL12screenNumber
	jeq .L35
.L26:
	move.l %d2,%d0
	and.l JAGPAD_HASH,%d0
	jne .L36
.L30:
	and.l JAGPAD_STAR,%d2
	jne .L37
.L31:
	clr.l -(%sp)
	jsr (%a2)
	addq.l #4,%sp
.L38:
	pea 1.w
	jsr (%a3)
	move.l %d0,%d2
	move.l %d0,__ZL4pad1
	addq.l #4,%sp
	tst.l __ZL12screenNumber
	jne .L26
	jra .L35
.L37:
	jsr (%a4)
	moveq #1,%d0
	move.l %d0,__ZL12screenNumber
	clr.l -(%sp)
	jsr (%a2)
	addq.l #4,%sp
	jra .L38
.L36:
	jsr (%a4)
	clr.l __ZL12screenNumber
	move.l __ZL4pad1,%d2
	and.l JAGPAD_STAR,%d2
	jeq .L31
	jra .L37
.L35:
	move.l __ZL2ty,%d0
	move.l __ZL2tx,%a0
	moveq #1,%d1
	cmp.l __ZL9scrolling.l,%d1
	jeq .L39
	move.l %d0,-(%sp)
	move.l %a0,-(%sp)
	move.l %d4,%a0
	jsr (%a0)
	move.l #.LC4,_js_r_textbuffer
	addq.l #8,%sp
	move.l %d3,%a0
	jsr (%a0)
	move.l __ZL4pad1,%d2
	move.l %d2,-(%sp)
	jsr (%a5)
	addq.l #4,%sp
.L41:
	move.l %d2,%d0
	and.l JAGPAD_HASH,%d0
	jeq .L30
	jra .L36
.L39:
	move.l %d0,-(%sp)
	pea -2(%a0)
	move.l %d4,%a0
	jsr (%a0)
	pea __ZL6winner
	move.l %d7,%a0
	jsr (%a0)
	lea (12,%sp),%sp
	moveq #8,%d1
	cmp.l %d0,%d1
	jcs .L40
	clr.b _BCX_TmpStr_buffer+2
	move.b #32,_BCX_TmpStr_buffer
	move.l %d5,%a0
	move.b #32,1(%a0)
	move.l #_BCX_TmpStr_buffer,%d5
	pea _BCX_TmpStr_buffer
	pea .LC1
	pea __ZL6winner
	pea .LC2
	pea .LC3
	move.l %d6,%a0
	jsr (%a0)
	move.l %d0,_js_r_textbuffer
	lea (20,%sp),%sp
	move.l %d3,%a0
	jsr (%a0)
	clr.l -(%sp)
	jsr (%a2)
	addq.l #4,%sp
.L42:
	move.l __ZL4pad1,%d2
	move.l %d2,-(%sp)
	jsr (%a5)
	addq.l #4,%sp
	jra .L41
.L40:
	clr.b _BCX_TmpStr_buffer+1
	pea _BCX_TmpStr_buffer
	pea .LC1
	pea __ZL6winner
	pea .LC2
	pea .LC3
	move.l %d6,%a0
	jsr (%a0)
	move.l %d0,_js_r_textbuffer
	lea (20,%sp),%sp
	move.l %d3,%a0
	jsr (%a0)
	clr.l -(%sp)
	jsr (%a2)
	addq.l #4,%sp
	jra .L42
	.even
	.globl	__Z12AssignWinneriPcS_
__Z12AssignWinneriPcS_:
	link.w %fp,#0
	unlk %fp
	rts
	.even
	.globl	__Z12ScrollStringiiiiPc
__Z12ScrollStringiiiiPc:
	link.w %fp,#0
	move.l %d2,-(%sp)
	move.l 12(%fp),%a0
	move.l 16(%fp),%d0
	move.l 24(%fp),%d2
	moveq #1,%d1
	cmp.l 8(%fp),%d1
	jeq .L51
	move.l %d0,-(%sp)
	move.l %a0,-(%sp)
	jsr rapLocate
	move.l #.LC4,_js_r_textbuffer
	addq.l #8,%sp
	jsr _rapPrint
	move.l -4(%fp),%d2
	unlk %fp
	rts
.L51:
	move.l %d0,-(%sp)
	pea -2(%a0)
	jsr rapLocate
	move.l %d2,-(%sp)
	jsr _strlen
	lea (12,%sp),%sp
	moveq #8,%d1
	cmp.l %d0,%d1
	jcs .L52
	clr.b _BCX_TmpStr_buffer+2
	move.b #32,_BCX_TmpStr_buffer
	move.b #32,_BCX_TmpStr_buffer+1
	pea _BCX_TmpStr_buffer
	pea .LC1
	move.l %d2,-(%sp)
	pea .LC2
	pea .LC3
	jsr ee_printf
	move.l %d0,_js_r_textbuffer
	lea (20,%sp),%sp
	jsr _rapPrint
	clr.l -(%sp)
	jsr _jsfVsync
	addq.l #4,%sp
.L53:
	move.l -4(%fp),%d2
	unlk %fp
	rts
.L52:
	clr.b _BCX_TmpStr_buffer+1
	pea _BCX_TmpStr_buffer
	pea .LC1
	move.l %d2,-(%sp)
	pea .LC2
	pea .LC3
	jsr ee_printf
	move.l %d0,_js_r_textbuffer
	lea (20,%sp),%sp
	jsr _rapPrint
	clr.l -(%sp)
	jsr _jsfVsync
	addq.l #4,%sp
	jra .L53
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
	.globl	__Z9writeNamev
__Z9writeNamev:
	link.w %fp,#0
	moveq #1,%d0
	move.l %d0,__ZL12screenNumber
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
.lcomm __ZL12screenNumber,4
.lcomm __ZL4pad1,4
