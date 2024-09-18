#NO_APP
	.text
.LC0:
	.ascii "DPAD LEFT/RIGHT/UP/DOWN\0"
	.even
	.globl	__Z9basicmainv
__Z9basicmainv:
	link.w %fp,#0
	movem.l #56,-(%sp)
	clr.l __ZL2PX
	clr.l __ZL2PY
	moveq #1,%d0
	move.l %d0,_jsfFontIndx
	move.l %d0,_jsfFontSize
	pea 190.w
	pea 72.w
	jsr rapLocate
	move.l #.LC0,_js_r_textbuffer
	addq.l #8,%sp
	jsr _rapPrint
	lea jsfGetPad,%a4
	lea rapSetMapLoc,%a3
	lea _jsfVsync,%a2
	pea 1.w
	jsr (%a4)
	move.l %d0,__ZL3PAD
	move.l %d0,%d1
	and.l JAGPAD_UP,%d1
	addq.l #4,%sp
	jeq .L2
.L17:
	subq.l #4,__ZL2PY
.L3:
	move.l %d0,%d1
	and.l JAGPAD_LEFT,%d1
	jeq .L4
.L18:
	move.l __ZL2PX,%d0
	subq.l #4,%d0
	move.l %d0,__ZL2PX
.L5:
	tst.l %d0
	jlt .L14
.L7:
	moveq #96,%d1
	cmp.l %d0,%d1
	jge .L8
	move.l %d1,__ZL2PX
	moveq #96,%d0
.L8:
	move.l __ZL2PY,%d1
	jlt .L15
.L9:
	cmp.l #20904,%d1
	jle .L16
	move.l #20904,__ZL2PY
	move.l __ZL2PX,%d0
	move.l #1369964544,%d1
	move.l %d1,-(%sp)
	swap %d0
	clr.w %d0
	move.l %d0,-(%sp)
	jsr (%a3)
	addq.l #4,%sp
	clr.l (%sp)
	jsr (%a2)
	addq.l #4,%sp
.L19:
	pea 1.w
	jsr (%a4)
	move.l %d0,__ZL3PAD
	move.l %d0,%d1
	and.l JAGPAD_UP,%d1
	addq.l #4,%sp
	jne .L17
.L2:
	move.l %d0,%d1
	and.l JAGPAD_DOWN,%d1
	jeq .L3
	addq.l #4,__ZL2PY
	move.l %d0,%d1
	and.l JAGPAD_LEFT,%d1
	jne .L18
.L4:
	and.l JAGPAD_RIGHT,%d0
	jne .L6
	move.l __ZL2PX,%d0
	jge .L7
.L14:
	clr.l __ZL2PX
	moveq #0,%d0
	move.l __ZL2PY,%d1
	jge .L9
.L15:
	clr.l __ZL2PY
	move.l __ZL2PX,%d0
	moveq #0,%d1
	move.l %d1,-(%sp)
	swap %d0
	clr.w %d0
	move.l %d0,-(%sp)
	jsr (%a3)
	addq.l #4,%sp
	clr.l (%sp)
	jsr (%a2)
	addq.l #4,%sp
	jra .L19
.L6:
	move.l __ZL2PX,%d0
	addq.l #4,%d0
	move.l %d0,__ZL2PX
	jra .L5
.L16:
	swap %d1
	clr.w %d1
	move.l %d1,-(%sp)
	swap %d0
	clr.w %d0
	move.l %d0,-(%sp)
	jsr (%a3)
	addq.l #4,%sp
	clr.l (%sp)
	jsr (%a2)
	addq.l #4,%sp
	jra .L19
	.globl	colliders
	.data
	.even
colliders:
	.long	raptor_collisionlist
	.globl	sprite
	.even
sprite:
	.long	RAPTOR_sprite_table
.lcomm __ZL2PX,4
.lcomm __ZL2PY,4
.lcomm __ZL3PAD,4
