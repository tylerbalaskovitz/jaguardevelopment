#NO_APP
	.text
.LC0:
	.ascii "CalcAngle\0"
.LC1:
	.ascii "DPAD To Move\0"
.LC2:
	.ascii "0-511 Angle: \0"
.LC3:
	.ascii "%s% d\0"
.LC4:
	.ascii "Vector X: \0"
.LC5:
	.ascii "Vector Y: \0"
	.even
	.globl	__Z9basicmainv
__Z9basicmainv:
	link.w %fp,#0
	movem.l #14396,-(%sp)
	moveq #1,%d0
	move.l %d0,_jsfFontIndx
	move.l %d0,_jsfFontSize
	pea 182.w
	pea 130.w
	lea rapLocate,%a3
	jsr (%a3)
	move.l #.LC0,_js_r_textbuffer
	addq.l #8,%sp
	lea _rapPrint,%a2
	jsr (%a2)
	pea 210.w
	pea 118.w
	jsr (%a3)
	move.l #.LC1,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	pea __ZL15calcAngleBuffer
	jsr rapInitCalcAngle
	clr.l _jsfFontIndx
	clr.l _jsfFontSize
	addq.l #4,%sp
	move.l #jsfGetPad,%d4
	move.l #rapCalcAngle,%d2
	lea ee_printf,%a4
	lea rapAngleVector,%a5
	move.l #_jsfVsync,%d3
	pea 1.w
	move.l %d4,%a0
	jsr (%a0)
	move.l %d0,__ZL4pad1
	move.l %d0,%d1
	and.l JAGPAD_UP,%d1
	addq.l #4,%sp
	jeq .L2
.L10:
	move.l sprite,%a0
	subq.w #2,204(%a0)
.L3:
	move.l %d0,%d1
	and.l JAGPAD_LEFT,%d1
	jeq .L5
.L11:
	move.w 200(%a0),%d0
	subq.w #2,%d0
	move.w %d0,200(%a0)
	move.w 204(%a0),%a1
	move.l %a1,-(%sp)
	move.w %d0,%a1
	move.l %a1,-(%sp)
	move.w 396(%a0),%a1
	move.l %a1,-(%sp)
	move.w 392(%a0),%a0
	move.l %a0,-(%sp)
	move.l %d2,%a0
	jsr (%a0)
	move.l %d0,__ZL5angle
	lea (16,%sp),%sp
	pea 30.w
	pea 20.w
	jsr (%a3)
	addq.l #4,%sp
	move.l __ZL5angle,(%sp)
	pea .LC2
	pea .LC3
	jsr (%a4)
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	jsr (%a2)
	move.l __ZL5angle,-(%sp)
	jsr (%a5)
	moveq #50,%d0
	move.l %d0,(%sp)
	pea 20.w
	jsr (%a3)
	addq.l #4,%sp
	move.l rapAngle_xAdd,(%sp)
	pea .LC4
	pea .LC3
	jsr (%a4)
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	jsr (%a2)
	pea 70.w
	pea 20.w
	jsr (%a3)
	addq.l #4,%sp
	move.l rapAngle_yAdd,(%sp)
	pea .LC5
	pea .LC3
	jsr (%a4)
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	jsr (%a2)
	move.l sprite,%a0
	move.l rapAngle_xAdd,400(%a0)
	move.l rapAngle_yAdd,404(%a0)
	move.w 204(%a0),%a1
	move.l %a1,-(%sp)
	move.w 200(%a0),%a1
	move.l %a1,-(%sp)
	move.w 588(%a0),%a1
	move.l %a1,-(%sp)
	move.w 584(%a0),%a0
	move.l %a0,-(%sp)
	move.l %d2,%a0
	jsr (%a0)
	move.l %d0,__ZL5angle
	lea (12,%sp),%sp
	move.l %d0,(%sp)
	jsr (%a5)
	move.l sprite,%a0
	move.l rapAngle_xAdd,%d0
	add.l %d0,%d0
	add.l %d0,%d0
	move.l %d0,592(%a0)
	move.l rapAngle_yAdd,%d0
	add.l %d0,%d0
	add.l %d0,%d0
	move.l %d0,596(%a0)
	clr.l (%sp)
	move.l %d3,%a1
	jsr (%a1)
	addq.l #4,%sp
.L12:
	pea 1.w
	move.l %d4,%a0
	jsr (%a0)
	move.l %d0,__ZL4pad1
	move.l %d0,%d1
	and.l JAGPAD_UP,%d1
	addq.l #4,%sp
	jne .L10
.L2:
	move.l %d0,%d1
	and.l JAGPAD_DOWN,%d1
	move.l sprite,%a0
	jeq .L3
	addq.w #2,204(%a0)
	move.l %d0,%d1
	and.l JAGPAD_LEFT,%d1
	jne .L11
.L5:
	and.l JAGPAD_RIGHT,%d0
	jne .L7
	move.w 200(%a0),%d0
	move.w 204(%a0),%a1
	move.l %a1,-(%sp)
	move.w %d0,%a1
	move.l %a1,-(%sp)
	move.w 396(%a0),%a1
	move.l %a1,-(%sp)
	move.w 392(%a0),%a0
	move.l %a0,-(%sp)
	move.l %d2,%a0
	jsr (%a0)
	move.l %d0,__ZL5angle
	lea (16,%sp),%sp
	pea 30.w
	pea 20.w
	jsr (%a3)
	addq.l #4,%sp
	move.l __ZL5angle,(%sp)
	pea .LC2
	pea .LC3
	jsr (%a4)
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	jsr (%a2)
	move.l __ZL5angle,-(%sp)
	jsr (%a5)
	moveq #50,%d0
	move.l %d0,(%sp)
	pea 20.w
	jsr (%a3)
	addq.l #4,%sp
	move.l rapAngle_xAdd,(%sp)
	pea .LC4
	pea .LC3
	jsr (%a4)
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	jsr (%a2)
	pea 70.w
	pea 20.w
	jsr (%a3)
	addq.l #4,%sp
	move.l rapAngle_yAdd,(%sp)
	pea .LC5
	pea .LC3
	jsr (%a4)
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	jsr (%a2)
	move.l sprite,%a0
	move.l rapAngle_xAdd,400(%a0)
	move.l rapAngle_yAdd,404(%a0)
	move.w 204(%a0),%a1
	move.l %a1,-(%sp)
	move.w 200(%a0),%a1
	move.l %a1,-(%sp)
	move.w 588(%a0),%a1
	move.l %a1,-(%sp)
	move.w 584(%a0),%a0
	move.l %a0,-(%sp)
	move.l %d2,%a0
	jsr (%a0)
	move.l %d0,__ZL5angle
	lea (12,%sp),%sp
	move.l %d0,(%sp)
	jsr (%a5)
	move.l sprite,%a0
	move.l rapAngle_xAdd,%d0
	add.l %d0,%d0
	add.l %d0,%d0
	move.l %d0,592(%a0)
	move.l rapAngle_yAdd,%d0
	add.l %d0,%d0
	add.l %d0,%d0
	move.l %d0,596(%a0)
	clr.l (%sp)
	move.l %d3,%a1
	jsr (%a1)
	addq.l #4,%sp
	jra .L12
.L7:
	move.w 200(%a0),%d0
	addq.w #2,%d0
	move.w %d0,200(%a0)
	move.w 204(%a0),%a1
	move.l %a1,-(%sp)
	move.w %d0,%a1
	move.l %a1,-(%sp)
	move.w 396(%a0),%a1
	move.l %a1,-(%sp)
	move.w 392(%a0),%a0
	move.l %a0,-(%sp)
	move.l %d2,%a0
	jsr (%a0)
	move.l %d0,__ZL5angle
	lea (16,%sp),%sp
	pea 30.w
	pea 20.w
	jsr (%a3)
	addq.l #4,%sp
	move.l __ZL5angle,(%sp)
	pea .LC2
	pea .LC3
	jsr (%a4)
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	jsr (%a2)
	move.l __ZL5angle,-(%sp)
	jsr (%a5)
	moveq #50,%d0
	move.l %d0,(%sp)
	pea 20.w
	jsr (%a3)
	addq.l #4,%sp
	move.l rapAngle_xAdd,(%sp)
	pea .LC4
	pea .LC3
	jsr (%a4)
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	jsr (%a2)
	pea 70.w
	pea 20.w
	jsr (%a3)
	addq.l #4,%sp
	move.l rapAngle_yAdd,(%sp)
	pea .LC5
	pea .LC3
	jsr (%a4)
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	jsr (%a2)
	move.l sprite,%a0
	move.l rapAngle_xAdd,400(%a0)
	move.l rapAngle_yAdd,404(%a0)
	move.w 204(%a0),%a1
	move.l %a1,-(%sp)
	move.w 200(%a0),%a1
	move.l %a1,-(%sp)
	move.w 588(%a0),%a1
	move.l %a1,-(%sp)
	move.w 584(%a0),%a0
	move.l %a0,-(%sp)
	move.l %d2,%a0
	jsr (%a0)
	move.l %d0,__ZL5angle
	lea (12,%sp),%sp
	move.l %d0,(%sp)
	jsr (%a5)
	move.l sprite,%a0
	move.l rapAngle_xAdd,%d0
	add.l %d0,%d0
	add.l %d0,%d0
	move.l %d0,592(%a0)
	move.l rapAngle_yAdd,%d0
	add.l %d0,%d0
	add.l %d0,%d0
	move.l %d0,596(%a0)
	clr.l (%sp)
	move.l %d3,%a1
	jsr (%a1)
	addq.l #4,%sp
	jra .L12
	.globl	colliders
	.data
	.even
colliders:
	.long	raptor_collisionlist
	.globl	sprite
	.even
sprite:
	.long	RAPTOR_sprite_table
.lcomm __ZL15calcAngleBuffer,65540
.lcomm __ZL4pad1,4
.lcomm __ZL5angle,4
