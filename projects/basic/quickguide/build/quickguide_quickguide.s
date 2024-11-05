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
	pea 10.w
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
	pea .LC3
	jsr (%a3)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	move.l __ZL10tempYStart,__ZL5tempY
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
	moveq #5,%d1
	cmp.l %d0,%d1
	jge .L28
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
	moveq #5,%d1
	cmp.l %d0,%d1
	jge .L38
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
	moveq #5,%d1
	cmp.l %d0,%d1
	jge .L66
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
	moveq #5,%d1
	cmp.l %d0,%d1
	jge .L92
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
	moveq #5,%d1
	cmp.l %d0,%d1
	jge .L86
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
.LC7:
	.ascii " is the winner!\0"
.LC8:
	.ascii "Congratulations!\0"
.LC9:
	.ascii "%s%s%s%s\0"
.LC10:
	.ascii "Who will be today's winner?\0"
	.even
	.globl	__Z9basicmainv
__Z9basicmainv:
	link.w %fp,#-4
	movem.l #16188,-(%sp)
	moveq #1,%d0
	move.l %d0,__ZL9upperCase
	moveq #65,%d1
	move.l %d1,__ZL12upperCaseLow
	moveq #90,%d2
	move.l %d2,__ZL13upperCaseHigh
	move.b #97,%d0
	move.l %d0,__ZL12lowerCaseLow
	move.b #122,%d1
	move.l %d1,__ZL13lowerCaseHigh
	clr.l __ZL10inputSpeed
	clr.l __ZL14selectedPlayer
	move.b #6,%d2
	move.l %d2,__ZL11playerLimit
	move.b #60,%d0
	move.l %d0,__ZL10tempYStart
	move.l %d0,__ZL5tempY
	move.b #20,%d1
	move.l %d1,__ZL7yGrowth
	clr.l __ZL9speedTemp
	clr.l __ZL4temp
	clr.b __ZL8tempName
	clr.l __ZL9scrolling
	clr.l _jsfFontIndx
	move.b #1,%d2
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
	lea jsfGetPad,%a4
	move.l #rapLocate,%d3
	move.l #_BCX_TmpStr_buffer,-4(%fp)
	lea ee_printf,%a5
	lea _rapPrint,%a2
	lea _jsfVsync,%a3
	move.l #__Z18selectWinnerKeypadi,%d5
	move.l #__Z15writePlayerNamei,%d7
	move.l #_memset,%d6
	move.l #_cls,%d4
	pea 1.w
	jsr (%a4)
	move.l %d0,%d2
	move.l %d0,__ZL4pad1
	move.l __ZL12screenNumber,%d0
	addq.l #4,%sp
	jeq .L132
.L121:
	moveq #1,%d1
	cmp.l %d0,%d1
	jeq .L133
.L126:
	move.l %d2,%d0
	and.l JAGPAD_HASH,%d0
	jne .L134
.L127:
	and.l JAGPAD_STAR,%d2
	jne .L135
.L128:
	clr.l -(%sp)
	jsr (%a3)
	addq.l #4,%sp
.L136:
	pea 1.w
	jsr (%a4)
	move.l %d0,%d2
	move.l %d0,__ZL4pad1
	move.l __ZL12screenNumber,%d0
	addq.l #4,%sp
	jne .L121
	jra .L132
.L135:
	move.l %d4,%a0
	jsr (%a0)
	moveq #1,%d0
	move.l %d0,__ZL12screenNumber
	clr.l -(%sp)
	jsr (%a3)
	addq.l #4,%sp
	jra .L136
.L134:
	move.l %d4,%a0
	jsr (%a0)
	clr.l __ZL12screenNumber
	and.l JAGPAD_STAR,%d2
	jeq .L128
	jra .L135
.L132:
	move.l __ZL2ty,%d1
	move.l __ZL2tx,%d0
	moveq #1,%d2
	cmp.l __ZL9scrolling.l,%d2
	jeq .L137
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	move.l %d3,%a0
	jsr (%a0)
	move.l #.LC10,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	moveq #1,%d0
	cmp.l __ZL9scrolling.l,%d0
	jeq .L138
.L125:
	move.l __ZL4pad1,%d2
	move.l %d2,-(%sp)
	move.l %d5,%a0
	jsr (%a0)
	move.l __ZL12screenNumber,%d0
	addq.l #4,%sp
.L139:
	moveq #1,%d1
	cmp.l %d0,%d1
	jne .L126
.L133:
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
	jsr (%a5)
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
	clr.b _BCX_TmpStr_buffer+21
	pea 21.w
	pea 32.w
	pea _BCX_TmpStr_buffer
	move.l %d6,%a0
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
	pea 10.w
	move.l %d3,%a0
	jsr (%a0)
	clr.b _BCX_TmpStr_buffer+21
	pea 21.w
	pea 32.w
	pea _BCX_TmpStr_buffer
	move.l %d6,%a0
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
	jsr (%a5)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	move.l __ZL10tempYStart,__ZL5tempY
	move.l __ZL4pad1,%d2
	move.l %d2,%d0
	and.l JAGPAD_HASH,%d0
	jeq .L127
	jra .L134
.L138:
	subq.l #2,__ZL2tx
	move.l __ZL4pad1,%d2
	move.l %d2,-(%sp)
	move.l %d5,%a0
	jsr (%a0)
	move.l __ZL12screenNumber,%d0
	addq.l #4,%sp
	jra .L139
.L137:
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	move.l %d3,%a0
	jsr (%a0)
	pea __ZL6winner
	jsr _strlen
	lea (12,%sp),%sp
	moveq #8,%d1
	cmp.l %d0,%d1
	jcs .L140
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
.L141:
	moveq #1,%d0
	cmp.l __ZL9scrolling.l,%d0
	jne .L125
	jra .L138
.L140:
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
	jra .L141
	.even
	.globl	__Z18changeScreenKeypadi
__Z18changeScreenKeypadi:
	link.w %fp,#0
	move.l %d2,-(%sp)
	move.l 8(%fp),%d2
	move.l %d2,%d0
	and.l JAGPAD_HASH,%d0
	jne .L148
	and.l JAGPAD_STAR,%d2
	jne .L149
.L146:
	move.l -4(%fp),%d2
	unlk %fp
	rts
.L149:
	jsr _cls
	moveq #1,%d0
	move.l %d0,__ZL12screenNumber
	move.l -4(%fp),%d2
	unlk %fp
	rts
.L148:
	jsr _cls
	clr.l __ZL12screenNumber
	and.l JAGPAD_STAR,%d2
	jeq .L146
	jra .L149
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
	jeq .L157
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
.L157:
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	jsr rapLocate
	move.l %d2,-(%sp)
	jsr _strlen
	lea (12,%sp),%sp
	moveq #8,%d1
	cmp.l %d0,%d1
	jcs .L158
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
.L159:
	move.l -8(%fp),%d2
	move.l -4(%fp),%d3
	unlk %fp
	rts
.L158:
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
	jra .L159
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
.lcomm __ZL12upperCaseLow,4
.lcomm __ZL13upperCaseHigh,4
.lcomm __ZL12lowerCaseLow,4
.lcomm __ZL13lowerCaseHigh,4
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
