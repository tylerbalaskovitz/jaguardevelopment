#NO_APP
	.text
.LC0:
	.ascii "Text overlay example\0"
.LC1:
	.ascii "4 different pictures\0"
.LC2:
	.ascii " text still visible\0"
.LC3:
	.ascii "  Look at rapinit.s\0"
.LC4:
	.ascii " and background.bas\0"
	.even
	.globl	__Z9basicmainv
__Z9basicmainv:
	link.w %fp,#0
	move.l %a3,-(%sp)
	move.l %a2,-(%sp)
	moveq #1,%d0
	move.l %d0,_jsfFontIndx
	move.b #2,%d0
	move.l %d0,_jsfFontSize
	pea 50.w
	clr.l -(%sp)
	lea rapLocate,%a3
	jsr (%a3)
	move.l #.LC0,_js_r_textbuffer
	addq.l #8,%sp
	lea _rapPrint,%a2
	jsr (%a2)
	pea 80.w
	clr.l -(%sp)
	jsr (%a3)
	move.l #.LC1,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	pea 110.w
	clr.l -(%sp)
	jsr (%a3)
	move.l #.LC2,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	pea 140.w
	clr.l -(%sp)
	jsr (%a3)
	move.l #.LC3,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	pea 170.w
	clr.l -(%sp)
	jsr (%a3)
	move.l #.LC4,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	pea 16.w
	clr.l -(%sp)
	pea back1_clut
	lea jsfLoadClut,%a2
	jsr (%a2)
	move.l sprite,%a0
	move.l #1048576,12(%a0)
	lea (12,%sp),%sp
	lea jsfDelay,%a3
.L2:
	pea 60.w
	jsr (%a3)
	moveq #16,%d0
	move.l %d0,(%sp)
	clr.l -(%sp)
	pea back2_clut
	jsr (%a2)
	move.l sprite,%a0
	move.l #1048576,204(%a0)
	move.l #45875200,12(%a0)
	addq.l #8,%sp
	moveq #60,%d1
	move.l %d1,(%sp)
	jsr (%a3)
	moveq #16,%d0
	move.l %d0,(%sp)
	clr.l -(%sp)
	pea back3_clut
	jsr (%a2)
	move.l sprite,%a0
	move.l #1048576,396(%a0)
	move.l #45875200,204(%a0)
	addq.l #8,%sp
	moveq #60,%d1
	move.l %d1,(%sp)
	jsr (%a3)
	moveq #16,%d0
	move.l %d0,(%sp)
	clr.l -(%sp)
	pea back4_clut
	jsr (%a2)
	move.l sprite,%a0
	move.l #1048576,588(%a0)
	move.l #45875200,396(%a0)
	addq.l #8,%sp
	moveq #60,%d1
	move.l %d1,(%sp)
	jsr (%a3)
	moveq #16,%d0
	move.l %d0,(%sp)
	clr.l -(%sp)
	pea back1_clut
	jsr (%a2)
	move.l sprite,%a0
	move.l #1048576,12(%a0)
	move.l #45875200,588(%a0)
	lea (12,%sp),%sp
	pea 60.w
	jsr (%a3)
	moveq #16,%d0
	move.l %d0,(%sp)
	clr.l -(%sp)
	pea back2_clut
	jsr (%a2)
	move.l sprite,%a0
	move.l #1048576,204(%a0)
	move.l #45875200,12(%a0)
	addq.l #8,%sp
	moveq #60,%d1
	move.l %d1,(%sp)
	jsr (%a3)
	moveq #16,%d0
	move.l %d0,(%sp)
	clr.l -(%sp)
	pea back3_clut
	jsr (%a2)
	move.l sprite,%a0
	move.l #1048576,396(%a0)
	move.l #45875200,204(%a0)
	addq.l #8,%sp
	moveq #60,%d1
	move.l %d1,(%sp)
	jsr (%a3)
	moveq #16,%d0
	move.l %d0,(%sp)
	clr.l -(%sp)
	pea back4_clut
	jsr (%a2)
	move.l sprite,%a0
	move.l #1048576,588(%a0)
	move.l #45875200,396(%a0)
	addq.l #8,%sp
	moveq #60,%d1
	move.l %d1,(%sp)
	jsr (%a3)
	moveq #16,%d0
	move.l %d0,(%sp)
	clr.l -(%sp)
	pea back1_clut
	jsr (%a2)
	move.l sprite,%a0
	move.l #1048576,12(%a0)
	move.l #45875200,588(%a0)
	lea (12,%sp),%sp
	jra .L2
	.globl	colliders
	.data
	.even
colliders:
	.long	raptor_collisionlist
	.globl	sprite
	.even
sprite:
	.long	RAPTOR_sprite_table
