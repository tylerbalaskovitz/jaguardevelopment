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
.LC1:
	.ascii " is the winner!\0"
.LC2:
	.ascii "Congratulations!\0"
.LC3:
	.ascii "%s%s%s%s\0"
.LC4:
	.ascii "Who will be today's winner?\0"
	.even
	.globl	__Z12ScrollStringPc
__Z12ScrollStringPc:
	link.w %fp,#0
	move.l %d2,-(%sp)
	move.l 8(%fp),%d2
	moveq #1,%d0
	cmp.l __ZL9scrolling.l,%d0
	jeq .L17
	move.l __ZL2ty,-(%sp)
	move.l __ZL2tx,-(%sp)
	jsr rapLocate
	move.l #.LC4,_js_r_textbuffer
	addq.l #8,%sp
	jsr _rapPrint
	move.l -4(%fp),%d2
	unlk %fp
	rts
.L17:
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
	jcc .L12
	clr.l __ZL6spaces
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
.L18:
	move.l -4(%fp),%d2
	unlk %fp
	rts
.L12:
	moveq #2,%d0
	move.l %d0,__ZL6spaces
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
	jra .L18
	.even
	.globl	__Z9writeNamev
__Z9writeNamev:
	link.w %fp,#0
	moveq #1,%d0
	move.l %d0,__ZL12screenNumber
	unlk %fp
	rts
	.even
	.globl	__Z18selectWinnerKeypadv
__Z18selectWinnerKeypadv:
	link.w %fp,#0
	move.l %d2,-(%sp)
	move.l __ZL4pad1,%d2
	move.l %d2,%d0
	and.l JAGPAD_1,%d0
	jne .L30
	move.l %d2,%d0
	and.l JAGPAD_2,%d0
	jne .L31
.L23:
	move.l %d2,%d0
	and.l JAGPAD_3,%d0
	jne .L32
.L24:
	move.l %d2,%d0
	and.l JAGPAD_4,%d0
	jne .L33
.L25:
	move.l %d2,%d0
	and.l JAGPAD_5,%d0
	jne .L34
.L26:
	and.l JAGPAD_6,%d2
	jne .L35
.L28:
	move.l -4(%fp),%d2
	unlk %fp
	rts
.L35:
	pea __ZL7players+10240
	pea __ZL6winner
	jsr _strcpy
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	move.l -4(%fp),%d2
	unlk %fp
	rts
.L34:
	pea __ZL7players+8192
	pea __ZL6winner
	jsr _strcpy
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	and.l JAGPAD_6,%d2
	jeq .L28
	jra .L35
.L33:
	pea __ZL7players+6144
	pea __ZL6winner
	jsr _strcpy
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	move.l %d2,%d0
	and.l JAGPAD_5,%d0
	jeq .L26
	jra .L34
.L32:
	pea __ZL7players+4096
	pea __ZL6winner
	jsr _strcpy
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	move.l %d2,%d0
	and.l JAGPAD_4,%d0
	jeq .L25
	jra .L33
.L31:
	pea __ZL7players+2048
	pea __ZL6winner
	jsr _strcpy
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	move.l %d2,%d0
	and.l JAGPAD_3,%d0
	jeq .L24
	jra .L32
.L30:
	pea __ZL7players
	pea __ZL6winner
	jsr _strcpy
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	move.l %d2,%d0
	and.l JAGPAD_2,%d0
	jeq .L23
	jra .L31
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
	clr.l __ZL12screenNumber
	clr.l _jsfFontIndx
	moveq #1,%d1
	move.l %d1,_jsfFontSize
	pea 12.w
	jsr __Z6Squarei
	move.l %d0,__ZL9scrolling
	addq.l #4,%sp
	lea jsfGetPad,%a3
	move.l #rapLocate,%d3
	move.l #_strlen,%d5
	move.l #_BCX_TmpStr_buffer,%d6
	move.l #ee_printf,%d4
	move.l #_rapPrint,%d2
	lea _jsfVsync,%a2
	lea __Z18selectWinnerKeypadv,%a5
	lea _cls,%a4
	pea 1.w
	jsr (%a3)
	move.l %d0,__ZL4pad1
	addq.l #4,%sp
	tst.l __ZL12screenNumber
	jeq .L47
.L38:
	move.l %d0,%d1
	and.l JAGPAD_HASH,%d1
	jne .L48
.L43:
	and.l JAGPAD_STAR,%d0
	jne .L49
.L44:
	clr.l -(%sp)
	jsr (%a2)
	addq.l #4,%sp
.L50:
	pea 1.w
	jsr (%a3)
	move.l %d0,__ZL4pad1
	addq.l #4,%sp
	tst.l __ZL12screenNumber
	jne .L38
	jra .L47
.L49:
	jsr (%a4)
	moveq #1,%d0
	move.l %d0,__ZL12screenNumber
	clr.l -(%sp)
	jsr (%a2)
	addq.l #4,%sp
	jra .L50
.L48:
	jsr (%a4)
	clr.l __ZL12screenNumber
	move.l __ZL4pad1,%d0
	and.l JAGPAD_STAR,%d0
	jeq .L44
	jra .L49
.L47:
	moveq #1,%d0
	cmp.l __ZL9scrolling.l,%d0
	jeq .L51
	move.l __ZL2ty,-(%sp)
	move.l __ZL2tx,-(%sp)
	move.l %d3,%a0
	jsr (%a0)
	move.l #.LC4,_js_r_textbuffer
	addq.l #8,%sp
	move.l %d2,%a0
	jsr (%a0)
	jsr (%a5)
	move.l __ZL4pad1,%d0
.L52:
	move.l %d0,%d1
	and.l JAGPAD_HASH,%d1
	jeq .L43
	jra .L48
.L51:
	move.l __ZL2tx,%d0
	subq.l #2,%d0
	move.l %d0,__ZL2tx
	move.l __ZL2ty,-(%sp)
	move.l %d0,-(%sp)
	move.l %d3,%a0
	jsr (%a0)
	pea __ZL6winner
	move.l %d5,%a0
	jsr (%a0)
	lea (12,%sp),%sp
	moveq #8,%d1
	cmp.l %d0,%d1
	jcc .L40
	clr.l __ZL6spaces
	clr.b _BCX_TmpStr_buffer+1
	pea _BCX_TmpStr_buffer
	pea .LC1
	pea __ZL6winner
	pea .LC2
	pea .LC3
	move.l %d4,%a0
	jsr (%a0)
	move.l %d0,_js_r_textbuffer
	lea (20,%sp),%sp
	move.l %d2,%a0
	jsr (%a0)
	clr.l -(%sp)
	jsr (%a2)
	addq.l #4,%sp
.L53:
	jsr (%a5)
	move.l __ZL4pad1,%d0
	jra .L52
.L40:
	moveq #2,%d0
	move.l %d0,__ZL6spaces
	clr.b _BCX_TmpStr_buffer+2
	move.b #32,_BCX_TmpStr_buffer
	move.l %d6,%a0
	move.b #32,1(%a0)
	move.l #_BCX_TmpStr_buffer,%d6
	pea _BCX_TmpStr_buffer
	pea .LC1
	pea __ZL6winner
	pea .LC2
	pea .LC3
	move.l %d4,%a0
	jsr (%a0)
	move.l %d0,_js_r_textbuffer
	lea (20,%sp),%sp
	move.l %d2,%a0
	jsr (%a0)
	clr.l -(%sp)
	jsr (%a2)
	addq.l #4,%sp
	jra .L53
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
.lcomm __ZL6spaces,4
