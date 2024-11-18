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
	.globl	__Z3midPcii
__Z3midPcii:
	link.w %fp,#0
	movem.l #12320,-(%sp)
	move.l 8(%fp),%a2
	move.l 12(%fp),%d2
	move.l 16(%fp),%d3
	move.l %a2,-(%sp)
	jsr _strlen
	addq.l #4,%sp
	cmp.l %d0,%d2
	jgt .L3
	tst.l %d2
	jle .L3
	sub.l %d2,%d0
	addq.l #1,%d0
	tst.l %d3
	jlt .L7
	cmp.l %d3,%d0
	jge .L8
.L7:
	move.l %d0,%d3
.L8:
	lea _BCX_TmpStr_buffer,%a0
	clr.b (%a0,%d3.l)
	move.l %d3,16(%fp)
	lea -1(%a2,%d2.l),%a2
	move.l %a2,12(%fp)
	move.l %a0,8(%fp)
	movem.l -12(%fp),#1036
	unlk %fp
	jra _memcpy
.L3:
	clr.b _BCX_TmpStr_buffer+1
	move.l #_BCX_TmpStr_buffer,%d0
	movem.l -12(%fp),#1036
	unlk %fp
	rts
	.even
	.globl	__Z5spacei
__Z5spacei:
	link.w %fp,#0
	move.l 8(%fp),%d0
	jle .L15
	lea _BCX_TmpStr_buffer,%a0
	clr.b (%a0,%d0.l)
	move.l %d0,-(%sp)
	pea 32.w
	move.l %a0,-(%sp)
	jsr _memset
	lea (12,%sp),%sp
	unlk %fp
	rts
.L15:
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
	.even
	.globl	__Z14registerPlayeriPc
__Z14registerPlayeriPc:
	link.w %fp,#0
	movem.l #8252,-(%sp)
	moveq #10,%d0
	move.l %d0,__ZL5tempX
	moveq #60,%d1
	move.l %d1,__ZL5tempY
	move.b #20,%d0
	move.l %d0,__ZL7yGrowth
	move.l %d1,__ZL8defaultY
	pea 60.w
	pea 10.w
	lea rapLocate,%a4
	jsr (%a4)
	addq.l #4,%sp
	move.l #.LC0,(%sp)
	move.l __ZL14selectedPlayer,%d1
	addq.l #1,%d1
	move.l %d1,-(%sp)
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
	move.l __ZL5tempX,-(%sp)
	jsr (%a4)
	move.l #_BCX_TmpStr_buffer+21,%d2
	move.l %d2,%a0
	clr.b (%a0)
	pea 21.w
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
	move.l __ZL5tempX,-(%sp)
	jsr (%a4)
	move.l %d2,%a0
	clr.b (%a0)
	pea 21.w
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
	move.l __ZL5tempX,-(%sp)
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
	pea .LC3
	jsr (%a3)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	move.l __ZL8defaultY,__ZL5tempY
	movem.l -20(%fp),#15364
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
	.globl	__Z12removeLetterv
__Z12removeLetterv:
	link.w %fp,#0
	move.l __ZL10inputSpeed,%d0
	addq.l #1,%d0
	move.l %d0,__ZL10inputSpeed
	cmp.l __ZL17buttonSensitivity.l,%d0
	jle .L28
	tst.b __ZL8tempName
	jne .L30
	clr.l __ZL10inputSpeed
.L28:
	unlk %fp
	rts
.L30:
	pea __ZL8tempName
	jsr _strlen
	addq.l #4,%sp
	tst.l %d0
	jle .L31
	move.l %d0,%d1
	subq.l #1,%d1
	jmi .L26
	cmp.l %d0,%d1
	jlt .L32
.L26:
	lea _BCX_TmpStr_buffer,%a0
	clr.b (%a0,%d0.l)
	move.l %d0,-(%sp)
	pea __ZL8tempName
	move.l %a0,-(%sp)
	jsr _memcpy
	lea (12,%sp),%sp
.L25:
	move.l %d0,-(%sp)
	pea __ZL8tempName
	jsr _strcpy
	addq.l #8,%sp
.L33:
	clr.l __ZL10inputSpeed
	jra .L28
.L31:
	clr.b _BCX_TmpStr_buffer+1
	move.l #_BCX_TmpStr_buffer,%d0
	move.l %d0,-(%sp)
	pea __ZL8tempName
	jsr _strcpy
	addq.l #8,%sp
	jra .L33
.L32:
	move.l %d1,%d0
	lea _BCX_TmpStr_buffer,%a0
	clr.b (%a0,%d0.l)
	move.l %d0,-(%sp)
	pea __ZL8tempName
	move.l %a0,-(%sp)
	jsr _memcpy
	lea (12,%sp),%sp
	jra .L25
	.even
	.globl	__Z9addLetterPc
__Z9addLetterPc:
	link.w %fp,#0
	move.l %d2,-(%sp)
	move.l 8(%fp),%d2
	move.l __ZL10inputSpeed,%d0
	addq.l #1,%d0
	move.l %d0,__ZL10inputSpeed
	cmp.l __ZL17buttonSensitivity.l,%d0
	jle .L38
	move.l %d2,-(%sp)
	jsr _strlen
	addq.l #4,%sp
	moveq #10,%d1
	cmp.l %d0,%d1
	jcc .L40
	clr.l __ZL10inputSpeed
.L38:
	move.l -4(%fp),%d2
	unlk %fp
	rts
.L40:
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
	move.l %d2,-(%sp)
	jsr _strcat
	lea (16,%sp),%sp
	clr.l __ZL10inputSpeed
	jra .L38
	.even
	.globl	__Z10changeCasev
__Z10changeCasev:
	link.w %fp,#0
	moveq #1,%d0
	cmp.l __ZL9upperCase.l,%d0
	jeq .L47
	moveq #-32,%d0
	add.l %d0,__ZL4temp
	moveq #1,%d0
	move.l %d0,__ZL9upperCase
	unlk %fp
	rts
.L47:
	move.b #32,%d0
	add.l %d0,__ZL4temp
	clr.l __ZL9upperCase
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
	jne .L58
	move.l %d2,%d0
	and.l JAGPAD_2,%d0
	jne .L59
.L51:
	move.l %d2,%d0
	and.l JAGPAD_3,%d0
	jne .L60
.L52:
	move.l %d2,%d0
	and.l JAGPAD_4,%d0
	jne .L61
.L53:
	move.l %d2,%d0
	and.l JAGPAD_5,%d0
	jne .L62
.L54:
	and.l JAGPAD_6,%d2
	jne .L63
.L56:
	move.l -4(%fp),%d2
	unlk %fp
	rts
.L63:
	pea __ZL7players+10240
	pea __ZL6winner
	jsr _strcpy
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	move.l -4(%fp),%d2
	unlk %fp
	rts
.L62:
	pea __ZL7players+8192
	pea __ZL6winner
	jsr _strcpy
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	and.l JAGPAD_6,%d2
	jeq .L56
	jra .L63
.L61:
	pea __ZL7players+6144
	pea __ZL6winner
	jsr _strcpy
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	move.l %d2,%d0
	and.l JAGPAD_5,%d0
	jeq .L54
	jra .L62
.L60:
	pea __ZL7players+4096
	pea __ZL6winner
	jsr _strcpy
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	move.l %d2,%d0
	and.l JAGPAD_4,%d0
	jeq .L53
	jra .L61
.L59:
	pea __ZL7players+2048
	pea __ZL6winner
	jsr _strcpy
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	move.l %d2,%d0
	and.l JAGPAD_3,%d0
	jeq .L52
	jra .L60
.L58:
	pea __ZL7players
	pea __ZL6winner
	jsr _strcpy
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	addq.l #8,%sp
	move.l %d2,%d0
	and.l JAGPAD_2,%d0
	jeq .L51
	jra .L59
	.even
	.globl	__Z10checkTempsv
__Z10checkTempsv:
	link.w %fp,#0
	move.l __ZL9speedTemp,%d0
	cmp.l __ZL17buttonSensitivity.l,%d0
	jle .L66
	clr.l __ZL9speedTemp
	addq.l #1,__ZL4temp
.L67:
	move.l __ZL9upperCase,%d0
	moveq #1,%d1
	cmp.l %d0,%d1
	jeq .L77
.L68:
	tst.l %d0
	jne .L74
	move.l __ZL4temp,%d1
	move.l __ZL12lowerCaseLow,%d0
	cmp.l %d1,%d0
	jle .L78
	move.l __ZL13lowerCaseHigh,__ZL4temp
.L74:
	unlk %fp
	rts
.L66:
	moveq #-5,%d1
	cmp.l %d0,%d1
	jle .L67
	clr.l __ZL9speedTemp
	subq.l #1,__ZL4temp
	move.l __ZL9upperCase,%d0
	moveq #1,%d1
	cmp.l %d0,%d1
	jne .L68
.L77:
	move.l __ZL4temp,%d1
	move.l __ZL12upperCaseLow,%d0
	cmp.l %d1,%d0
	jle .L79
	move.l __ZL13upperCaseHigh,__ZL4temp
	unlk %fp
	rts
.L78:
	cmp.l __ZL13lowerCaseHigh.l,%d1
	jle .L74
	move.l %d0,__ZL4temp
.L80:
	unlk %fp
	rts
.L79:
	cmp.l __ZL13upperCaseHigh.l,%d1
	jle .L74
	move.l %d0,__ZL4temp
	jra .L80
	.even
	.globl	__Z15writePlayerNamei
__Z15writePlayerNamei:
	link.w %fp,#0
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	move.l 8(%fp),%d2
	move.l %d2,%d0
	and.l JAGPAD_UP,%d0
	jne .L106
	move.l %d2,%d0
	and.l JAGPAD_DOWN,%d0
	jne .L107
.L84:
	move.l %d2,%d0
	and.l JAGPAD_OPTION,%d0
	jne .L108
.L85:
	move.l %d2,%d0
	and.l JAGPAD_A,%d0
	jne .L109
.L86:
	move.l %d2,%d0
	and.l JAGPAD_B,%d0
	jne .L110
.L92:
	move.l %d2,%d0
	and.l JAGPAD_C,%d0
	jne .L111
.L94:
	move.l %d2,%d0
	and.l JAGPAD_1,%d0
	jeq .L95
	clr.l __ZL14selectedPlayer
.L95:
	move.l %d2,%d0
	and.l JAGPAD_2,%d0
	jeq .L96
	moveq #1,%d1
	move.l %d1,__ZL14selectedPlayer
.L96:
	move.l %d2,%d0
	and.l JAGPAD_3,%d0
	jeq .L97
	moveq #2,%d0
	move.l %d0,__ZL14selectedPlayer
.L97:
	move.l %d2,%d0
	and.l JAGPAD_4,%d0
	jeq .L98
	moveq #3,%d1
	move.l %d1,__ZL14selectedPlayer
.L98:
	move.l %d2,%d0
	and.l JAGPAD_5,%d0
	jeq .L99
	moveq #4,%d0
	move.l %d0,__ZL14selectedPlayer
.L99:
	move.l %d2,%d0
	and.l JAGPAD_6,%d0
	jeq .L100
	moveq #5,%d1
	move.l %d1,__ZL14selectedPlayer
.L100:
	and.l JAGPAD_0,%d2
	jeq .L104
	move.l __ZL10inputSpeed,%d0
	addq.l #1,%d0
	move.l %d0,__ZL10inputSpeed
	moveq #5,%d1
	cmp.l %d0,%d1
	jge .L104
	moveq #1,%d0
	cmp.l __ZL9upperCase.l,%d0
	jeq .L112
	moveq #-32,%d0
	add.l %d0,__ZL4temp
	moveq #1,%d1
	move.l %d1,__ZL9upperCase
	clr.l __ZL10inputSpeed
.L104:
	move.l -8(%fp),%d2
	move.l -4(%fp),%d3
	unlk %fp
	rts
.L111:
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
	jra .L94
.L110:
	move.l __ZL10inputSpeed,%d0
	addq.l #1,%d0
	move.l %d0,__ZL10inputSpeed
	cmp.l __ZL17buttonSensitivity.l,%d0
	jle .L92
	pea __ZL8tempName
	jsr _strlen
	addq.l #4,%sp
	moveq #10,%d1
	cmp.l %d0,%d1
	jcc .L113
	clr.l __ZL10inputSpeed
.L117:
	move.l %d2,%d0
	and.l JAGPAD_C,%d0
	jeq .L94
	jra .L111
.L109:
	move.l __ZL10inputSpeed,%d0
	addq.l #1,%d0
	move.l %d0,__ZL10inputSpeed
	cmp.l __ZL17buttonSensitivity.l,%d0
	jle .L86
	tst.b __ZL8tempName
	jne .L114
	clr.l __ZL10inputSpeed
.L116:
	move.l %d2,%d0
	and.l JAGPAD_B,%d0
	jeq .L92
	jra .L110
.L108:
	pea 2048.w
	clr.l -(%sp)
	pea __ZL8tempName
	jsr _memset
	lea (12,%sp),%sp
	move.l %d2,%d0
	and.l JAGPAD_A,%d0
	jeq .L86
	jra .L109
.L107:
	subq.l #1,__ZL9speedTemp
	jsr __Z10checkTempsv
	move.l %d2,%d0
	and.l JAGPAD_OPTION,%d0
	jeq .L85
	jra .L108
.L106:
	addq.l #1,__ZL9speedTemp
	jsr __Z10checkTempsv
	move.l %d2,%d0
	and.l JAGPAD_DOWN,%d0
	jeq .L84
	jra .L107
.L114:
	pea __ZL8tempName
	jsr _strlen
	addq.l #4,%sp
	tst.l %d0
	jle .L115
	move.l %d0,%d1
	subq.l #1,%d1
	jmi .L90
	cmp.l %d0,%d1
	jge .L90
	move.l %d1,%d0
.L90:
	lea _BCX_TmpStr_buffer,%a0
	clr.b (%a0,%d0.l)
	move.l %d0,-(%sp)
	pea __ZL8tempName
	move.l %a0,-(%sp)
	jsr _memcpy
	lea (12,%sp),%sp
	move.l %d0,-(%sp)
	pea __ZL8tempName
	jsr _strcpy
	addq.l #8,%sp
.L118:
	clr.l __ZL10inputSpeed
	jra .L116
.L113:
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
	clr.l __ZL10inputSpeed
	jra .L117
.L112:
	move.b #32,%d1
	add.l %d1,__ZL4temp
	clr.l __ZL9upperCase
	clr.l __ZL10inputSpeed
	jra .L104
.L115:
	clr.b _BCX_TmpStr_buffer+1
	move.l #_BCX_TmpStr_buffer,%d0
	move.l %d0,-(%sp)
	pea __ZL8tempName
	jsr _strcpy
	addq.l #8,%sp
	jra .L118
	.even
	.globl	__Z18changeScreenKeypadi
__Z18changeScreenKeypadi:
	link.w %fp,#0
	move.l %d2,-(%sp)
	move.l 8(%fp),%d2
	move.l %d2,%d0
	and.l JAGPAD_HASH,%d0
	jne .L121
	move.l __ZL10inputSpeed,%d0
	addq.l #1,%d0
.L122:
	move.l %d0,__ZL10inputSpeed
	and.l JAGPAD_STAR,%d2
	jeq .L126
	cmp.l __ZL17buttonSensitivity.l,%d0
	jgt .L128
	clr.l __ZL10inputSpeed
.L126:
	move.l -4(%fp),%d2
	unlk %fp
	rts
.L121:
	move.l __ZL10inputSpeed,%d0
	addq.l #1,%d0
	move.l %d0,__ZL10inputSpeed
	cmp.l __ZL17buttonSensitivity.l,%d0
	jgt .L129
	moveq #1,%d0
	jra .L122
.L128:
	jsr _cls
	clr.l __ZL6sorted
	addq.l #1,__ZL12screenNumber
	clr.l __ZL10inputSpeed
	jra .L126
.L129:
	jsr _cls
	clr.l __ZL6sorted
	subq.l #1,__ZL12screenNumber
	moveq #1,%d0
	jra .L122
.LC7:
	.ascii " is the winner!\0"
.LC8:
	.ascii "Congratulations!\0"
.LC9:
	.ascii "%s%s%s%s\0"
.LC10:
	.ascii "Who will be today's winner?\0"
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
	jeq .L137
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	jsr rapLocate
	move.l #.LC10,_js_r_textbuffer
	addq.l #8,%sp
	jsr _rapPrint
	move.l -8(%fp),%d2
	move.l -4(%fp),%d3
	unlk %fp
	rts
.L137:
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	jsr rapLocate
	move.l %d2,-(%sp)
	jsr _strlen
	lea (12,%sp),%sp
	moveq #8,%d1
	cmp.l %d0,%d1
	jcs .L138
	clr.b _BCX_TmpStr_buffer+2
	move.b #32,_BCX_TmpStr_buffer
	move.b #32,_BCX_TmpStr_buffer+1
	pea _BCX_TmpStr_buffer
	pea .LC7
	move.l %d2,-(%sp)
	pea .LC8
	pea .LC9
	jsr ee_printf
	move.l %d0,_js_r_textbuffer
	lea (20,%sp),%sp
	jsr _rapPrint
	clr.l -(%sp)
	jsr _jsfVsync
	addq.l #4,%sp
.L139:
	move.l -8(%fp),%d2
	move.l -4(%fp),%d3
	unlk %fp
	rts
.L138:
	clr.b _BCX_TmpStr_buffer+1
	pea _BCX_TmpStr_buffer
	pea .LC7
	move.l %d2,-(%sp)
	pea .LC8
	pea .LC9
	jsr ee_printf
	move.l %d0,_js_r_textbuffer
	lea (20,%sp),%sp
	jsr _rapPrint
	clr.l -(%sp)
	jsr _jsfVsync
	addq.l #4,%sp
	jra .L139
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
.LC11:
	.ascii "Point Manager\0"
.LC12:
	.ascii " #\0"
.LC13:
	.ascii "Name:\0"
.LC14:
	.ascii "Score\0"
.LC15:
	.ascii "% d\0"
	.even
	.globl	__Z14drawScoreboardi
__Z14drawScoreboardi:
	link.w %fp,#0
	movem.l #12348,-(%sp)
	move.l 8(%fp),%d2
	moveq #10,%d0
	move.l %d0,__ZL5tempX
	moveq #75,%d1
	move.l %d1,__ZL5tempY
	move.b #20,%d0
	move.l %d0,__ZL7yGrowth
	move.b #40,%d1
	move.l %d1,__ZL7xGrowth
	move.b #75,%d0
	move.l %d0,__ZL8defaultY
	move.b #10,%d1
	move.l %d1,__ZL8defaultX
	move.l __ZL12playerNumber,%d0
	move.l %d0,__ZL7Counter
	move.l __ZL10StepNumber,%d1
	moveq #10,%d3
	lea rapLocate,%a4
	lea ee_printf,%a3
	lea _rapPrint,%a2
	lea __ZL12playerScores,%a5
	tst.l %d1
	jlt .L146
.L152:
	cmp.l %d2,%d0
	sle %d1
	neg.b %d1
	jeq .L150
.L148:
	tst.l %d0
	jeq .L151
.L144:
	tst.l %d0
	jle .L145
	move.l __ZL5tempY,%d0
	add.l __ZL7yGrowth,%d0
	move.l %d0,__ZL5tempY
	move.l %d0,-(%sp)
	move.l __ZL5tempX,-(%sp)
	jsr (%a4)
	addq.l #4,%sp
	move.l __ZL7Counter,(%sp)
	pea .LC15
	jsr (%a3)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	move.l __ZL5tempX,%d0
	add.l __ZL7xGrowth,%d0
	move.l %d0,__ZL5tempX
	move.l __ZL5tempY,-(%sp)
	move.l %d0,-(%sp)
	jsr (%a4)
	addq.l #8,%sp
	move.l __ZL7Counter,%d0
	subq.l #1,%d0
	moveq #11,%d1
	lsl.l %d1,%d0
	add.l #__ZL7players,%d0
	move.l %d0,-(%sp)
	pea .LC3
	jsr (%a3)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	move.l __ZL7xGrowth,%a0
	add.l %a0,%a0
	lea 10(%a0,%a0.l),%a0
	add.l __ZL5tempX,%a0
	move.l %a0,__ZL5tempX
	move.l __ZL5tempY,-(%sp)
	move.l %a0,-(%sp)
	jsr (%a4)
	addq.l #8,%sp
	move.l __ZL7Counter,%d0
	subq.l #1,%d0
	add.l %d0,%d0
	add.l %d0,%d0
	move.l (%a5,%d0.l),-(%sp)
	pea .LC15
	jsr (%a3)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	move.l __ZL7Counter,%d0
.L145:
	move.l __ZL8defaultX,%d3
	move.l %d3,__ZL5tempX
	move.l __ZL10StepNumber,%d1
	add.l %d1,%d0
	move.l %d0,__ZL7Counter
	tst.l %d1
	jge .L152
.L146:
	cmp.l %d2,%d0
	sge %d1
	neg.b %d1
	jne .L148
.L150:
	move.l __ZL8defaultY,__ZL5tempY
	movem.l -24(%fp),#15372
	unlk %fp
	rts
.L151:
	moveq #-15,%d0
	add.l __ZL5tempY,%d0
	move.l %d0,-(%sp)
	move.l %d3,%d0
	lsl.l #3,%d0
	move.l %d0,%a0
	pea (%a0,%d3.l)
	jsr (%a4)
	addq.l #4,%sp
	move.l #.LC11,(%sp)
	pea .LC3
	jsr (%a3)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	move.l __ZL5tempY,-(%sp)
	move.l __ZL5tempX,-(%sp)
	jsr (%a4)
	addq.l #4,%sp
	move.l #.LC12,(%sp)
	pea .LC3
	jsr (%a3)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	move.l __ZL5tempX,%d0
	add.l __ZL7xGrowth,%d0
	move.l %d0,__ZL5tempX
	move.l __ZL5tempY,-(%sp)
	move.l %d0,-(%sp)
	jsr (%a4)
	addq.l #4,%sp
	move.l #.LC13,(%sp)
	pea .LC3
	jsr (%a3)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	move.l __ZL7xGrowth,%a0
	add.l %a0,%a0
	lea 10(%a0,%a0.l),%a0
	add.l __ZL5tempX,%a0
	move.l %a0,__ZL5tempX
	move.l __ZL5tempY,-(%sp)
	move.l %a0,-(%sp)
	jsr (%a4)
	addq.l #4,%sp
	move.l #.LC14,(%sp)
	pea .LC3
	jsr (%a3)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	move.l __ZL7Counter,%d0
	jra .L144
	.even
	.globl	__Z14calculateScorei
__Z14calculateScorei:
	link.w %fp,#0
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	move.l 8(%fp),%d2
	cmp.l __ZL10maxPlayers.l,%d2
	jge .L159
	move.l __ZL10inputSpeed,%d0
	addq.l #1,%d0
	move.l %d0,__ZL10inputSpeed
	cmp.l __ZL17buttonSensitivity.l,%d0
	jle .L159
	move.l __ZL9addNumber,%d0
	moveq #1,%d1
	cmp.l %d0,%d1
	jeq .L161
	tst.l %d0
	jne .L158
.L162:
	lea __ZL12playerScores,%a0
	add.l %d2,%d2
	add.l %d2,%d2
	move.l (%a0,%d2.l),%d0
	jle .L158
	subq.l #1,%d0
	move.l %d0,(%a0,%d2.l)
.L158:
	clr.l __ZL10inputSpeed
.L159:
	move.l -8(%fp),%d2
	move.l -4(%fp),%d3
	unlk %fp
	rts
.L161:
	lea __ZL12playerScores,%a0
	move.l %d2,%d0
	add.l %d2,%d0
	move.l %d0,%d1
	add.l %d0,%d1
	move.l (%a0,%d1.l),%d0
	moveq #9,%d3
	cmp.l %d0,%d3
	jlt .L157
	addq.l #1,%d0
	move.l %d0,(%a0,%d1.l)
.L157:
	moveq #10,%d1
	cmp.l %d0,%d1
	jne .L158
	jsr _cls
	move.l %d2,%d0
	moveq #11,%d3
	lsl.l %d3,%d0
	add.l #__ZL7players,%d0
	move.l %d0,-(%sp)
	pea __ZL6winner
	jsr _strcpy
	moveq #1,%d0
	move.l %d0,__ZL9scrolling
	clr.l __ZL12screenNumber
	move.l __ZL9addNumber,%d0
	addq.l #8,%sp
	jeq .L162
	jra .L158
	.even
	.globl	__Z9keepScorei
__Z9keepScorei:
	link.w %fp,#0
	move.l %d2,-(%sp)
	move.l 8(%fp),%d2
	move.l %d2,%d0
	and.l JAGPAD_1,%d0
	jne .L176
	move.l %d2,%d0
	and.l JAGPAD_2,%d0
	jne .L177
.L166:
	move.l %d2,%d0
	and.l JAGPAD_3,%d0
	jne .L178
.L167:
	move.l %d2,%d0
	and.l JAGPAD_4,%d0
	jne .L179
.L168:
	move.l %d2,%d0
	and.l JAGPAD_5,%d0
	jne .L180
.L169:
	move.l %d2,%d0
	and.l JAGPAD_6,%d0
	jne .L181
.L170:
	and.l JAGPAD_0,%d2
	jeq .L174
	move.l __ZL10inputSpeed,%d0
	addq.l #1,%d0
	move.l %d0,__ZL10inputSpeed
	cmp.l __ZL17buttonSensitivity.l,%d0
	jle .L174
	moveq #1,%d0
	cmp.l __ZL9addNumber.l,%d0
	sne %d0
	ext.w %d0
	ext.l %d0
	neg.l %d0
	move.l %d0,__ZL9addNumber
	clr.l __ZL10inputSpeed
.L174:
	move.l -4(%fp),%d2
	unlk %fp
	rts
.L181:
	moveq #5,%d0
	move.l %d0,__ZL14selectedPlayer
	pea 5.w
	jsr __Z14calculateScorei
	addq.l #4,%sp
	jra .L170
.L180:
	moveq #4,%d0
	move.l %d0,__ZL14selectedPlayer
	pea 4.w
	jsr __Z14calculateScorei
	addq.l #4,%sp
	move.l %d2,%d0
	and.l JAGPAD_6,%d0
	jeq .L170
	jra .L181
.L179:
	moveq #3,%d0
	move.l %d0,__ZL14selectedPlayer
	pea 3.w
	jsr __Z14calculateScorei
	addq.l #4,%sp
	move.l %d2,%d0
	and.l JAGPAD_5,%d0
	jeq .L169
	jra .L180
.L178:
	moveq #2,%d0
	move.l %d0,__ZL14selectedPlayer
	pea 2.w
	jsr __Z14calculateScorei
	addq.l #4,%sp
	move.l %d2,%d0
	and.l JAGPAD_4,%d0
	jeq .L168
	jra .L179
.L177:
	moveq #1,%d0
	move.l %d0,__ZL14selectedPlayer
	pea 1.w
	jsr __Z14calculateScorei
	addq.l #4,%sp
	move.l %d2,%d0
	and.l JAGPAD_3,%d0
	jeq .L167
	jra .L178
.L176:
	clr.l __ZL14selectedPlayer
	clr.l -(%sp)
	jsr __Z14calculateScorei
	addq.l #4,%sp
	move.l %d2,%d0
	and.l JAGPAD_2,%d0
	jeq .L166
	jra .L177
.LC16:
	.ascii "Player Ranks\0"
	.even
	.globl	__Z12drawRankingsi
__Z12drawRankingsi:
	link.w %fp,#-8
	movem.l #16188,-(%sp)
	move.l 8(%fp),%d7
	moveq #10,%d0
	move.l %d0,__ZL5tempX
	moveq #75,%d1
	move.l %d1,__ZL5tempY
	move.b #20,%d0
	move.l %d0,__ZL7yGrowth
	move.b #40,%d1
	move.l %d1,__ZL7xGrowth
	move.b #75,%d0
	move.l %d0,__ZL8defaultY
	move.b #10,%d1
	move.l %d1,__ZL8defaultX
	tst.l __ZL6sorted
	jeq .L184
	move.l __ZL10StepNumber,%d4
	move.l __ZL12playerNumber,%d0
	move.l %d0,__ZL7Counter
	lea rapLocate,%a4
	lea ee_printf,%a3
	lea _rapPrint,%a2
	lea __ZL16rankPlayerScores,%a5
.L197:
	tst.l %d4
	jlt .L200
.L207:
	cmp.l %d7,%d0
	sle %d1
	neg.b %d1
	jeq .L205
.L202:
	tst.l %d0
	jeq .L206
.L198:
	tst.l %d0
	jle .L199
	move.l __ZL5tempY,%d0
	add.l __ZL7yGrowth,%d0
	move.l %d0,__ZL5tempY
	move.l %d0,-(%sp)
	move.l __ZL5tempX,-(%sp)
	jsr (%a4)
	addq.l #4,%sp
	move.l __ZL7Counter,(%sp)
	pea .LC15
	jsr (%a3)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	move.l __ZL5tempX,%d0
	add.l __ZL7xGrowth,%d0
	move.l %d0,__ZL5tempX
	move.l __ZL5tempY,-(%sp)
	move.l %d0,-(%sp)
	jsr (%a4)
	addq.l #8,%sp
	move.l __ZL7Counter,%d0
	subq.l #1,%d0
	moveq #11,%d1
	lsl.l %d1,%d0
	add.l #__ZL11rankPlayers,%d0
	move.l %d0,-(%sp)
	pea .LC3
	jsr (%a3)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	move.l __ZL7xGrowth,%a0
	add.l %a0,%a0
	lea 10(%a0,%a0.l),%a0
	add.l __ZL5tempX,%a0
	move.l %a0,__ZL5tempX
	move.l __ZL5tempY,-(%sp)
	move.l %a0,-(%sp)
	jsr (%a4)
	addq.l #8,%sp
	move.l __ZL7Counter,%d0
	subq.l #1,%d0
	add.l %d0,%d0
	add.l %d0,%d0
	move.l (%a5,%d0.l),-(%sp)
	pea .LC15
	jsr (%a3)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	move.l __ZL7Counter,%d0
.L199:
	move.l __ZL8defaultX,__ZL5tempX
	move.l __ZL10StepNumber,%d4
	add.l %d4,%d0
	move.l %d0,__ZL7Counter
	tst.l %d4
	jge .L207
.L200:
	cmp.l %d7,%d0
	sge %d1
	neg.b %d1
	jne .L202
.L205:
	move.l __ZL8defaultY,__ZL5tempY
	movem.l -48(%fp),#15612
	unlk %fp
	rts
.L206:
	moveq #-15,%d0
	add.l __ZL5tempY,%d0
	move.l %d0,-(%sp)
	move.l __ZL5tempX,%d0
	move.l %d0,%d1
	lsl.l #3,%d1
	move.l %d1,%a0
	pea (%a0,%d0.l)
	jsr (%a4)
	addq.l #4,%sp
	move.l #.LC16,(%sp)
	pea .LC3
	jsr (%a3)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	move.l __ZL5tempY,-(%sp)
	move.l __ZL5tempX,-(%sp)
	jsr (%a4)
	addq.l #4,%sp
	move.l #.LC12,(%sp)
	pea .LC3
	jsr (%a3)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	move.l __ZL5tempX,%d0
	add.l __ZL7xGrowth,%d0
	move.l %d0,__ZL5tempX
	move.l __ZL5tempY,-(%sp)
	move.l %d0,-(%sp)
	jsr (%a4)
	addq.l #4,%sp
	move.l #.LC13,(%sp)
	pea .LC3
	jsr (%a3)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	move.l __ZL7xGrowth,%a0
	add.l %a0,%a0
	lea 10(%a0,%a0.l),%a0
	add.l __ZL5tempX,%a0
	move.l %a0,__ZL5tempX
	move.l __ZL5tempY,-(%sp)
	move.l %a0,-(%sp)
	jsr (%a4)
	addq.l #4,%sp
	move.l #.LC14,(%sp)
	pea .LC3
	jsr (%a3)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	move.l __ZL7Counter,%d0
	jra .L198
.L184:
	move.l __ZL12playerNumber,%d5
	move.l %d5,__ZL7Counter
	move.l __ZL10StepNumber,%d4
	move.l %d4,%a4
	add.l %d4,%a4
	move.l %a4,%d6
	add.l %a4,%d6
	move.l %d5,%d2
	moveq #0,%d3
	lea _strcpy,%a5
	tst.l %d4
	jlt .L186
	move.l %d5,%d0
	sub.l %d4,%d0
	move.l %d0,%a2
	add.l %d0,%a2
	add.l %a2,%a2
	move.l %a2,%a3
	add.l #__ZL16rankPlayerScores,%a3
	add.l #__ZL12playerScores,%a2
	add.l %d6,%d3
	cmp.l %d7,%d2
	jgt .L188
.L190:
	move.l %d2,%d0
	moveq #11,%d1
	lsl.l %d1,%d0
	move.l %d0,%d1
	add.l #__ZL7players,%d1
	move.l %d1,-(%sp)
	add.l #__ZL11rankPlayers,%d0
	move.l %d0,-(%sp)
	jsr (%a5)
	move.l (%a2,%d3.l),(%a3,%d3.l)
	add.l %d4,%d2
	move.l %d2,__ZL7Counter
	addq.l #8,%sp
	add.l %d6,%d3
	cmp.l %d7,%d2
	jle .L190
.L188:
	move.l %d5,__ZL7Counter
	move.l %d5,%d6
	subq.l #1,%d6
	add.l %a4,%a4
	move.l %a4,-4(%fp)
	move.l %d5,%d0
	add.l %d5,%d0
	move.l %d0,%a5
	add.l %d0,%a5
	add.l #__ZL16rankPlayerScores,%a5
	move.l %d7,%d1
	subq.l #1,%d1
	move.l %d1,-8(%fp)
	lea _strcpy,%a4
	tst.l %d4
	jlt .L194
.L209:
	cmp.l %d7,%d5
	slt %d0
	neg.b %d0
	jeq .L208
.L196:
	move.l %d5,%d0
	moveq #11,%d1
	lsl.l %d1,%d0
	add.l #__ZL11rankPlayers,%d0
	move.l %d0,-(%sp)
	pea __ZL8tempName
	jsr (%a4)
	move.l (%a5),%d3
	move.l %d3,__ZL9tempScore
	move.l %d6,%d2
	move.l %d6,__ZL1j
	addq.l #8,%sp
	jlt .L191
	cmp.l -4(%a5),%d3
	jge .L191
	move.l %d5,%d0
	lsl.l #2,%d0
	move.l %d0,%a3
	add.l #__ZL16rankPlayerScores+4,%a3
	move.l %d6,%a2
	add.l %d6,%a2
	add.l %a2,%a2
	add.l #__ZL16rankPlayerScores,%a2
.L192:
	move.l (%a2),-(%a3)
	move.l %d2,%d0
	moveq #11,%d1
	lsl.l %d1,%d0
	add.l #__ZL11rankPlayers,%d0
	move.l %d0,-(%sp)
	move.l %d2,%d0
	lsl.l %d1,%d0
	add.l #__ZL11rankPlayers+2048,%d0
	move.l %d0,-(%sp)
	jsr (%a4)
	subq.l #1,%d2
	move.l %d2,__ZL1j
	addq.l #8,%sp
	moveq #-1,%d0
	cmp.l %d2,%d0
	jeq .L191
	cmp.l -(%a2),%d3
	jlt .L192
.L191:
	addq.l #1,%d2
	move.l %d2,%d0
	add.l %d2,%d0
	add.l %d0,%d0
	lea __ZL16rankPlayerScores,%a0
	move.l %d3,(%a0,%d0.l)
	pea __ZL8tempName
	moveq #11,%d0
	lsl.l %d0,%d2
	add.l #__ZL11rankPlayers,%d2
	move.l %d2,-(%sp)
	jsr (%a4)
	add.l %d4,%d5
	move.l %d5,__ZL7Counter
	add.l %d4,%d6
	add.l -4(%fp),%a5
	addq.l #8,%sp
	tst.l %d4
	jge .L209
.L194:
	cmp.l -8(%fp),%d5
	sge %d0
	neg.b %d0
	jne .L196
.L208:
	moveq #1,%d1
	move.l %d1,__ZL6sorted
	move.l __ZL12playerNumber,%d0
	move.l %d0,__ZL7Counter
	lea rapLocate,%a4
	lea ee_printf,%a3
	lea _rapPrint,%a2
	lea __ZL16rankPlayerScores,%a5
	jra .L197
.L186:
	move.l %d5,%a2
	sub.l %d4,%a2
	add.l %a2,%a2
	add.l %a2,%a2
	move.l %a2,%a3
	add.l #__ZL16rankPlayerScores,%a3
	add.l #__ZL12playerScores,%a2
.L189:
	add.l %d6,%d3
	cmp.l %d7,%d2
	jlt .L188
	move.l %d2,%d0
	moveq #11,%d1
	lsl.l %d1,%d0
	move.l %d0,%d1
	add.l #__ZL7players,%d1
	move.l %d1,-(%sp)
	add.l #__ZL11rankPlayers,%d0
	move.l %d0,-(%sp)
	jsr (%a5)
	move.l (%a2,%d3.l),(%a3,%d3.l)
	add.l %d4,%d2
	move.l %d2,__ZL7Counter
	addq.l #8,%sp
	jra .L189
	.even
	.globl	__Z9basicmainv
__Z9basicmainv:
	link.w %fp,#-4
	movem.l #16188,-(%sp)
	moveq #7,%d0
	move.l %d0,__ZL17buttonSensitivity
	moveq #1,%d1
	move.l %d1,__ZL9upperCase
	moveq #65,%d2
	move.l %d2,__ZL12upperCaseLow
	move.b #90,%d0
	move.l %d0,__ZL13upperCaseHigh
	move.b #97,%d1
	move.l %d1,__ZL12lowerCaseLow
	move.b #122,%d2
	move.l %d2,__ZL13lowerCaseHigh
	clr.l __ZL10inputSpeed
	clr.l __ZL14selectedPlayer
	move.b #6,%d0
	move.l %d0,__ZL10maxPlayers
	clr.l __ZL9speedTemp
	clr.l __ZL4temp
	clr.b __ZL8tempName
	clr.l __ZL9scrolling
	clr.l _jsfFontIndx
	move.b #1,%d1
	move.l %d1,_jsfFontSize
	move.b #38,%d2
	move.l %d2,__ZL2tx
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
	clr.l __ZL12playerScores
	clr.l __ZL12playerScores+4
	clr.l __ZL12playerScores+8
	clr.l __ZL12playerScores+12
	clr.l __ZL12playerScores+16
	clr.l __ZL12playerScores+20
	move.b #2,%d0
	move.l %d0,__ZL7intName
	clr.l __ZL12screenNumber
	move.l %d1,__ZL9addNumber
	clr.l __ZL12playerNumber
	move.l %d1,__ZL10StepNumber
	lea jsfGetPad,%a4
	move.l #rapLocate,%d3
	move.l #_BCX_TmpStr_buffer,-4(%fp)
	lea ee_printf,%a5
	lea _rapPrint,%a2
	lea _jsfVsync,%a3
	move.l #__Z18selectWinnerKeypadi,%d5
	move.l #_memset,%d7
	move.l #__Z9keepScorei,%d6
	move.l #_cls,%d4
	pea 1.w
	jsr (%a4)
	move.l %d0,%d2
	move.l %d0,__ZL4pad1
	move.l __ZL12screenNumber,%d0
	addq.l #4,%sp
	jeq .L228
.L212:
	moveq #1,%d1
	cmp.l %d0,%d1
	jeq .L229
.L217:
	moveq #2,%d1
	cmp.l %d0,%d1
	jeq .L230
.L218:
	moveq #3,%d1
	cmp.l %d0,%d1
	jeq .L231
.L219:
	move.l %d2,%d0
	and.l JAGPAD_HASH,%d0
	jne .L220
.L235:
	move.l __ZL10inputSpeed,%d0
	addq.l #1,%d0
.L221:
	move.l %d0,__ZL10inputSpeed
	and.l JAGPAD_STAR,%d2
	jeq .L223
	cmp.l __ZL17buttonSensitivity.l,%d0
	jgt .L232
	clr.l __ZL10inputSpeed
.L223:
	clr.l -(%sp)
	jsr (%a3)
	addq.l #4,%sp
	pea 1.w
	jsr (%a4)
	move.l %d0,%d2
	move.l %d0,__ZL4pad1
	move.l __ZL12screenNumber,%d0
	addq.l #4,%sp
	jne .L212
.L228:
	move.l __ZL2ty,%d1
	move.l __ZL2tx,%d0
	moveq #1,%d2
	cmp.l __ZL9scrolling.l,%d2
	jeq .L233
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	move.l %d3,%a0
	jsr (%a0)
	move.l #.LC10,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	moveq #1,%d0
	cmp.l __ZL9scrolling.l,%d0
	jeq .L234
.L216:
	move.l __ZL4pad1,%d2
	move.l %d2,-(%sp)
	move.l %d5,%a0
	jsr (%a0)
	move.l __ZL12screenNumber,%d0
	addq.l #4,%sp
.L237:
	moveq #1,%d1
	cmp.l %d0,%d1
	jne .L217
	jra .L229
.L232:
	move.l %d4,%a0
	jsr (%a0)
	clr.l __ZL6sorted
	addq.l #1,__ZL12screenNumber
	clr.l __ZL10inputSpeed
	jra .L223
.L229:
	move.l %d2,-(%sp)
	jsr __Z15writePlayerNamei
	move.l __ZL4temp,%d2
	moveq #10,%d0
	move.l %d0,__ZL5tempX
	moveq #60,%d1
	move.l %d1,__ZL5tempY
	move.b #20,%d0
	move.l %d0,__ZL7yGrowth
	move.l %d1,__ZL8defaultY
	moveq #60,%d0
	move.l %d0,(%sp)
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
	jsr (%a5)
	move.l %d0,_js_r_textbuffer
	lea (16,%sp),%sp
	jsr (%a2)
	move.l __ZL5tempY,%d0
	add.l __ZL7yGrowth,%d0
	move.l %d0,__ZL5tempY
	move.l %d0,-(%sp)
	move.l __ZL5tempX,-(%sp)
	move.l %d3,%a0
	jsr (%a0)
	clr.b _BCX_TmpStr_buffer+21
	pea 21.w
	pea 32.w
	pea _BCX_TmpStr_buffer
	move.l %d7,%a0
	jsr (%a0)
	lea (16,%sp),%sp
	move.l %d0,(%sp)
	pea .LC3
	jsr (%a5)
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
	jsr (%a5)
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	jsr (%a2)
	move.l __ZL5tempY,%d0
	add.l __ZL7yGrowth,%d0
	move.l %d0,__ZL5tempY
	move.l %d0,-(%sp)
	move.l __ZL5tempX,-(%sp)
	move.l %d3,%a0
	jsr (%a0)
	clr.b _BCX_TmpStr_buffer+21
	pea 21.w
	pea 32.w
	pea _BCX_TmpStr_buffer
	move.l %d7,%a0
	jsr (%a0)
	lea (16,%sp),%sp
	move.l %d0,(%sp)
	pea .LC3
	jsr (%a5)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	pea __ZL8tempName
	pea .LC6
	pea .LC5
	jsr (%a5)
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	jsr (%a2)
	move.l __ZL5tempY,%d0
	add.l __ZL7yGrowth,%d0
	move.l %d0,__ZL5tempY
	move.l %d0,-(%sp)
	move.l __ZL5tempX,-(%sp)
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
	jsr (%a5)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	move.l __ZL8defaultY,__ZL5tempY
	move.l __ZL12screenNumber,%d0
	move.l __ZL4pad1,%d2
	moveq #2,%d1
	cmp.l %d0,%d1
	jne .L218
	jra .L230
.L231:
	move.l %d2,-(%sp)
	move.l %d6,%a0
	jsr (%a0)
	move.l __ZL10maxPlayers,(%sp)
	jsr __Z12drawRankingsi
	move.l __ZL4pad1,%d2
	addq.l #4,%sp
	move.l %d2,%d0
	and.l JAGPAD_HASH,%d0
	jeq .L235
.L220:
	move.l __ZL10inputSpeed,%d0
	addq.l #1,%d0
	move.l %d0,__ZL10inputSpeed
	cmp.l __ZL17buttonSensitivity.l,%d0
	jgt .L236
	moveq #1,%d0
	jra .L221
.L230:
	move.l %d2,-(%sp)
	move.l %d6,%a0
	jsr (%a0)
	move.l __ZL10maxPlayers,(%sp)
	jsr __Z14drawScoreboardi
	move.l __ZL12screenNumber,%d0
	move.l __ZL4pad1,%d2
	addq.l #4,%sp
	moveq #3,%d1
	cmp.l %d0,%d1
	jne .L219
	jra .L231
.L234:
	subq.l #2,__ZL2tx
	move.l __ZL4pad1,%d2
	move.l %d2,-(%sp)
	move.l %d5,%a0
	jsr (%a0)
	move.l __ZL12screenNumber,%d0
	addq.l #4,%sp
	jra .L237
.L236:
	move.l %d4,%a0
	jsr (%a0)
	clr.l __ZL6sorted
	subq.l #1,__ZL12screenNumber
	moveq #1,%d0
	jra .L221
.L233:
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	move.l %d3,%a0
	jsr (%a0)
	pea __ZL6winner
	jsr _strlen
	lea (12,%sp),%sp
	moveq #8,%d1
	cmp.l %d0,%d1
	jcs .L238
	clr.b _BCX_TmpStr_buffer+2
	move.b #32,_BCX_TmpStr_buffer
	move.l -4(%fp),%a0
	move.b #32,1(%a0)
	move.l #_BCX_TmpStr_buffer,-4(%fp)
	pea _BCX_TmpStr_buffer
	pea .LC7
	pea __ZL6winner
	pea .LC8
	pea .LC9
	jsr (%a5)
	move.l %d0,_js_r_textbuffer
	lea (20,%sp),%sp
	jsr (%a2)
	clr.l -(%sp)
	jsr (%a3)
	addq.l #4,%sp
.L239:
	moveq #1,%d0
	cmp.l __ZL9scrolling.l,%d0
	jne .L216
	jra .L234
.L238:
	clr.b _BCX_TmpStr_buffer+1
	pea _BCX_TmpStr_buffer
	pea .LC7
	pea __ZL6winner
	pea .LC8
	pea .LC9
	jsr (%a5)
	move.l %d0,_js_r_textbuffer
	lea (20,%sp),%sp
	jsr (%a2)
	clr.l -(%sp)
	jsr (%a3)
	addq.l #4,%sp
	jra .L239
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
.lcomm __ZL17buttonSensitivity,4
.lcomm __ZL9upperCase,4
.lcomm __ZL12upperCaseLow,4
.lcomm __ZL13upperCaseHigh,4
.lcomm __ZL12lowerCaseLow,4
.lcomm __ZL13lowerCaseHigh,4
.lcomm __ZL10inputSpeed,4
.lcomm __ZL14selectedPlayer,4
.lcomm __ZL10maxPlayers,4
.lcomm __ZL9speedTemp,4
.lcomm __ZL4temp,4
.lcomm __ZL8tempName,2048
.lcomm __ZL9scrolling,4
.lcomm __ZL2tx,4
.lcomm __ZL2ty,4
.lcomm __ZL6winner,2048
.lcomm __ZL7players,12288
.lcomm __ZL12playerScores,24
.lcomm __ZL7intName,4
.lcomm __ZL12screenNumber,4
.lcomm __ZL9addNumber,4
.lcomm __ZL12playerNumber,4
.lcomm __ZL10StepNumber,4
.lcomm __ZL4pad1,4
.lcomm __ZL5tempX,4
.lcomm __ZL5tempY,4
.lcomm __ZL7yGrowth,4
.lcomm __ZL8defaultY,4
.lcomm __ZL6sorted,4
.lcomm __ZL12letterHolder,2048
.lcomm __ZL7xGrowth,4
.lcomm __ZL8defaultX,4
.lcomm __ZL7Counter,4
.lcomm __ZL11rankPlayers,12288
.lcomm __ZL16rankPlayerScores,24
.lcomm __ZL9tempScore,4
.lcomm __ZL1j,4
