#NO_APP
	.text
.LC0:
	.ascii "JagStudio Clock Example\0"
.LC1:
	.ascii "A   : Start Counting Up\0"
.LC2:
	.ascii "B   : Stop Counting\0"
.LC3:
	.ascii "C   : Start Counting Down\0"
.LC4:
	.ascii "1   : Add 10 Seconds\0"
.LC5:
	.ascii "2   : subtract 10 Seconds\0"
.LC6:
	.ascii "ASCII Value: \0"
.LC7:
	.ascii "Raw Value:      \0"
.LC8:
	.ascii "%d\0"
	.even
	.globl	__Z9basicmainv
__Z9basicmainv:
	link.w %fp,#0
	movem.l #15420,-(%sp)
	moveq #1,%d0
	move.l %d0,_jsfFontIndx
	move.l %d0,_jsfFontSize
	clr.l __ZL4pad1
	pea 182.w
	pea 70.w
	lea rapLocate,%a3
	jsr (%a3)
	move.l #.LC0,_js_r_textbuffer
	addq.l #8,%sp
	lea _rapPrint,%a2
	jsr (%a2)
	clr.l _jsfFontIndx
	clr.l _jsfFontSize
	pea 10.w
	pea 20.w
	jsr (%a3)
	move.l #.LC1,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	pea 30.w
	pea 20.w
	jsr (%a3)
	move.l #.LC2,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	pea 50.w
	pea 20.w
	jsr (%a3)
	move.l #.LC3,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	pea 70.w
	pea 20.w
	jsr (%a3)
	move.l #.LC4,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	pea 90.w
	pea 20.w
	jsr (%a3)
	move.l #.LC5,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	clr.l -(%sp)
	jsr rapSetClock
	clr.w raptor_clock_mode
	moveq #1,%d0
	move.l %d0,_jsfFontIndx
	addq.l #4,%sp
	move.l #_rapPrintCont,%d3
	move.l #ee_printf,%d2
	lea jsfGetPadPressed,%a5
	move.l #rapAddClock,%d4
	move.l #rapSubClock,%d5
	lea _jsfVsync,%a4
	pea 130.w
	pea 50.w
	jsr (%a3)
	move.l #.LC6,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	move.l #raptor_clock_val,_js_r_textbuffer
	move.l %d3,%a0
	jsr (%a0)
	pea 150.w
	pea 50.w
	jsr (%a3)
	move.l #.LC7,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	pea 150.w
	pea 138.w
	jsr (%a3)
	addq.l #8,%sp
	move.w raptor_clock_hex,%a0
	move.l %a0,-(%sp)
	pea .LC8
	move.l %d2,%a0
	jsr (%a0)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	pea 1.w
	jsr (%a5)
	move.l %d0,__ZL4pad1
	move.l %d0,%d1
	and.l JAGPAD_A,%d1
	addq.l #4,%sp
	jeq .L2
.L9:
	move.w #8,raptor_clock_mode
.L3:
	clr.l -(%sp)
	jsr (%a4)
	addq.l #4,%sp
.L10:
	pea 130.w
	pea 50.w
	jsr (%a3)
	move.l #.LC6,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	move.l #raptor_clock_val,_js_r_textbuffer
	move.l %d3,%a0
	jsr (%a0)
	pea 150.w
	pea 50.w
	jsr (%a3)
	move.l #.LC7,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	pea 150.w
	pea 138.w
	jsr (%a3)
	addq.l #8,%sp
	move.w raptor_clock_hex,%a0
	move.l %a0,-(%sp)
	pea .LC8
	move.l %d2,%a0
	jsr (%a0)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	pea 1.w
	jsr (%a5)
	move.l %d0,__ZL4pad1
	move.l %d0,%d1
	and.l JAGPAD_A,%d1
	addq.l #4,%sp
	jne .L9
.L2:
	move.l %d0,%d1
	and.l JAGPAD_B,%d1
	jeq .L4
	clr.w raptor_clock_mode
	clr.l -(%sp)
	jsr (%a4)
	addq.l #4,%sp
	jra .L10
.L4:
	move.l %d0,%d1
	and.l JAGPAD_C,%d1
	jeq .L5
	move.w #4,raptor_clock_mode
	clr.l -(%sp)
	jsr (%a4)
	addq.l #4,%sp
	jra .L10
.L5:
	move.l %d0,%d1
	and.l JAGPAD_1,%d1
	jne .L11
	and.l JAGPAD_2,%d0
	jeq .L3
	pea 10.w
	move.l %d5,%a0
	jsr (%a0)
	addq.l #4,%sp
	clr.l -(%sp)
	jsr (%a4)
	addq.l #4,%sp
	jra .L10
.L11:
	pea 10.w
	move.l %d4,%a0
	jsr (%a0)
	addq.l #4,%sp
	clr.l -(%sp)
	jsr (%a4)
	addq.l #4,%sp
	jra .L10
	.globl	sprite
	.data
	.even
sprite:
	.long	RAPTOR_sprite_table
.lcomm __ZL4pad1,4
