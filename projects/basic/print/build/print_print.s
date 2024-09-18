#NO_APP
	.text
.LC0:
	.ascii "helloooooooooooooooo!\0"
.LC1:
	.ascii " hello \0"
.LC2:
	.ascii "hiya! \0"
.LC3:
	.ascii "%s% d%s% G\0"
.LC4:
	.ascii "%d\0"
.LC5:
	.ascii "Continued\0"
.LC6:
	.ascii " string \0"
.LC7:
	.ascii " from \0"
.LC8:
	.ascii " last \0"
.LC9:
	.ascii " position \0"
.LC10:
	.ascii "Press joypad buttons\0"
.LC11:
	.ascii "%s\0"
	.even
	.globl	__Z9basicmainv
__Z9basicmainv:
	link.w %fp,#0
	movem.l #15932,-(%sp)
	moveq #32,%d0
	move.l %d0,__ZL4pad1
	clr.l _jsfFontIndx
	clr.l _jsfFontSize
	clr.l -(%sp)
	pea 10.w
	lea rapLocate,%a2
	jsr (%a2)
	move.l #.LC0,_js_r_textbuffer
	addq.l #8,%sp
	lea _rapPrint,%a3
	jsr (%a3)
	pea 20.w
	pea 10.w
	jsr (%a2)
	addq.l #4,%sp
	move.l #-1610612736,(%sp)
	move.l #1079955250,-(%sp)
	pea .LC1
	move.l __ZL4pad1,-(%sp)
	pea .LC2
	pea .LC3
	lea ee_printf,%a4
	jsr (%a4)
	move.l %d0,_js_r_textbuffer
	lea (24,%sp),%sp
	jsr (%a3)
	move.b #122,__ZL1a
	move.b #122,__ZL1a+1
	move.b #122,__ZL1a+2
	move.b #122,__ZL1a+3
	move.b #122,__ZL1a+4
	move.b #122,__ZL1a+5
	move.b #122,__ZL1a+6
	move.b #122,__ZL1a+7
	clr.b __ZL1a+8
	pea __ZL1a
	pea 3.w
	pea 567.w
	jsr rapNumToStr
	moveq #1,%d1
	move.l %d1,_jsfFontIndx
	move.l %d1,_jsfFontSize
	addq.l #8,%sp
	moveq #40,%d0
	move.l %d0,(%sp)
	pea 10.w
	jsr (%a2)
	move.l #__ZL1a,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a3)
	clr.l _jsfFontIndx
	clr.l _jsfFontSize
	pea 70.w
	pea 10.w
	jsr (%a2)
	addq.l #8,%sp
	pea 3433.w
	pea .LC4
	jsr (%a4)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a3)
	clr.l _jsfFontIndx
	clr.l _jsfFontSize
	pea 100.w
	pea 10.w
	jsr (%a2)
	move.l #.LC5,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a3)
	moveq #1,%d0
	move.l %d0,_jsfFontIndx
	move.l #.LC6,_js_r_textbuffer
	lea _rapPrintCont,%a5
	jsr (%a5)
	moveq #1,%d1
	move.l %d1,_jsfFontSize
	clr.l _jsfFontIndx
	move.l #.LC7,_js_r_textbuffer
	jsr (%a5)
	moveq #1,%d0
	move.l %d0,_jsfFontSize
	move.l %d0,_jsfFontIndx
	move.l #.LC8,_js_r_textbuffer
	jsr (%a5)
	clr.l _jsfFontSize
	moveq #1,%d1
	move.l %d1,_jsfFontIndx
	move.l #.LC9,_js_r_textbuffer
	jsr (%a5)
	clr.l _jsfFontIndx
	clr.l _jsfFontSize
	pea 150.w
	pea 10.w
	jsr (%a2)
	move.l #.LC10,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a3)
	move.b #96,_plot_colour
	pea 11.w
	pea 100.w
	jsr _jsfPlot
	addq.l #8,%sp
	pea 170.w
	pea 10.w
	jsr (%a2)
	addq.l #8,%sp
	move.l #jsfGetPad,%d4
	lea _strlen,%a2
	move.l #_BCX_TmpStr_buffer,%d6
	move.l #_memset,%d5
	move.l #_strcat,%d3
	lea _jsfVsync,%a5
	pea 1.w
	move.l %d4,%a0
	jsr (%a0)
	move.l %d0,%d2
	move.l %d0,__ZL4pad1
	clr.b __ZL1a
	and.l JAGPAD_PAUSE,%d0
	addq.l #4,%sp
	jne .L27
.L2:
	move.l %d2,%d0
	and.l JAGPAD_A,%d0
	jne .L28
.L3:
	move.l %d2,%d0
	and.l JAGPAD_UP,%d0
	jne .L29
.L4:
	move.l %d2,%d0
	and.l JAGPAD_DOWN,%d0
	jne .L30
.L5:
	move.l %d2,%d0
	and.l JAGPAD_LEFT,%d0
	jne .L31
.L6:
	move.l %d2,%d0
	and.l JAGPAD_RIGHT,%d0
	jne .L32
.L7:
	move.l %d2,%d0
	and.l JAGPAD_B,%d0
	jne .L33
.L8:
	move.l %d2,%d0
	and.l JAGPAD_STAR,%d0
	jne .L34
.L9:
	move.l %d2,%d0
	and.l JAGPAD_7,%d0
	jne .L35
.L10:
	move.l %d2,%d0
	and.l JAGPAD_4,%d0
	jne .L36
.L11:
	move.l %d2,%d0
	and.l JAGPAD_1,%d0
	jne .L37
.L12:
	move.l %d2,%d0
	and.l JAGPAD_C,%d0
	jne .L38
.L13:
	move.l %d2,%d0
	and.l JAGPAD_0,%d0
	jne .L39
.L14:
	move.l %d2,%d0
	and.l JAGPAD_8,%d0
	jne .L40
.L15:
	move.l %d2,%d0
	and.l JAGPAD_5,%d0
	jne .L41
.L16:
	move.l %d2,%d0
	and.l JAGPAD_2,%d0
	jne .L42
.L17:
	move.l %d2,%d0
	and.l JAGPAD_OPTION,%d0
	jne .L43
.L18:
	move.l %d2,%d0
	and.l JAGPAD_HASH,%d0
	jne .L44
.L19:
	move.l %d2,%d0
	and.l JAGPAD_9,%d0
	jne .L45
.L20:
	move.l %d2,%d0
	and.l JAGPAD_6,%d0
	jne .L46
.L21:
	and.l JAGPAD_3,%d2
	jne .L47
.L22:
	pea __ZL1a
	jsr (%a2)
	addq.l #4,%sp
	moveq #39,%d1
	sub.l %d0,%d1
	tst.l %d1
	jle .L48
.L23:
	move.l %d6,%a0
	clr.b (%a0,%d1.l)
	move.l %d1,-(%sp)
	pea 32.w
	pea _BCX_TmpStr_buffer
	move.l %d5,%a0
	jsr (%a0)
	lea (12,%sp),%sp
	move.l %d0,-(%sp)
	pea __ZL1a
	move.l %d3,%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l #__ZL1a,(%sp)
	pea .LC11
	jsr (%a4)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a3)
	clr.l -(%sp)
	jsr (%a5)
	addq.l #4,%sp
.L49:
	pea 1.w
	move.l %d4,%a0
	jsr (%a0)
	move.l %d0,%d2
	move.l %d0,__ZL4pad1
	clr.b __ZL1a
	and.l JAGPAD_PAUSE,%d0
	addq.l #4,%sp
	jeq .L2
	jra .L27
.L47:
	pea __ZL1a
	jsr (%a2)
	addq.l #4,%sp
	move.l %d0,%a0
	add.l #__ZL1a,%a0
	move.b #51,(%a0)+
	move.b #32,(%a0)+
	clr.b (%a0)
	pea __ZL1a
	jsr (%a2)
	addq.l #4,%sp
	moveq #39,%d1
	sub.l %d0,%d1
	tst.l %d1
	jgt .L23
.L48:
	clr.b _BCX_TmpStr_buffer+1
	move.l #_BCX_TmpStr_buffer,%d0
	move.l %d0,-(%sp)
	pea __ZL1a
	move.l %d3,%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l #__ZL1a,(%sp)
	pea .LC11
	jsr (%a4)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a3)
	clr.l -(%sp)
	jsr (%a5)
	addq.l #4,%sp
	jra .L49
.L46:
	pea __ZL1a
	jsr (%a2)
	addq.l #4,%sp
	move.l %d0,%a0
	add.l #__ZL1a,%a0
	move.b #54,(%a0)+
	move.b #32,(%a0)+
	clr.b (%a0)
	and.l JAGPAD_3,%d2
	jeq .L22
	jra .L47
.L45:
	pea __ZL1a
	jsr (%a2)
	addq.l #4,%sp
	move.l %d0,%a0
	add.l #__ZL1a,%a0
	move.b #57,(%a0)+
	move.b #32,(%a0)+
	clr.b (%a0)
	move.l %d2,%d0
	and.l JAGPAD_6,%d0
	jeq .L21
	jra .L46
.L44:
	pea __ZL1a
	jsr (%a2)
	addq.l #4,%sp
	move.l %d0,%a0
	add.l #__ZL1a,%a0
	move.b #35,(%a0)+
	move.b #32,(%a0)+
	clr.b (%a0)
	move.l %d2,%d0
	and.l JAGPAD_9,%d0
	jeq .L20
	jra .L45
.L43:
	pea __ZL1a
	jsr (%a2)
	addq.l #4,%sp
	move.l %d0,%a0
	add.l #__ZL1a,%a0
	move.b #79,(%a0)+
	move.b #112,(%a0)+
	move.b #116,(%a0)+
	move.b #105,(%a0)+
	move.b #111,(%a0)+
	move.b #110,(%a0)+
	move.b #32,(%a0)+
	clr.b (%a0)
	move.l %d2,%d0
	and.l JAGPAD_HASH,%d0
	jeq .L19
	jra .L44
.L42:
	pea __ZL1a
	jsr (%a2)
	addq.l #4,%sp
	move.l %d0,%a0
	add.l #__ZL1a,%a0
	move.b #50,(%a0)+
	move.b #32,(%a0)+
	clr.b (%a0)
	move.l %d2,%d0
	and.l JAGPAD_OPTION,%d0
	jeq .L18
	jra .L43
.L41:
	pea __ZL1a
	jsr (%a2)
	addq.l #4,%sp
	move.l %d0,%a0
	add.l #__ZL1a,%a0
	move.b #53,(%a0)+
	move.b #32,(%a0)+
	clr.b (%a0)
	move.l %d2,%d0
	and.l JAGPAD_2,%d0
	jeq .L17
	jra .L42
.L40:
	pea __ZL1a
	jsr (%a2)
	addq.l #4,%sp
	move.l %d0,%a0
	add.l #__ZL1a,%a0
	move.b #56,(%a0)+
	move.b #32,(%a0)+
	clr.b (%a0)
	move.l %d2,%d0
	and.l JAGPAD_5,%d0
	jeq .L16
	jra .L41
.L39:
	pea __ZL1a
	jsr (%a2)
	addq.l #4,%sp
	move.l %d0,%a0
	add.l #__ZL1a,%a0
	move.b #48,(%a0)+
	move.b #32,(%a0)+
	clr.b (%a0)
	move.l %d2,%d0
	and.l JAGPAD_8,%d0
	jeq .L15
	jra .L40
.L38:
	pea __ZL1a
	jsr (%a2)
	addq.l #4,%sp
	move.l %d0,%a0
	add.l #__ZL1a,%a0
	move.b #67,(%a0)+
	move.b #32,(%a0)+
	clr.b (%a0)
	move.l %d2,%d0
	and.l JAGPAD_0,%d0
	jeq .L14
	jra .L39
.L37:
	pea __ZL1a
	jsr (%a2)
	addq.l #4,%sp
	move.l %d0,%a0
	add.l #__ZL1a,%a0
	move.b #49,(%a0)+
	move.b #32,(%a0)+
	clr.b (%a0)
	move.l %d2,%d0
	and.l JAGPAD_C,%d0
	jeq .L13
	jra .L38
.L36:
	pea __ZL1a
	jsr (%a2)
	addq.l #4,%sp
	move.l %d0,%a0
	add.l #__ZL1a,%a0
	move.b #52,(%a0)+
	move.b #32,(%a0)+
	clr.b (%a0)
	move.l %d2,%d0
	and.l JAGPAD_1,%d0
	jeq .L12
	jra .L37
.L35:
	pea __ZL1a
	jsr (%a2)
	addq.l #4,%sp
	move.l %d0,%a0
	add.l #__ZL1a,%a0
	move.b #55,(%a0)+
	move.b #32,(%a0)+
	clr.b (%a0)
	move.l %d2,%d0
	and.l JAGPAD_4,%d0
	jeq .L11
	jra .L36
.L34:
	pea __ZL1a
	jsr (%a2)
	addq.l #4,%sp
	move.l %d0,%a0
	add.l #__ZL1a,%a0
	move.b #83,(%a0)+
	move.b #116,(%a0)+
	move.b #97,(%a0)+
	move.b #114,(%a0)+
	move.b #32,(%a0)+
	clr.b (%a0)
	move.l %d2,%d0
	and.l JAGPAD_7,%d0
	jeq .L10
	jra .L35
.L33:
	pea __ZL1a
	jsr (%a2)
	addq.l #4,%sp
	move.l %d0,%a0
	add.l #__ZL1a,%a0
	move.b #66,(%a0)+
	move.b #32,(%a0)+
	clr.b (%a0)
	move.l %d2,%d0
	and.l JAGPAD_STAR,%d0
	jeq .L9
	jra .L34
.L32:
	pea __ZL1a
	jsr (%a2)
	addq.l #4,%sp
	move.l %d0,%a0
	add.l #__ZL1a,%a0
	move.b #82,(%a0)+
	move.b #105,(%a0)+
	move.b #103,(%a0)+
	move.b #104,(%a0)+
	move.b #116,(%a0)+
	move.b #32,(%a0)+
	clr.b (%a0)
	move.l %d2,%d0
	and.l JAGPAD_B,%d0
	jeq .L8
	jra .L33
.L31:
	pea __ZL1a
	jsr (%a2)
	addq.l #4,%sp
	move.l %d0,%a0
	add.l #__ZL1a,%a0
	move.b #76,(%a0)+
	move.b #101,(%a0)+
	move.b #102,(%a0)+
	move.b #116,(%a0)+
	move.b #32,(%a0)+
	clr.b (%a0)
	move.l %d2,%d0
	and.l JAGPAD_RIGHT,%d0
	jeq .L7
	jra .L32
.L30:
	pea __ZL1a
	jsr (%a2)
	addq.l #4,%sp
	move.l %d0,%a0
	add.l #__ZL1a,%a0
	move.b #68,(%a0)+
	move.b #111,(%a0)+
	move.b #119,(%a0)+
	move.b #110,(%a0)+
	move.b #32,(%a0)+
	clr.b (%a0)
	move.l %d2,%d0
	and.l JAGPAD_LEFT,%d0
	jeq .L6
	jra .L31
.L29:
	pea __ZL1a
	jsr (%a2)
	addq.l #4,%sp
	move.l %d0,%a0
	add.l #__ZL1a,%a0
	move.b #85,(%a0)+
	move.b #112,(%a0)+
	move.b #32,(%a0)+
	clr.b (%a0)
	move.l %d2,%d0
	and.l JAGPAD_DOWN,%d0
	jeq .L5
	jra .L30
.L28:
	pea __ZL1a
	jsr (%a2)
	addq.l #4,%sp
	move.l %d0,%a0
	add.l #__ZL1a,%a0
	move.b #65,(%a0)+
	move.b #32,(%a0)+
	clr.b (%a0)
	move.l %d2,%d0
	and.l JAGPAD_UP,%d0
	jeq .L4
	jra .L29
.L27:
	pea __ZL1a
	jsr (%a2)
	addq.l #4,%sp
	move.l %d0,%a0
	add.l #__ZL1a,%a0
	move.b #80,(%a0)+
	move.b #97,(%a0)+
	move.b #117,(%a0)+
	move.b #115,(%a0)+
	move.b #101,(%a0)+
	move.b #32,(%a0)+
	clr.b (%a0)
	move.l %d2,%d0
	and.l JAGPAD_A,%d0
	jeq .L3
	jra .L28
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
	jle .L56
	lea _BCX_TmpStr_buffer,%a0
	clr.b (%a0,%d0.l)
	move.l %d0,-(%sp)
	pea 32.w
	move.l %a0,-(%sp)
	jsr _memset
	lea (12,%sp),%sp
	unlk %fp
	rts
.L56:
	clr.b _BCX_TmpStr_buffer+1
	move.l #_BCX_TmpStr_buffer,%d0
	unlk %fp
	rts
	.even
	.globl	__Z4joiniz
__Z4joiniz:
	link.w %fp,#0
	movem.l #14384,-(%sp)
	lea (12,%fp),%a0
	move.l 8(%fp),%d2
	move.l %d2,%d3
	moveq #0,%d4
	lea _strlen,%a3
	tst.l %d3
	jle .L66
.L61:
	lea (4,%a0),%a2
	move.l (%a0),%d0
	jeq .L60
	move.l %d0,-(%sp)
	jsr (%a3)
	addq.l #4,%sp
	add.l %d0,%d4
.L60:
	subq.l #1,%d3
	move.l %a2,%a0
	tst.l %d3
	jgt .L61
.L66:
	lea _BCX_TmpStr_buffer,%a0
	clr.b (%a0,%d4.l)
	moveq #12,%d3
	add.l %fp,%d3
	lea _strcat,%a2
	tst.l %d2
	jle .L67
.L64:
	move.l %d3,%a0
	addq.l #4,%d3
	move.l (%a0),%d0
	jeq .L63
	move.l %d0,-(%sp)
	pea _BCX_TmpStr_buffer
	jsr (%a2)
	addq.l #8,%sp
.L63:
	subq.l #1,%d2
	tst.l %d2
	jgt .L64
.L67:
	move.l #_BCX_TmpStr_buffer,%d0
	movem.l -20(%fp),#3100
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
.lcomm __ZL4pad1,4
.lcomm __ZL1a,2048
