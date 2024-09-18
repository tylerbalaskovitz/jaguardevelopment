#NO_APP
	.text
.LC0:
	.ascii "1 Pressed\0"
.LC1:
	.ascii "2 Pressed\0"
.LC2:
	.ascii "3 Pressed\0"
.LC3:
	.ascii "4 Pressed\0"
.LC4:
	.ascii "5 Pressed\0"
.LC5:
	.ascii "6 Pressed\0"
.LC6:
	.ascii "7 Pressed\0"
.LC7:
	.ascii "8 Pressed\0"
.LC8:
	.ascii "9 Pressed\0"
.LC9:
	.ascii "* Pressed\0"
.LC10:
	.ascii "# Pressed\0"
.LC11:
	.ascii "Option Pressed\0"
.LC12:
	.ascii "Pause Pressed\0"
.LC13:
	.ascii "Up Pressed\0"
.LC14:
	.ascii "Down Pressed\0"
.LC15:
	.ascii "Left Pressed\0"
.LC16:
	.ascii "Right Pressed\0"
.LC17:
	.ascii "              \0"
	.even
__Z13printPadStateiii.part.0:
	link.w %fp,#0
	move.l 8(%fp),%d0
	tst.w %d0
	jlt .L20
	btst #19,%d0
	jne .L21
	tst.b %d0
	jlt .L22
	btst #14,%d0
	jne .L23
	btst #18,%d0
	jne .L24
	btst #6,%d0
	jne .L25
	btst #13,%d0
	jne .L26
	btst #17,%d0
	jne .L27
	btst #5,%d0
	jne .L28
	btst #12,%d0
	jne .L29
	btst #4,%d0
	jne .L30
	btst #11,%d0
	jne .L31
	btst #8,%d0
	jne .L32
	btst #0,%d0
	jne .L33
	btst #1,%d0
	jne .L34
	btst #2,%d0
	jne .L35
	btst #3,%d0
	jne .L36
	move.l #.LC17,_js_r_textbuffer
	unlk %fp
	jra _rapPrint
.L20:
	move.l #.LC0,_js_r_textbuffer
	unlk %fp
	jra _rapPrint
.L22:
	move.l #.LC2,_js_r_textbuffer
	unlk %fp
	jra _rapPrint
.L26:
	move.l #.LC6,_js_r_textbuffer
	unlk %fp
	jra _rapPrint
.L21:
	move.l #.LC1,_js_r_textbuffer
	unlk %fp
	jra _rapPrint
.L23:
	move.l #.LC3,_js_r_textbuffer
	unlk %fp
	jra _rapPrint
.L24:
	move.l #.LC4,_js_r_textbuffer
	unlk %fp
	jra _rapPrint
.L25:
	move.l #.LC5,_js_r_textbuffer
	unlk %fp
	jra _rapPrint
.L32:
	move.l #.LC12,_js_r_textbuffer
	unlk %fp
	jra _rapPrint
.L27:
	move.l #.LC7,_js_r_textbuffer
	unlk %fp
	jra _rapPrint
.L28:
	move.l #.LC8,_js_r_textbuffer
	unlk %fp
	jra _rapPrint
.L29:
	move.l #.LC9,_js_r_textbuffer
	unlk %fp
	jra _rapPrint
.L30:
	move.l #.LC10,_js_r_textbuffer
	unlk %fp
	jra _rapPrint
.L31:
	move.l #.LC11,_js_r_textbuffer
	unlk %fp
	jra _rapPrint
.L33:
	move.l #.LC13,_js_r_textbuffer
	unlk %fp
	jra _rapPrint
.L36:
	move.l #.LC16,_js_r_textbuffer
	unlk %fp
	jra _rapPrint
.L34:
	move.l #.LC14,_js_r_textbuffer
	unlk %fp
	jra _rapPrint
.L35:
	move.l #.LC15,_js_r_textbuffer
	unlk %fp
	jra _rapPrint
.LC18:
	.ascii "TeamTap Test\0"
.LC19:
	.ascii "TeamTap Left:\0"
.LC20:
	.ascii "NONE\0"
.LC21:
	.ascii "TeamTap Right:\0"
.LC22:
	.ascii "YES!\0"
.LC23:
	.ascii "LEFT TT Pad 1\0"
.LC24:
	.ascii "%d\0"
.LC25:
	.ascii "A Pressed\0"
.LC26:
	.ascii "B Pressed\0"
.LC27:
	.ascii "C Pressed\0"
.LC28:
	.ascii "0 Pressed\0"
.LC29:
	.ascii "RIGHT TT Pad 4\0"
.LC30:
	.ascii "LEFT Jag Pad (no TT)\0"
	.even
	.globl	__Z9basicmainv
__Z9basicmainv:
	link.w %fp,#0
	movem.l #16188,-(%sp)
	moveq #1,%d0
	move.l %d0,_jsfFontIndx
	clr.l _jsfFontSize
	pea 16.w
	pea 16.w
	lea rapLocate,%a2
	jsr (%a2)
	move.l #.LC18,_js_r_textbuffer
	addq.l #8,%sp
	lea _rapPrint,%a3
	jsr (%a3)
	clr.l __ZL4pad1
	clr.l __ZL10ttPadLeft1
	clr.l __ZL10ttPadLeft2
	clr.l __ZL10ttPadLeft3
	clr.l __ZL10ttPadLeft4
	clr.l __ZL11ttPadRight1
	clr.l __ZL11ttPadRight2
	clr.l __ZL11ttPadRight3
	clr.l __ZL11ttPadRight4
	clr.l -(%sp)
	lea rapCheckTTExists,%a4
	jsr (%a4)
	move.l %d0,__ZL12ttLeftExists
	moveq #1,%d1
	move.l %d1,(%sp)
	jsr (%a4)
	move.l %d0,__ZL13ttRightExists
	clr.l _jsfFontIndx
	moveq #40,%d2
	move.l %d2,(%sp)
	pea 16.w
	jsr (%a2)
	move.l #.LC19,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a3)
	pea 40.w
	pea 128.w
	jsr (%a2)
	move.l #.LC20,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a3)
	pea 50.w
	pea 16.w
	jsr (%a2)
	move.l #.LC21,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a3)
	pea 50.w
	pea 136.w
	jsr (%a2)
	move.l #.LC20,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a3)
	move.l #rapGetTTState,%d7
	move.l #rapGetTTPad,%d3
	lea ee_printf,%a4
	move.l #__Z13printPadStateiii.part.0,%d5
	move.l #jsfGetPad,%d6
	move.l #_jsfVsync,%d4
	move.l %a3,%a5
	moveq #1,%d0
	cmp.l __ZL12ttLeftExists.l,%d0
	jeq .L58
.L39:
	moveq #1,%d0
	cmp.l __ZL13ttRightExists.l,%d0
	jeq .L59
.L40:
	pea 150.w
	pea 20.w
	jsr (%a2)
	move.l #.LC23,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a3)
	move.l __ZL10ttPadLeft1,%d2
	pea 160.w
	pea 20.w
	jsr (%a2)
	addq.l #4,%sp
	move.l %d2,(%sp)
	pea .LC24
	jsr (%a4)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a3)
	pea 180.w
	pea 20.w
	jsr (%a2)
	addq.l #8,%sp
	btst #9,%d2
	jne .L60
.L41:
	btst #21,%d2
	jne .L61
	btst #25,%d2
	jne .L62
	btst #16,%d2
	jne .L63
	move.l %d2,-(%sp)
	move.l %d5,%a0
	jsr (%a0)
	addq.l #4,%sp
.L42:
	pea 150.w
	pea 180.w
	jsr (%a2)
	move.l #.LC29,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a3)
	move.l __ZL11ttPadRight4,%d2
	pea 160.w
	pea 180.w
	jsr (%a2)
	addq.l #4,%sp
	move.l %d2,(%sp)
	pea .LC24
	jsr (%a4)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a3)
	pea 180.w
	pea 180.w
	jsr (%a2)
	addq.l #8,%sp
	btst #9,%d2
	jne .L64
.L46:
	btst #21,%d2
	jne .L65
	btst #25,%d2
	jne .L66
	btst #16,%d2
	jne .L67
	move.l %d2,-(%sp)
	move.l %d5,%a0
	jsr (%a0)
	addq.l #4,%sp
	tst.l __ZL12ttLeftExists
	jeq .L68
.L51:
	clr.l -(%sp)
	move.l %d4,%a0
	jsr (%a0)
	addq.l #4,%sp
.L73:
	moveq #1,%d0
	cmp.l __ZL12ttLeftExists.l,%d0
	jne .L39
	jra .L58
.L68:
	pea 100.w
	pea 20.w
	jsr (%a2)
	move.l #.LC30,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a3)
	pea 1.w
	move.l %d6,%a0
	jsr (%a0)
	move.l %d0,%d2
	move.l %d0,__ZL4pad1
	moveq #110,%d0
	move.l %d0,(%sp)
	pea 20.w
	jsr (%a2)
	addq.l #4,%sp
	move.l %d2,(%sp)
	pea .LC24
	jsr (%a4)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a3)
	pea 130.w
	pea 20.w
	jsr (%a2)
	addq.l #8,%sp
	btst #9,%d2
	jne .L69
	btst #21,%d2
	jne .L70
	btst #25,%d2
	jne .L71
	btst #16,%d2
	jne .L72
	move.l %d2,-(%sp)
	move.l %d5,%a0
	jsr (%a0)
	addq.l #4,%sp
	clr.l -(%sp)
	move.l %d4,%a0
	jsr (%a0)
	addq.l #4,%sp
	jra .L73
.L59:
	pea 50.w
	pea 136.w
	jsr (%a2)
	move.l #.LC22,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a3)
	pea 1.w
	move.l %d7,%a0
	jsr (%a0)
	clr.l (%sp)
	pea 1.w
	move.l %d3,%a0
	jsr (%a0)
	move.l %d0,__ZL11ttPadRight1
	addq.l #8,%sp
	pea 1.w
	pea 1.w
	move.l %d3,%a0
	jsr (%a0)
	move.l %d0,__ZL11ttPadRight2
	addq.l #8,%sp
	pea 2.w
	pea 1.w
	move.l %d3,%a0
	jsr (%a0)
	move.l %d0,__ZL11ttPadRight3
	addq.l #8,%sp
	pea 3.w
	pea 1.w
	move.l %d3,%a0
	jsr (%a0)
	move.l %d0,__ZL11ttPadRight4
	addq.l #8,%sp
	pea 150.w
	pea 20.w
	jsr (%a2)
	move.l #.LC23,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a3)
	move.l __ZL10ttPadLeft1,%d2
	pea 160.w
	pea 20.w
	jsr (%a2)
	addq.l #4,%sp
	move.l %d2,(%sp)
	pea .LC24
	jsr (%a4)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a3)
	pea 180.w
	pea 20.w
	jsr (%a2)
	addq.l #8,%sp
	btst #9,%d2
	jeq .L41
.L60:
	move.l #.LC25,_js_r_textbuffer
	jsr (%a5)
	pea 150.w
	pea 180.w
	jsr (%a2)
	move.l #.LC29,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a3)
	move.l __ZL11ttPadRight4,%d2
	pea 160.w
	pea 180.w
	jsr (%a2)
	addq.l #4,%sp
	move.l %d2,(%sp)
	pea .LC24
	jsr (%a4)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a3)
	pea 180.w
	pea 180.w
	jsr (%a2)
	addq.l #8,%sp
	btst #9,%d2
	jeq .L46
.L64:
	move.l #.LC25,_js_r_textbuffer
	jsr (%a5)
	tst.l __ZL12ttLeftExists
	jne .L51
	jra .L68
.L58:
	pea 40.w
	pea 128.w
	jsr (%a2)
	move.l #.LC22,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a3)
	clr.l -(%sp)
	move.l %d7,%a0
	jsr (%a0)
	clr.l (%sp)
	clr.l -(%sp)
	move.l %d3,%a0
	jsr (%a0)
	move.l %d0,__ZL10ttPadLeft1
	addq.l #8,%sp
	pea 1.w
	clr.l -(%sp)
	move.l %d3,%a0
	jsr (%a0)
	move.l %d0,__ZL10ttPadLeft2
	addq.l #8,%sp
	pea 2.w
	clr.l -(%sp)
	move.l %d3,%a0
	jsr (%a0)
	move.l %d0,__ZL10ttPadLeft3
	addq.l #8,%sp
	pea 3.w
	clr.l -(%sp)
	move.l %d3,%a0
	jsr (%a0)
	move.l %d0,__ZL10ttPadLeft4
	addq.l #8,%sp
	moveq #1,%d0
	cmp.l __ZL13ttRightExists.l,%d0
	jne .L40
	jra .L59
.L61:
	move.l #.LC26,_js_r_textbuffer
	jsr (%a5)
	jra .L42
.L65:
	move.l #.LC26,_js_r_textbuffer
	jsr (%a5)
	tst.l __ZL12ttLeftExists
	jne .L51
	jra .L68
.L66:
	move.l #.LC27,_js_r_textbuffer
	jsr (%a5)
	tst.l __ZL12ttLeftExists
	jne .L51
	jra .L68
.L62:
	move.l #.LC27,_js_r_textbuffer
	jsr (%a5)
	jra .L42
.L67:
	move.l #.LC28,_js_r_textbuffer
	jsr (%a5)
	tst.l __ZL12ttLeftExists
	jne .L51
	jra .L68
.L63:
	move.l #.LC28,_js_r_textbuffer
	jsr (%a5)
	jra .L42
.L69:
	move.l #.LC25,_js_r_textbuffer
	jsr (%a5)
	clr.l -(%sp)
	move.l %d4,%a0
	jsr (%a0)
	addq.l #4,%sp
	jra .L73
.L70:
	move.l #.LC26,_js_r_textbuffer
	jsr (%a5)
	clr.l -(%sp)
	move.l %d4,%a0
	jsr (%a0)
	addq.l #4,%sp
	jra .L73
.L71:
	move.l #.LC27,_js_r_textbuffer
	jsr (%a5)
	clr.l -(%sp)
	move.l %d4,%a0
	jsr (%a0)
	addq.l #4,%sp
	jra .L73
.L72:
	move.l #.LC28,_js_r_textbuffer
	jsr (%a5)
	clr.l -(%sp)
	move.l %d4,%a0
	jsr (%a0)
	addq.l #4,%sp
	jra .L73
	.even
	.globl	__Z13printPadStateiii
__Z13printPadStateiii:
	link.w %fp,#0
	movem.l #12336,-(%sp)
	move.l 8(%fp),%d2
	move.l 12(%fp),%d3
	move.l 16(%fp),%a3
	move.l %a3,-(%sp)
	move.l %d3,-(%sp)
	lea rapLocate,%a2
	jsr (%a2)
	addq.l #4,%sp
	move.l %d2,(%sp)
	pea .LC24
	jsr ee_printf
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr _rapPrint
	pea 20(%a3)
	move.l %d3,-(%sp)
	jsr (%a2)
	addq.l #8,%sp
	btst #9,%d2
	jne .L81
	btst #21,%d2
	jne .L82
	btst #25,%d2
	jne .L83
	btst #16,%d2
	jne .L84
	move.l %d2,8(%fp)
	movem.l -16(%fp),#3084
	unlk %fp
	jra (__Z13printPadStateiii.part.0)
.L81:
	move.l #.LC25,_js_r_textbuffer
	movem.l -16(%fp),#3084
	unlk %fp
	jra _rapPrint
.L83:
	move.l #.LC27,_js_r_textbuffer
	movem.l -16(%fp),#3084
	unlk %fp
	jra _rapPrint
.L82:
	move.l #.LC26,_js_r_textbuffer
	movem.l -16(%fp),#3084
	unlk %fp
	jra _rapPrint
.L84:
	move.l #.LC28,_js_r_textbuffer
	movem.l -16(%fp),#3084
	unlk %fp
	jra _rapPrint
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
.lcomm __ZL10ttPadLeft1,4
.lcomm __ZL10ttPadLeft2,4
.lcomm __ZL10ttPadLeft3,4
.lcomm __ZL10ttPadLeft4,4
.lcomm __ZL11ttPadRight1,4
.lcomm __ZL11ttPadRight2,4
.lcomm __ZL11ttPadRight3,4
.lcomm __ZL11ttPadRight4,4
.lcomm __ZL12ttLeftExists,4
.lcomm __ZL13ttRightExists,4
