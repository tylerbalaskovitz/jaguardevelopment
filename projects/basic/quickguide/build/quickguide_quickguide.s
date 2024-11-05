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
	.ascii "'s name\0"
.LC1:
	.ascii "Write player \0"
.LC2:
	.ascii "%s% d%s\0"
.LC3:
	.ascii "%s\0"
.LC4:
	.ascii "Current Name: \0"
.LC5:
	.ascii "%s%s\0"
.LC6:
	.ascii "New name:\0"
.LC7:
	.ascii "ASCII value as \0"
.LC8:
	.ascii "%s% d\0"
	.even
	.globl	__Z14registerPlayeriPc
__Z14registerPlayeriPc:
	link.w %fp,#0
	movem.l #12348,-(%sp)
	move.l 8(%fp),%d2
	move.l __ZL5tempY,-(%sp)
	pea 10.w
	lea rapLocate,%a4
	jsr (%a4)
	addq.l #4,%sp
	move.l #.LC0,(%sp)
	move.l __ZL14selectedPlayer,%d0
	addq.l #1,%d0
	move.l %d0,-(%sp)
	pea .LC1
	pea .LC2
	lea ee_printf,%a3
	jsr (%a3)
	move.l %d0,_js_r_textbuffer
	lea (16,%sp),%sp
	lea _rapPrint,%a2
	jsr (%a2)
	move.l __ZL5tempY,%d0
	add.l __ZL7yGrowth,%d0
	move.l %d0,__ZL5tempY
	move.l %d0,-(%sp)
	pea 10.w
	jsr (%a4)
	move.l #_BCX_TmpStr_buffer+20,%d3
	move.l %d3,%a0
	clr.b (%a0)
	pea 20.w
	pea 32.w
	pea _BCX_TmpStr_buffer
	lea _memset,%a5
	jsr (%a5)
	lea (16,%sp),%sp
	move.l %d0,(%sp)
	pea .LC3
	jsr (%a3)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	move.l __ZL14selectedPlayer,%d0
	moveq #11,%d1
	lsl.l %d1,%d0
	add.l #__ZL7players,%d0
	move.l %d0,-(%sp)
	pea .LC4
	pea .LC5
	jsr (%a3)
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	jsr (%a2)
	move.l __ZL5tempY,%d0
	add.l __ZL7yGrowth,%d0
	move.l %d0,__ZL5tempY
	move.l %d0,-(%sp)
	pea 10.w
	jsr (%a4)
	move.l %d3,%a0
	clr.b (%a0)
	pea 20.w
	pea 32.w
	pea _BCX_TmpStr_buffer
	jsr (%a5)
	lea (16,%sp),%sp
	move.l %d0,(%sp)
	pea .LC3
	jsr (%a3)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	move.l 12(%fp),-(%sp)
	pea .LC6
	pea .LC5
	jsr (%a3)
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	jsr (%a2)
	move.l __ZL5tempY,%d0
	add.l __ZL7yGrowth,%d0
	move.l %d0,__ZL5tempY
	move.l %d0,-(%sp)
	pea 10.w
	jsr (%a4)
	clr.b _BCX_TmpStr_buffer+11
	lea _BCX_TmpStr_buffer,%a0
	move.b %d2,(%a0)
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
	pea .LC3
	jsr (%a3)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	move.l __ZL5tempY,%d0
	add.l __ZL7yGrowth,%d0
	move.l %d0,__ZL5tempY
	move.l %d0,-(%sp)
	pea 10.w
	jsr (%a4)
	addq.l #4,%sp
	move.l %d2,(%sp)
	pea .LC7
	pea .LC8
	jsr (%a3)
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	jsr (%a2)
	move.l __ZL10tempYStart,__ZL5tempY
	movem.l -24(%fp),#15372
	unlk %fp
	rts
	.even
	.globl	__Z11confirmNamei
__Z11confirmNamei:
	link.w %fp,#0
	move.l %d2,-(%sp)
	move.l 8(%fp),%d2
	moveq #11,%d0
	lsl.l %d0,%d2
	add.l #__ZL7players,%d2
	pea 2048.w
	clr.l -(%sp)
	move.l %d2,-(%sp)
	jsr _memset
	pea __ZL8tempName
	move.l %d2,-(%sp)
	jsr _strcat
	move.l %d0,-(%sp)
	move.l %d2,-(%sp)
	jsr _strcpy
	lea (28,%sp),%sp
	move.l -4(%fp),%d2
	unlk %fp
	rts
	.even
	.globl	__Z9clearNamev
__Z9clearNamev:
	link.w %fp,#0
	pea 2048.w
	clr.l -(%sp)
	pea __ZL8tempName
	jsr _memset
	lea (12,%sp),%sp
	unlk %fp
	rts
	.even
	.globl	__Z9addLetterPc
__Z9addLetterPc:
	link.w %fp,#0
	move.l __ZL10inputSpeed,%d0
	addq.l #1,%d0
	move.l %d0,__ZL10inputSpeed
	moveq #5,%d1
	cmp.l %d0,%d1
	jlt .L16
	unlk %fp
	rts
.L16:
	clr.b _BCX_TmpStr_buffer+11
	move.b __ZL4temp+3,_BCX_TmpStr_buffer
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
	pea _BCX_TmpStr_buffer
	pea __ZL12letterHolder
	jsr _strcpy
	pea __ZL12letterHolder
	move.l 8(%fp),-(%sp)
	jsr _strcat
	clr.l __ZL10inputSpeed
	lea (16,%sp),%sp
	unlk %fp
	rts
	.even
	.globl	__Z10checkTempsv
__Z10checkTempsv:
	link.w %fp,#0
	move.l __ZL9speedTemp,%d0
	moveq #5,%d1
	cmp.l %d0,%d1
	jge .L19
	clr.l __ZL9speedTemp
	addq.l #1,__ZL4temp
.L20:
	move.l __ZL4temp,%d0
.L22:
	move.l __ZL10lowerASCII,%d1
	cmp.l %d1,%d0
	jge .L23
	move.l %d1,__ZL4temp
	move.l %d1,%d0
.L23:
	move.l __ZL10upperASCII,%d1
	cmp.l %d1,%d0
	jle .L25
	move.l %d1,__ZL4temp
.L25:
	unlk %fp
	rts
.L19:
	moveq #-5,%d1
	cmp.l %d0,%d1
	jle .L20
	clr.l __ZL9speedTemp
	move.l __ZL4temp,%d0
	subq.l #1,%d0
	move.l %d0,__ZL4temp
	jra .L22
	.even
	.globl	__Z18selectWinnerKeypadi
__Z18selectWinnerKeypadi:
	link.w %fp,#0
	move.l %d2,-(%sp)
	move.l 8(%fp),%d2
	move.l %d2,%d0
	and.l JAGPAD_1,%d0
	jne .L37
	move.l %d2,%d0
	and.l JAGPAD_2,%d0
	jne .L38
.L30:
	move.l %d2,%d0
	and.l JAGPAD_3,%d0
	jne .L39
.L31:
	move.l %d2,%d0
	and.l JAGPAD_4,%d0
	jne .L40
.L32:
	move.l %d2,%d0
	and.l JAGPAD_5,%d0
	jne .L41
.L33:
	and.l JAGPAD_6,%d2
	jne .L42
.L35:
	move.l -4(%fp),%d2
	unlk %fp
	rts
.L42:
	pea __ZL7players+10240
	pea __ZL6winner
	jsr _strcpy
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	move.l -4(%fp),%d2
	unlk %fp
	rts
.L41:
	pea __ZL7players+8192
	pea __ZL6winner
	jsr _strcpy
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	and.l JAGPAD_6,%d2
	jeq .L35
	jra .L42
.L40:
	pea __ZL7players+6144
	pea __ZL6winner
	jsr _strcpy
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	move.l %d2,%d0
	and.l JAGPAD_5,%d0
	jeq .L33
	jra .L41
.L39:
	pea __ZL7players+4096
	pea __ZL6winner
	jsr _strcpy
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	move.l %d2,%d0
	and.l JAGPAD_4,%d0
	jeq .L32
	jra .L40
.L38:
	pea __ZL7players+2048
	pea __ZL6winner
	jsr _strcpy
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	move.l %d2,%d0
	and.l JAGPAD_3,%d0
	jeq .L31
	jra .L39
.L37:
	pea __ZL7players
	pea __ZL6winner
	jsr _strcpy
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	move.l %d2,%d0
	and.l JAGPAD_2,%d0
	jeq .L30
	jra .L38
	.even
	.globl	__Z15writePlayerNamei
__Z15writePlayerNamei:
	link.w %fp,#0
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	move.l 8(%fp),%d2
	move.l %d2,%d0
	and.l JAGPAD_UP,%d0
	jne .L68
.L45:
	move.l %d2,%d0
	and.l JAGPAD_DOWN,%d0
	jne .L69
.L51:
	move.l %d2,%d0
	and.l JAGPAD_A,%d0
	jne .L70
.L57:
	move.l %d2,%d0
	and.l JAGPAD_B,%d0
	jne .L71
.L58:
	move.l %d2,%d0
	and.l JAGPAD_C,%d0
	jne .L72
.L59:
	move.l %d2,%d0
	and.l JAGPAD_1,%d0
	jeq .L60
	clr.l __ZL14selectedPlayer
.L60:
	move.l %d2,%d0
	and.l JAGPAD_2,%d0
	jeq .L61
	moveq #1,%d1
	move.l %d1,__ZL14selectedPlayer
.L61:
	move.l %d2,%d0
	and.l JAGPAD_3,%d0
	jeq .L62
	moveq #2,%d0
	move.l %d0,__ZL14selectedPlayer
.L62:
	move.l %d2,%d0
	and.l JAGPAD_4,%d0
	jeq .L63
	moveq #3,%d1
	move.l %d1,__ZL14selectedPlayer
.L63:
	move.l %d2,%d0
	and.l JAGPAD_5,%d0
	jeq .L64
	moveq #4,%d0
	move.l %d0,__ZL14selectedPlayer
.L64:
	and.l JAGPAD_6,%d2
	jeq .L66
	moveq #5,%d1
	move.l %d1,__ZL14selectedPlayer
.L66:
	move.l -8(%fp),%d2
	move.l -4(%fp),%d3
	unlk %fp
	rts
.L72:
	move.l __ZL14selectedPlayer,%d3
	moveq #11,%d0
	lsl.l %d0,%d3
	add.l #__ZL7players,%d3
	pea 2048.w
	clr.l -(%sp)
	move.l %d3,-(%sp)
	jsr _memset
	pea __ZL8tempName
	move.l %d3,-(%sp)
	jsr _strcat
	move.l %d0,-(%sp)
	move.l %d3,-(%sp)
	jsr _strcpy
	lea (28,%sp),%sp
	jra .L59
.L71:
	move.l __ZL10inputSpeed,%d0
	addq.l #1,%d0
	move.l %d0,__ZL10inputSpeed
	moveq #5,%d1
	cmp.l %d0,%d1
	jge .L58
	clr.b _BCX_TmpStr_buffer+11
	move.b __ZL4temp+3,_BCX_TmpStr_buffer
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
	pea _BCX_TmpStr_buffer
	pea __ZL12letterHolder
	jsr _strcpy
	pea __ZL12letterHolder
	pea __ZL8tempName
	jsr _strcat
	clr.l __ZL10inputSpeed
	lea (16,%sp),%sp
	move.l %d2,%d0
	and.l JAGPAD_C,%d0
	jeq .L59
	jra .L72
.L70:
	pea 2048.w
	clr.l -(%sp)
	pea __ZL8tempName
	jsr _memset
	lea (12,%sp),%sp
	move.l %d2,%d0
	and.l JAGPAD_B,%d0
	jeq .L58
	jra .L71
.L69:
	move.l __ZL9speedTemp,%d0
	subq.l #1,%d0
	move.l %d0,__ZL9speedTemp
	moveq #5,%d1
	cmp.l %d0,%d1
	jlt .L73
	moveq #-5,%d1
	cmp.l %d0,%d1
	jle .L53
	clr.l __ZL9speedTemp
	move.l __ZL4temp,%d0
	subq.l #1,%d0
	move.l %d0,__ZL4temp
.L55:
	move.l __ZL10lowerASCII,%d1
	cmp.l %d1,%d0
	jge .L56
	move.l %d1,__ZL4temp
	move.l %d1,%d0
.L56:
	move.l __ZL10upperASCII,%d1
	cmp.l %d1,%d0
	jle .L51
	move.l %d1,__ZL4temp
	move.l %d2,%d0
	and.l JAGPAD_A,%d0
	jeq .L57
	jra .L70
.L68:
	move.l __ZL9speedTemp,%d0
	addq.l #1,%d0
	move.l %d0,__ZL9speedTemp
	moveq #5,%d1
	cmp.l %d0,%d1
	jlt .L74
	moveq #-5,%d1
	cmp.l %d0,%d1
	jle .L47
	clr.l __ZL9speedTemp
	move.l __ZL4temp,%d0
	subq.l #1,%d0
	move.l %d0,__ZL4temp
.L49:
	move.l __ZL10lowerASCII,%d1
	cmp.l %d1,%d0
	jge .L50
	move.l %d1,__ZL4temp
	move.l %d1,%d0
.L50:
	move.l __ZL10upperASCII,%d1
	cmp.l %d1,%d0
	jle .L45
	move.l %d1,__ZL4temp
	move.l %d2,%d0
	and.l JAGPAD_DOWN,%d0
	jeq .L51
	jra .L69
.L74:
	clr.l __ZL9speedTemp
	addq.l #1,__ZL4temp
.L47:
	move.l __ZL4temp,%d0
	jra .L49
.L73:
	clr.l __ZL9speedTemp
	addq.l #1,__ZL4temp
.L53:
	move.l __ZL4temp,%d0
	jra .L55
.LC9:
	.ascii " is the winner!\0"
.LC10:
	.ascii "Congratulations!\0"
.LC11:
	.ascii "%s%s%s%s\0"
.LC12:
	.ascii "Who will be today's winner?\0"
	.even
	.globl	__Z9basicmainv
__Z9basicmainv:
	link.w %fp,#-4
	movem.l #16188,-(%sp)
	moveq #1,%d0
	move.l %d0,__ZL9upperCase
	moveq #65,%d1
	move.l %d1,__ZL10lowerASCII
	moveq #90,%d2
	move.l %d2,__ZL10upperASCII
	clr.l __ZL10inputSpeed
	clr.l __ZL14selectedPlayer
	move.b #6,%d0
	move.l %d0,__ZL11playerLimit
	move.b #60,%d1
	move.l %d1,__ZL10tempYStart
	move.l %d1,__ZL5tempY
	move.b #15,%d2
	move.l %d2,__ZL7yGrowth
	clr.l __ZL9speedTemp
	clr.l __ZL4temp
	clr.b __ZL8tempName
	clr.l __ZL9scrolling
	clr.l _jsfFontIndx
	move.b #1,%d0
	move.l %d0,_jsfFontSize
	move.b #38,%d1
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
	move.b #2,%d2
	move.l %d2,__ZL7intName
	clr.l __ZL12screenNumber
	lea jsfGetPad,%a5
	move.l #rapLocate,%d3
	move.l #_BCX_TmpStr_buffer,-4(%fp)
	lea ee_printf,%a4
	lea _rapPrint,%a2
	lea _jsfVsync,%a3
	move.l #__Z18selectWinnerKeypadi,%d5
	move.l #__Z15writePlayerNamei,%d7
	move.l #_memset,%d6
	move.l #_cls,%d4
	pea 1.w
	jsr (%a5)
	move.l %d0,%d2
	move.l %d0,__ZL4pad1
	move.l __ZL12screenNumber,%d0
	addq.l #4,%sp
	jeq .L88
.L77:
	moveq #1,%d1
	cmp.l %d0,%d1
	jeq .L89
.L82:
	move.l %d2,%d0
	and.l JAGPAD_HASH,%d0
	jne .L90
.L83:
	and.l JAGPAD_STAR,%d2
	jne .L91
.L84:
	clr.l -(%sp)
	jsr (%a3)
	addq.l #4,%sp
.L92:
	pea 1.w
	jsr (%a5)
	move.l %d0,%d2
	move.l %d0,__ZL4pad1
	move.l __ZL12screenNumber,%d0
	addq.l #4,%sp
	jne .L77
	jra .L88
.L91:
	move.l %d4,%a0
	jsr (%a0)
	moveq #1,%d0
	move.l %d0,__ZL12screenNumber
	clr.l -(%sp)
	jsr (%a3)
	addq.l #4,%sp
	jra .L92
.L90:
	move.l %d4,%a0
	jsr (%a0)
	clr.l __ZL12screenNumber
	and.l JAGPAD_STAR,%d2
	jeq .L84
	jra .L91
.L88:
	move.l __ZL2ty,%d1
	move.l __ZL2tx,%d0
	moveq #1,%d2
	cmp.l __ZL9scrolling.l,%d2
	jeq .L93
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	move.l %d3,%a0
	jsr (%a0)
	move.l #.LC12,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	moveq #1,%d0
	cmp.l __ZL9scrolling.l,%d0
	jeq .L94
.L81:
	move.l __ZL4pad1,%d2
	move.l %d2,-(%sp)
	move.l %d5,%a0
	jsr (%a0)
	move.l __ZL12screenNumber,%d0
	addq.l #4,%sp
.L95:
	moveq #1,%d1
	cmp.l %d0,%d1
	jne .L82
.L89:
	move.l %d2,-(%sp)
	move.l %d7,%a0
	jsr (%a0)
	move.l __ZL4temp,%d2
	move.l __ZL5tempY,(%sp)
	pea 10.w
	move.l %d3,%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l #.LC0,(%sp)
	move.l __ZL14selectedPlayer,%d0
	addq.l #1,%d0
	move.l %d0,-(%sp)
	pea .LC1
	pea .LC2
	jsr (%a4)
	move.l %d0,_js_r_textbuffer
	lea (16,%sp),%sp
	jsr (%a2)
	move.l __ZL5tempY,%d0
	add.l __ZL7yGrowth,%d0
	move.l %d0,__ZL5tempY
	move.l %d0,-(%sp)
	pea 10.w
	move.l %d3,%a0
	jsr (%a0)
	clr.b _BCX_TmpStr_buffer+20
	pea 20.w
	pea 32.w
	pea _BCX_TmpStr_buffer
	move.l %d6,%a0
	jsr (%a0)
	lea (16,%sp),%sp
	move.l %d0,(%sp)
	pea .LC3
	jsr (%a4)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	move.l __ZL14selectedPlayer,%d0
	moveq #11,%d1
	lsl.l %d1,%d0
	add.l #__ZL7players,%d0
	move.l %d0,-(%sp)
	pea .LC4
	pea .LC5
	jsr (%a4)
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	jsr (%a2)
	move.l __ZL5tempY,%d0
	add.l __ZL7yGrowth,%d0
	move.l %d0,__ZL5tempY
	move.l %d0,-(%sp)
	pea 10.w
	move.l %d3,%a0
	jsr (%a0)
	clr.b _BCX_TmpStr_buffer+20
	pea 20.w
	pea 32.w
	pea _BCX_TmpStr_buffer
	move.l %d6,%a0
	jsr (%a0)
	lea (16,%sp),%sp
	move.l %d0,(%sp)
	pea .LC3
	jsr (%a4)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	pea __ZL8tempName
	pea .LC6
	pea .LC5
	jsr (%a4)
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	jsr (%a2)
	move.l __ZL5tempY,%d0
	add.l __ZL7yGrowth,%d0
	move.l %d0,__ZL5tempY
	move.l %d0,-(%sp)
	pea 10.w
	move.l %d3,%a0
	jsr (%a0)
	clr.b _BCX_TmpStr_buffer+11
	move.b %d2,_BCX_TmpStr_buffer
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
	pea .LC3
	jsr (%a4)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	move.l __ZL5tempY,%d0
	add.l __ZL7yGrowth,%d0
	move.l %d0,__ZL5tempY
	move.l %d0,-(%sp)
	pea 10.w
	move.l %d3,%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l %d2,(%sp)
	pea .LC7
	pea .LC8
	jsr (%a4)
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	jsr (%a2)
	move.l __ZL10tempYStart,__ZL5tempY
	move.l __ZL4pad1,%d2
	move.l %d2,%d0
	and.l JAGPAD_HASH,%d0
	jeq .L83
	jra .L90
.L94:
	subq.l #2,__ZL2tx
	move.l __ZL4pad1,%d2
	move.l %d2,-(%sp)
	move.l %d5,%a0
	jsr (%a0)
	move.l __ZL12screenNumber,%d0
	addq.l #4,%sp
	jra .L95
.L93:
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	move.l %d3,%a0
	jsr (%a0)
	pea __ZL6winner
	jsr _strlen
	lea (12,%sp),%sp
	moveq #8,%d1
	cmp.l %d0,%d1
	jcs .L96
	clr.b _BCX_TmpStr_buffer+2
	move.b #32,_BCX_TmpStr_buffer
	move.l -4(%fp),%a0
	move.b #32,1(%a0)
	move.l #_BCX_TmpStr_buffer,-4(%fp)
	pea _BCX_TmpStr_buffer
	pea .LC9
	pea __ZL6winner
	pea .LC10
	pea .LC11
	jsr (%a4)
	move.l %d0,_js_r_textbuffer
	lea (20,%sp),%sp
	jsr (%a2)
	clr.l -(%sp)
	jsr (%a3)
	addq.l #4,%sp
.L97:
	moveq #1,%d0
	cmp.l __ZL9scrolling.l,%d0
	jne .L81
	jra .L94
.L96:
	clr.b _BCX_TmpStr_buffer+1
	pea _BCX_TmpStr_buffer
	pea .LC9
	pea __ZL6winner
	pea .LC10
	pea .LC11
	jsr (%a4)
	move.l %d0,_js_r_textbuffer
	lea (20,%sp),%sp
	jsr (%a2)
	clr.l -(%sp)
	jsr (%a3)
	addq.l #4,%sp
	jra .L97
	.even
	.globl	__Z18changeScreenKeypadi
__Z18changeScreenKeypadi:
	link.w %fp,#0
	move.l %d2,-(%sp)
	move.l 8(%fp),%d2
	move.l %d2,%d0
	and.l JAGPAD_HASH,%d0
	jne .L104
	and.l JAGPAD_STAR,%d2
	jne .L105
.L102:
	move.l -4(%fp),%d2
	unlk %fp
	rts
.L105:
	jsr _cls
	moveq #1,%d0
	move.l %d0,__ZL12screenNumber
	move.l -4(%fp),%d2
	unlk %fp
	rts
.L104:
	jsr _cls
	clr.l __ZL12screenNumber
	and.l JAGPAD_STAR,%d2
	jeq .L102
	jra .L105
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
	jeq .L113
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	jsr rapLocate
	move.l #.LC12,_js_r_textbuffer
	addq.l #8,%sp
	jsr _rapPrint
	move.l -8(%fp),%d2
	move.l -4(%fp),%d3
	unlk %fp
	rts
.L113:
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	jsr rapLocate
	move.l %d2,-(%sp)
	jsr _strlen
	lea (12,%sp),%sp
	moveq #8,%d1
	cmp.l %d0,%d1
	jcs .L114
	clr.b _BCX_TmpStr_buffer+2
	move.b #32,_BCX_TmpStr_buffer
	move.b #32,_BCX_TmpStr_buffer+1
	pea _BCX_TmpStr_buffer
	pea .LC9
	move.l %d2,-(%sp)
	pea .LC10
	pea .LC11
	jsr ee_printf
	move.l %d0,_js_r_textbuffer
	lea (20,%sp),%sp
	jsr _rapPrint
	clr.l -(%sp)
	jsr _jsfVsync
	addq.l #4,%sp
.L115:
	move.l -8(%fp),%d2
	move.l -4(%fp),%d3
	unlk %fp
	rts
.L114:
	clr.b _BCX_TmpStr_buffer+1
	pea _BCX_TmpStr_buffer
	pea .LC9
	move.l %d2,-(%sp)
	pea .LC10
	pea .LC11
	jsr ee_printf
	move.l %d0,_js_r_textbuffer
	lea (20,%sp),%sp
	jsr _rapPrint
	clr.l -(%sp)
	jsr _jsfVsync
	addq.l #4,%sp
	jra .L115
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
.lcomm __ZL9upperCase,4
.lcomm __ZL10lowerASCII,4
.lcomm __ZL10upperASCII,4
.lcomm __ZL10inputSpeed,4
.lcomm __ZL14selectedPlayer,4
.lcomm __ZL11playerLimit,4
.lcomm __ZL10tempYStart,4
.lcomm __ZL5tempY,4
.lcomm __ZL7yGrowth,4
.lcomm __ZL9speedTemp,4
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
