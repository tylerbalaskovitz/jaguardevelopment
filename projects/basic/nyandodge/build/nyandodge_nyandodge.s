#NO_APP
	.text
	.even
	.globl	__Z3rndv
__Z3rndv:
	link.w %fp,#0
	jsr _rand
	move.l %d0,-(%sp)
	jsr ___floatsisf
	move.l #0x30000000,(%sp)
	move.l %d0,-(%sp)
	jsr ___mulsf3
	addq.l #8,%sp
	unlk %fp
	rts
	.even
	.globl	__Z8newenemyv
__Z8newenemyv:
	link.w %fp,#0
	move.l %a2,-(%sp)
	move.l __ZL7CURRENT,%d0
	move.l %d0,%a2
	add.l %d0,%a2
	add.l %a2,%d0
	lsl.l #6,%d0
	move.l %d0,%a2
	lea (384,%a2),%a2
	add.l sprite,%a2
	move.w #352,8(%a2)
	jsr _rand
	move.l %d0,-(%sp)
	jsr ___floatsisf
	move.l #0x33c80000,(%sp)
	move.l %d0,-(%sp)
	jsr ___mulsf3
	addq.l #4,%sp
	move.l %d0,(%sp)
	jsr ___fixsfsi
	move.l %d0,(%sp)
	jsr ___floatsidf
	move.l %d1,(%sp)
	move.l %d0,-(%sp)
	jsr ___fixdfsi
	addq.l #8,%sp
	move.w %d0,12(%a2)
	move.l __ZL7CURRENT,%d0
	move.l %d0,%d1
	add.l %d0,%d1
	add.l %d0,%d1
	lsl.l #6,%d1
	move.l %d1,%a0
	lea (384,%a0),%a0
	add.l sprite,%a0
	moveq #-1,%d1
	move.l %d1,112(%a0)
	moveq #1,%d1
	move.l %d1,132(%a0)
	move.w #-2,16(%a0)
	move.l %d1,4(%a0)
	addq.l #1,%d0
	move.l %d0,__ZL7CURRENT
	move.b #19,%d1
	cmp.l %d0,%d1
	jeq .L5
	clr.l __ZL7FRCOUNT
	move.l -4(%fp),%a2
	unlk %fp
	rts
.L5:
	clr.l __ZL7CURRENT
	clr.l __ZL7FRCOUNT
	move.l -4(%fp),%a2
	unlk %fp
	rts
	.even
	.globl	__Z9basicmainv
__Z9basicmainv:
	link.w %fp,#0
	movem.l #16188,-(%sp)
	clr.l __ZL7FRCOUNT
	clr.l __ZL7CURRENT
	moveq #100,%d0
	move.l %d0,__ZL2PY
	clr.l _jsfFontIndx
	clr.l _jsfFontSize
	move.w #1,raptor_fade_delay
	clr.l __ZL6countr
	pea 10.w
	pea 10.w
	jsr rapLocate
	addq.l #8,%sp
	pea 16.w
	pea 2.w
	pea BMP_ENEMY_clut
	jsr jsfLoadClut
	addq.l #8,%sp
	moveq #1,%d0
	move.l %d0,(%sp)
	pea Module1
	move.l #__Z14u235PlayModuleis,%d6
	move.l %d6,%a0
	jsr (%a0)
	moveq #20,%d0
	move.l %d0,__ZL7counter
	addq.l #8,%sp
	move.l #jsfGetPad,%d2
	move.l #__Z14u235StopModulev,%d5
	move.l #__Z11u235Silencev,%d4
	lea rapCollide,%a5
	lea _jsfVsync,%a4
	lea rapFadeClut,%a3
	lea rapFadeSingle,%a2
	move.l %a3,%d3
	move.l __ZL7FRCOUNT,%d0
	addq.l #1,%d0
	move.l %d0,__ZL7FRCOUNT
	moveq #10,%d1
	cmp.l %d0,%d1
	jeq .L24
.L8:
	pea 1.w
	move.l %d2,%a0
	jsr (%a0)
	move.l %d0,__ZL5STICK
	move.l %d0,%d1
	and.l JAGPAD_UP,%d1
	addq.l #4,%sp
	jeq .L9
	move.l __ZL2PY,%d1
	moveq #20,%d7
	cmp.l %d1,%d7
	jge .L9
	subq.l #2,%d1
	move.l %d1,__ZL2PY
.L9:
	and.l JAGPAD_DOWN,%d0
	jeq .L10
	move.l __ZL2PY,%d0
	cmp.l #199,%d0
	jgt .L10
	addq.l #2,%d0
	move.l %d0,__ZL2PY
.L10:
	move.l __ZL7counter,%d0
	addq.l #1,%d0
	move.l %d0,__ZL7counter
	cmp.l #200,%d0
	jeq .L22
	cmp.l #201,%d0
	jeq .L25
	cmp.l #400,%d0
	jeq .L26
	moveq #1,%d1
	cmp.l %d0,%d1
	jeq .L27
.L12:
	move.l sprite,%a0
	move.w __ZL2PY+2,204(%a0)
	pea 22.w
	pea 2.w
	pea 1.w
	pea 1.w
	jsr (%a5)
	lea (16,%sp),%sp
	moveq #-1,%d1
	cmp.l %d0,%d1
	jeq .L15
.L31:
	move.w __ZL8sfxcount,%d0
	addq.w #1,%d0
	move.w %d0,__ZL8sfxcount
	cmp.w #10,%d0
	jeq .L28
	move.l __ZL2PY,%d0
	moveq #10,%d7
	lsl.l %d7,%d0
	move.l %d0,__ZL3col
	move.w %d0,15728728
.L17:
	clr.l -(%sp)
	jsr (%a4)
	move.l #BMP_PLAYER_clut,(%sp)
	pea 15.w
	pea 1.w
	jsr (%a3)
	move.l __ZL6countr,%d0
	lea (12,%sp),%sp
	moveq #31,%d1
	cmp.l %d0,%d1
	jge .L29
.L18:
	moveq #63,%d1
	cmp.l %d0,%d1
	jge .L30
	moveq #1,%d0
	move.l %d0,__ZL6countr
.L32:
	move.l __ZL7FRCOUNT,%d0
	addq.l #1,%d0
	move.l %d0,__ZL7FRCOUNT
	moveq #10,%d1
	cmp.l %d0,%d1
	jne .L8
.L24:
	jsr __Z8newenemyv
	jra .L8
.L28:
	clr.l -(%sp)
	pea 4.w
	jsr u235PlaySample
	clr.w __ZL8sfxcount
	addq.l #8,%sp
	move.l __ZL2PY,%d0
	moveq #10,%d7
	lsl.l %d7,%d0
	move.l %d0,__ZL3col
	move.w %d0,15728728
	jra .L17
.L27:
	pea 1.w
	pea Module1
	move.l %d6,%a0
	jsr (%a0)
	addq.l #8,%sp
	move.l sprite,%a0
	move.w __ZL2PY+2,204(%a0)
	pea 22.w
	pea 2.w
	pea 1.w
	pea 1.w
	jsr (%a5)
	lea (16,%sp),%sp
	moveq #-1,%d1
	cmp.l %d0,%d1
	jne .L31
.L15:
	move.w __ZL2PY+2,15728728
	clr.l -(%sp)
	jsr (%a4)
	move.l #BMP_PLAYER_clut,(%sp)
	pea 15.w
	pea 1.w
	jsr (%a3)
	move.l __ZL6countr,%d0
	lea (12,%sp),%sp
	moveq #31,%d1
	cmp.l %d0,%d1
	jlt .L18
.L29:
	pea BMP_ENEMY_clut
	pea 15.w
	pea 2.w
	move.l %d3,%a0
	jsr (%a0)
	move.l __ZL6countr,%d0
	addq.l #1,%d0
	lea (12,%sp),%sp
	move.l %d0,__ZL6countr
	jra .L32
.L26:
	clr.l __ZL7counter
.L22:
	move.l %d5,%a0
	jsr (%a0)
	move.l %d4,%a0
	jsr (%a0)
	jra .L12
.L30:
	pea 255.w
	pea 32.w
	jsr (%a2)
	addq.l #8,%sp
	pea 255.w
	pea 33.w
	jsr (%a2)
	addq.l #8,%sp
	pea 255.w
	pea 34.w
	jsr (%a2)
	addq.l #8,%sp
	pea 255.w
	pea 35.w
	jsr (%a2)
	addq.l #8,%sp
	pea 255.w
	pea 36.w
	jsr (%a2)
	addq.l #8,%sp
	pea 255.w
	pea 37.w
	jsr (%a2)
	addq.l #8,%sp
	pea 255.w
	pea 38.w
	jsr (%a2)
	addq.l #8,%sp
	pea 255.w
	pea 39.w
	jsr (%a2)
	addq.l #8,%sp
	pea 255.w
	pea 40.w
	jsr (%a2)
	addq.l #8,%sp
	pea 255.w
	pea 41.w
	jsr (%a2)
	move.l __ZL6countr,%d0
	addq.l #1,%d0
	addq.l #8,%sp
	move.l %d0,__ZL6countr
	jra .L32
.L25:
	pea 1.w
	pea Module2
	move.l %d6,%a0
	jsr (%a0)
	addq.l #8,%sp
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
.lcomm __ZL7FRCOUNT,4
.lcomm __ZL7CURRENT,4
.lcomm __ZL2PY,4
.lcomm __ZL6countr,4
.lcomm __ZL7counter,4
.lcomm __ZL5STICK,4
.lcomm __ZL8sfxcount,2
.lcomm __ZL3col,4
