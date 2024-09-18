#NO_APP
	.text
	.even
	.globl	__Z6midstrPciiS_
__Z6midstrPciiS_:
	link.w %fp,#0
	movem.l #15408,-(%sp)
	move.l 8(%fp),%a2
	move.l 12(%fp),%d2
	move.l 16(%fp),%d3
	move.l 20(%fp),%d5
	move.l %a2,-(%sp)
	lea _strlen,%a3
	jsr (%a3)
	addq.l #4,%sp
	move.l %d0,%d4
	cmp.l %d0,%d2
	jle .L12
.L1:
	movem.l -24(%fp),#3132
	unlk %fp
	rts
.L12:
	tst.l %d2
	jle .L1
	move.l %d5,-(%sp)
	jsr (%a3)
	addq.l #4,%sp
	cmp.l %d0,%d3
	jle .L13
	move.l %d0,%d3
.L4:
	addq.l #1,%d4
	move.l %d2,%d0
	add.l %d3,%d0
	cmp.l %d4,%d0
	jle .L5
	move.l %d4,%d3
	sub.l %d2,%d3
.L5:
	move.l %d3,16(%fp)
	move.l %d5,12(%fp)
	lea -1(%a2,%d2.l),%a2
	move.l %a2,8(%fp)
	movem.l -24(%fp),#3132
	unlk %fp
	jra _memcpy
.L13:
	moveq #-1,%d1
	cmp.l %d3,%d1
	jne .L4
	move.l %d0,%d3
	jra .L4
.LC0:
	.ascii "No MT/EE detected!\0"
.LC1:
	.ascii "EEPROM detected!\0"
.LC2:
	.ascii "MT detected!\0"
.LC3:
	.ascii "Saved value:\0"
.LC4:
	.ascii "%s% d\0"
.LC5:
	.ascii "Initial table:\0"
.LC6:
	.ascii "\0"
.LC7:
	.ascii " -\0"
.LC8:
	.ascii " - \0"
.LC9:
	.ascii "#\0"
.LC10:
	.ascii "%s% d%s%s%s% d\0"
.LC11:
	.ascii "After a highscore of 432 points:\0"
.LC12:
	.ascii "No MT/EE detected, so no scores saved!\0"
.LC13:
	.ascii "EEPROM detected, scores saved!\0"
.LC14:
	.ascii "EEPROM detected, save fail!\0"
.LC15:
	.ascii "Memory Track detected, scores saved!\0"
	.even
	.globl	__Z9basicmainv
__Z9basicmainv:
	link.w %fp,#0
	movem.l #12348,-(%sp)
	clr.l _jsfFontSize
	moveq #1,%d0
	move.l %d0,_jsfFontIndx
	jsr RAPTOR_mt_init
	tst.l raptor_mt_present
	jlt .L33
	clr.l -(%sp)
	pea 160.w
	lea rapLocate,%a2
	jsr (%a2)
	move.l #.LC2,_js_r_textbuffer
	addq.l #8,%sp
	lea _rapPrint,%a3
	jsr (%a3)
	pea 200.w
	clr.l -(%sp)
	jsr (%a2)
	moveq #1,%d1
	move.l %d1,_jsfFontIndx
	addq.l #4,%sp
	move.l raptor_highscores1_hex+124,(%sp)
	pea .LC3
	pea .LC4
	lea ee_printf,%a4
	jsr (%a4)
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	jsr (%a3)
	move.l #123456789,raptor_highscores1_hex+124
	lea jsfEEPROM,%a5
	clr.l -(%sp)
	clr.l -(%sp)
	jsr (%a2)
	move.l #.LC5,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a3)
	clr.l _jsfFontIndx
	move.l #__ZL4name,__ZL7dstname
	pea .LC6
	pea 1.w
	pea 9.w
	pea __ZL4name
	jsr __Z6midstrPciiS_
	clr.w __ZL1i
	lea (16,%sp),%sp
	clr.w %d0
	move.l #raptor_highscores1_hex,%d3
.L20:
	ext.l %d0
	lsl.l #3,%d0
	move.l %d0,%a0
	pea 8(%a0)
	clr.l -(%sp)
	jsr (%a2)
	move.w __ZL1i,%d1
	ext.l %d1
	moveq #9,%d0
	sub.l %d1,%d0
	move.l %d0,%d2
	lsl.l #3,%d2
	move.l %d2,%a1
	add.l #raptor_highscores1_nam,%a1
	move.l %a1,__ZL7srcname
	move.l (%a1)+,%d2
	move.l __ZL7dstname,%a0
	move.l %d2,(%a0)+
	move.l (%a1),%a1
	move.l %a1,(%a0)
	addq.l #8,%sp
	add.l %d0,%d0
	add.l %d0,%d0
	move.l %d3,%a0
	move.l (%a0,%d0.l),-(%sp)
	pea .LC7
	pea __ZL4name
	pea .LC8
	move.l %d1,-(%sp)
	pea .LC9
	pea .LC10
	jsr (%a4)
	move.l %d0,_js_r_textbuffer
	lea (28,%sp),%sp
	jsr (%a3)
	move.w __ZL1i,%d0
	addq.w #1,%d0
	move.w %d0,__ZL1i
	cmp.w #9,%d0
	jle .L20
	moveq #1,%d0
	move.l %d0,_jsfFontIndx
	pea 96.w
	clr.l -(%sp)
	jsr rapLocate
	move.l #.LC11,_js_r_textbuffer
	addq.l #8,%sp
	jsr _rapPrint
	clr.l _jsfFontIndx
	move.b #73,__ZL4name
	move.b #32,__ZL4name+1
	move.b #87,__ZL4name+2
	move.b #79,__ZL4name+3
	move.b #78,__ZL4name+4
	move.b #33,__ZL4name+5
	move.b #33,__ZL4name+6
	move.b #33,__ZL4name+7
	clr.b __ZL4name+8
	clr.l -(%sp)
	pea __ZL4name
	pea 432.w
	jsr rapHiscoreCheck
	lea (12,%sp),%sp
	tst.w %d0
	jgt .L34
	clr.w __ZL1i
	clr.w %d0
.L23:
	ext.l %d0
	lsl.l #3,%d0
	move.l %d0,%a0
	pea 104(%a0)
	clr.l -(%sp)
	jsr (%a2)
	move.w __ZL1i,%d1
	ext.l %d1
	moveq #9,%d0
	sub.l %d1,%d0
	move.l %d0,%d2
	lsl.l #3,%d2
	move.l %d2,%a1
	add.l #raptor_highscores1_nam,%a1
	move.l %a1,__ZL7srcname
	move.l (%a1)+,%d2
	move.l __ZL7dstname,%a0
	move.l %d2,(%a0)+
	move.l (%a1),%a1
	move.l %a1,(%a0)
	addq.l #8,%sp
	add.l %d0,%d0
	add.l %d0,%d0
	move.l %d3,%a0
	move.l (%a0,%d0.l),-(%sp)
	pea .LC7
	pea __ZL4name
	pea .LC8
	move.l %d1,-(%sp)
	pea .LC9
	pea .LC10
	jsr (%a4)
	move.l %d0,_js_r_textbuffer
	lea (28,%sp),%sp
	move.l #_rapPrint,%d2
	jsr (%a3)
	move.w __ZL1i,%d0
	addq.w #1,%d0
	move.w %d0,__ZL1i
	cmp.w #9,%d0
	jle .L23
	moveq #1,%d0
	move.l %d0,_jsfFontIndx
	pea 192.w
	clr.l -(%sp)
	jsr rapLocate
	addq.l #8,%sp
	tst.l raptor_mt_present
	jlt .L35
	jsr RAPTOR_mt_save
	move.l #.LC15,_js_r_textbuffer
	move.l %d2,%a0
	jsr (%a0)
	lea _jsfVsync,%a2
.L31:
	clr.l -(%sp)
	jsr (%a2)
	addq.l #4,%sp
	clr.l -(%sp)
	jsr (%a2)
	addq.l #4,%sp
	jra .L31
.L34:
	clr.l -(%sp)
	jsr rapHiscoreSort
	clr.w __ZL1i
	addq.l #4,%sp
	clr.w %d0
	jra .L23
.L35:
	tst.l __ZL14eeprom_present
	jeq .L25
	move.l #.LC12,_js_r_textbuffer
	move.l %d2,%a0
	jsr (%a0)
	lea _jsfVsync,%a2
	jra .L31
.L33:
	pea raptor_highscores1_hex
	pea 1.w
	lea jsfEEPROM,%a5
	jsr (%a5)
	move.l %d0,__ZL14eeprom_present
	addq.l #8,%sp
	moveq #1,%d1
	cmp.l %d0,%d1
	jne .L17
	move.l #900,raptor_highscores1_hex
	move.l #800,raptor_highscores1_hex+4
	move.l #700,raptor_highscores1_hex+8
	move.l #600,raptor_highscores1_hex+12
	move.l #500,raptor_highscores1_hex+16
	move.l #400,raptor_highscores1_hex+20
	move.l #300,raptor_highscores1_hex+24
	move.l #200,raptor_highscores1_hex+28
	moveq #100,%d0
	move.l %d0,raptor_highscores1_hex+32
	clr.l raptor_highscores1_hex+36
	move.w #10,__ZL1i
	pea raptor_highscores1_hex
	clr.l -(%sp)
	jsr (%a5)
	addq.l #4,%sp
	move.l #raptor_highscores1_hex,(%sp)
	pea 1.w
	jsr (%a5)
	move.l %d0,__ZL14eeprom_present
	addq.l #8,%sp
.L17:
	tst.l __ZL14eeprom_present
	jeq .L18
	clr.l -(%sp)
	pea 160.w
	lea rapLocate,%a2
	jsr (%a2)
	move.l #.LC0,_js_r_textbuffer
	addq.l #8,%sp
	lea _rapPrint,%a3
	jsr (%a3)
	move.l #900,raptor_highscores1_hex
	move.l #800,raptor_highscores1_hex+4
	move.l #700,raptor_highscores1_hex+8
	move.l #600,raptor_highscores1_hex+12
	move.l #500,raptor_highscores1_hex+16
	move.l #400,raptor_highscores1_hex+20
	move.l #300,raptor_highscores1_hex+24
	move.l #200,raptor_highscores1_hex+28
	moveq #100,%d1
	move.l %d1,raptor_highscores1_hex+32
	clr.l raptor_highscores1_hex+36
	move.w #10,__ZL1i
	lea ee_printf,%a4
	clr.l -(%sp)
	clr.l -(%sp)
	jsr (%a2)
	move.l #.LC5,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a3)
	clr.l _jsfFontIndx
	move.l #__ZL4name,__ZL7dstname
	pea .LC6
	pea 1.w
	pea 9.w
	pea __ZL4name
	jsr __Z6midstrPciiS_
	clr.w __ZL1i
	lea (16,%sp),%sp
	clr.w %d0
	move.l #raptor_highscores1_hex,%d3
	jra .L20
.L25:
	pea raptor_highscores1_hex
	clr.l -(%sp)
	jsr (%a5)
	move.l %d0,__ZL14eeprom_present
	addq.l #8,%sp
	jne .L27
	move.l #.LC13,_js_r_textbuffer
	move.l %d2,%a0
	jsr (%a0)
	lea _jsfVsync,%a2
	jra .L31
.L18:
	clr.l -(%sp)
	pea 160.w
	lea rapLocate,%a2
	jsr (%a2)
	move.l #.LC1,_js_r_textbuffer
	addq.l #8,%sp
	lea _rapPrint,%a3
	jsr (%a3)
	pea 200.w
	clr.l -(%sp)
	jsr (%a2)
	moveq #1,%d0
	move.l %d0,_jsfFontIndx
	addq.l #8,%sp
	lea ee_printf,%a4
	clr.l -(%sp)
	clr.l -(%sp)
	jsr (%a2)
	move.l #.LC5,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a3)
	clr.l _jsfFontIndx
	move.l #__ZL4name,__ZL7dstname
	pea .LC6
	pea 1.w
	pea 9.w
	pea __ZL4name
	jsr __Z6midstrPciiS_
	clr.w __ZL1i
	lea (16,%sp),%sp
	clr.w %d0
	move.l #raptor_highscores1_hex,%d3
	jra .L20
.L27:
	move.l #.LC14,_js_r_textbuffer
	move.l %d2,%a0
	jsr (%a0)
	lea _jsfVsync,%a2
	jra .L31
	.globl	colliders
	.data
	.even
colliders:
	.long	raptor_collisionlist
	.globl	sprite
	.even
sprite:
	.long	RAPTOR_sprite_table
.lcomm __ZL14eeprom_present,4
.lcomm __ZL1i,2
.lcomm __ZL4name,2048
.lcomm __ZL7dstname,4
.lcomm __ZL7srcname,4
