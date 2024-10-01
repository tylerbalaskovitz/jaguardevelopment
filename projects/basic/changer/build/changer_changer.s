#NO_APP
	.text
	.even
	.globl	__Z18check_pad_movementv
__Z18check_pad_movementv:
	link.w %fp,#0
	move.l %d2,-(%sp)
	move.l __ZL4pad1,%d0
	btst #2,%d0
	jeq .L2
	move.l __ZL8ship_pos,%d1
	cmp.l #5636096,%d1
	jgt .L6
.L2:
	btst #3,%d0
	jeq .L3
	move.l __ZL8ship_pos,%d0
	cmp.l #13631487,%d0
	jgt .L1
	move.l __ZL4ship,%d1
	move.l %d1,%a0
	add.l %d1,%a0
	add.l %a0,%d1
	lsl.l #6,%d1
	move.l sprite,%a0
	add.l %d1,%a0
	add.l #131072,%d0
	move.l %d0,8(%a0)
	move.l __ZL13ship_gfx_size,%d0
	add.l %d0,%d0
	add.l __ZL12ship_gfx_loc,%d0
	move.l %d0,44(%a0)
.L1:
	move.l (%sp)+,%d2
	unlk %fp
	rts
.L3:
	tst.l %d0
	jne .L1
	move.l __ZL4ship,%d0
	move.l %d0,%d1
	add.l %d0,%d1
	add.l %d1,%d0
	lsl.l #6,%d0
	move.l sprite,%a0
	move.l __ZL12ship_gfx_loc,44(%a0,%d0.l)
	move.l (%sp)+,%d2
	unlk %fp
	rts
.L6:
	move.l __ZL4ship,%a0
	move.l %a0,%d2
	add.l %a0,%d2
	add.l %a0,%d2
	lsl.l #6,%d2
	move.l sprite,%a0
	add.l %d2,%a0
	add.l #-131072,%d1
	move.l %d1,8(%a0)
	move.l __ZL12ship_gfx_loc,%d1
	add.l __ZL13ship_gfx_size,%d1
	move.l %d1,44(%a0)
	jra .L2
	.even
	.globl	__Z18choose_stars_framev
__Z18choose_stars_framev:
	link.w %fp,#0
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	move.l sprite,%a0
	move.l __ZL4ship,%d0
	move.l %d0,%d1
	add.l %d0,%d1
	add.l %d1,%d0
	lsl.l #6,%d0
	move.l 8(%a0,%d0.l),%d0
	move.l %d0,__ZL8ship_pos
	cmp.l #6553600,%d0
	jgt .L9
	move.l __ZL5stars,%d1
	move.l %d1,%a1
	add.l %d1,%a1
	add.l %a1,%d1
	lsl.l #6,%d1
	move.l __ZL13stars_gfx_loc,44(%a0,%d1.l)
.L9:
	move.l %d0,%d1
	add.l #-6553601,%d1
	cmp.l #655359,%d1
	jhi .L10
	move.l __ZL5stars,%d1
	move.l %d1,%a1
	add.l %d1,%a1
	add.l %a1,%d1
	lsl.l #6,%d1
	move.l __ZL13stars_gfx_loc,%d2
	add.l __ZL14stars_gfx_size,%d2
	move.l %d2,44(%a0,%d1.l)
.L10:
	move.l %d0,%d1
	add.l #-7208961,%d1
	cmp.l #655359,%d1
	jhi .L11
	move.l __ZL5stars,%d1
	move.l %d1,%a1
	add.l %d1,%a1
	add.l %a1,%d1
	lsl.l #6,%d1
	move.l __ZL14stars_gfx_size,%a1
	add.l %a1,%a1
	add.l __ZL13stars_gfx_loc,%a1
	move.l %a1,44(%a0,%d1.l)
.L11:
	move.l %d0,%d1
	add.l #-7864321,%d1
	cmp.l #655359,%d1
	jhi .L12
	move.l __ZL5stars,%d1
	move.l %d1,%a1
	add.l %d1,%a1
	add.l %a1,%d1
	lsl.l #6,%d1
	move.l __ZL14stars_gfx_size,%a1
	move.l %a1,%d2
	add.l %a1,%d2
	lea (%a1,%d2.l),%a1
	add.l __ZL13stars_gfx_loc,%a1
	move.l %a1,44(%a0,%d1.l)
.L12:
	move.l %d0,%d1
	add.l #-8519681,%d1
	cmp.l #655359,%d1
	jhi .L13
	move.l __ZL5stars,%d1
	move.l %d1,%a1
	add.l %d1,%a1
	add.l %a1,%d1
	lsl.l #6,%d1
	move.l __ZL14stars_gfx_size,%a1
	add.l %a1,%a1
	add.l %a1,%a1
	add.l __ZL13stars_gfx_loc,%a1
	move.l %a1,44(%a0,%d1.l)
.L13:
	move.l %d0,%d1
	add.l #-9175041,%d1
	cmp.l #655359,%d1
	jhi .L14
	move.l __ZL5stars,%d1
	move.l %d1,%a1
	add.l %d1,%a1
	add.l %a1,%d1
	lsl.l #6,%d1
	move.l __ZL14stars_gfx_size,%a1
	move.l %a1,%d2
	add.l %a1,%d2
	add.l %d2,%d2
	lea (%a1,%d2.l),%a1
	add.l __ZL13stars_gfx_loc,%a1
	move.l %a1,44(%a0,%d1.l)
.L14:
	move.l %d0,%d1
	add.l #-9830401,%d1
	cmp.l #655359,%d1
	jhi .L15
	move.l __ZL5stars,%d1
	move.l %d1,%a1
	add.l %d1,%a1
	add.l %a1,%d1
	lsl.l #6,%d1
	move.l __ZL14stars_gfx_size,%a1
	move.l %a1,%d2
	add.l %a1,%d2
	lea (%a1,%d2.l),%a1
	add.l %a1,%a1
	add.l __ZL13stars_gfx_loc,%a1
	move.l %a1,44(%a0,%d1.l)
.L15:
	move.l %d0,%d1
	add.l #-10485761,%d1
	cmp.l #655359,%d1
	jhi .L16
	move.l __ZL5stars,%d1
	move.l %d1,%a1
	add.l %d1,%a1
	add.l %a1,%d1
	lsl.l #6,%d1
	move.l __ZL14stars_gfx_size,%d3
	move.l %d3,%d2
	lsl.l #3,%d2
	sub.l %d3,%d2
	add.l __ZL13stars_gfx_loc,%d2
	move.l %d2,44(%a0,%d1.l)
.L16:
	move.l %d0,%d1
	add.l #-11141121,%d1
	cmp.l #655359,%d1
	jhi .L17
	move.l __ZL5stars,%d1
	move.l %d1,%a1
	add.l %d1,%a1
	add.l %a1,%d1
	lsl.l #6,%d1
	move.l __ZL14stars_gfx_size,%d2
	lsl.l #3,%d2
	add.l __ZL13stars_gfx_loc,%d2
	move.l %d2,44(%a0,%d1.l)
.L17:
	move.l %d0,%d1
	add.l #-11796481,%d1
	cmp.l #655359,%d1
	jhi .L18
	move.l __ZL5stars,%d1
	move.l %d1,%a1
	add.l %d1,%a1
	add.l %a1,%d1
	lsl.l #6,%d1
	move.l __ZL14stars_gfx_size,%d2
	move.l %d2,%d3
	lsl.l #3,%d3
	add.l %d3,%d2
	add.l __ZL13stars_gfx_loc,%d2
	move.l %d2,44(%a0,%d1.l)
.L18:
	move.l %d0,%d1
	add.l #-12451841,%d1
	cmp.l #655359,%d1
	jhi .L19
	move.l __ZL5stars,%d0
	move.l %d0,%d1
	add.l %d0,%d1
	add.l %d1,%d0
	lsl.l #6,%d0
	move.l __ZL14stars_gfx_size,%d1
	move.l %d1,%a1
	add.l %d1,%a1
	add.l %a1,%a1
	add.l %a1,%d1
	add.l %d1,%d1
	add.l __ZL13stars_gfx_loc,%d1
	move.l %d1,44(%a0,%d0.l)
.L8:
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	unlk %fp
	rts
.L19:
	cmp.l #13107200,%d0
	jle .L8
	move.l __ZL5stars,%d0
	move.l %d0,%d1
	add.l %d0,%d1
	add.l %d0,%d1
	lsl.l #6,%d1
	move.l __ZL14stars_gfx_size,%d0
	move.l %d0,%a1
	add.l %d0,%a1
	add.l %d0,%a1
	add.l %a1,%a1
	add.l %a1,%a1
	sub.l %d0,%a1
	add.l __ZL13stars_gfx_loc,%a1
	move.l %a1,44(%a0,%d1.l)
	move.l (%sp)+,%d2
	move.l (%sp)+,%d3
	unlk %fp
	rts
	.even
	.globl	__Z9basicmainv
__Z9basicmainv:
	link.w %fp,#0
	movem.l #60,-(%sp)
	moveq #1,%d0
	move.l %d0,__ZL5stars
	moveq #2,%d1
	move.l %d1,__ZL4ship
	clr.l __ZL12framecounter
	clr.l __ZL4pad1
	clr.l __ZL8ship_pos
	move.l sprite,%a0
	move.l 236(%a0),__ZL13stars_gfx_loc
	move.l 240(%a0),__ZL14stars_gfx_size
	move.l 428(%a0),__ZL12ship_gfx_loc
	move.l 432(%a0),__ZL13ship_gfx_size
	pea 16.w
	pea 15.w
	pea STARS_clut
	lea jsfLoadClut,%a2
	jsr (%a2)
	addq.l #8,%sp
	moveq #16,%d0
	move.l %d0,(%sp)
	pea 14.w
	pea SHIP_clut
	jsr (%a2)
	move.l __ZL5stars,%d0
	move.l sprite,%a0
	move.l %d0,%d1
	add.l %d0,%d1
	add.l %d1,%d0
	lsl.l #6,%d0
	move.l __ZL14stars_gfx_size,%d1
	move.l %d1,%a1
	add.l %d1,%a1
	add.l %a1,%a1
	add.l %a1,%d1
	add.l __ZL13stars_gfx_loc,%d1
	move.l %d1,44(%a0,%d0.l)
	lea (12,%sp),%sp
	lea jsfGetPad,%a5
	lea __Z18check_pad_movementv,%a4
	lea __Z18choose_stars_framev,%a3
	lea _jsfVsync,%a2
	move.l __ZL4ship,%d0
	move.l %d0,%d1
	add.l %d0,%d1
	add.l %d1,%d0
	lsl.l #6,%d0
	move.l 8(%a0,%d0.l),__ZL8ship_pos
	pea 1.w
	jsr (%a5)
	move.l %d0,__ZL4pad1
	jsr (%a4)
	jsr (%a3)
	clr.l (%sp)
	jsr (%a2)
	move.l __ZL12framecounter,%d0
	addq.l #1,%d0
	move.l %d0,__ZL12framecounter
	addq.l #4,%sp
	moveq #60,%d1
	cmp.l %d0,%d1
	jeq .L28
.L30:
	move.l sprite,%a0
.L32:
	move.l __ZL4ship,%d0
	move.l %d0,%d1
	add.l %d0,%d1
	add.l %d1,%d0
	lsl.l #6,%d0
	move.l 8(%a0,%d0.l),__ZL8ship_pos
	pea 1.w
	jsr (%a5)
	move.l %d0,__ZL4pad1
	jsr (%a4)
	jsr (%a3)
	clr.l (%sp)
	jsr (%a2)
	move.l __ZL12framecounter,%d0
	addq.l #1,%d0
	move.l %d0,__ZL12framecounter
	addq.l #4,%sp
	moveq #60,%d1
	cmp.l %d0,%d1
	jne .L30
.L28:
	clr.l __ZL12framecounter
	move.l sprite,%a0
	jra .L32
	.globl	colliders
	.data
	.even
colliders:
	.long	raptor_collisionlist
	.globl	sprite
	.even
sprite:
	.long	RAPTOR_sprite_table
.lcomm __ZL5stars,4
.lcomm __ZL4ship,4
.lcomm __ZL12framecounter,4
.lcomm __ZL4pad1,4
.lcomm __ZL8ship_pos,4
.lcomm __ZL13stars_gfx_loc,4
.lcomm __ZL12ship_gfx_loc,4
.lcomm __ZL14stars_gfx_size,4
.lcomm __ZL13ship_gfx_size,4
