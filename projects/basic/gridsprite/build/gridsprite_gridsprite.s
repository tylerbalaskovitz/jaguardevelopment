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
	.globl	__Z8drawtiless
__Z8drawtiless:
	link.w %fp,#0
	movem.l #12336,-(%sp)
	move.w 10(%fp),%d0
	ext.l %d0
	clr.w __ZZ8drawtilessE1i
	move.w __ZL5tiley,%d3
	muls.w #15360,%d3
	move.l %d3,__ZZ8drawtilessE13tile_y_offset
	move.w __ZL5tilex,%d1
	ext.l %d1
	lsl.l #4,%d1
	move.l %d1,__ZZ8drawtilessE13tile_x_offset
	add.l #tiles,%d1
	add.l %d1,%d3
	move.l %d3,__ZZ8drawtilessE12tile_address
	move.w 14(%fp),%d1
	muls.w #4608,%d1
	move.l %d1,__ZZ8drawtilessE15screen_y_offset
	lsl.l #4,%d0
	move.l %d0,__ZZ8drawtilessE15screen_x_offset
	move.l %d0,%d2
	add.l #scrbuf,%d2
	add.l %d1,%d2
	move.l %d2,__ZZ8drawtilessE14screen_address
	move.l %d3,%a3
	move.l %d2,%a0
	move.l %d2,%d1
	add.l #4608,%d1
	move.l %d3,%a1
	move.l (%a1),%d0
	move.l %a0,%a2
	move.l %d0,(%a2)+
	addq.l #4,%a3
	move.l (%a3),%d0
	move.l %d0,(%a2)
	lea (8,%a0),%a2
	lea (8,%a1),%a3
	move.l (%a3),%d0
	move.l %d0,(%a2)
	lea (12,%a0),%a2
	lea (12,%a1),%a3
	move.l (%a3),%d0
	move.l %d0,(%a2)
	lea (960,%a1),%a3
	lea (288,%a0),%a0
	cmp.l %a0,%d1
	jeq .L7
.L5:
	move.l %a3,%a1
	move.l (%a1),%d0
	move.l %a0,%a2
	move.l %d0,(%a2)+
	addq.l #4,%a3
	move.l (%a3),%d0
	move.l %d0,(%a2)
	lea (8,%a0),%a2
	lea (8,%a1),%a3
	move.l (%a3),%d0
	move.l %d0,(%a2)
	lea (12,%a0),%a2
	lea (12,%a1),%a3
	move.l (%a3),%d0
	move.l %d0,(%a2)
	lea (960,%a1),%a3
	lea (288,%a0),%a0
	cmp.l %a0,%d1
	jne .L5
.L7:
	add.l #15360,%d3
	move.l %d3,__ZZ8drawtilessE12tile_address
	add.l #4608,%d2
	move.l %d2,__ZZ8drawtilessE14screen_address
	move.w #16,__ZZ8drawtilessE1i
	movem.l (%sp)+,#3084
	unlk %fp
	rts
.LC0:
	.ascii "  Map draw and sprite position example  \0"
.LC1:
	.ascii "Uses graphics from Hyptosis\0"
.LC2:
	.ascii "Press A to begin countdown\0"
.LC3:
	.ascii ", map y=\0"
.LC4:
	.ascii ", map x=\0"
.LC5:
	.ascii ", y=\0"
.LC6:
	.ascii "x=\0"
.LC7:
	.ascii "%s% d%s% d%s% d%s% d\12\0"
.LC8:
	.ascii "Seconds left: \0"
.LC9:
	.ascii "%s% .7G\12\0"
.LC10:
	.ascii "It's over!!!!!!!!!!!!!!!!!!!!!!!!!!\0"
	.even
	.globl	__Z9basicmainv
__Z9basicmainv:
	link.w %fp,#-16
	movem.l #16188,-(%sp)
	moveq #1,%d0
	move.l %d0,_jsfFontIndx
	move.l %d0,_jsfFontSize
	pea 202.w
	clr.l -(%sp)
	lea rapLocate,%a4
	jsr (%a4)
	move.l #.LC0,_js_r_textbuffer
	addq.l #8,%sp
	jsr _rapPrint
	clr.l _jsfFontIndx
	clr.l _jsfFontSize
	pea 218.w
	clr.l -(%sp)
	jsr (%a4)
	move.l #.LC1,_js_r_textbuffer
	addq.l #8,%sp
	jsr _rapPrint
	pea 256.w
	clr.l -(%sp)
	pea tiles_clut
	jsr jsfLoadClut
	clr.l __ZL4pad1
	lea (12,%sp),%sp
	clr.w %d1
	moveq #0,%d2
.L11:
	move.l %d2,%d0
	lsl.l #3,%d0
	move.l %d0,%a0
	add.l %d2,%a0
	add.l %a0,%a0
	add.l %a0,%a0
	add.l #__ZL3map,%a0
	moveq #0,%d0
.L10:
	move.w %d1,%d3
	add.w %d0,%d3
	move.w %d3,(%a0)+
	addq.l #1,%d0
	moveq #18,%d3
	cmp.l %d0,%d3
	jne .L10
	addq.l #1,%d2
	add.w #60,%d1
	moveq #10,%d0
	cmp.l %d2,%d0
	jne .L11
	clr.w __ZL1y
	clr.b %d3
	lea __Z8drawtiless,%a3
.L13:
	move.l %d3,%d0
	lsl.l #3,%d0
	move.l %d0,%a2
	add.l %d3,%a2
	add.l %a2,%a2
	add.l %a2,%a2
	add.l #__ZL3map,%a2
	moveq #0,%d2
.L12:
	move.w (%a2)+,%d0
	move.w %d0,__ZL1c
	moveq #60,%d1
	ext.l %d0
	divs.w %d1,%d0
	move.l %d0,%d1
	swap %d1
	move.w %d1,__ZL5tilex
	move.w %d0,__ZL5tiley
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	jsr (%a3)
	move.w %d2,%a0
	addq.w #1,%a0
	move.w %a0,__ZL1x
	addq.l #1,%d2
	addq.l #8,%sp
	moveq #18,%d0
	cmp.l %d2,%d0
	jne .L12
	move.w %d3,%d1
	addq.w #1,%d1
	move.w %d1,__ZL1y
	addq.l #1,%d3
	move.b #10,%d0
	cmp.l %d3,%d0
	jne .L13
	move.l #scrbuf,%d1
	move.l %d1,%a2
.L15:
	move.l #46080,%a1
	add.l %a2,%a1
	move.l %a2,%a0
.L14:
	move.b #-128,(%a0)
	lea (288,%a0),%a0
	cmp.l %a0,%a1
	jne .L14
	lea (16,%a2),%a2
	cmp.l #scrbuf+288,%a2
	jne .L15
	move.w #18,__ZL1x
.L17:
	move.l %d1,%d0
	add.l #288,%d0
	move.l %d1,%a0
.L16:
	move.b #-128,(%a0)+
	cmp.l %a0,%d0
	jne .L16
	add.l #4608,%d1
	cmp.l #scrbuf+46080,%d1
	jne .L17
	move.w #10,__ZL1y
	move.w #288,__ZL1c
	move.w #50,__ZL16ticks_per_second
	tst.w raptor_ntsc_flag
	jeq .L18
	move.w #60,__ZL16ticks_per_second
.L18:
	move.w #100,__ZL8sprite_x
	move.w #80,__ZL8sprite_y
	pea 180.w
	clr.l -(%sp)
	jsr (%a4)
	move.l #.LC2,_js_r_textbuffer
	addq.l #8,%sp
	jsr _rapPrint
	lea _srand,%a2
.L19:
	move.w __ZL1c,%a0
	move.l %a0,-(%sp)
	jsr (%a2)
	add.w #539,__ZL1c
	moveq #1,%d1
	move.l %d1,(%sp)
	jsr jsfGetPad
	move.l %d0,__ZL4pad1
	and.l JAGPAD_A,%d0
	addq.l #4,%sp
	jeq .L19
	jsr __Z3rndv
	move.l %d0,-(%sp)
	jsr ___extendsfdf2
	lea ___muldf3,%a2
	clr.l (%sp)
	move.l #1076101120,-(%sp)
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	jsr (%a2)
	lea (12,%sp),%sp
	clr.l (%sp)
	move.l #1075052544,-(%sp)
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	jsr ___adddf3
	lea (16,%sp),%sp
	move.l %d0,%d2
	move.l %d1,%d3
	lea ___floatsidf,%a5
	move.w __ZL16ticks_per_second,%a1
	move.l %a1,-(%sp)
	jsr (%a5)
	move.l %d1,(%sp)
	move.l %d0,-(%sp)
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	jsr (%a2)
	lea (12,%sp),%sp
	move.l %d1,(%sp)
	move.l %d0,-(%sp)
	move.l #_floor,%d3
	move.l %d3,%a0
	jsr (%a0)
	addq.l #8,%sp
	move.l #___fixdfsi,%d2
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	move.l %d2,%a1
	jsr (%a1)
	addq.l #8,%sp
	move.w %d0,__ZL15countdown_ticks
	move.l #_jsfVsync,%d6
	move.l #ee_printf,%d5
	move.l #___floatsisf,%d4
	move.l #_rapPrint,%d7
.L39:
	clr.l -(%sp)
	move.l %d6,%a0
	jsr (%a0)
	moveq #1,%d0
	move.l %d0,(%sp)
	jsr jsfGetPad
	move.l %d0,__ZL4pad1
	move.l %d0,%d1
	and.l JAGPAD_UP,%d1
	addq.l #4,%sp
	jeq .L21
	move.w __ZL8sprite_y,%d1
	jle .L21
	subq.w #1,%d1
	move.w %d1,__ZL8sprite_y
.L21:
	move.l %d0,%d1
	and.l JAGPAD_DOWN,%d1
	jeq .L22
	move.w __ZL8sprite_y,%d1
	cmp.w #143,%d1
	jgt .L22
	addq.w #1,%d1
	move.w %d1,__ZL8sprite_y
.L22:
	move.l %d0,%d1
	and.l JAGPAD_LEFT,%d1
	jne .L23
	move.w __ZL8sprite_x,%d1
.L24:
	and.l JAGPAD_RIGHT,%d0
	jeq .L25
	cmp.w #271,%d1
	jgt .L25
	addq.w #1,%d1
	move.w %d1,__ZL8sprite_x
.L25:
	move.l sprite,%a0
	swap %d1
	clr.w %d1
	add.l #1048576,%d1
	move.l %d1,384(%a0)
	move.w __ZL8sprite_y,%d0
	ext.l %d0
	swap %d0
	clr.w %d0
	add.l #1048576,%d0
	move.l %d0,388(%a0)
	pea 192.w
	clr.l -(%sp)
	jsr (%a4)
	move.w __ZL8sprite_y,%a2
	move.l %a2,%d0
	addq.l #8,%d0
	jmi .L41
	asr.l #4,%d0
	move.l %d0,-(%sp)
	jsr (%a5)
	move.l %d1,(%sp)
	move.l %d0,-(%sp)
	move.l %d3,%a1
	jsr (%a1)
	addq.l #8,%sp
	move.l %d0,-8(%fp)
	move.l %d1,-4(%fp)
	move.w __ZL8sprite_x,%a3
	move.l %a3,%d0
	addq.l #8,%d0
	jmi .L42
.L27:
	asr.l #4,%d0
	move.l %d0,-(%sp)
	jsr (%a5)
	move.l %d1,(%sp)
	move.l %d0,-(%sp)
	move.l %d3,%a0
	jsr (%a0)
	move.l %d0,-16(%fp)
	move.l %d1,-12(%fp)
	lea (12,%sp),%sp
	move.l -4(%fp),(%sp)
	move.l -8(%fp),-(%sp)
	move.l %d2,%a1
	jsr (%a1)
	addq.l #4,%sp
	move.l %d0,(%sp)
	pea .LC3
	move.l -12(%fp),-(%sp)
	move.l -16(%fp),-(%sp)
	move.l %d2,%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l %d0,(%sp)
	pea .LC4
	move.l %a2,-(%sp)
	pea .LC5
	move.l %a3,-(%sp)
	pea .LC6
	pea .LC7
	move.l %d5,%a1
	jsr (%a1)
	move.l %d0,_js_r_textbuffer
	lea (36,%sp),%sp
	jsr _rapPrint
	pea 180.w
	clr.l -(%sp)
	jsr (%a4)
	move.w __ZL15countdown_ticks,%d0
	addq.l #8,%sp
	jle .L28
.L43:
	move.w %d0,%a0
	move.l %a0,-(%sp)
	move.l %d4,%a1
	jsr (%a1)
	move.l %d0,%a2
	move.w __ZL16ticks_per_second,%a0
	move.l %a0,(%sp)
	move.l %d4,%a1
	jsr (%a1)
	move.l %d0,(%sp)
	move.l %a2,-(%sp)
	jsr ___divsf3
	addq.l #4,%sp
	move.l %d0,(%sp)
	jsr ___extendsfdf2
	move.l %d1,(%sp)
	move.l %d0,-(%sp)
	pea .LC8
	pea .LC9
	jsr ee_printf
	move.l %d0,_js_r_textbuffer
	lea (16,%sp),%sp
	move.l %d7,%a0
	jsr (%a0)
	subq.w #1,__ZL15countdown_ticks
	jra .L39
.L42:
	moveq #23,%d0
	add.l %a3,%d0
	asr.l #4,%d0
	move.l %d0,-(%sp)
	jsr (%a5)
	move.l %d1,(%sp)
	move.l %d0,-(%sp)
	move.l %d3,%a0
	jsr (%a0)
	move.l %d0,-16(%fp)
	move.l %d1,-12(%fp)
	lea (12,%sp),%sp
	move.l -4(%fp),(%sp)
	move.l -8(%fp),-(%sp)
	move.l %d2,%a1
	jsr (%a1)
	addq.l #4,%sp
	move.l %d0,(%sp)
	pea .LC3
	move.l -12(%fp),-(%sp)
	move.l -16(%fp),-(%sp)
	move.l %d2,%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l %d0,(%sp)
	pea .LC4
	move.l %a2,-(%sp)
	pea .LC5
	move.l %a3,-(%sp)
	pea .LC6
	pea .LC7
	move.l %d5,%a1
	jsr (%a1)
	move.l %d0,_js_r_textbuffer
	lea (36,%sp),%sp
	jsr _rapPrint
	pea 180.w
	clr.l -(%sp)
	jsr (%a4)
	move.w __ZL15countdown_ticks,%d0
	addq.l #8,%sp
	jgt .L43
.L28:
	move.l #.LC10,_js_r_textbuffer
	move.l %d7,%a1
	jsr (%a1)
	jra .L39
.L41:
	moveq #23,%d0
	add.l %a2,%d0
	asr.l #4,%d0
	move.l %d0,-(%sp)
	jsr (%a5)
	move.l %d1,(%sp)
	move.l %d0,-(%sp)
	move.l %d3,%a1
	jsr (%a1)
	addq.l #8,%sp
	move.l %d0,-8(%fp)
	move.l %d1,-4(%fp)
	move.w __ZL8sprite_x,%a3
	move.l %a3,%d0
	addq.l #8,%d0
	jpl .L27
	jra .L42
.L23:
	move.w __ZL8sprite_x,%d1
	jle .L24
	subq.w #1,%d1
	move.w %d1,__ZL8sprite_x
	jra .L24
	.globl	sprite
	.data
	.even
sprite:
	.long	RAPTOR_sprite_table
.lcomm __ZL4pad1,4
.lcomm __ZL1y,2
.lcomm __ZL1x,2
.lcomm __ZL3map,360
.lcomm __ZL1c,2
.lcomm __ZL5tilex,2
.lcomm __ZL5tiley,2
.lcomm __ZL16ticks_per_second,2
.lcomm __ZL8sprite_x,2
.lcomm __ZL8sprite_y,2
.lcomm __ZL15countdown_ticks,2
.lcomm __ZZ8drawtilessE1i,2
.lcomm __ZZ8drawtilessE15screen_y_offset,4
.lcomm __ZZ8drawtilessE15screen_x_offset,4
.lcomm __ZZ8drawtilessE14screen_address,4
.lcomm __ZZ8drawtilessE13tile_y_offset,4
.lcomm __ZZ8drawtilessE13tile_x_offset,4
.lcomm __ZZ8drawtilessE12tile_address,4
