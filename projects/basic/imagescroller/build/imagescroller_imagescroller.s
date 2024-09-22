#NO_APP
	.text
.LC0:
	.ascii "DPAD Left/Right to scroll\0"
	.even
	.globl	__Z9basicmainv
__Z9basicmainv:
	link.w %fp,#0
	move.l %a3,-(%sp)
	move.l %a2,-(%sp)
	clr.l _jsfFontIndx
	moveq #1,%d0
	move.l %d0,_jsfFontSize
	pea 190.w
	pea 60.w
	jsr rapLocate
	move.l #.LC0,_js_r_textbuffer
	addq.l #8,%sp
	jsr _rapPrint
	clr.l __ZL16backgroundObject
	moveq #1,%d0
	move.l %d0,__ZL19particleLayerObject
	pea 256.w
	clr.l -(%sp)
	pea BACKGROUND_clut
	jsr jsfLoadClut
	clr.l __ZL4pad1
	move.l #910,__ZL10scrollXmax
	clr.l __ZL7scrollX
	move.l __ZL16backgroundObject,%d0
	move.l %d0,%d1
	add.l %d0,%d1
	add.l %d1,%d0
	lsl.l #6,%d0
	move.l sprite,%a0
	add.l %d0,%a0
	move.l #-1048576,8(%a0)
	move.l 44(%a0),__ZL13backgroundGfx
	lea (12,%sp),%sp
	lea jsfGetPad,%a3
	lea _jsfVsync,%a2
	pea 1.w
	jsr (%a3)
	move.l %d0,__ZL4pad1
	move.l %d0,%d1
	and.l JAGPAD_LEFT,%d1
	addq.l #4,%sp
	jeq .L2
.L6:
	move.l __ZL7scrollX,%a1
	cmp.w #0,%a1
	jle .L2
	move.l __ZL16backgroundObject,%d0
	move.l %d0,%d1
	add.l %d0,%d1
	add.l %d1,%d0
	lsl.l #6,%d0
	move.l sprite,%a0
	add.l %d0,%a0
	move.l 8(%a0),%d0
	add.l #65536,%d0
	move.l %d0,8(%a0)
	cmp.l #-65535,%d0
	jlt .L3
	lea (-16,%a1),%a1
	move.l %a1,__ZL7scrollX
	add.l __ZL13backgroundGfx,%a1
	move.l %a1,44(%a0)
	move.l #-1048576,8(%a0)
.L3:
	clr.l -(%sp)
	jsr (%a2)
	addq.l #4,%sp
.L7:
	pea 1.w
	jsr (%a3)
	move.l %d0,__ZL4pad1
	move.l %d0,%d1
	and.l JAGPAD_LEFT,%d1
	addq.l #4,%sp
	jne .L6
.L2:
	and.l JAGPAD_RIGHT,%d0
	jeq .L3
	move.l __ZL7scrollX,%a0
	cmp.l __ZL10scrollXmax.l,%a0
	jge .L3
	move.l __ZL16backgroundObject,%d0
	move.l %d0,%a1
	add.l %d0,%a1
	add.l %a1,%d0
	lsl.l #6,%d0
	move.l sprite,%a1
	add.l %d0,%a1
	move.l 8(%a1),%d0
	add.l #-65536,%d0
	move.l %d0,8(%a1)
	cmp.l #-983040,%d0
	jge .L3
	lea (16,%a0),%a0
	move.l %a0,__ZL7scrollX
	add.l __ZL13backgroundGfx,%a0
	move.l %a0,44(%a1)
	clr.l 8(%a1)
	clr.l -(%sp)
	jsr (%a2)
	addq.l #4,%sp
	jra .L7
	.globl	colliders
	.data
	.even
colliders:
	.long	raptor_collisionlist
	.globl	sprite
	.even
sprite:
	.long	RAPTOR_sprite_table
.lcomm __ZL16backgroundObject,4
.lcomm __ZL19particleLayerObject,4
.lcomm __ZL4pad1,4
.lcomm __ZL10scrollXmax,4
.lcomm __ZL7scrollX,4
.lcomm __ZL13backgroundGfx,4
