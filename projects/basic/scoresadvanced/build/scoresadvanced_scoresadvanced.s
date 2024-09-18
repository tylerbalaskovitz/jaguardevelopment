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
	.even
	.globl	__Z19createDefaultScoresv
__Z19createDefaultScoresv:
	link.w %fp,#0
	movem.l #15392,-(%sp)
	move.l __ZL14highscoreBoard,%d3
	move.l __ZL14highscoreNames,%d2
	move.l __ZL20highscoreBoardNumber,%d4
	moveq #0,%d1
	moveq #0,%d0
	jeq .L25
.L16:
	moveq #1,%d5
	cmp.l %d0,%d5
	jeq .L26
	moveq #2,%d5
	cmp.l %d0,%d5
	jeq .L27
	moveq #3,%d5
	cmp.l %d0,%d5
	jeq .L28
	moveq #4,%d5
	cmp.l %d0,%d5
	jeq .L29
	move.l %d2,%a0
	move.l %d3,%a1
.L17:
	move.l #900,(%a1)
	move.l %a0,%a2
	move.b #74,(%a2)+
	move.b #65,(%a2)
	lea (2,%a0),%a2
	move.b #71,(%a2)
	lea (3,%a0),%a2
	move.b #0,(%a2)
	move.l #800,4(%a1)
	lea (8,%a0),%a2
	move.b #74,(%a2)
	lea (9,%a0),%a2
	move.b #65,(%a2)
	lea (10,%a0),%a2
	move.b #71,(%a2)
	lea (11,%a0),%a2
	move.b #0,(%a2)
	move.l #700,8(%a1)
	lea (16,%a0),%a2
	move.b #74,(%a2)
	lea (17,%a0),%a2
	move.b #65,(%a2)
	lea (18,%a0),%a2
	move.b #71,(%a2)
	lea (19,%a0),%a2
	move.b #0,(%a2)
	move.l #600,12(%a1)
	lea (24,%a0),%a2
	move.b #74,(%a2)
	lea (25,%a0),%a2
	move.b #65,(%a2)
	lea (26,%a0),%a2
	move.b #71,(%a2)
	lea (27,%a0),%a2
	move.b #0,(%a2)
	move.l #500,16(%a1)
	lea (32,%a0),%a2
	move.b #74,(%a2)
	lea (33,%a0),%a2
	move.b #65,(%a2)
	lea (34,%a0),%a2
	move.b #71,(%a2)
	lea (35,%a0),%a2
	move.b #0,(%a2)
	move.l #400,20(%a1)
	lea (40,%a0),%a2
	move.b #74,(%a2)
	lea (41,%a0),%a2
	move.b #65,(%a2)
	lea (42,%a0),%a2
	move.b #71,(%a2)
	lea (43,%a0),%a2
	move.b #0,(%a2)
	move.l #300,24(%a1)
	lea (48,%a0),%a2
	move.b #74,(%a2)
	lea (49,%a0),%a2
	move.b #65,(%a2)
	lea (50,%a0),%a2
	move.b #71,(%a2)
	lea (51,%a0),%a2
	move.b #0,(%a2)
	move.l #200,28(%a1)
	lea (56,%a0),%a2
	move.b #74,(%a2)
	lea (57,%a0),%a2
	move.b #65,(%a2)
	lea (58,%a0),%a2
	move.b #71,(%a2)
	lea (59,%a0),%a2
	move.b #0,(%a2)
	moveq #100,%d0
	move.l %d0,32(%a1)
	lea (64,%a0),%a2
	move.b #74,(%a2)
	lea (65,%a0),%a2
	move.b #65,(%a2)
	lea (66,%a0),%a2
	move.b #71,(%a2)
	lea (67,%a0),%a2
	move.b #0,(%a2)
	clr.l 36(%a1)
	lea (72,%a0),%a1
	move.b #74,(%a1)
	lea (73,%a0),%a1
	move.b #65,(%a1)
	lea (74,%a0),%a1
	move.b #71,(%a1)
	lea (75,%a0),%a0
	move.b #0,(%a0)
	move.l %d1,%d0
	addq.l #1,%d0
	moveq #4,%d1
	cmp.l %d0,%d1
	jlt .L30
.L23:
	move.l %d0,%d1
	jne .L16
.L25:
	move.l #raptor_highscores1_nam,%d2
	move.l %d2,%a0
	moveq #0,%d4
	move.l #raptor_highscores1_hex,%d3
	move.l %d3,%a1
	move.l #900,(%a1)
	move.l %a0,%a2
	move.b #74,(%a2)+
	move.b #65,(%a2)
	lea (2,%a0),%a2
	move.b #71,(%a2)
	lea (3,%a0),%a2
	move.b #0,(%a2)
	move.l #800,4(%a1)
	lea (8,%a0),%a2
	move.b #74,(%a2)
	lea (9,%a0),%a2
	move.b #65,(%a2)
	lea (10,%a0),%a2
	move.b #71,(%a2)
	lea (11,%a0),%a2
	move.b #0,(%a2)
	move.l #700,8(%a1)
	lea (16,%a0),%a2
	move.b #74,(%a2)
	lea (17,%a0),%a2
	move.b #65,(%a2)
	lea (18,%a0),%a2
	move.b #71,(%a2)
	lea (19,%a0),%a2
	move.b #0,(%a2)
	move.l #600,12(%a1)
	lea (24,%a0),%a2
	move.b #74,(%a2)
	lea (25,%a0),%a2
	move.b #65,(%a2)
	lea (26,%a0),%a2
	move.b #71,(%a2)
	lea (27,%a0),%a2
	move.b #0,(%a2)
	move.l #500,16(%a1)
	lea (32,%a0),%a2
	move.b #74,(%a2)
	lea (33,%a0),%a2
	move.b #65,(%a2)
	lea (34,%a0),%a2
	move.b #71,(%a2)
	lea (35,%a0),%a2
	move.b #0,(%a2)
	move.l #400,20(%a1)
	lea (40,%a0),%a2
	move.b #74,(%a2)
	lea (41,%a0),%a2
	move.b #65,(%a2)
	lea (42,%a0),%a2
	move.b #71,(%a2)
	lea (43,%a0),%a2
	move.b #0,(%a2)
	move.l #300,24(%a1)
	lea (48,%a0),%a2
	move.b #74,(%a2)
	lea (49,%a0),%a2
	move.b #65,(%a2)
	lea (50,%a0),%a2
	move.b #71,(%a2)
	lea (51,%a0),%a2
	move.b #0,(%a2)
	move.l #200,28(%a1)
	lea (56,%a0),%a2
	move.b #74,(%a2)
	lea (57,%a0),%a2
	move.b #65,(%a2)
	lea (58,%a0),%a2
	move.b #71,(%a2)
	lea (59,%a0),%a2
	move.b #0,(%a2)
	moveq #100,%d0
	move.l %d0,32(%a1)
	lea (64,%a0),%a2
	move.b #74,(%a2)
	lea (65,%a0),%a2
	move.b #65,(%a2)
	lea (66,%a0),%a2
	move.b #71,(%a2)
	lea (67,%a0),%a2
	move.b #0,(%a2)
	clr.l 36(%a1)
	lea (72,%a0),%a1
	move.b #74,(%a1)
	lea (73,%a0),%a1
	move.b #65,(%a1)
	lea (74,%a0),%a1
	move.b #71,(%a1)
	lea (75,%a0),%a0
	move.b #0,(%a0)
	move.l %d1,%d0
	addq.l #1,%d0
	moveq #4,%d1
	cmp.l %d0,%d1
	jge .L23
.L30:
	move.l %d3,__ZL14highscoreBoard
	move.l %d2,__ZL14highscoreNames
	move.l %d4,__ZL20highscoreBoardNumber
	move.w #10,__ZL1i
	move.l %d0,__ZL12tableCounter
	movem.l (%sp)+,#1084
	unlk %fp
	rts
.L26:
	move.l #raptor_highscores2_nam,%d2
	move.l %d2,%a0
	moveq #1,%d4
	move.l #raptor_highscores2_hex,%d3
	move.l %d3,%a1
	jra .L17
.L29:
	move.l #raptor_highscores5_nam,%d2
	move.l %d2,%a0
	moveq #4,%d4
	move.l #raptor_highscores5_hex,%d3
	move.l %d3,%a1
	jra .L17
.L27:
	move.l #raptor_highscores3_nam,%d2
	move.l %d2,%a0
	moveq #2,%d4
	move.l #raptor_highscores3_hex,%d3
	move.l %d3,%a1
	jra .L17
.L28:
	move.l #raptor_highscores4_nam,%d2
	move.l %d2,%a0
	moveq #3,%d4
	move.l #raptor_highscores4_hex,%d3
	move.l %d3,%a1
	jra .L17
	.even
	.globl	__Z13setScoreboardi
__Z13setScoreboardi:
	link.w %fp,#0
	move.l 8(%fp),%d0
	jeq .L39
	moveq #1,%d1
	cmp.l %d0,%d1
	jeq .L40
	moveq #2,%d1
	cmp.l %d0,%d1
	jeq .L41
	moveq #3,%d1
	cmp.l %d0,%d1
	jeq .L42
	moveq #4,%d1
	cmp.l %d0,%d1
	jeq .L43
	unlk %fp
	rts
.L39:
	move.l #raptor_highscores1_hex,__ZL14highscoreBoard
	move.l #raptor_highscores1_nam,__ZL14highscoreNames
	clr.l __ZL20highscoreBoardNumber
	unlk %fp
	rts
.L40:
	move.l #raptor_highscores2_hex,__ZL14highscoreBoard
	move.l #raptor_highscores2_nam,__ZL14highscoreNames
	move.l %d1,__ZL20highscoreBoardNumber
	unlk %fp
	rts
.L43:
	move.l #raptor_highscores5_hex,__ZL14highscoreBoard
	move.l #raptor_highscores5_nam,__ZL14highscoreNames
	move.l %d1,__ZL20highscoreBoardNumber
	unlk %fp
	rts
.L41:
	move.l #raptor_highscores3_hex,__ZL14highscoreBoard
	move.l #raptor_highscores3_nam,__ZL14highscoreNames
	move.l %d1,__ZL20highscoreBoardNumber
	unlk %fp
	rts
.L42:
	move.l #raptor_highscores4_hex,__ZL14highscoreBoard
	move.l #raptor_highscores4_nam,__ZL14highscoreNames
	move.l %d1,__ZL20highscoreBoardNumber
	unlk %fp
	rts
.LC0:
	.ascii " -\0"
.LC1:
	.ascii " - \0"
.LC2:
	.ascii "#\0"
.LC3:
	.ascii "%s% d%s%s%s% d\0"
	.even
	.globl	__Z17displayScoreboardi
__Z17displayScoreboardi:
	link.w %fp,#0
	movem.l #56,-(%sp)
	move.l 8(%fp),%d0
	jeq .L56
	moveq #1,%d1
	cmp.l %d0,%d1
	jeq .L57
	moveq #2,%d1
	cmp.l %d0,%d1
	jeq .L58
	moveq #3,%d1
	cmp.l %d0,%d1
	jeq .L59
	moveq #4,%d1
	cmp.l %d0,%d1
	jeq .L60
	move.l #__ZL4name,__ZL7dstname
	pea __ZL4name
	addq.l #4,%sp
	clr.w __ZL1i
	clr.w %d0
	lea rapLocate,%a4
	lea ee_printf,%a3
	lea _rapPrint,%a2
.L53:
	ext.l %d0
	lsl.l #3,%d0
	move.l %d0,%a0
	pea 104(%a0)
	clr.l -(%sp)
	jsr (%a4)
	move.w __ZL1i,%d0
	ext.l %d0
	move.l %d0,%d1
	lsl.l #3,%d1
	move.l %d1,%a1
	add.l __ZL14highscoreNames,%a1
	move.l %a1,__ZL7srcname
	move.l (%a1)+,%d1
	move.l __ZL7dstname,%a0
	move.l %d1,(%a0)+
	move.l (%a1),%d1
	move.l %d1,(%a0)
	addq.l #8,%sp
	move.l %d0,%a0
	add.l %d0,%a0
	move.l __ZL14highscoreBoard,%a1
	add.l %a0,%a1
	move.l (%a1,%a0.l),-(%sp)
	pea .LC0
	pea __ZL4name
	pea .LC1
	move.l %d0,-(%sp)
	pea .LC2
	pea .LC3
	jsr (%a3)
	move.l %d0,_js_r_textbuffer
	lea (28,%sp),%sp
	jsr (%a2)
	move.w __ZL1i,%d0
	addq.w #1,%d0
	move.w %d0,__ZL1i
	cmp.w #9,%d0
	jle .L53
	movem.l -12(%fp),#7168
	unlk %fp
	rts
.L56:
	move.l #raptor_highscores1_hex,__ZL14highscoreBoard
	move.l #raptor_highscores1_nam,__ZL14highscoreNames
	clr.l __ZL20highscoreBoardNumber
	move.l #__ZL4name,__ZL7dstname
	pea __ZL4name
	addq.l #4,%sp
	clr.w __ZL1i
	clr.w %d0
	lea rapLocate,%a4
	lea ee_printf,%a3
	lea _rapPrint,%a2
	jra .L53
.L57:
	move.l #raptor_highscores2_hex,__ZL14highscoreBoard
	move.l #raptor_highscores2_nam,__ZL14highscoreNames
	move.l %d1,__ZL20highscoreBoardNumber
	move.l #__ZL4name,__ZL7dstname
	pea __ZL4name
	addq.l #4,%sp
	clr.w __ZL1i
	clr.w %d0
	lea rapLocate,%a4
	lea ee_printf,%a3
	lea _rapPrint,%a2
	jra .L53
.L60:
	move.l #raptor_highscores5_hex,__ZL14highscoreBoard
	move.l #raptor_highscores5_nam,__ZL14highscoreNames
	move.l %d1,__ZL20highscoreBoardNumber
	move.l #__ZL4name,__ZL7dstname
	pea __ZL4name
	addq.l #4,%sp
	clr.w __ZL1i
	clr.w %d0
	lea rapLocate,%a4
	lea ee_printf,%a3
	lea _rapPrint,%a2
	jra .L53
.L58:
	move.l #raptor_highscores3_hex,__ZL14highscoreBoard
	move.l #raptor_highscores3_nam,__ZL14highscoreNames
	move.l %d1,__ZL20highscoreBoardNumber
	move.l #__ZL4name,__ZL7dstname
	pea __ZL4name
	addq.l #4,%sp
	clr.w __ZL1i
	clr.w %d0
	lea rapLocate,%a4
	lea ee_printf,%a3
	lea _rapPrint,%a2
	jra .L53
.L59:
	move.l #raptor_highscores4_hex,__ZL14highscoreBoard
	move.l #raptor_highscores4_nam,__ZL14highscoreNames
	move.l %d1,__ZL20highscoreBoardNumber
	move.l #__ZL4name,__ZL7dstname
	pea __ZL4name
	addq.l #4,%sp
	clr.w __ZL1i
	clr.w %d0
	lea rapLocate,%a4
	lea ee_printf,%a3
	lea _rapPrint,%a2
	jra .L53
.LC4:
	.ascii "No EE detected, so no scores saved!\0"
.LC5:
	.ascii "EEPROM detected, scores saved - \0"
.LC6:
	.ascii "%s% d\0"
.LC7:
	.ascii "EEPROM detected, save fail!\0"
	.even
	.globl	__Z9saveScorePcii
__Z9saveScorePcii:
	link.w %fp,#0
	move.l %d3,-(%sp)
	move.l %d2,-(%sp)
	move.l 8(%fp),%d0
	move.l 12(%fp),%d3
	move.l 16(%fp),%d2
	jeq .L72
	moveq #1,%d1
	cmp.l %d2,%d1
	jeq .L73
	moveq #2,%d1
	cmp.l %d2,%d1
	jeq .L74
	moveq #3,%d1
	cmp.l %d2,%d1
	jeq .L75
	moveq #4,%d1
	cmp.l %d2,%d1
	jeq .L76
.L64:
	move.l %d0,-(%sp)
	pea __ZL4name
	jsr _strcpy
	addq.l #4,%sp
	move.l __ZL20highscoreBoardNumber,(%sp)
	pea __ZL4name
	move.l %d3,-(%sp)
	jsr rapHiscoreCheck
	lea (12,%sp),%sp
	tst.w %d0
	jle .L68
	move.l __ZL20highscoreBoardNumber,-(%sp)
	jsr rapHiscoreSort
	addq.l #4,%sp
.L68:
	pea 192.w
	clr.l -(%sp)
	jsr rapLocate
	addq.l #8,%sp
	tst.l __ZL14eeprom_present
	jne .L77
	pea raptor_highscores1_hex
	clr.l -(%sp)
	jsr jsfEEPROM
	move.l %d0,__ZL14eeprom_present
	addq.l #8,%sp
	jeq .L78
	move.l #.LC7,_js_r_textbuffer
	move.l -8(%fp),%d2
	move.l -4(%fp),%d3
	unlk %fp
	jra _rapPrint
.L72:
	move.l #raptor_highscores1_hex,__ZL14highscoreBoard
	move.l #raptor_highscores1_nam,__ZL14highscoreNames
	clr.l __ZL20highscoreBoardNumber
	jra .L64
.L77:
	move.l #.LC4,_js_r_textbuffer
	move.l -8(%fp),%d2
	move.l -4(%fp),%d3
	unlk %fp
	jra _rapPrint
.L78:
	move.l %d2,-(%sp)
	pea .LC5
	pea .LC6
	jsr ee_printf
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	move.l -8(%fp),%d2
	move.l -4(%fp),%d3
	unlk %fp
	jra _rapPrint
.L73:
	move.l #raptor_highscores2_hex,__ZL14highscoreBoard
	move.l #raptor_highscores2_nam,__ZL14highscoreNames
	move.l %d1,__ZL20highscoreBoardNumber
	jra .L64
.L76:
	move.l #raptor_highscores5_hex,__ZL14highscoreBoard
	move.l #raptor_highscores5_nam,__ZL14highscoreNames
	move.l %d1,__ZL20highscoreBoardNumber
	jra .L64
.L74:
	move.l #raptor_highscores3_hex,__ZL14highscoreBoard
	move.l #raptor_highscores3_nam,__ZL14highscoreNames
	move.l %d1,__ZL20highscoreBoardNumber
	jra .L64
.L75:
	move.l #raptor_highscores4_hex,__ZL14highscoreBoard
	move.l #raptor_highscores4_nam,__ZL14highscoreNames
	move.l %d1,__ZL20highscoreBoardNumber
	jra .L64
.LC8:
	.ascii "Checking for existing scores\0"
.LC9:
	.ascii "Creating Default Scores..\0"
.LC10:
	.ascii "Scores Found\0"
.LC11:
	.ascii "No EE detected!\0"
.LC12:
	.ascii "EEPROM detected!\0"
.LC13:
	.ascii "Player 1\0"
.LC14:
	.ascii " -DPAD LEFT/RIGHT TO VIEW\0"
.LC15:
	.ascii "SCOREBOARD \0"
.LC16:
	.ascii "%s% d%s\0"
	.even
	.globl	__Z9basicmainv
__Z9basicmainv:
	link.w %fp,#0
	movem.l #15420,-(%sp)
	clr.l _jsfFontSize
	moveq #1,%d0
	move.l %d0,_jsfFontIndx
	clr.l __ZL4pad1
	clr.l -(%sp)
	jsr __Z13setScoreboardi
	moveq #16,%d1
	move.l %d1,(%sp)
	pea 16.w
	move.l #rapLocate,%d2
	move.l %d2,%a0
	jsr (%a0)
	move.l #.LC8,_js_r_textbuffer
	addq.l #8,%sp
	lea _rapPrint,%a5
	jsr (%a5)
	clr.l -(%sp)
	lea _jsfVsync,%a2
	jsr (%a2)
	move.l #raptor_highscores1_hex,(%sp)
	pea 1.w
	lea jsfEEPROM,%a4
	jsr (%a4)
	move.l %d0,__ZL14eeprom_present
	addq.l #8,%sp
	moveq #1,%d1
	cmp.l %d0,%d1
	jeq .L91
	pea 32.w
	pea 16.w
	move.l %d2,%a0
	jsr (%a0)
	move.l #.LC10,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a5)
	clr.l -(%sp)
	jsr (%a2)
	addq.l #4,%sp
	lea __Z19createDefaultScoresv,%a3
.L82:
	tst.l __ZL14eeprom_present
	jeq .L83
	pea 48.w
	pea 16.w
	move.l %d2,%a0
	jsr (%a0)
	move.l #.LC11,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a5)
	jsr (%a3)
	clr.l -(%sp)
	pea 111.w
	pea .LC13
	jsr __Z9saveScorePcii
	clr.l __ZL11tickcounter
	clr.l __ZL12tableCounter
	lea (12,%sp),%sp
	pea 210.w
	clr.l -(%sp)
	move.l %d2,%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l #.LC14,(%sp)
	move.l __ZL12tableCounter,-(%sp)
	pea .LC15
	pea .LC16
	move.l #ee_printf,%d3
	move.l %d3,%a0
	jsr (%a0)
	move.l %d0,_js_r_textbuffer
	lea (16,%sp),%sp
	jsr (%a5)
	lea jsfGetPad,%a4
	move.l #jsfDelay,%d5
	move.l #_cls,%d4
	lea __Z17displayScoreboardi,%a3
.L89:
	clr.l -(%sp)
	jsr (%a2)
	moveq #1,%d0
	move.l %d0,(%sp)
	jsr (%a4)
	move.l %d0,__ZL4pad1
	move.l %d0,%d1
	and.l JAGPAD_RIGHT,%d1
	addq.l #4,%sp
	jeq .L85
.L92:
	move.l __ZL12tableCounter,%d0
	addq.l #1,%d0
	move.l %d0,__ZL12tableCounter
	moveq #4,%d1
	cmp.l %d0,%d1
	jge .L88
	clr.l __ZL12tableCounter
.L88:
	pea 20.w
	move.l %d5,%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l %d4,%a0
	jsr (%a0)
	pea 210.w
	clr.l -(%sp)
	move.l %d2,%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l #.LC14,(%sp)
	move.l __ZL12tableCounter,-(%sp)
	pea .LC15
	pea .LC16
	move.l %d3,%a0
	jsr (%a0)
	move.l %d0,_js_r_textbuffer
	lea (16,%sp),%sp
	jsr (%a5)
.L87:
	move.l __ZL12tableCounter,-(%sp)
	jsr (%a3)
	addq.l #4,%sp
	clr.l -(%sp)
	jsr (%a2)
	moveq #1,%d0
	move.l %d0,(%sp)
	jsr (%a4)
	move.l %d0,__ZL4pad1
	move.l %d0,%d1
	and.l JAGPAD_RIGHT,%d1
	addq.l #4,%sp
	jne .L92
.L85:
	and.l JAGPAD_LEFT,%d0
	jeq .L87
	move.l __ZL12tableCounter,%d0
	subq.l #1,%d0
	move.l %d0,__ZL12tableCounter
	jge .L88
	moveq #4,%d0
	move.l %d0,__ZL12tableCounter
	pea 20.w
	move.l %d5,%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l %d4,%a0
	jsr (%a0)
	pea 210.w
	clr.l -(%sp)
	move.l %d2,%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l #.LC14,(%sp)
	move.l __ZL12tableCounter,-(%sp)
	pea .LC15
	pea .LC16
	move.l %d3,%a0
	jsr (%a0)
	move.l %d0,_js_r_textbuffer
	lea (16,%sp),%sp
	jsr (%a5)
	jra .L87
.L83:
	pea 48.w
	pea 16.w
	move.l %d2,%a0
	jsr (%a0)
	move.l #.LC12,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a5)
	clr.l -(%sp)
	pea 111.w
	pea .LC13
	jsr __Z9saveScorePcii
	clr.l __ZL11tickcounter
	clr.l __ZL12tableCounter
	lea (12,%sp),%sp
	pea 210.w
	clr.l -(%sp)
	move.l %d2,%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l #.LC14,(%sp)
	move.l __ZL12tableCounter,-(%sp)
	pea .LC15
	pea .LC16
	move.l #ee_printf,%d3
	move.l %d3,%a0
	jsr (%a0)
	move.l %d0,_js_r_textbuffer
	lea (16,%sp),%sp
	jsr (%a5)
	lea jsfGetPad,%a4
	move.l #jsfDelay,%d5
	move.l #_cls,%d4
	lea __Z17displayScoreboardi,%a3
	jra .L89
.L91:
	pea 32.w
	pea 16.w
	move.l %d2,%a0
	jsr (%a0)
	move.l #.LC9,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a5)
	clr.l -(%sp)
	jsr (%a2)
	lea __Z19createDefaultScoresv,%a3
	jsr (%a3)
	move.l #raptor_highscores1_hex,(%sp)
	clr.l -(%sp)
	jsr (%a4)
	addq.l #4,%sp
	move.l #raptor_highscores1_hex,(%sp)
	pea 1.w
	jsr (%a4)
	move.l %d0,__ZL14eeprom_present
	addq.l #8,%sp
	jra .L82
	.globl	colliders
	.data
	.even
colliders:
	.long	raptor_collisionlist
	.globl	sprite
	.even
sprite:
	.long	RAPTOR_sprite_table
.lcomm __ZL4pad1,4
.lcomm __ZL14eeprom_present,4
.lcomm __ZL11tickcounter,4
.lcomm __ZL12tableCounter,4
.lcomm __ZL1i,2
.lcomm __ZL14highscoreBoard,4
.lcomm __ZL14highscoreNames,4
.lcomm __ZL20highscoreBoardNumber,4
.lcomm __ZL4name,2048
.lcomm __ZL7dstname,4
.lcomm __ZL7srcname,4
