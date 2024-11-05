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
	move.l %d0,-(%sp)
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
	move.l __ZL7yGrowth,%d0
	add.l %d0,%d0
	add.l __ZL5tempY,%d0
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
	move.l __ZL7yGrowth,%d0
	move.l %d0,%d1
	add.l %d0,%d1
	add.l %d1,%d0
	add.l __ZL5tempY,%d0
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
	addq.l #8,%sp
	clr.l (%sp)
	jsr _jsfVsync
	addq.l #4,%sp
	unlk %fp
	rts
	.even
	.globl	__Z9addLetterPc
__Z9addLetterPc:
	link.w %fp,#0
	clr.b _BCX_TmpStr_buffer+11
	lea _BCX_TmpStr_buffer,%a0
	move.b __ZL4temp+3,(%a0)
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
	move.l %a0,-(%sp)
	pea __ZL12letterHolder
	jsr _strcpy
	pea __ZL12letterHolder
	move.l 8(%fp),-(%sp)
	jsr _strcat
	clr.l __ZL9speedTemp
	lea (16,%sp),%sp
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
	.even
	.globl	__Z15writePlayerNamei
__Z15writePlayerNamei:
	link.w %fp,#0
	move.l %d2,-(%sp)
	move.l 8(%fp),%d2
	move.l %d2,%d0
	and.l JAGPAD_UP,%d0
	jne .L45
.L29:
	move.l %d2,%d0
	and.l JAGPAD_DOWN,%d0
	jne .L46
.L35:
	move.l %d2,%d0
	and.l JAGPAD_A,%d0
	jne .L47
.L41:
	and.l JAGPAD_B,%d2
	jne .L48
.L43:
	move.l -4(%fp),%d2
	unlk %fp
	rts
.L48:
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
	clr.l __ZL9speedTemp
	lea (16,%sp),%sp
	move.l -4(%fp),%d2
	unlk %fp
	rts
.L47:
	pea 2048.w
	clr.l -(%sp)
	pea __ZL8tempName
	jsr _memset
	addq.l #8,%sp
	clr.l (%sp)
	jsr _jsfVsync
	addq.l #4,%sp
	and.l JAGPAD_B,%d2
	jeq .L43
	jra .L48
.L46:
	move.l __ZL9speedTemp,%d0
	subq.l #1,%d0
	move.l %d0,__ZL9speedTemp
	moveq #5,%d1
	cmp.l %d0,%d1
	jlt .L49
	moveq #-5,%d1
	cmp.l %d0,%d1
	jle .L37
	clr.l __ZL9speedTemp
	move.l __ZL4temp,%d0
	subq.l #1,%d0
	move.l %d0,__ZL4temp
	moveq #64,%d1
	cmp.l %d0,%d1
	jlt .L40
.L52:
	moveq #65,%d0
	move.l %d0,__ZL4temp
	move.l %d2,%d0
	and.l JAGPAD_A,%d0
	jeq .L41
	jra .L47
.L45:
	move.l __ZL9speedTemp,%d0
	addq.l #1,%d0
	move.l %d0,__ZL9speedTemp
	moveq #5,%d1
	cmp.l %d0,%d1
	jlt .L50
	moveq #-5,%d1
	cmp.l %d0,%d1
	jle .L31
	clr.l __ZL9speedTemp
	move.l __ZL4temp,%d0
	subq.l #1,%d0
	move.l %d0,__ZL4temp
	moveq #64,%d1
	cmp.l %d0,%d1
	jlt .L34
.L51:
	moveq #65,%d0
	move.l %d0,__ZL4temp
	move.l %d2,%d0
	and.l JAGPAD_DOWN,%d0
	jeq .L35
	jra .L46
.L50:
	clr.l __ZL9speedTemp
	addq.l #1,__ZL4temp
.L31:
	move.l __ZL4temp,%d0
	moveq #64,%d1
	cmp.l %d0,%d1
	jge .L51
.L34:
	moveq #90,%d1
	cmp.l %d0,%d1
	jge .L29
	move.l %d1,__ZL4temp
	move.l %d2,%d0
	and.l JAGPAD_DOWN,%d0
	jeq .L35
	jra .L46
.L49:
	clr.l __ZL9speedTemp
	addq.l #1,__ZL4temp
.L37:
	move.l __ZL4temp,%d0
	moveq #64,%d1
	cmp.l %d0,%d1
	jge .L52
.L40:
	moveq #90,%d1
	cmp.l %d0,%d1
	jge .L35
	move.l %d1,__ZL4temp
	move.l %d2,%d0
	and.l JAGPAD_A,%d0
	jeq .L41
	jra .L47
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
	link.w %fp,#0
	movem.l #16188,-(%sp)
	moveq #60,%d0
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
	move.l #_BCX_TmpStr_buffer,%d7
	move.l #ee_printf,%d4
	lea _rapPrint,%a4
	lea _jsfVsync,%a2
	move.l #__Z18selectWinnerKeypadi,%d5
	move.l #__Z15writePlayerNamei,%d6
	move.l #_cls,%d3
	pea 1.w
	jsr (%a3)
	move.l %d0,%d2
	move.l %d0,__ZL4pad1
	move.l __ZL12screenNumber,%d0
	addq.l #4,%sp
	jeq .L66
.L55:
	moveq #1,%d1
	cmp.l %d0,%d1
	jeq .L67
.L60:
	move.l %d2,%d0
	and.l JAGPAD_HASH,%d0
	jne .L68
.L61:
	and.l JAGPAD_STAR,%d2
	jne .L69
.L62:
	clr.l -(%sp)
	jsr (%a2)
	addq.l #4,%sp
.L70:
	pea 1.w
	jsr (%a3)
	move.l %d0,%d2
	move.l %d0,__ZL4pad1
	move.l __ZL12screenNumber,%d0
	addq.l #4,%sp
	jne .L55
	jra .L66
.L69:
	move.l %d3,%a0
	jsr (%a0)
	moveq #1,%d0
	move.l %d0,__ZL12screenNumber
	clr.l -(%sp)
	jsr (%a2)
	addq.l #4,%sp
	jra .L70
.L68:
	move.l %d3,%a0
	jsr (%a0)
	clr.l __ZL12screenNumber
	and.l JAGPAD_STAR,%d2
	jeq .L62
	jra .L69
.L66:
	move.l __ZL2ty,%d1
	move.l __ZL2tx,%d0
	moveq #1,%d2
	cmp.l __ZL9scrolling.l,%d2
	jeq .L71
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	jsr (%a5)
	move.l #.LC9,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a4)
	moveq #1,%d0
	cmp.l __ZL9scrolling.l,%d0
	jeq .L72
.L59:
	move.l __ZL4pad1,%d2
	move.l %d2,-(%sp)
	move.l %d5,%a0
	jsr (%a0)
	move.l __ZL12screenNumber,%d0
	addq.l #4,%sp
.L73:
	moveq #1,%d1
	cmp.l %d0,%d1
	jne .L60
.L67:
	move.l %d2,-(%sp)
	move.l %d6,%a0
	jsr (%a0)
	move.l __ZL4temp,%d2
	move.l __ZL5tempY,(%sp)
	pea 10.w
	jsr (%a5)
	addq.l #4,%sp
	move.l #.LC0,(%sp)
	pea .LC1
	move.l %d4,%a0
	jsr (%a0)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a4)
	move.l __ZL5tempY,%d0
	add.l __ZL7yGrowth,%d0
	move.l %d0,-(%sp)
	pea 10.w
	jsr (%a5)
	addq.l #4,%sp
	move.l #__ZL8tempName,(%sp)
	pea .LC2
	pea .LC3
	move.l %d4,%a0
	jsr (%a0)
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	jsr (%a4)
	move.l __ZL7yGrowth,%d0
	add.l %d0,%d0
	add.l __ZL5tempY,%d0
	move.l %d0,-(%sp)
	pea 10.w
	jsr (%a5)
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
	pea .LC1
	move.l %d4,%a0
	jsr (%a0)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a4)
	move.l __ZL7yGrowth,%d0
	move.l %d0,%d1
	add.l %d0,%d1
	add.l %d1,%d0
	add.l __ZL5tempY,%d0
	move.l %d0,-(%sp)
	pea 10.w
	jsr (%a5)
	addq.l #4,%sp
	move.l %d2,(%sp)
	pea .LC4
	pea .LC5
	move.l %d4,%a0
	jsr (%a0)
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	jsr (%a4)
	move.l __ZL4pad1,%d2
	move.l %d2,%d0
	and.l JAGPAD_HASH,%d0
	jeq .L61
	jra .L68
.L72:
	subq.l #2,__ZL2tx
	move.l __ZL4pad1,%d2
	move.l %d2,-(%sp)
	move.l %d5,%a0
	jsr (%a0)
	move.l __ZL12screenNumber,%d0
	addq.l #4,%sp
	jra .L73
.L71:
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	jsr (%a5)
	pea __ZL6winner
	jsr _strlen
	lea (12,%sp),%sp
	moveq #8,%d1
	cmp.l %d0,%d1
	jcs .L74
	clr.b _BCX_TmpStr_buffer+2
	move.b #32,_BCX_TmpStr_buffer
	move.l %d7,%a0
	move.b #32,1(%a0)
	move.l #_BCX_TmpStr_buffer,%d7
	pea _BCX_TmpStr_buffer
	pea .LC6
	pea __ZL6winner
	pea .LC7
	pea .LC8
	move.l %d4,%a0
	jsr (%a0)
	move.l %d0,_js_r_textbuffer
	lea (20,%sp),%sp
	jsr (%a4)
	clr.l -(%sp)
	jsr (%a2)
	addq.l #4,%sp
.L75:
	moveq #1,%d0
	cmp.l __ZL9scrolling.l,%d0
	jne .L59
	jra .L72
.L74:
	clr.b _BCX_TmpStr_buffer+1
	pea _BCX_TmpStr_buffer
	pea .LC6
	pea __ZL6winner
	pea .LC7
	pea .LC8
	move.l %d4,%a0
	jsr (%a0)
	move.l %d0,_js_r_textbuffer
	lea (20,%sp),%sp
	jsr (%a4)
	clr.l -(%sp)
	jsr (%a2)
	addq.l #4,%sp
	jra .L75
	.even
	.globl	__Z10checkTempsv
__Z10checkTempsv:
	link.w %fp,#0
	move.l __ZL9speedTemp,%d0
	moveq #5,%d1
	cmp.l %d0,%d1
	jge .L78
	clr.l __ZL9speedTemp
	addq.l #1,__ZL4temp
.L79:
	move.l __ZL4temp,%d0
.L81:
	moveq #64,%d1
	cmp.l %d0,%d1
	jlt .L82
	moveq #65,%d0
	move.l %d0,__ZL4temp
.L84:
	unlk %fp
	rts
.L82:
	moveq #90,%d1
	cmp.l %d0,%d1
	jge .L84
	move.l %d1,__ZL4temp
	unlk %fp
	rts
.L78:
	moveq #-5,%d1
	cmp.l %d0,%d1
	jle .L79
	clr.l __ZL9speedTemp
	move.l __ZL4temp,%d0
	subq.l #1,%d0
	move.l %d0,__ZL4temp
	jra .L81
	.even
	.globl	__Z18changeScreenKeypadi
__Z18changeScreenKeypadi:
	link.w %fp,#0
	move.l %d2,-(%sp)
	move.l 8(%fp),%d2
	move.l %d2,%d0
	and.l JAGPAD_HASH,%d0
	jne .L92
	and.l JAGPAD_STAR,%d2
	jne .L93
.L90:
	move.l -4(%fp),%d2
	unlk %fp
	rts
.L93:
	jsr _cls
	moveq #1,%d0
	move.l %d0,__ZL12screenNumber
	move.l -4(%fp),%d2
	unlk %fp
	rts
.L92:
	jsr _cls
	clr.l __ZL12screenNumber
	and.l JAGPAD_STAR,%d2
	jeq .L90
	jra .L93
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
	jeq .L101
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
.L101:
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	jsr rapLocate
	move.l %d2,-(%sp)
	jsr _strlen
	lea (12,%sp),%sp
	moveq #8,%d1
	cmp.l %d0,%d1
	jcs .L102
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
.L103:
	move.l -8(%fp),%d2
	move.l -4(%fp),%d3
	unlk %fp
	rts
.L102:
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
	jra .L103
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
