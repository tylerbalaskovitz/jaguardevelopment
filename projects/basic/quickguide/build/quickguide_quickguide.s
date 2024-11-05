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
.LC4:
	.ascii "ASCII value as \0"
.LC5:
	.ascii "%s% d\0"
	.even
	.globl	__Z14registerPlayeriPc
__Z14registerPlayeriPc:
	link.w %fp,#0
	movem.l #8248,-(%sp)
	move.l 8(%fp),%d2
	move.l __ZL5tempY,-(%sp)
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
	move.l __ZL5tempY,%d0
	add.l __ZL7yGrowth,%d0
	move.l %d0,__ZL5tempY
	move.l %d0,-(%sp)
	pea 10.w
	jsr (%a4)
	clr.b _BCX_TmpStr_buffer+35
	pea 35.w
	pea 32.w
	pea _BCX_TmpStr_buffer
	jsr _memset
	lea (16,%sp),%sp
	move.l %d0,(%sp)
	pea .LC1
	jsr (%a3)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	move.l 12(%fp),-(%sp)
	pea .LC2
	pea .LC3
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
	pea .LC1
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
	pea .LC4
	pea .LC5
	jsr (%a3)
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	jsr (%a2)
	move.l __ZL10tempYStart,__ZL5tempY
	movem.l -16(%fp),#7172
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
	move.l __ZL9speedTemp,%d0
	jlt .L12
	addq.l #1,%d0
	move.l %d0,__ZL9speedTemp
	moveq #1,%d1
	cmp.l %d0,%d1
	jeq .L12
	clr.l __ZL9speedTemp
	unlk %fp
	rts
.L12:
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
	lea (16,%sp),%sp
	clr.l __ZL9speedTemp
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
	jne .L25
	move.l %d2,%d0
	and.l JAGPAD_2,%d0
	jne .L26
.L18:
	move.l %d2,%d0
	and.l JAGPAD_3,%d0
	jne .L27
.L19:
	move.l %d2,%d0
	and.l JAGPAD_4,%d0
	jne .L28
.L20:
	move.l %d2,%d0
	and.l JAGPAD_5,%d0
	jne .L29
.L21:
	and.l JAGPAD_6,%d2
	jne .L30
.L23:
	move.l -4(%fp),%d2
	unlk %fp
	rts
.L30:
	pea __ZL7players+10240
	pea __ZL6winner
	jsr _strcpy
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	move.l -4(%fp),%d2
	unlk %fp
	rts
.L29:
	pea __ZL7players+8192
	pea __ZL6winner
	jsr _strcpy
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	and.l JAGPAD_6,%d2
	jeq .L23
	jra .L30
.L28:
	pea __ZL7players+6144
	pea __ZL6winner
	jsr _strcpy
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	move.l %d2,%d0
	and.l JAGPAD_5,%d0
	jeq .L21
	jra .L29
.L27:
	pea __ZL7players+4096
	pea __ZL6winner
	jsr _strcpy
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	move.l %d2,%d0
	and.l JAGPAD_4,%d0
	jeq .L20
	jra .L28
.L26:
	pea __ZL7players+2048
	pea __ZL6winner
	jsr _strcpy
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	move.l %d2,%d0
	and.l JAGPAD_3,%d0
	jeq .L19
	jra .L27
.L25:
	pea __ZL7players
	pea __ZL6winner
	jsr _strcpy
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	move.l %d2,%d0
	and.l JAGPAD_2,%d0
	jeq .L18
	jra .L26
.LC6:
	.ascii " is the winner!\0"
.LC7:
	.ascii "Congratulations!\0"
.LC8:
	.ascii "%s%s%s%s\0"
.LC9:
	.ascii "Who will be today's winner?\0"
	.even
	.globl	__Z9basicmainv
__Z9basicmainv:
	link.w %fp,#-4
	movem.l #16188,-(%sp)
	moveq #60,%d0
	move.l %d0,__ZL10tempYStart
	move.l %d0,__ZL5tempY
	moveq #15,%d1
	move.l %d1,__ZL7yGrowth
	clr.l __ZL9speedTemp
	clr.l __ZL4temp
	clr.b __ZL8tempName
	clr.l __ZL9scrolling
	clr.l _jsfFontIndx
	moveq #1,%d2
	move.l %d2,_jsfFontSize
	move.b #38,%d0
	move.l %d0,__ZL2tx
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
	move.b #2,%d1
	move.l %d1,__ZL7intName
	clr.l __ZL12screenNumber
	lea jsfGetPad,%a3
	lea rapLocate,%a5
	move.l #_BCX_TmpStr_buffer,-4(%fp)
	move.l #ee_printf,%d3
	lea _rapPrint,%a4
	lea _jsfVsync,%a2
	move.l #__Z18selectWinnerKeypadi,%d6
	move.l #_cls,%d4
	pea 1.w
	jsr (%a3)
	move.l %d0,%d2
	move.l %d0,__ZL4pad1
	move.l __ZL12screenNumber,%d0
	addq.l #4,%sp
	jeq .L62
.L33:
	moveq #1,%d1
	cmp.l %d0,%d1
	jeq .L63
.L38:
	move.l %d2,%d0
	and.l JAGPAD_HASH,%d0
	jne .L64
.L57:
	and.l JAGPAD_STAR,%d2
	jne .L65
.L58:
	clr.l -(%sp)
	jsr (%a2)
	addq.l #4,%sp
.L66:
	pea 1.w
	jsr (%a3)
	move.l %d0,%d2
	move.l %d0,__ZL4pad1
	move.l __ZL12screenNumber,%d0
	addq.l #4,%sp
	jne .L33
	jra .L62
.L65:
	move.l %d4,%a0
	jsr (%a0)
	moveq #1,%d0
	move.l %d0,__ZL12screenNumber
	clr.l -(%sp)
	jsr (%a2)
	addq.l #4,%sp
	jra .L66
.L64:
	move.l %d4,%a0
	jsr (%a0)
	clr.l __ZL12screenNumber
	and.l JAGPAD_STAR,%d2
	jeq .L58
	jra .L65
.L62:
	move.l __ZL2ty,%d1
	move.l __ZL2tx,%d0
	moveq #1,%d2
	cmp.l __ZL9scrolling.l,%d2
	jeq .L67
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	jsr (%a5)
	move.l #.LC9,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a4)
	moveq #1,%d0
	cmp.l __ZL9scrolling.l,%d0
	jeq .L68
.L37:
	move.l __ZL4pad1,%d2
	move.l %d2,-(%sp)
	move.l %d6,%a0
	jsr (%a0)
	move.l __ZL12screenNumber,%d0
	addq.l #4,%sp
.L72:
	moveq #1,%d1
	cmp.l %d0,%d1
	jne .L38
.L63:
	move.l %d2,%d0
	and.l JAGPAD_UP,%d0
	jne .L69
.L39:
	move.l %d2,%d0
	and.l JAGPAD_DOWN,%d0
	jne .L45
.L74:
	move.l __ZL4temp,%d5
	move.b %d5,%d7
	move.l %d2,%d0
	and.l JAGPAD_A,%d0
	jne .L70
.L53:
	and.l JAGPAD_B,%d2
	jne .L71
.L54:
	move.l __ZL5tempY,-(%sp)
	pea 10.w
	jsr (%a5)
	addq.l #4,%sp
	move.l #.LC0,(%sp)
	pea .LC1
	move.l %d3,%a0
	jsr (%a0)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a4)
	move.l __ZL5tempY,%d0
	add.l __ZL7yGrowth,%d0
	move.l %d0,__ZL5tempY
	move.l %d0,-(%sp)
	pea 10.w
	jsr (%a5)
	clr.b _BCX_TmpStr_buffer+35
	pea 35.w
	pea 32.w
	pea _BCX_TmpStr_buffer
	jsr _memset
	lea (16,%sp),%sp
	move.l %d0,(%sp)
	pea .LC1
	move.l %d3,%a0
	jsr (%a0)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a4)
	pea __ZL8tempName
	pea .LC2
	pea .LC3
	move.l %d3,%a0
	jsr (%a0)
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	jsr (%a4)
	move.l __ZL5tempY,%d0
	add.l __ZL7yGrowth,%d0
	move.l %d0,__ZL5tempY
	move.l %d0,-(%sp)
	pea 10.w
	jsr (%a5)
	clr.b _BCX_TmpStr_buffer+11
	move.b %d7,_BCX_TmpStr_buffer
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
	move.l %d3,%a0
	jsr (%a0)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a4)
	move.l __ZL5tempY,%d0
	add.l __ZL7yGrowth,%d0
	move.l %d0,__ZL5tempY
	move.l %d0,-(%sp)
	pea 10.w
	jsr (%a5)
	addq.l #4,%sp
	move.l %d5,(%sp)
	pea .LC4
	pea .LC5
	move.l %d3,%a0
	jsr (%a0)
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	jsr (%a4)
	move.l __ZL10tempYStart,__ZL5tempY
	move.l __ZL4pad1,%d2
.L73:
	move.l %d2,%d0
	and.l JAGPAD_HASH,%d0
	jeq .L57
	jra .L64
.L68:
	subq.l #2,__ZL2tx
	move.l __ZL4pad1,%d2
	move.l %d2,-(%sp)
	move.l %d6,%a0
	jsr (%a0)
	move.l __ZL12screenNumber,%d0
	addq.l #4,%sp
	jra .L72
.L71:
	move.l __ZL9speedTemp,%d0
	jlt .L55
	addq.l #1,%d0
	move.l %d0,__ZL9speedTemp
	moveq #1,%d2
	cmp.l %d0,%d2
	jeq .L55
	clr.l __ZL9speedTemp
.L80:
	move.l __ZL5tempY,-(%sp)
	pea 10.w
	jsr (%a5)
	addq.l #4,%sp
	move.l #.LC0,(%sp)
	pea .LC1
	move.l %d3,%a0
	jsr (%a0)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a4)
	move.l __ZL5tempY,%d0
	add.l __ZL7yGrowth,%d0
	move.l %d0,__ZL5tempY
	move.l %d0,-(%sp)
	pea 10.w
	jsr (%a5)
	clr.b _BCX_TmpStr_buffer+35
	pea 35.w
	pea 32.w
	pea _BCX_TmpStr_buffer
	jsr _memset
	lea (16,%sp),%sp
	move.l %d0,(%sp)
	pea .LC1
	move.l %d3,%a0
	jsr (%a0)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a4)
	pea __ZL8tempName
	pea .LC2
	pea .LC3
	move.l %d3,%a0
	jsr (%a0)
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	jsr (%a4)
	move.l __ZL5tempY,%d0
	add.l __ZL7yGrowth,%d0
	move.l %d0,__ZL5tempY
	move.l %d0,-(%sp)
	pea 10.w
	jsr (%a5)
	clr.b _BCX_TmpStr_buffer+11
	move.b %d7,_BCX_TmpStr_buffer
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
	move.l %d3,%a0
	jsr (%a0)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a4)
	move.l __ZL5tempY,%d0
	add.l __ZL7yGrowth,%d0
	move.l %d0,__ZL5tempY
	move.l %d0,-(%sp)
	pea 10.w
	jsr (%a5)
	addq.l #4,%sp
	move.l %d5,(%sp)
	pea .LC4
	pea .LC5
	move.l %d3,%a0
	jsr (%a0)
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	jsr (%a4)
	move.l __ZL10tempYStart,__ZL5tempY
	move.l __ZL4pad1,%d2
	jra .L73
.L70:
	pea 2048.w
	clr.l -(%sp)
	pea __ZL8tempName
	jsr _memset
	lea (12,%sp),%sp
	and.l JAGPAD_B,%d2
	jeq .L54
	jra .L71
.L69:
	move.l __ZL9speedTemp,%d0
	addq.l #1,%d0
	move.l %d0,__ZL9speedTemp
	move.b #5,%d1
	cmp.l %d0,%d1
	jge .L40
	clr.l __ZL9speedTemp
	addq.l #1,__ZL4temp
.L41:
	move.l __ZL4temp,%d0
	moveq #64,%d1
	cmp.l %d0,%d1
	jlt .L44
.L79:
	moveq #65,%d0
	move.l %d0,__ZL4temp
	move.l %d2,%d0
	and.l JAGPAD_DOWN,%d0
	jeq .L74
.L45:
	move.l __ZL9speedTemp,%d0
	subq.l #1,%d0
	move.l %d0,__ZL9speedTemp
	moveq #5,%d1
	cmp.l %d0,%d1
	jge .L47
	clr.l __ZL9speedTemp
	addq.l #1,__ZL4temp
.L48:
	move.l __ZL4temp,%d5
	moveq #64,%d0
	cmp.l %d5,%d0
	jlt .L51
.L77:
	moveq #65,%d1
	move.l %d1,__ZL4temp
	moveq #65,%d7
	moveq #65,%d5
	move.l %d2,%d0
	and.l JAGPAD_A,%d0
	jeq .L53
	jra .L70
.L67:
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	jsr (%a5)
	pea __ZL6winner
	jsr _strlen
	lea (12,%sp),%sp
	moveq #8,%d1
	cmp.l %d0,%d1
	jcs .L75
	clr.b _BCX_TmpStr_buffer+2
	move.b #32,_BCX_TmpStr_buffer
	move.l -4(%fp),%a0
	move.b #32,1(%a0)
	move.l #_BCX_TmpStr_buffer,-4(%fp)
	pea _BCX_TmpStr_buffer
	pea .LC6
	pea __ZL6winner
	pea .LC7
	pea .LC8
	move.l %d3,%a0
	jsr (%a0)
	move.l %d0,_js_r_textbuffer
	lea (20,%sp),%sp
	jsr (%a4)
	clr.l -(%sp)
	jsr (%a2)
	addq.l #4,%sp
.L76:
	moveq #1,%d0
	cmp.l __ZL9scrolling.l,%d0
	jne .L37
	jra .L68
.L75:
	clr.b _BCX_TmpStr_buffer+1
	pea _BCX_TmpStr_buffer
	pea .LC6
	pea __ZL6winner
	pea .LC7
	pea .LC8
	move.l %d3,%a0
	jsr (%a0)
	move.l %d0,_js_r_textbuffer
	lea (20,%sp),%sp
	jsr (%a4)
	clr.l -(%sp)
	jsr (%a2)
	addq.l #4,%sp
	jra .L76
.L47:
	moveq #-5,%d1
	cmp.l %d0,%d1
	jle .L48
	clr.l __ZL9speedTemp
	move.l __ZL4temp,%d5
	subq.l #1,%d5
	move.l %d5,__ZL4temp
	moveq #64,%d0
	cmp.l %d5,%d0
	jge .L77
.L51:
	moveq #90,%d0
	cmp.l %d5,%d0
	jge .L78
	moveq #90,%d1
	move.l %d1,__ZL4temp
	moveq #90,%d7
	moveq #90,%d5
	move.l %d2,%d0
	and.l JAGPAD_A,%d0
	jeq .L53
	jra .L70
.L40:
	moveq #-5,%d1
	cmp.l %d0,%d1
	jle .L41
	clr.l __ZL9speedTemp
	move.l __ZL4temp,%d0
	subq.l #1,%d0
	move.l %d0,__ZL4temp
	moveq #64,%d1
	cmp.l %d0,%d1
	jge .L79
.L44:
	moveq #90,%d1
	cmp.l %d0,%d1
	jge .L39
	move.l %d1,__ZL4temp
	jra .L39
.L55:
	clr.b _BCX_TmpStr_buffer+11
	move.b %d7,_BCX_TmpStr_buffer
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
	lea (16,%sp),%sp
	clr.l __ZL9speedTemp
	jra .L80
.L78:
	move.b %d5,%d7
	move.l %d2,%d0
	and.l JAGPAD_A,%d0
	jeq .L53
	jra .L70
	.even
	.globl	__Z15writePlayerNamei
__Z15writePlayerNamei:
	link.w %fp,#0
	move.l %d2,-(%sp)
	move.l 8(%fp),%d2
	move.l %d2,%d0
	and.l JAGPAD_UP,%d0
	jne .L101
.L83:
	move.l %d2,%d0
	and.l JAGPAD_DOWN,%d0
	jne .L102
.L89:
	move.l %d2,%d0
	and.l JAGPAD_A,%d0
	jne .L103
.L95:
	and.l JAGPAD_B,%d2
	jne .L104
.L99:
	move.l -4(%fp),%d2
	unlk %fp
	rts
.L104:
	move.l __ZL9speedTemp,%d0
	jlt .L97
	addq.l #1,%d0
	move.l %d0,__ZL9speedTemp
	moveq #1,%d1
	cmp.l %d0,%d1
	jeq .L97
	clr.l __ZL9speedTemp
.L109:
	move.l -4(%fp),%d2
	unlk %fp
	rts
.L103:
	pea 2048.w
	clr.l -(%sp)
	pea __ZL8tempName
	jsr _memset
	lea (12,%sp),%sp
	and.l JAGPAD_B,%d2
	jeq .L99
	jra .L104
.L102:
	move.l __ZL9speedTemp,%d0
	subq.l #1,%d0
	move.l %d0,__ZL9speedTemp
	moveq #5,%d1
	cmp.l %d0,%d1
	jlt .L105
	moveq #-5,%d1
	cmp.l %d0,%d1
	jle .L91
	clr.l __ZL9speedTemp
	move.l __ZL4temp,%d0
	subq.l #1,%d0
	move.l %d0,__ZL4temp
	moveq #64,%d1
	cmp.l %d0,%d1
	jlt .L94
.L108:
	moveq #65,%d0
	move.l %d0,__ZL4temp
	move.l %d2,%d0
	and.l JAGPAD_A,%d0
	jeq .L95
	jra .L103
.L101:
	move.l __ZL9speedTemp,%d0
	addq.l #1,%d0
	move.l %d0,__ZL9speedTemp
	moveq #5,%d1
	cmp.l %d0,%d1
	jlt .L106
	moveq #-5,%d1
	cmp.l %d0,%d1
	jle .L85
	clr.l __ZL9speedTemp
	move.l __ZL4temp,%d0
	subq.l #1,%d0
	move.l %d0,__ZL4temp
	moveq #64,%d1
	cmp.l %d0,%d1
	jlt .L88
.L107:
	moveq #65,%d0
	move.l %d0,__ZL4temp
	move.l %d2,%d0
	and.l JAGPAD_DOWN,%d0
	jeq .L89
	jra .L102
.L106:
	clr.l __ZL9speedTemp
	addq.l #1,__ZL4temp
.L85:
	move.l __ZL4temp,%d0
	moveq #64,%d1
	cmp.l %d0,%d1
	jge .L107
.L88:
	moveq #90,%d1
	cmp.l %d0,%d1
	jge .L83
	move.l %d1,__ZL4temp
	move.l %d2,%d0
	and.l JAGPAD_DOWN,%d0
	jeq .L89
	jra .L102
.L105:
	clr.l __ZL9speedTemp
	addq.l #1,__ZL4temp
.L91:
	move.l __ZL4temp,%d0
	moveq #64,%d1
	cmp.l %d0,%d1
	jge .L108
.L94:
	moveq #90,%d1
	cmp.l %d0,%d1
	jge .L89
	move.l %d1,__ZL4temp
	move.l %d2,%d0
	and.l JAGPAD_A,%d0
	jeq .L95
	jra .L103
.L97:
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
	lea (16,%sp),%sp
	clr.l __ZL9speedTemp
	jra .L109
	.even
	.globl	__Z10checkTempsv
__Z10checkTempsv:
	link.w %fp,#0
	move.l __ZL9speedTemp,%d0
	moveq #5,%d1
	cmp.l %d0,%d1
	jge .L112
	clr.l __ZL9speedTemp
	addq.l #1,__ZL4temp
.L113:
	move.l __ZL4temp,%d0
.L115:
	moveq #64,%d1
	cmp.l %d0,%d1
	jlt .L116
	moveq #65,%d0
	move.l %d0,__ZL4temp
.L118:
	unlk %fp
	rts
.L116:
	moveq #90,%d1
	cmp.l %d0,%d1
	jge .L118
	move.l %d1,__ZL4temp
	unlk %fp
	rts
.L112:
	moveq #-5,%d1
	cmp.l %d0,%d1
	jle .L113
	clr.l __ZL9speedTemp
	move.l __ZL4temp,%d0
	subq.l #1,%d0
	move.l %d0,__ZL4temp
	jra .L115
	.even
	.globl	__Z18changeScreenKeypadi
__Z18changeScreenKeypadi:
	link.w %fp,#0
	move.l %d2,-(%sp)
	move.l 8(%fp),%d2
	move.l %d2,%d0
	and.l JAGPAD_HASH,%d0
	jne .L126
	and.l JAGPAD_STAR,%d2
	jne .L127
.L124:
	move.l -4(%fp),%d2
	unlk %fp
	rts
.L127:
	jsr _cls
	moveq #1,%d0
	move.l %d0,__ZL12screenNumber
	move.l -4(%fp),%d2
	unlk %fp
	rts
.L126:
	jsr _cls
	clr.l __ZL12screenNumber
	and.l JAGPAD_STAR,%d2
	jeq .L124
	jra .L127
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
	jeq .L135
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	jsr rapLocate
	move.l #.LC9,_js_r_textbuffer
	addq.l #8,%sp
	jsr _rapPrint
	move.l -8(%fp),%d2
	move.l -4(%fp),%d3
	unlk %fp
	rts
.L135:
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	jsr rapLocate
	move.l %d2,-(%sp)
	jsr _strlen
	lea (12,%sp),%sp
	moveq #8,%d1
	cmp.l %d0,%d1
	jcs .L136
	clr.b _BCX_TmpStr_buffer+2
	move.b #32,_BCX_TmpStr_buffer
	move.b #32,_BCX_TmpStr_buffer+1
	pea _BCX_TmpStr_buffer
	pea .LC6
	move.l %d2,-(%sp)
	pea .LC7
	pea .LC8
	jsr ee_printf
	move.l %d0,_js_r_textbuffer
	lea (20,%sp),%sp
	jsr _rapPrint
	clr.l -(%sp)
	jsr _jsfVsync
	addq.l #4,%sp
.L137:
	move.l -8(%fp),%d2
	move.l -4(%fp),%d3
	unlk %fp
	rts
.L136:
	clr.b _BCX_TmpStr_buffer+1
	pea _BCX_TmpStr_buffer
	pea .LC6
	move.l %d2,-(%sp)
	pea .LC7
	pea .LC8
	jsr ee_printf
	move.l %d0,_js_r_textbuffer
	lea (20,%sp),%sp
	jsr _rapPrint
	clr.l -(%sp)
	jsr _jsfVsync
	addq.l #4,%sp
	jra .L137
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
