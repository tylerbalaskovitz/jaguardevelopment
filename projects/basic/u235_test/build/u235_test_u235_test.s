#NO_APP
	.text
.LC0:
	.ascii "JagStudio\0"
.LC1:
	.ascii " U235 \0"
.LC2:
	.ascii "Test\0"
.LC3:
	.ascii "B        : Play SFX at Fixed Freq\0"
.LC4:
	.ascii "C        : Play SFX at variable Freq\0"
.LC5:
	.ascii "Left     : Lower Frequency\0"
.LC6:
	.ascii "Right    : Higher Frequency\0"
.LC7:
	.ascii "Frequency:\0"
.LC8:
	.ascii "%s% d\0"
.LC9:
	.ascii "1        : Play ABS Mono Module\0"
.LC10:
	.ascii "2        : Play ABS Stereo Module\0"
.LC11:
	.ascii "3        : Play ROM Module\0"
.LC12:
	.ascii "4        : Stop Module\0"
	.even
	.globl	__Z9basicmainv
__Z9basicmainv:
	link.w %fp,#0
	movem.l #16188,-(%sp)
	moveq #1,%d0
	move.l %d0,_jsfFontSize
	move.l %d0,_jsfFontIndx
	pea 200.w
	pea 80.w
	move.l #rapLocate,%d2
	move.l %d2,%a0
	jsr (%a0)
	move.l #.LC0,_js_r_textbuffer
	addq.l #8,%sp
	lea _rapPrint,%a5
	jsr (%a5)
	clr.l _jsfFontIndx
	move.l #.LC1,_js_r_textbuffer
	lea _rapPrintCont,%a2
	jsr (%a2)
	moveq #1,%d0
	move.l %d0,_jsfFontIndx
	move.l #.LC2,_js_r_textbuffer
	jsr (%a2)
	clr.l _jsfFontIndx
	clr.l _jsfFontSize
	clr.l __ZL4pad1
	move.l #8000,__ZL9frequency
	pea 10.w
	pea 20.w
	move.l %d2,%a0
	jsr (%a0)
	move.l #.LC3,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a5)
	pea 40.w
	pea 20.w
	move.l %d2,%a0
	jsr (%a0)
	move.l #.LC4,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a5)
	pea 50.w
	pea 20.w
	move.l %d2,%a0
	jsr (%a0)
	move.l #.LC5,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a5)
	pea 60.w
	pea 20.w
	move.l %d2,%a0
	jsr (%a0)
	move.l #.LC6,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a5)
	moveq #1,%d0
	move.l %d0,_jsfFontIndx
	pea 76.w
	pea 20.w
	move.l %d2,%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l __ZL9frequency,(%sp)
	pea .LC7
	pea .LC8
	move.l #ee_printf,%d3
	move.l %d3,%a0
	jsr (%a0)
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	jsr (%a5)
	clr.l _jsfFontIndx
	pea 100.w
	pea 20.w
	move.l %d2,%a0
	jsr (%a0)
	move.l #.LC9,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a5)
	pea 120.w
	pea 20.w
	move.l %d2,%a0
	jsr (%a0)
	move.l #.LC10,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a5)
	pea 140.w
	pea 20.w
	move.l %d2,%a0
	jsr (%a0)
	move.l #.LC11,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a5)
	pea 160.w
	pea 20.w
	move.l %d2,%a0
	jsr (%a0)
	move.l #.LC12,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a5)
	lea _jsfVsync,%a2
	lea jsfGetPadPressed,%a4
	move.l #u235PlaySampleFreq,%d4
	move.l #u235PlaySample,%d6
	move.l #u235ChannelFreq,%d5
	move.l #__Z11u235Silencev,%d7
	lea jsfGetPad,%a3
.L15:
	clr.l -(%sp)
	jsr (%a2)
	moveq #1,%d0
	move.l %d0,(%sp)
	jsr (%a4)
	move.l %d0,__ZL4pad1
	move.l %d0,%d1
	and.l JAGPAD_B,%d1
	addq.l #4,%sp
	jne .L17
.L3:
	move.l %d0,%d1
	and.l JAGPAD_C,%d1
	jne .L18
	move.l %d0,%d1
	and.l JAGPAD_1,%d1
	jne .L19
	move.l %d0,%d1
	and.l JAGPAD_2,%d1
	jne .L20
	move.l %d0,%d1
	and.l JAGPAD_3,%d1
	jne .L21
	and.l JAGPAD_4,%d0
	jne .L22
.L4:
	pea 1.w
	jsr (%a3)
	move.l %d0,__ZL4pad1
	move.l %d0,%d1
	and.l JAGPAD_LEFT,%d1
	addq.l #4,%sp
	jeq .L9
.L23:
	moveq #-30,%d0
	add.l __ZL9frequency,%d0
	move.l %d0,__ZL9frequency
	cmp.l #999,%d0
	jgt .L12
	move.l #1000,__ZL9frequency
.L12:
	moveq #1,%d0
	move.l %d0,_jsfFontIndx
	pea 76.w
	pea 20.w
	move.l %d2,%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l __ZL9frequency,(%sp)
	pea .LC7
	pea .LC8
	move.l %d3,%a0
	jsr (%a0)
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	jsr (%a5)
.L24:
	clr.l -(%sp)
	jsr (%a2)
	moveq #1,%d0
	move.l %d0,(%sp)
	jsr (%a4)
	move.l %d0,__ZL4pad1
	move.l %d0,%d1
	and.l JAGPAD_B,%d1
	addq.l #4,%sp
	jeq .L3
.L17:
	pea 8000.w
	clr.l -(%sp)
	pea 4.w
	move.l %d4,%a0
	jsr (%a0)
	lea (12,%sp),%sp
	pea 8000.w
	clr.l -(%sp)
	pea 5.w
	move.l %d4,%a0
	jsr (%a0)
	lea (12,%sp),%sp
	pea 1.w
	jsr (%a3)
	move.l %d0,__ZL4pad1
	move.l %d0,%d1
	and.l JAGPAD_LEFT,%d1
	addq.l #4,%sp
	jne .L23
.L9:
	and.l JAGPAD_RIGHT,%d0
	jeq .L15
	moveq #30,%d0
	add.l __ZL9frequency,%d0
	move.l %d0,__ZL9frequency
	cmp.l #24000,%d0
	jle .L12
	move.l #24000,__ZL9frequency
	moveq #1,%d0
	move.l %d0,_jsfFontIndx
	pea 76.w
	pea 20.w
	move.l %d2,%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l __ZL9frequency,(%sp)
	pea .LC7
	pea .LC8
	move.l %d3,%a0
	jsr (%a0)
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	jsr (%a5)
	jra .L24
.L22:
	jsr __Z14u235StopModulev
	move.l %d7,%a0
	jsr (%a0)
	jra .L4
.L18:
	clr.l -(%sp)
	pea 6.w
	move.l %d6,%a0
	jsr (%a0)
	addq.l #4,%sp
	clr.l (%sp)
	pea 7.w
	move.l %d6,%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l __ZL9frequency,(%sp)
	pea 6.w
	move.l %d5,%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l __ZL9frequency,(%sp)
	pea 7.w
	move.l %d5,%a0
	jsr (%a0)
	addq.l #8,%sp
	jra .L4
.L19:
	jsr __Z14u235StopModulev
	move.l %d7,%a0
	jsr (%a0)
	clr.l -(%sp)
	jsr _jsfVsync
	clr.l (%sp)
	pea Module1
	jsr __Z14u235PlayModuleis
	addq.l #8,%sp
	jra .L4
.L20:
	jsr __Z14u235StopModulev
	move.l %d7,%a0
	jsr (%a0)
	clr.l -(%sp)
	jsr _jsfVsync
	moveq #1,%d1
	move.l %d1,(%sp)
	pea Module1
	jsr __Z14u235PlayModuleis
	addq.l #8,%sp
	jra .L4
.L21:
	jsr __Z14u235StopModulev
	move.l %d7,%a0
	jsr (%a0)
	clr.l -(%sp)
	jsr _jsfVsync
	moveq #1,%d0
	move.l %d0,(%sp)
	move.l #8397488,-(%sp)
	jsr __Z14u235PlayModuleis
	addq.l #8,%sp
	jra .L4
	.even
	.globl	__Z3MINdd
__Z3MINdd:
	link.w %fp,#0
	movem.l #15360,-(%sp)
	move.l 8(%fp),%d2
	move.l 12(%fp),%d3
	move.l 16(%fp),%d0
	move.l 20(%fp),%d1
	move.l %d0,%d5
	move.l %d1,%d4
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	jsr ___ledf2
	lea (16,%sp),%sp
	tst.l %d0
	jle .L27
	move.l %d2,%d5
	move.l %d3,%d4
.L27:
	move.l %d5,%d0
	move.l %d4,%d1
	movem.l -16(%fp),#60
	unlk %fp
	rts
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
.lcomm __ZL9frequency,4
