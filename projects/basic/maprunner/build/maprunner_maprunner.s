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
	.globl	__Z9randomizej
__Z9randomizej:
	link.w %fp,#0
	unlk %fp
	jra _srand
	.even
	.globl	__Z9updatemapv
__Z9updatemapv:
	link.w %fp,#-24
	movem.l #16188,-(%sp)
	clr.l __ZL1i
	clr.l __ZL5loopx
	move.l __ZL12viewportmaxx,-8(%fp)
	jlt .L4
	move.l __ZL12viewportmaxy,%d4
	move.l __ZL9viewportx,-16(%fp)
	move.l __ZL9viewporty,%d5
	move.l __ZL11sprfloorgfx,-4(%fp)
	move.l __ZL10sprwallgfx,%d6
	sub.l %a1,%a1
	moveq #0,%d7
	lea __ZL3map,%a3
	lea __ZL7mapclut,%a4
	move.l %d4,%d0
	not.l %d0
	add.l %d0,%d0
	subx.l %d0,%d0
	and.l %d4,%d0
	move.l %d0,-12(%fp)
	addq.l #1,%d0
	move.l %d0,-20(%fp)
.L10:
	tst.l %d4
	jlt .L11
	moveq #0,%d1
	moveq #0,%d0
	sub.l %a0,%a0
	move.l -16(%fp),%d2
	add.l %d7,%d2
	lea (%a1,%a1.l),%a5
	move.l %a1,%d3
	addq.l #1,%d3
	lsl.l #5,%d2
	add.l %a5,%a5
	move.l %a5,%a2
	add.l #__ZL6mapgfx,%a2
	add.l #__ZL7mapclut,%a5
	move.l %d7,-24(%fp)
	add.l %d5,%a0
	lea (%a0,%d2.l),%a0
	add.l %a0,%a0
	add.l %a0,%a0
	moveq #1,%d7
	cmp.l (%a3,%a0.l),%d7
	jeq .L15
.L6:
	move.l %d6,(%a2,%d1.l)
	add.l %a1,%a1
	add.l %a1,%a1
	moveq #2,%d7
	move.l %d7,(%a1,%a4.l)
	move.l %d3,%a1
	add.l %d0,%a1
	addq.l #1,%d0
	addq.l #4,%d1
	cmp.l %d0,%d4
	jlt .L16
.L12:
	move.l %d0,%a0
	add.l %d5,%a0
	lea (%a0,%d2.l),%a0
	add.l %a0,%a0
	add.l %a0,%a0
	moveq #1,%d7
	cmp.l (%a3,%a0.l),%d7
	jne .L6
.L15:
	move.l -4(%fp),(%a2,%d1.l)
	move.l %d7,(%a5,%d1.l)
	move.l %d3,%a1
	add.l %d0,%a1
	addq.l #1,%d0
	addq.l #4,%d1
	cmp.l %d0,%d4
	jge .L12
.L16:
	move.l -24(%fp),%d7
	move.l %d3,%a1
	add.l -12(%fp),%a1
	move.l -20(%fp),%d0
	addq.l #1,%d7
	cmp.l -8(%fp),%d7
	jle .L10
.L17:
	move.l %d0,__ZL5loopy
	move.l %a1,__ZL1i
	move.l %d7,__ZL5loopx
.L4:
	pea __ZL6mapgfx
	pea 100.w
	pea 44.w
	move.l __ZL4sand,-(%sp)
	lea jsfSprlistFieldSet,%a2
	jsr (%a2)
	lea (12,%sp),%sp
	move.l #__ZL7mapclut,(%sp)
	pea 100.w
	pea 96.w
	move.l __ZL4sand,-(%sp)
	jsr (%a2)
	lea (16,%sp),%sp
	movem.l -64(%fp),#15612
	unlk %fp
	rts
.L11:
	moveq #0,%d0
	addq.l #1,%d7
	cmp.l -8(%fp),%d7
	jle .L10
	jra .L17
	.even
	.globl	__Z4movev
__Z4movev:
	link.w %fp,#0
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	move.l __ZL12framecounter,%d0
	addq.l #1,%d0
	move.l %d0,__ZL12framecounter
	moveq #2,%d1
	cmp.l %d0,%d1
	jlt .L31
	move.l -8(%fp),%d2
	move.l -4(%fp),%d3
	unlk %fp
	rts
.L31:
	pea 1.w
	jsr jsfGetPad
	move.l %d0,__ZL4pad1
	move.l %d0,%d1
	and.l JAGPAD_LEFT,%d1
	addq.l #4,%sp
	jeq .L21
	move.l __ZL9viewportx,%d1
	jle .L21
	subq.l #1,%d1
	move.l %d1,__ZL9viewportx
	clr.l __ZL12framecounter
	moveq #1,%d2
.L22:
	move.l %d0,%d1
	and.l JAGPAD_UP,%d1
	jeq .L23
.L32:
	move.l __ZL9viewporty,%d1
	jle .L23
	subq.l #1,%d1
	move.l %d1,__ZL9viewporty
	clr.l __ZL12framecounter
.L26:
	move.l -8(%fp),%d2
	move.l -4(%fp),%d3
	unlk %fp
	jra __Z9updatemapv
.L21:
	move.l %d0,%d1
	and.l JAGPAD_RIGHT,%d1
	jeq .L28
	move.l __ZL9viewportx,%d1
	move.l %d1,%d2
	add.l __ZL12viewportmaxx,%d2
	move.l __ZL7mapsize,%a0
	subq.l #1,%a0
	cmp.l %d2,%a0
	jle .L28
	addq.l #1,%d1
	move.l %d1,__ZL9viewportx
	clr.l __ZL12framecounter
	moveq #1,%d2
	move.l %d0,%d1
	and.l JAGPAD_UP,%d1
	jne .L32
.L23:
	and.l JAGPAD_DOWN,%d0
	jeq .L25
	move.l __ZL9viewporty,%d0
	move.l %d0,%d3
	add.l __ZL12viewportmaxy,%d3
	move.l __ZL7mapsize,%d1
	subq.l #1,%d1
	cmp.l %d3,%d1
	jle .L25
	addq.l #1,%d0
	move.l %d0,__ZL9viewporty
	clr.l __ZL12framecounter
	move.l -8(%fp),%d2
	move.l -4(%fp),%d3
	unlk %fp
	jra __Z9updatemapv
.L28:
	clr.b %d2
	jra .L22
.L25:
	cmp.b #1,%d2
	jeq .L26
	move.l -8(%fp),%d2
	move.l -4(%fp),%d3
	unlk %fp
	rts
.LC0:
	.ascii "Please Wait: Building map\0"
.LC1:
	.ascii "Steps Left: \0"
.LC2:
	.ascii "%s% d\12\0"
.LC3:
	.ascii "DPAD: UP/DOWN/LEFT/RIGHT\0"
	.even
	.globl	__Z9basicmainv
__Z9basicmainv:
	link.w %fp,#-8
	movem.l #16188,-(%sp)
	clr.l __ZL9textlayer
	moveq #1,%d0
	move.l %d0,__ZL4sand
	moveq #101,%d1
	move.l %d1,__ZL7sprwall
	pea 16.w
	pea 1.w
	pea SPRITE_TILE_SAND_clut
	lea jsfLoadClut,%a2
	jsr (%a2)
	addq.l #8,%sp
	moveq #16,%d0
	move.l %d0,(%sp)
	pea 2.w
	pea SPRITE_TILE_ROCK3_clut
	jsr (%a2)
	move.l sprite,%a0
	move.l __ZL7sprwall,%d0
	move.l %d0,%d1
	add.l %d0,%d1
	add.l %d1,%d0
	lsl.l #6,%d0
	move.l 44(%a0,%d0.l),__ZL10sprwallgfx
	move.l __ZL4sand,%d0
	move.l %d0,%d1
	add.l %d0,%d1
	add.l %d1,%d0
	lsl.l #6,%d0
	move.l 44(%a0,%d0.l),__ZL11sprfloorgfx
	moveq #32,%d0
	move.l %d0,__ZL7mapsize
	clr.l __ZL1i
	clr.l __ZL5loopx
	clr.l __ZL5loopy
	moveq #9,%d1
	move.l %d1,__ZL12viewportmaxx
	move.l %d1,__ZL12viewportmaxy
	clr.l __ZL12framecounter
	clr.l __ZL4pad1
	clr.l __ZL10buildSteps
	clr.l __ZL3dir
	clr.l __ZL2px
	clr.l __ZL2py
	move.b #16,%d0
	move.l %d0,__ZL9viewportx
	move.l %d0,__ZL9viewporty
	pea 50.w
	jsr _srand
	move.l __ZL7mapsize,%d2
	move.l %d2,-(%sp)
	move.l %d2,-(%sp)
	jsr ___mulsi3
	add.l #500,%d0
	move.l %d0,__ZL10buildSteps
	move.l %d2,%d2
	jpl .L60
	addq.l #1,%d2
.L60:
	asr.l #1,%d2
	move.l %d2,__ZL2px
	move.l %d2,__ZL2py
	moveq #1,%d1
	move.l %d1,_jsfFontIndx
	move.l %d1,_jsfFontSize
	lea (24,%sp),%sp
	pea 18.w
	pea 16.w
	lea rapLocate,%a3
	jsr (%a3)
	move.l #.LC0,_js_r_textbuffer
	addq.l #8,%sp
	lea _rapPrint,%a2
	jsr (%a2)
	clr.l _jsfFontIndx
	clr.l _jsfFontSize
	tst.l __ZL10buildSteps
	jle .L35
	move.l #__ZL3map,%d7
	move.l #_rand,%d6
	move.l #___floatsisf,%d5
	move.l #___mulsf3,%d4
	move.l #___extendsfdf2,%d3
	move.l #___muldf3,%d2
	lea ___truncdfsf2,%a5
	lea ___fixsfsi,%a4
.L40:
	move.l __ZL2px,%d0
	lsl.l #5,%d0
	add.l __ZL2py,%d0
	add.l %d0,%d0
	add.l %d0,%d0
	moveq #1,%d1
	move.l %d7,%a0
	move.l %d1,(%a0,%d0.l)
	move.l %d6,%a0
	jsr (%a0)
	move.l %d0,-(%sp)
	move.l %d5,%a0
	jsr (%a0)
	move.l #0x30000000,(%sp)
	move.l %d0,-(%sp)
	move.l %d4,%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l %d0,(%sp)
	move.l %d3,%a0
	jsr (%a0)
	clr.l (%sp)
	move.l #1075052544,-(%sp)
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	move.l %d2,%a0
	jsr (%a0)
	lea (12,%sp),%sp
	move.l %d1,(%sp)
	move.l %d0,-(%sp)
	jsr (%a5)
	addq.l #4,%sp
	move.l %d0,(%sp)
	jsr (%a4)
	addq.l #4,%sp
	move.l %d0,__ZL3dir
	moveq #1,%d1
	cmp.l %d0,%d1
	jeq .L53
	moveq #2,%d1
	cmp.l %d0,%d1
	jeq .L54
	moveq #3,%d1
	cmp.l %d0,%d1
	jeq .L55
	moveq #4,%d1
	cmp.l %d0,%d1
	jeq .L56
.L38:
	subq.l #1,__ZL10buildSteps
	pea 50.w
	pea 16.w
	jsr (%a3)
	addq.l #4,%sp
	move.l __ZL10buildSteps,(%sp)
	pea .LC1
	pea .LC2
	jsr ee_printf
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	jsr (%a2)
	tst.l __ZL10buildSteps
	jgt .L40
.L35:
	jsr _cls
	jsr __Z9updatemapv
	clr.l __ZL1i
	clr.l __ZL5loopx
	move.l __ZL12viewportmaxx,-4(%fp)
	jlt .L41
	move.l __ZL12viewportmaxy,%d5
	sub.l %a5,%a5
	moveq #90,%d7
	moveq #0,%d6
	move.l %d5,%a0
	addq.l #1,%a0
	move.l %a0,-8(%fp)
	lea __ZL4mapy,%a4
.L44:
	tst.l %d5
	jlt .L46
	move.l %d7,%d4
	swap %d4
	clr.w %d4
	lea (%a5,%a5.l),%a1
	add.l %a1,%a1
	add.l #__ZL4mapx,%a1
	move.l -8(%fp),%d3
	add.l %a5,%d3
	move.l %a5,%d1
	move.l %a5,%d0
	move.w #32,%a0
	move.l %d4,(%a1)+
	add.l %d1,%d1
	add.l %d1,%d1
	move.l %a0,%d2
	swap %d2
	clr.w %d2
	move.l %d2,(%a4,%d1.l)
	addq.l #1,%d0
	lea (16,%a0),%a0
	cmp.l %d0,%d3
	jeq .L57
.L47:
	move.l %d0,%d1
	move.l %d4,(%a1)+
	add.l %d1,%d1
	add.l %d1,%d1
	move.l %a0,%d2
	swap %d2
	clr.w %d2
	move.l %d2,(%a4,%d1.l)
	addq.l #1,%d0
	lea (16,%a0),%a0
	cmp.l %d0,%d3
	jne .L47
.L57:
	lea 1(%a5,%d5.l),%a5
	move.l -8(%fp),%d0
	addq.l #1,%d6
	moveq #16,%d1
	add.l %d1,%d7
	cmp.l -4(%fp),%d6
	jle .L44
.L58:
	move.l %d0,__ZL5loopy
	move.l %a5,__ZL1i
	move.l -4(%fp),%d0
	addq.l #1,%d0
	move.l %d0,__ZL5loopx
.L41:
	pea __ZL4mapx
	pea 100.w
	pea 8.w
	move.l __ZL4sand,-(%sp)
	lea jsfSprlistFieldSet,%a4
	jsr (%a4)
	lea (12,%sp),%sp
	move.l #__ZL4mapy,(%sp)
	pea 100.w
	pea 12.w
	move.l __ZL4sand,-(%sp)
	jsr (%a4)
	moveq #1,%d1
	move.l %d1,_jsfFontIndx
	move.l %d1,_jsfFontSize
	lea (16,%sp),%sp
	pea 190.w
	pea 60.w
	jsr (%a3)
	move.l #.LC3,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	lea __Z4movev,%a3
	lea _jsfVsync,%a2
.L45:
	jsr (%a3)
	clr.l -(%sp)
	jsr (%a2)
	addq.l #4,%sp
	jsr (%a3)
	clr.l -(%sp)
	jsr (%a2)
	addq.l #4,%sp
	jra .L45
.L56:
	move.l __ZL2px,%d0
	move.b #1,%d1
	cmp.l %d0,%d1
	jge .L38
	subq.l #1,%d0
	move.l %d0,__ZL2px
	subq.l #1,__ZL10buildSteps
	pea 50.w
	pea 16.w
	jsr (%a3)
	addq.l #4,%sp
	move.l __ZL10buildSteps,(%sp)
	pea .LC1
	pea .LC2
	jsr ee_printf
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	jsr (%a2)
	tst.l __ZL10buildSteps
	jgt .L40
	jra .L35
.L53:
	move.l __ZL2py,%d0
	cmp.l %d0,%d1
	jge .L38
	subq.l #1,%d0
	move.l %d0,__ZL2py
	subq.l #1,__ZL10buildSteps
	pea 50.w
	pea 16.w
	jsr (%a3)
	addq.l #4,%sp
	move.l __ZL10buildSteps,(%sp)
	pea .LC1
	pea .LC2
	jsr ee_printf
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	jsr (%a2)
	tst.l __ZL10buildSteps
	jgt .L40
	jra .L35
.L55:
	move.l __ZL2py,%d0
	move.l __ZL7mapsize,%d1
	subq.l #2,%d1
	cmp.l %d1,%d0
	jge .L38
	addq.l #1,%d0
	move.l %d0,__ZL2py
	subq.l #1,__ZL10buildSteps
	pea 50.w
	pea 16.w
	jsr (%a3)
	addq.l #4,%sp
	move.l __ZL10buildSteps,(%sp)
	pea .LC1
	pea .LC2
	jsr ee_printf
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	jsr (%a2)
	tst.l __ZL10buildSteps
	jgt .L40
	jra .L35
.L54:
	move.l __ZL2px,%d0
	move.l __ZL7mapsize,%d1
	subq.l #2,%d1
	cmp.l %d1,%d0
	jge .L38
	addq.l #1,%d0
	move.l %d0,__ZL2px
	subq.l #1,__ZL10buildSteps
	pea 50.w
	pea 16.w
	jsr (%a3)
	addq.l #4,%sp
	move.l __ZL10buildSteps,(%sp)
	pea .LC1
	pea .LC2
	jsr ee_printf
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	jsr (%a2)
	tst.l __ZL10buildSteps
	jgt .L40
	jra .L35
.L46:
	moveq #0,%d0
	addq.l #1,%d6
	moveq #16,%d1
	add.l %d1,%d7
	cmp.l -4(%fp),%d6
	jle .L44
	jra .L58
	.even
	.globl	__Z8RNDRANGEff
__Z8RNDRANGEff:
	link.w %fp,#0
	movem.l #14384,-(%sp)
	move.l 8(%fp),%d4
	move.l 12(%fp),%a3
	move.l %a3,-(%sp)
	move.l %d4,-(%sp)
	jsr ___gtsf2
	addq.l #8,%sp
	tst.l %d0
	jgt .L66
	jsr _rand
	move.l %d0,-(%sp)
	jsr ___floatsisf
	move.l #0x30000000,(%sp)
	move.l %d0,-(%sp)
	jsr ___mulsf3
	addq.l #8,%sp
	lea ___extendsfdf2,%a2
	move.l %d0,-(%sp)
	jsr (%a2)
	move.l %d0,%d2
	move.l %d1,%d3
	move.l %d4,(%sp)
	move.l %a3,-(%sp)
	jsr ___subsf3
	addq.l #4,%sp
	move.l %d0,(%sp)
	jsr (%a2)
	lea ___adddf3,%a3
	clr.l (%sp)
	move.l #1072693248,-(%sp)
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	jsr (%a3)
	lea (12,%sp),%sp
	move.l %d1,(%sp)
	move.l %d0,-(%sp)
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	jsr ___muldf3
	lea (16,%sp),%sp
	move.l %d0,%d2
	move.l %d1,%d3
	move.l %d4,-(%sp)
	jsr (%a2)
	move.l %d1,(%sp)
	move.l %d0,-(%sp)
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	jsr (%a3)
	lea (12,%sp),%sp
	move.l %d1,(%sp)
	move.l %d0,-(%sp)
	jsr ___truncdfsf2
	addq.l #8,%sp
	movem.l -20(%fp),#3100
	unlk %fp
	rts
.L66:
	move.l %d4,__ZZ8RNDRANGEffE1t
	move.l %d4,%d0
	move.l %a3,%d4
	move.l %d0,%a3
	jsr _rand
	move.l %d0,-(%sp)
	jsr ___floatsisf
	move.l #0x30000000,(%sp)
	move.l %d0,-(%sp)
	jsr ___mulsf3
	addq.l #8,%sp
	lea ___extendsfdf2,%a2
	move.l %d0,-(%sp)
	jsr (%a2)
	move.l %d0,%d2
	move.l %d1,%d3
	move.l %d4,(%sp)
	move.l %a3,-(%sp)
	jsr ___subsf3
	addq.l #4,%sp
	move.l %d0,(%sp)
	jsr (%a2)
	lea ___adddf3,%a3
	clr.l (%sp)
	move.l #1072693248,-(%sp)
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	jsr (%a3)
	lea (12,%sp),%sp
	move.l %d1,(%sp)
	move.l %d0,-(%sp)
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	jsr ___muldf3
	lea (16,%sp),%sp
	move.l %d0,%d2
	move.l %d1,%d3
	move.l %d4,-(%sp)
	jsr (%a2)
	move.l %d1,(%sp)
	move.l %d0,-(%sp)
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	jsr (%a3)
	lea (12,%sp),%sp
	move.l %d1,(%sp)
	move.l %d0,-(%sp)
	jsr ___truncdfsf2
	addq.l #8,%sp
	movem.l -20(%fp),#3100
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
.lcomm __ZL9textlayer,4
.lcomm __ZL4sand,4
.lcomm __ZL7sprwall,4
.lcomm __ZL10sprwallgfx,4
.lcomm __ZL11sprfloorgfx,4
.lcomm __ZL7mapsize,4
.lcomm __ZL1i,4
.lcomm __ZL5loopx,4
.lcomm __ZL5loopy,4
.lcomm __ZL9viewportx,4
.lcomm __ZL9viewporty,4
.lcomm __ZL12viewportmaxx,4
.lcomm __ZL12viewportmaxy,4
.lcomm __ZL12framecounter,4
.lcomm __ZL4pad1,4
.lcomm __ZL10buildSteps,4
.lcomm __ZL3dir,4
.lcomm __ZL2px,4
.lcomm __ZL2py,4
.lcomm __ZL3map,4096
.lcomm __ZL4mapx,400
.lcomm __ZL4mapy,400
.lcomm __ZZ8RNDRANGEffE1t,4
.lcomm __ZL6mapgfx,400
.lcomm __ZL7mapclut,400
