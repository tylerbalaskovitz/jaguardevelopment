#NO_APP
	.text
.LC0:
	.ascii "Please Wait...\0"
	.even
	.globl	__Z9basicmainv
__Z9basicmainv:
	link.w %fp,#-4
	movem.l #14396,-(%sp)
	moveq #64,%d0
	move.l %d0,__ZL1x
	moveq #32,%d1
	move.l %d1,__ZL1y
	clr.l __ZL2x2
	clr.l __ZL2y2
	moveq #16,%d3
	move.l %d3,__ZL5parts
	clr.l __ZL7trigger
	clr.l __ZL7counter
	clr.l __ZL4pad1
	moveq #3,%d4
	move.l %d4,__ZL5speed
	move.b #10,%d0
	move.l %d0,__ZL5curve
	move.b #15,%d1
	move.l %d1,__ZL7initial
	move.b #4,%d3
	move.l %d3,__ZL5decay
	move.b #64,%d4
	move.l %d4,__ZL4life
	move.l %d0,__ZL5sinks
	move.l #0x40490fdb,__ZL3pie
	move.l #0x3c8efa36,__ZL4rads
	move.b #1,%d0
	move.l %d0,_jsfFontIndx
	move.l %d0,_jsfFontSize
	pea 18.w
	pea 16.w
	jsr rapLocate
	move.l #.LC0,_js_r_textbuffer
	addq.l #8,%sp
	jsr _rapPrint
	move.l __ZL4rads,-4(%fp)
	lea __ZL4sinz,%a5
	lea __ZL4sins,%a2
	move.l %a2,%a4
	moveq #0,%d2
	lea ___extendsfdf2,%a3
	move.l #_floor,%d4
	move.l #___fixdfsi,%d3
.L2:
	move.l %d2,-(%sp)
	jsr ___floatsisf
	move.l -4(%fp),(%sp)
	move.l %d0,-(%sp)
	jsr ___mulsf3
	addq.l #4,%sp
	move.l %d0,(%sp)
	jsr (%a3)
	move.l %d1,(%sp)
	move.l %d0,-(%sp)
	jsr _sin
	addq.l #4,%sp
	clr.l (%sp)
	move.l #1077936128,-(%sp)
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	jsr ___muldf3
	lea (12,%sp),%sp
	move.l %d1,(%sp)
	move.l %d0,-(%sp)
	jsr ___truncdfsf2
	addq.l #8,%sp
	move.l %d0,(%a5)+
	move.l %d0,-(%sp)
	jsr (%a3)
	move.l %d1,(%sp)
	move.l %d0,-(%sp)
	move.l %d4,%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l %d1,(%sp)
	move.l %d0,-(%sp)
	move.l %d3,%a0
	jsr (%a0)
	addq.l #8,%sp
	move.l %d0,(%a4)+
	addq.l #1,%d2
	cmp.l #361,%d2
	jne .L2
	move.l __ZL5parts,__ZL9particles+20
	moveq #64,%d0
	move.l %d0,__ZL9particles+24
	moveq #32,%d1
	move.l %d1,__ZL9particles+216
	move.l #128,__ZL9particles+48
	moveq #96,%d3
	move.l %d3,__ZL9particles+240
	move.l #192,__ZL9particles+72
	move.l #160,__ZL9particles+264
	move.l #256,__ZL9particles+96
	move.l #224,__ZL9particles+288
	move.l #320,__ZL9particles+120
	move.l #288,__ZL9particles+312
	move.l #384,__ZL9particles+144
	move.l #352,__ZL9particles+336
	move.l #448,__ZL9particles+168
	move.l #416,__ZL9particles+360
	move.l #512,__ZL9particles+192
	move.l #480,__ZL9particles+384
	move.l __ZL5speed,%d2
	move.l __ZL5curve,%a1
	move.l __ZL7initial,%a0
	move.l __ZL5decay,%d1
	move.l __ZL4life,%d0
	move.l %d2,__ZL9particles+28
	move.l %a1,__ZL9particles+32
	move.l %a0,__ZL9particles+36
	move.l %d1,__ZL9particles+40
	move.l %d0,__ZL9particles+44
	move.l %d2,__ZL9particles+52
	move.l %a1,__ZL9particles+56
	move.l %a0,__ZL9particles+60
	move.l %d1,__ZL9particles+64
	move.l %d0,__ZL9particles+68
	move.l %d2,__ZL9particles+76
	move.l %a1,__ZL9particles+80
	move.l %a0,__ZL9particles+84
	move.l %d1,__ZL9particles+88
	move.l %d0,__ZL9particles+92
	move.l %d2,__ZL9particles+100
	move.l %a1,__ZL9particles+104
	move.l %a0,__ZL9particles+108
	move.l %d1,__ZL9particles+112
	move.l %d0,__ZL9particles+116
	move.l %d2,__ZL9particles+124
	move.l %a1,__ZL9particles+128
	move.l %a0,__ZL9particles+132
	move.l %d1,__ZL9particles+136
	move.l %d0,__ZL9particles+140
	move.l %d2,__ZL9particles+148
	move.l %a1,__ZL9particles+152
	move.l %a0,__ZL9particles+156
	move.l %d1,__ZL9particles+160
	move.l %d0,__ZL9particles+164
	move.l %d2,__ZL9particles+172
	move.l %a1,__ZL9particles+176
	move.l %a0,__ZL9particles+180
	move.l %d1,__ZL9particles+184
	move.l %d0,__ZL9particles+188
	move.l %d2,__ZL9particles+196
	move.l %a1,__ZL9particles+200
	move.l %a0,__ZL9particles+204
	move.l %d1,__ZL9particles+208
	move.l %d0,__ZL9particles+212
	move.l %d2,__ZL9particles+220
	move.l %a1,__ZL9particles+224
	move.l %a0,__ZL9particles+228
	move.l %d1,__ZL9particles+232
	move.l %d0,__ZL9particles+236
	move.l %d2,__ZL9particles+244
	move.l %a1,__ZL9particles+248
	move.l %a0,__ZL9particles+252
	move.l %d1,__ZL9particles+256
	move.l %d0,__ZL9particles+260
	move.l %d2,__ZL9particles+268
	move.l %a1,__ZL9particles+272
	move.l %a0,__ZL9particles+276
	move.l %d1,__ZL9particles+280
	move.l %d0,__ZL9particles+284
	move.l %d2,__ZL9particles+292
	move.l %a1,__ZL9particles+296
	move.l %a0,__ZL9particles+300
	move.l %d1,__ZL9particles+304
	move.l %d0,__ZL9particles+308
	move.l %d2,__ZL9particles+316
	move.l %a1,__ZL9particles+320
	move.l %a0,__ZL9particles+324
	move.l %d1,__ZL9particles+328
	move.l %d0,__ZL9particles+332
	move.l %d2,__ZL9particles+340
	move.l %a1,__ZL9particles+344
	move.l %a0,__ZL9particles+348
	move.l %d1,__ZL9particles+352
	move.l %d0,__ZL9particles+356
	move.l %d2,__ZL9particles+364
	move.l %a1,__ZL9particles+368
	move.l %a0,__ZL9particles+372
	move.l %d1,__ZL9particles+376
	move.l %d0,__ZL9particles+380
	move.l %d2,__ZL9particles+388
	move.l %a1,__ZL9particles+392
	move.l %a0,__ZL9particles+396
	move.l %d1,__ZL9particles+400
	move.l %d0,__ZL9particles+404
	moveq #17,%d4
	move.l %d4,__ZL1i
	jsr _cls
	move.w #-31013,15728728
	pea 16.w
	pea 14.w
	pea SHADOWS_clut
	lea jsfLoadClut,%a3
	jsr (%a3)
	addq.l #8,%sp
	moveq #16,%d0
	move.l %d0,(%sp)
	pea 13.w
	pea SHADOWS2_clut
	jsr (%a3)
	addq.l #8,%sp
	moveq #16,%d1
	move.l %d1,(%sp)
	pea 12.w
	pea LOGO_clut
	jsr (%a3)
	lea (12,%sp),%sp
	lea jsfGetPad,%a3
	lea rapParticleInject,%a5
	lea jsfDelay,%a4
	pea 1.w
	jsr (%a3)
	move.l %d0,__ZL4pad1
	move.l %d0,%d1
	and.l JAGPAD_UP,%d1
	addq.l #4,%sp
	move.l __ZL5speed,%a0
	jeq .L3
.L21:
	moveq #9,%d1
	cmp.l %a0,%d1
	jlt .L3
	addq.l #1,%a0
	move.l %a0,__ZL5speed
.L4:
	move.l %d0,%d1
	and.l JAGPAD_LEFT,%d1
	move.l __ZL5curve,%d2
	tst.l %d1
	jeq .L5
.L22:
	moveq #-9,%d4
	cmp.l %d2,%d4
	jgt .L5
	subq.l #1,%d2
	move.l %d2,__ZL5curve
.L6:
	move.l %d0,%d1
	and.l JAGPAD_1,%d1
	jne .L23
.L26:
	move.l __ZL7initial,%d1
.L7:
	move.l %d0,%d3
	and.l JAGPAD_4,%d3
	jeq .L8
	moveq #1,%d4
	cmp.l %d1,%d4
	jge .L8
	subq.l #1,%d1
	move.l %d1,__ZL7initial
.L8:
	move.l %d0,%d3
	and.l JAGPAD_3,%d3
	move.l __ZL4life,%a1
	jeq .L9
.L24:
	cmp.w #239,%a1
	jgt .L9
	lea (16,%a1),%a1
	move.l %a1,__ZL4life
.L10:
	move.l %d0,%d3
	and.l JAGPAD_2,%d3
	jeq .L11
.L27:
	move.l __ZL5sinks,%d3
	moveq #59,%d4
	cmp.l %d3,%d4
	jlt .L11
	addq.l #1,%d3
	move.l %d3,__ZL5sinks
.L12:
	moveq #16,%d0
	add.l __ZL7counter,%d0
	move.l %d0,__ZL7counter
	cmp.l #359,%d0
	jle .L13
.L28:
	clr.l __ZL7counter
	move.l __ZL4sins,%d3
	move.l %d3,__ZL2x2
	move.l %d3,__ZL2y2
	move.l %d3,%d4
	move.l __ZL5decay,%d0
	move.l %a0,__ZL9particles+28
	move.l %d2,__ZL9particles+32
	move.l %d1,__ZL9particles+36
	move.l %d0,__ZL9particles+40
	move.l %a1,__ZL9particles+44
	move.l %a0,__ZL9particles+52
	move.l %d2,__ZL9particles+56
	move.l %d1,__ZL9particles+60
	move.l %d0,__ZL9particles+64
	move.l %a1,__ZL9particles+68
	move.l %a0,__ZL9particles+76
	move.l %d2,__ZL9particles+80
	move.l %d1,__ZL9particles+84
	move.l %d0,__ZL9particles+88
	move.l %a1,__ZL9particles+92
	move.l %a0,__ZL9particles+100
	move.l %d2,__ZL9particles+104
	move.l %d1,__ZL9particles+108
	move.l %d0,__ZL9particles+112
	move.l %a1,__ZL9particles+116
	move.l %a0,__ZL9particles+124
	move.l %d2,__ZL9particles+128
	move.l %d1,__ZL9particles+132
	move.l %d0,__ZL9particles+136
	move.l %a1,__ZL9particles+140
	move.l %a0,__ZL9particles+148
	move.l %d2,__ZL9particles+152
	move.l %d1,__ZL9particles+156
	move.l %d0,__ZL9particles+160
	move.l %a1,__ZL9particles+164
	move.l %a0,__ZL9particles+172
	move.l %d2,__ZL9particles+176
	move.l %d1,__ZL9particles+180
	move.l %d0,__ZL9particles+184
	move.l %a1,__ZL9particles+188
	move.l %a0,__ZL9particles+196
	move.l %d2,__ZL9particles+200
	move.l %d1,__ZL9particles+204
	move.l %d0,__ZL9particles+208
	move.l %a1,__ZL9particles+212
	move.l %a0,__ZL9particles+220
	move.l %d2,__ZL9particles+224
	move.l %d1,__ZL9particles+228
	move.l %d0,__ZL9particles+232
	move.l %a1,__ZL9particles+236
	move.l %a0,__ZL9particles+244
	move.l %d2,__ZL9particles+248
	move.l %d1,__ZL9particles+252
	move.l %d0,__ZL9particles+256
	move.l %a1,__ZL9particles+260
	move.l %a0,__ZL9particles+268
	move.l %d2,__ZL9particles+272
	move.l %d1,__ZL9particles+276
	move.l %d0,__ZL9particles+280
	move.l %a1,__ZL9particles+284
	move.l %a0,__ZL9particles+292
	move.l %d2,__ZL9particles+296
	move.l %d1,__ZL9particles+300
	move.l %d0,__ZL9particles+304
	move.l %a1,__ZL9particles+308
	move.l %a0,__ZL9particles+316
	move.l %d2,__ZL9particles+320
	move.l %d1,__ZL9particles+324
	move.l %d0,__ZL9particles+328
	move.l %a1,__ZL9particles+332
	move.l %a0,__ZL9particles+340
	move.l %d2,__ZL9particles+344
	move.l %d1,__ZL9particles+348
	move.l %d0,__ZL9particles+352
	move.l %a1,__ZL9particles+356
	move.l %a0,__ZL9particles+364
	move.l %d2,__ZL9particles+368
	move.l %d1,__ZL9particles+372
	move.l %d0,__ZL9particles+376
	move.l %a1,__ZL9particles+380
	move.l %a0,__ZL9particles+388
	move.l %d2,__ZL9particles+392
	move.l %d1,__ZL9particles+396
	move.l %d0,__ZL9particles+400
	move.l %a1,__ZL9particles+404
	moveq #17,%d1
	move.l %d1,__ZL1i
	move.l %d4,%d0
	add.l __ZL1x,%d0
	swap %d0
	clr.w %d0
	move.l %d0,__ZL9particles+12
	add.l __ZL1y,%d3
	swap %d3
	clr.w %d3
	move.l %d3,__ZL9particles+16
	pea __ZL9particles
	jsr (%a5)
	move.l __ZL5sinks,(%sp)
	jsr (%a4)
	addq.l #4,%sp
.L29:
	pea 1.w
	jsr (%a3)
	move.l %d0,__ZL4pad1
	move.l %d0,%d1
	and.l JAGPAD_UP,%d1
	addq.l #4,%sp
	move.l __ZL5speed,%a0
	jne .L21
.L3:
	move.l %d0,%d1
	and.l JAGPAD_DOWN,%d1
	jeq .L4
	moveq #1,%d3
	cmp.l %a0,%d3
	jge .L4
	subq.l #1,%a0
	move.l %a0,__ZL5speed
	move.l %d0,%d1
	and.l JAGPAD_LEFT,%d1
	move.l __ZL5curve,%d2
	tst.l %d1
	jne .L22
.L5:
	move.l %d0,%d1
	and.l JAGPAD_RIGHT,%d1
	jeq .L6
	moveq #9,%d1
	cmp.l %d2,%d1
	jlt .L6
	addq.l #1,%d2
	move.l %d2,__ZL5curve
	move.l %d0,%d1
	and.l JAGPAD_1,%d1
	jeq .L26
.L23:
	move.l __ZL7initial,%d1
	moveq #14,%d3
	cmp.l %d1,%d3
	jlt .L7
	addq.l #1,%d1
	move.l %d1,__ZL7initial
	move.l %d0,%d3
	and.l JAGPAD_3,%d3
	move.l __ZL4life,%a1
	jne .L24
.L9:
	move.l %d0,%d3
	and.l JAGPAD_6,%d3
	jeq .L10
	moveq #32,%d3
	cmp.l %a1,%d3
	jge .L10
	lea (-16,%a1),%a1
	move.l %a1,__ZL4life
	move.l %d0,%d3
	and.l JAGPAD_2,%d3
	jne .L27
.L11:
	and.l JAGPAD_5,%d0
	jeq .L12
	move.l __ZL5sinks,%d0
	moveq #1,%d3
	cmp.l %d0,%d3
	jge .L12
	subq.l #1,%d0
	move.l %d0,__ZL5sinks
	moveq #16,%d0
	add.l __ZL7counter,%d0
	move.l %d0,__ZL7counter
	cmp.l #359,%d0
	jgt .L28
.L13:
	move.l %d0,%d3
	add.l %d0,%d3
	add.l %d3,%d3
	move.l (%a2,%d3.l),%d4
	move.l %d4,__ZL2x2
	move.l %d0,%d3
	jpl .L31
	addq.l #1,%d3
.L31:
	moveq #-2,%d0
	and.l %d0,%d3
	add.l %d3,%d3
	move.l (%a2,%d3.l),%d3
	move.l %d3,__ZL2y2
	move.l __ZL5decay,%d0
	move.l %a0,__ZL9particles+28
	move.l %d2,__ZL9particles+32
	move.l %d1,__ZL9particles+36
	move.l %d0,__ZL9particles+40
	move.l %a1,__ZL9particles+44
	move.l %a0,__ZL9particles+52
	move.l %d2,__ZL9particles+56
	move.l %d1,__ZL9particles+60
	move.l %d0,__ZL9particles+64
	move.l %a1,__ZL9particles+68
	move.l %a0,__ZL9particles+76
	move.l %d2,__ZL9particles+80
	move.l %d1,__ZL9particles+84
	move.l %d0,__ZL9particles+88
	move.l %a1,__ZL9particles+92
	move.l %a0,__ZL9particles+100
	move.l %d2,__ZL9particles+104
	move.l %d1,__ZL9particles+108
	move.l %d0,__ZL9particles+112
	move.l %a1,__ZL9particles+116
	move.l %a0,__ZL9particles+124
	move.l %d2,__ZL9particles+128
	move.l %d1,__ZL9particles+132
	move.l %d0,__ZL9particles+136
	move.l %a1,__ZL9particles+140
	move.l %a0,__ZL9particles+148
	move.l %d2,__ZL9particles+152
	move.l %d1,__ZL9particles+156
	move.l %d0,__ZL9particles+160
	move.l %a1,__ZL9particles+164
	move.l %a0,__ZL9particles+172
	move.l %d2,__ZL9particles+176
	move.l %d1,__ZL9particles+180
	move.l %d0,__ZL9particles+184
	move.l %a1,__ZL9particles+188
	move.l %a0,__ZL9particles+196
	move.l %d2,__ZL9particles+200
	move.l %d1,__ZL9particles+204
	move.l %d0,__ZL9particles+208
	move.l %a1,__ZL9particles+212
	move.l %a0,__ZL9particles+220
	move.l %d2,__ZL9particles+224
	move.l %d1,__ZL9particles+228
	move.l %d0,__ZL9particles+232
	move.l %a1,__ZL9particles+236
	move.l %a0,__ZL9particles+244
	move.l %d2,__ZL9particles+248
	move.l %d1,__ZL9particles+252
	move.l %d0,__ZL9particles+256
	move.l %a1,__ZL9particles+260
	move.l %a0,__ZL9particles+268
	move.l %d2,__ZL9particles+272
	move.l %d1,__ZL9particles+276
	move.l %d0,__ZL9particles+280
	move.l %a1,__ZL9particles+284
	move.l %a0,__ZL9particles+292
	move.l %d2,__ZL9particles+296
	move.l %d1,__ZL9particles+300
	move.l %d0,__ZL9particles+304
	move.l %a1,__ZL9particles+308
	move.l %a0,__ZL9particles+316
	move.l %d2,__ZL9particles+320
	move.l %d1,__ZL9particles+324
	move.l %d0,__ZL9particles+328
	move.l %a1,__ZL9particles+332
	move.l %a0,__ZL9particles+340
	move.l %d2,__ZL9particles+344
	move.l %d1,__ZL9particles+348
	move.l %d0,__ZL9particles+352
	move.l %a1,__ZL9particles+356
	move.l %a0,__ZL9particles+364
	move.l %d2,__ZL9particles+368
	move.l %d1,__ZL9particles+372
	move.l %d0,__ZL9particles+376
	move.l %a1,__ZL9particles+380
	move.l %a0,__ZL9particles+388
	move.l %d2,__ZL9particles+392
	move.l %d1,__ZL9particles+396
	move.l %d0,__ZL9particles+400
	move.l %a1,__ZL9particles+404
	moveq #17,%d1
	move.l %d1,__ZL1i
	move.l %d4,%d0
	add.l __ZL1x,%d0
	swap %d0
	clr.w %d0
	move.l %d0,__ZL9particles+12
	add.l __ZL1y,%d3
	swap %d3
	clr.w %d3
	move.l %d3,__ZL9particles+16
	pea __ZL9particles
	jsr (%a5)
	move.l __ZL5sinks,(%sp)
	jsr (%a4)
	addq.l #4,%sp
	jra .L29
	.globl	colliders
	.data
	.even
colliders:
	.long	raptor_collisionlist
	.globl	sprite
	.even
sprite:
	.long	RAPTOR_sprite_table
.lcomm __ZL1x,4
.lcomm __ZL1y,4
.lcomm __ZL2x2,4
.lcomm __ZL2y2,4
.lcomm __ZL5parts,4
.lcomm __ZL7trigger,4
.lcomm __ZL7counter,4
.lcomm __ZL4pad1,4
.lcomm __ZL5speed,4
.lcomm __ZL5curve,4
.lcomm __ZL7initial,4
.lcomm __ZL5decay,4
.lcomm __ZL4life,4
.lcomm __ZL5sinks,4
.lcomm __ZL3pie,4
.lcomm __ZL4rads,4
.lcomm __ZL1i,4
.lcomm __ZL4sinz,1440
.lcomm __ZL4sins,1440
.lcomm __ZL9particles,408
