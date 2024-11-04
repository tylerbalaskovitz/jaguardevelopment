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
	.even
	.globl	__Z3chriiiiiiiiii
__Z3chriiiiiiiiii:
	link.w %fp,#0
	clr.b _BCX_TmpStr_buffer+11
	move.l #_BCX_TmpStr_buffer,%d0
	move.l %d0,%a0
	move.b 11(%fp),(%a0)
	move.b 15(%fp),_BCX_TmpStr_buffer+1
	move.b 19(%fp),_BCX_TmpStr_buffer+2
	move.b 23(%fp),_BCX_TmpStr_buffer+3
	move.b 27(%fp),_BCX_TmpStr_buffer+4
	move.b 31(%fp),_BCX_TmpStr_buffer+5
	move.b 35(%fp),_BCX_TmpStr_buffer+6
	move.b 39(%fp),_BCX_TmpStr_buffer+7
	move.b 43(%fp),_BCX_TmpStr_buffer+8
	move.b 47(%fp),_BCX_TmpStr_buffer+9
	clr.b _BCX_TmpStr_buffer+10
	unlk %fp
	rts
.LC0:
	.ascii "Write your players name\0"
.LC1:
	.ascii "%s\0"
.LC2:
	.ascii "Your name:\0"
.LC3:
	.ascii "%s%s\0"
	.even
	.globl	__Z14registerPlayeriPc
__Z14registerPlayeriPc:
	link.w %fp,#0
	movem.l #56,-(%sp)
	pea 60.w
	pea 10.w
	lea rapLocate,%a4
	jsr (%a4)
	addq.l #4,%sp
	move.l #.LC0,(%sp)
	pea .LC1
	lea ee_printf,%a3
	jsr (%a3)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	lea _rapPrint,%a2
	jsr (%a2)
	pea 75.w
	pea 10.w
	jsr (%a4)
	addq.l #4,%sp
	move.l 12(%fp),(%sp)
	pea .LC2
	pea .LC3
	jsr (%a3)
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	jsr (%a2)
	pea 90.w
	pea 10.w
	jsr (%a4)
	clr.b _BCX_TmpStr_buffer+11
	lea _BCX_TmpStr_buffer,%a0
	move.b 11(%fp),(%a0)
	clr.b _BCX_TmpStr_buffer+1
	clr.b _BCX_TmpStr_buffer+2
	clr.b _BCX_TmpStr_buffer+3
	clr.b _BCX_TmpStr_buffer+4
	clr.b _BCX_TmpStr_buffer+5
	clr.b _BCX_TmpStr_buffer+6
	clr.b _BCX_TmpStr_buffer+7
	clr.b _BCX_TmpStr_buffer+8
	clr.b _BCX_TmpStr_buffer+9
	clr.b _BCX_TmpStr_buffer+10
	addq.l #4,%sp
	move.l %a0,(%sp)
	pea .LC1
	jsr (%a3)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	movem.l -12(%fp),#7168
	unlk %fp
	rts
	.even
	.globl	__Z9clearNamePc
__Z9clearNamePc:
	link.w %fp,#0
	unlk %fp
	rts
	.even
	.globl	__Z9addLetterPci
__Z9addLetterPci:
	link.w %fp,#0
	clr.b _BCX_TmpStr_buffer+11
	lea _BCX_TmpStr_buffer,%a0
	move.b 15(%fp),(%a0)
	clr.b _BCX_TmpStr_buffer+1
	clr.b _BCX_TmpStr_buffer+2
	clr.b _BCX_TmpStr_buffer+3
	clr.b _BCX_TmpStr_buffer+4
	clr.b _BCX_TmpStr_buffer+5
	clr.b _BCX_TmpStr_buffer+6
	clr.b _BCX_TmpStr_buffer+7
	clr.b _BCX_TmpStr_buffer+8
	clr.b _BCX_TmpStr_buffer+9
	clr.b _BCX_TmpStr_buffer+10
	move.l %a0,12(%fp)
	move.l #__ZL12letterHolder,8(%fp)
	unlk %fp
	jra _strcpy
	.even
	.globl	__Z18selectWinnerKeypadi
__Z18selectWinnerKeypadi:
	link.w %fp,#0
	move.l %d2,-(%sp)
	move.l 8(%fp),%d2
	move.l %d2,%d0
	and.l JAGPAD_1,%d0
	jne .L21
	move.l %d2,%d0
	and.l JAGPAD_2,%d0
	jne .L22
.L14:
	move.l %d2,%d0
	and.l JAGPAD_3,%d0
	jne .L23
.L15:
	move.l %d2,%d0
	and.l JAGPAD_4,%d0
	jne .L24
.L16:
	move.l %d2,%d0
	and.l JAGPAD_5,%d0
	jne .L25
.L17:
	and.l JAGPAD_6,%d2
	jne .L26
.L19:
	move.l -4(%fp),%d2
	unlk %fp
	rts
.L26:
	pea __ZL7players+10240
	pea __ZL6winner
	jsr _strcpy
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	move.l -4(%fp),%d2
	unlk %fp
	rts
.L25:
	pea __ZL7players+8192
	pea __ZL6winner
	jsr _strcpy
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	and.l JAGPAD_6,%d2
	jeq .L19
	jra .L26
.L24:
	pea __ZL7players+6144
	pea __ZL6winner
	jsr _strcpy
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	move.l %d2,%d0
	and.l JAGPAD_5,%d0
	jeq .L17
	jra .L25
.L23:
	pea __ZL7players+4096
	pea __ZL6winner
	jsr _strcpy
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	move.l %d2,%d0
	and.l JAGPAD_4,%d0
	jeq .L16
	jra .L24
.L22:
	pea __ZL7players+2048
	pea __ZL6winner
	jsr _strcpy
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	move.l %d2,%d0
	and.l JAGPAD_3,%d0
	jeq .L15
	jra .L23
.L21:
	pea __ZL7players
	pea __ZL6winner
	jsr _strcpy
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	move.l %d2,%d0
	and.l JAGPAD_2,%d0
	jeq .L14
	jra .L22
.LC4:
	.ascii " is the winner!\0"
.LC5:
	.ascii "Congratulations!\0"
.LC6:
	.ascii "%s%s%s%s\0"
.LC7:
	.ascii "Who will be today's winner?\0"
	.even
	.globl	__Z9basicmainv
__Z9basicmainv:
	link.w %fp,#0
	movem.l #16188,-(%sp)
	clr.l __ZL4temp
	clr.b __ZL8tempName
	clr.l __ZL9scrolling
	clr.l _jsfFontIndx
	moveq #1,%d0
	move.l %d0,_jsfFontSize
	moveq #38,%d1
	move.l %d1,__ZL2tx
	move.l #182,__ZL2ty
	clr.b __ZL6winner
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
	move.b #74,__ZL7players+10240
	move.b #97,__ZL7players+10241
	move.b #114,__ZL7players+10242
	move.b #111,__ZL7players+10243
	move.b #100,__ZL7players+10244
	clr.b __ZL7players+10245
	moveq #2,%d2
	move.l %d2,__ZL7intName
	clr.l __ZL12screenNumber
	lea jsfGetPad,%a3
	lea rapLocate,%a5
	move.l #_BCX_TmpStr_buffer,%d7
	move.l #ee_printf,%d5
	lea _rapPrint,%a4
	lea _jsfVsync,%a2
	move.l #__Z18selectWinnerKeypadi,%d6
	move.l #_cls,%d3
	pea 1.w
	jsr (%a3)
	move.l %d0,%d2
	move.l %d0,__ZL4pad1
	move.l __ZL12screenNumber,%d0
	addq.l #4,%sp
	jeq .L43
.L29:
	moveq #1,%d1
	cmp.l %d0,%d1
	jeq .L44
.L34:
	move.l %d2,%d0
	and.l JAGPAD_HASH,%d0
	jne .L45
.L38:
	and.l JAGPAD_STAR,%d2
	jne .L46
.L39:
	clr.l -(%sp)
	jsr (%a2)
	addq.l #4,%sp
.L47:
	pea 1.w
	jsr (%a3)
	move.l %d0,%d2
	move.l %d0,__ZL4pad1
	move.l __ZL12screenNumber,%d0
	addq.l #4,%sp
	jne .L29
	jra .L43
.L46:
	move.l %d3,%a0
	jsr (%a0)
	moveq #1,%d0
	move.l %d0,__ZL12screenNumber
	clr.l -(%sp)
	jsr (%a2)
	addq.l #4,%sp
	jra .L47
.L45:
	move.l %d3,%a0
	jsr (%a0)
	clr.l __ZL12screenNumber
	and.l JAGPAD_STAR,%d2
	jeq .L39
	jra .L46
.L43:
	move.l __ZL2ty,%d1
	move.l __ZL2tx,%d0
	moveq #1,%d2
	cmp.l __ZL9scrolling.l,%d2
	jeq .L48
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	jsr (%a5)
	move.l #.LC7,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a4)
	moveq #1,%d0
	cmp.l __ZL9scrolling.l,%d0
	jeq .L49
.L33:
	move.l __ZL4pad1,%d2
	move.l %d2,-(%sp)
	move.l %d6,%a0
	jsr (%a0)
	move.l __ZL12screenNumber,%d0
	addq.l #4,%sp
.L50:
	moveq #1,%d1
	cmp.l %d0,%d1
	jne .L34
.L44:
	move.l %d2,%d0
	and.l JAGPAD_UP,%d0
	move.l __ZL4temp,%d4
	tst.l %d0
	jeq .L36
	addq.l #1,%d4
	move.l %d4,__ZL4temp
.L36:
	and.l JAGPAD_DOWN,%d2
	jeq .L37
	subq.l #1,%d4
	move.l %d4,__ZL4temp
.L37:
	pea 60.w
	pea 10.w
	jsr (%a5)
	addq.l #4,%sp
	move.l #.LC0,(%sp)
	pea .LC1
	move.l %d5,%a0
	jsr (%a0)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a4)
	pea 75.w
	pea 10.w
	jsr (%a5)
	addq.l #4,%sp
	move.l #__ZL8tempName,(%sp)
	pea .LC2
	pea .LC3
	move.l %d5,%a0
	jsr (%a0)
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	jsr (%a4)
	pea 90.w
	pea 10.w
	jsr (%a5)
	clr.b _BCX_TmpStr_buffer+11
	move.b %d4,_BCX_TmpStr_buffer
	clr.b _BCX_TmpStr_buffer+1
	clr.b _BCX_TmpStr_buffer+2
	clr.b _BCX_TmpStr_buffer+3
	clr.b _BCX_TmpStr_buffer+4
	clr.b _BCX_TmpStr_buffer+5
	clr.b _BCX_TmpStr_buffer+6
	clr.b _BCX_TmpStr_buffer+7
	clr.b _BCX_TmpStr_buffer+8
	clr.b _BCX_TmpStr_buffer+9
	clr.b _BCX_TmpStr_buffer+10
	addq.l #4,%sp
	move.l #_BCX_TmpStr_buffer,(%sp)
	pea .LC1
	move.l %d5,%a0
	jsr (%a0)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a4)
	move.l __ZL4pad1,%d2
	move.l %d2,%d0
	and.l JAGPAD_HASH,%d0
	jeq .L38
	jra .L45
.L49:
	subq.l #2,__ZL2tx
	move.l __ZL4pad1,%d2
	move.l %d2,-(%sp)
	move.l %d6,%a0
	jsr (%a0)
	move.l __ZL12screenNumber,%d0
	addq.l #4,%sp
	jra .L50
.L48:
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	jsr (%a5)
	pea __ZL6winner
	jsr _strlen
	lea (12,%sp),%sp
	moveq #8,%d1
	cmp.l %d0,%d1
	jcs .L51
	clr.b _BCX_TmpStr_buffer+2
	move.b #32,_BCX_TmpStr_buffer
	move.l %d7,%a0
	move.b #32,1(%a0)
	move.l #_BCX_TmpStr_buffer,%d7
	pea _BCX_TmpStr_buffer
	pea .LC4
	pea __ZL6winner
	pea .LC5
	pea .LC6
	move.l %d5,%a0
	jsr (%a0)
	move.l %d0,_js_r_textbuffer
	lea (20,%sp),%sp
	jsr (%a4)
	clr.l -(%sp)
	jsr (%a2)
	addq.l #4,%sp
.L52:
	moveq #1,%d0
	cmp.l __ZL9scrolling.l,%d0
	jne .L33
	jra .L49
.L51:
	clr.b _BCX_TmpStr_buffer+1
	pea _BCX_TmpStr_buffer
	pea .LC4
	pea __ZL6winner
	pea .LC5
	pea .LC6
	move.l %d5,%a0
	jsr (%a0)
	move.l %d0,_js_r_textbuffer
	lea (20,%sp),%sp
	jsr (%a4)
	clr.l -(%sp)
	jsr (%a2)
	addq.l #4,%sp
	jra .L52
	.even
	.globl	__Z15writePlayerNamei
__Z15writePlayerNamei:
	link.w %fp,#0
	move.l 8(%fp),%d0
	move.l %d0,%d1
	and.l JAGPAD_UP,%d1
	jeq .L55
	addq.l #1,__ZL4temp
.L55:
	and.l JAGPAD_DOWN,%d0
	jeq .L57
	subq.l #1,__ZL4temp
.L57:
	unlk %fp
	rts
	.even
	.globl	__Z18changeScreenKeypadi
__Z18changeScreenKeypadi:
	link.w %fp,#0
	move.l %d2,-(%sp)
	move.l 8(%fp),%d2
	move.l %d2,%d0
	and.l JAGPAD_HASH,%d0
	jne .L65
	and.l JAGPAD_STAR,%d2
	jne .L66
.L63:
	move.l -4(%fp),%d2
	unlk %fp
	rts
.L66:
	jsr _cls
	moveq #1,%d0
	move.l %d0,__ZL12screenNumber
	move.l -4(%fp),%d2
	unlk %fp
	rts
.L65:
	jsr _cls
	clr.l __ZL12screenNumber
	and.l JAGPAD_STAR,%d2
	jeq .L63
	jra .L66
	.even
	.globl	__Z12ScrollStringiiiiPc
__Z12ScrollStringiiiiPc:
	link.w %fp,#0
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	move.l 12(%fp),%d0
	move.l 16(%fp),%d1
	move.l 24(%fp),%d2
	moveq #1,%d3
	cmp.l 8(%fp),%d3
	jeq .L74
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	jsr rapLocate
	move.l #.LC7,_js_r_textbuffer
	addq.l #8,%sp
	jsr _rapPrint
	move.l -8(%fp),%d2
	move.l -4(%fp),%d3
	unlk %fp
	rts
.L74:
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	jsr rapLocate
	move.l %d2,-(%sp)
	jsr _strlen
	lea (12,%sp),%sp
	moveq #8,%d1
	cmp.l %d0,%d1
	jcs .L75
	clr.b _BCX_TmpStr_buffer+2
	move.b #32,_BCX_TmpStr_buffer
	move.b #32,_BCX_TmpStr_buffer+1
	pea _BCX_TmpStr_buffer
	pea .LC4
	move.l %d2,-(%sp)
	pea .LC5
	pea .LC6
	jsr ee_printf
	move.l %d0,_js_r_textbuffer
	lea (20,%sp),%sp
	jsr _rapPrint
	clr.l -(%sp)
	jsr _jsfVsync
	addq.l #4,%sp
.L76:
	move.l -8(%fp),%d2
	move.l -4(%fp),%d3
	unlk %fp
	rts
.L75:
	clr.b _BCX_TmpStr_buffer+1
	pea _BCX_TmpStr_buffer
	pea .LC4
	move.l %d2,-(%sp)
	pea .LC5
	pea .LC6
	jsr ee_printf
	move.l %d0,_js_r_textbuffer
	lea (20,%sp),%sp
	jsr _rapPrint
	clr.l -(%sp)
	jsr _jsfVsync
	addq.l #4,%sp
	jra .L76
	.even
	.globl	__Z9writeNamev
__Z9writeNamev:
	link.w %fp,#0
	moveq #1,%d0
	move.l %d0,__ZL12screenNumber
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
.lcomm __ZL4temp,4
.lcomm __ZL8tempName,2048
.lcomm __ZL9scrolling,4
.lcomm __ZL2tx,4
.lcomm __ZL2ty,4
.lcomm __ZL6winner,2048
.lcomm __ZL7players,12288
.lcomm __ZL7intName,4
.lcomm __ZL12screenNumber,4
.lcomm __ZL4pad1,4
.lcomm __ZL12letterHolder,2048
