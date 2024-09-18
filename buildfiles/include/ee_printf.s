#NO_APP
	.text
.LC0:
	.ascii "0123456789abcdefghijklmnopqrstuvwxyz\0"
.LC1:
	.ascii "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ\0"
	.even
__ZL6numberPcliiii:
	link.w %fp,#-84
	movem.l #16188,-(%sp)
	move.l 8(%fp),%d6
	move.l 12(%fp),%d2
	move.l 16(%fp),%d4
	lea .LC0,%a4
	btst #6,31(%fp)
	jeq .L2
	lea .LC1,%a4
.L2:
	btst #4,31(%fp)
	jeq .L3
	moveq #-2,%d0
	and.l %d0,28(%fp)
.L3:
	move.l %d4,%d0
	subq.l #2,%d0
	moveq #34,%d1
	cmp.l %d0,%d1
	jcs .L55
	btst #0,31(%fp)
	jeq .L56
	moveq #48,%d7
	btst #1,31(%fp)
	jeq .L58
.L94:
	tst.l %d2
	jlt .L88
	btst #2,31(%fp)
	jne .L89
	btst #3,31(%fp)
	jeq .L58
	subq.l #1,20(%fp)
	move.b #32,-79(%fp)
.L6:
	moveq #32,%d5
	and.l 28(%fp),%d5
	move.l %d5,-78(%fp)
	jeq .L9
	moveq #16,%d0
	cmp.l %d4,%d0
	jeq .L90
	moveq #8,%d1
	cmp.l %d4,%d1
	jeq .L91
.L9:
	tst.l %d2
	jne .L11
	move.b #48,-66(%fp)
	moveq #0,%d5
	moveq #1,%d3
	lea (-66,%fp),%a2
.L12:
	move.l %d3,%a1
	cmp.l 24(%fp),%d3
	jge .L14
	move.l 24(%fp),%a1
.L14:
	move.l 20(%fp),%d2
	sub.l %a1,%d2
	moveq #17,%d0
	and.l 28(%fp),%d0
	jne .L15
	move.l %d2,%d0
	subq.l #1,%d0
	move.l %d0,-84(%fp)
	tst.l %d2
	jle .L59
	move.l %d2,-74(%fp)
	move.l %d6,%a4
	move.l %d6,%d1
	neg.l %d1
	moveq #3,%d0
	and.l %d0,%d1
	move.l %d2,%a3
	cmp.l %d2,%d1
	jcc .L16
	move.l %d1,%a3
.L16:
	cmp.w #0,%a3
	jeq .L60
	moveq #0,%d1
	move.l -84(%fp),%d0
.L18:
	move.l %a4,%a0
	move.b #32,(%a0)+
	move.l %a0,%a4
	subq.l #1,%d0
	addq.l #1,%d1
	cmp.l %a3,%d1
	jcs .L18
	move.l %d0,-84(%fp)
	cmp.l %d2,%a3
	jeq .L19
.L17:
	move.l %d2,%a5
	sub.l %a3,%a5
	move.l %a5,%d1
	lsr.l #2,%d1
	move.l %d1,-70(%fp)
	move.l %a5,%d2
	moveq #-4,%d0
	and.l %d0,%d2
	move.l %d2,%a4
	jeq .L83
	move.l %d1,%d2
	lea (%a3,%d6.l),%a3
	moveq #0,%d1
	move.l -84(%fp),%d0
.L21:
	move.l #538976288,(%a3)+
	addq.l #1,%d1
	cmp.l %d1,%d2
	jhi .L21
	move.l %d0,-84(%fp)
	add.l %a4,%a0
	move.l %a4,%d1
	sub.l %d1,-84(%fp)
	cmp.l %a5,%a4
	jeq .L19
.L83:
	move.l -84(%fp),%d0
.L68:
	move.b #32,(%a0)+
	subq.l #1,%d0
	move.l %d0,%d1
	addq.l #1,%d1
	tst.l %d1
	jgt .L68
.L19:
	moveq #-1,%d2
	add.l -74(%fp),%d6
.L15:
	tst.b -79(%fp)
	jeq .L24
	move.l %d6,%a0
	addq.l #1,%d6
	move.b -79(%fp),(%a0)+
.L24:
	tst.l -78(%fp)
	jeq .L25
	moveq #8,%d0
	cmp.l %d4,%d0
	jeq .L92
	moveq #16,%d0
	cmp.l %d4,%d0
	jeq .L93
.L25:
	btst #4,31(%fp)
	jne .L27
	move.l %d2,%d0
	subq.l #1,%d0
	move.l %d0,-78(%fp)
	tst.l %d2
	jle .L61
	move.l %d6,%a3
	move.l %d6,%d1
	neg.l %d1
	moveq #3,%d4
	and.l %d4,%d1
	cmp.l %d1,%d2
	jcc .L28
	move.l %d2,%d1
.L28:
	tst.l %d1
	jeq .L62
	moveq #0,%d4
	move.l -78(%fp),%d0
.L30:
	move.l %a3,%a0
	move.b %d7,(%a0)+
	move.l %a0,%a3
	subq.l #1,%d0
	addq.l #1,%d4
	cmp.l %d1,%d4
	jcs .L30
	move.l %d0,-78(%fp)
	cmp.l %d2,%d1
	jeq .L31
.L29:
	move.l %d2,%d0
	sub.l %d1,%d0
	move.l %d0,-70(%fp)
	lsr.l #2,%d0
	move.l %d0,%a4
	moveq #-4,%d4
	and.l -70(%fp),%d4
	move.l %d4,%a5
	jeq .L84
	moveq #0,%d0
	move.b %d7,%d0
	move.l %d0,%a3
	swap %d0
	clr.w %d0
	move.l %d0,-74(%fp)
	move.l %a3,%d4
	lsl.w #8,%d4
	swap %d4
	clr.w %d4
	move.l %a3,%d0
	lsl.l #8,%d0
	or.l -74(%fp),%d4
	or.l %d0,%d4
	move.b %d7,%d4
	move.l %d6,%a3
	add.l %d1,%a3
	moveq #0,%d1
	move.l -78(%fp),%d0
.L33:
	move.l %d4,(%a3)+
	addq.l #1,%d1
	cmp.l %d1,%a4
	jhi .L33
	move.l %d0,-78(%fp)
	add.l %a5,%a0
	move.l %a5,%d1
	sub.l %d1,-78(%fp)
	cmp.l -70(%fp),%a5
	jeq .L31
.L84:
	move.l -78(%fp),%d0
.L67:
	move.b %d7,(%a0)+
	subq.l #1,%d0
	move.l %d0,%d1
	addq.l #1,%d1
	tst.l %d1
	jgt .L67
.L31:
	add.l %d2,%d6
	moveq #-1,%d2
.L27:
	cmp.l %a1,%d3
	jge .L36
	move.l %a1,%d0
	subq.l #1,%d0
	sub.l %d3,%a1
	move.l %d6,%d4
	move.l %d6,%d7
	neg.l %d7
	moveq #3,%d1
	and.l %d1,%d7
	cmp.l %d7,%a1
	jcc .L37
	move.l %a1,%d7
.L37:
	tst.l %d7
	jeq .L63
	moveq #0,%d1
.L39:
	move.l %d4,%a0
	move.b #48,(%a0)+
	move.l %a0,%d4
	subq.l #1,%d0
	addq.l #1,%d1
	cmp.l %d7,%d1
	jcs .L39
	cmp.l %a1,%d7
	jeq .L40
.L38:
	move.l %a1,%a5
	sub.l %d7,%a5
	move.l %a5,%d4
	lsr.l #2,%d4
	move.l %d4,-70(%fp)
	move.l %a5,%d1
	moveq #-4,%d4
	and.l %d4,%d1
	move.l %d1,%a4
	jeq .L66
	move.l %d6,%a3
	add.l %d7,%a3
	moveq #0,%d1
	move.l -70(%fp),%d4
.L42:
	move.l #808464432,(%a3)+
	addq.l #1,%d1
	cmp.l %d1,%d4
	jhi .L42
	add.l %a4,%a0
	sub.l %a4,%d0
	cmp.l %a5,%a4
	jeq .L40
.L66:
	move.b #48,(%a0)+
	subq.l #1,%d0
	move.l %d0,%d1
	addq.l #1,%d1
	cmp.l %d3,%d1
	jgt .L66
.L40:
	add.l %a1,%d6
.L36:
	lea 1(%a2,%d5.l),%a0
	move.l %d6,%a1
.L45:
	move.b -(%a0),(%a1)+
	move.l %a0,%a3
	sub.l %a2,%a3
	cmp.w #0,%a3
	jgt .L45
	move.l %d5,%d0
	not.l %d0
	add.l %d0,%d0
	subx.l %d0,%d0
	and.l %d0,%d5
	move.l %d6,%a0
	lea 1(%a0,%d5.l),%a0
	move.l %a0,%d0
	tst.l %d2
	jle .L4
	move.l %d2,%d1
	subq.l #1,%d1
	move.l %a0,%d3
	move.l %a0,%d4
	neg.l %d4
	moveq #3,%d5
	and.l %d5,%d4
	cmp.l %d4,%d2
	jcc .L47
	move.l %d2,%d4
.L47:
	tst.l %d4
	jeq .L64
	sub.l %a1,%a1
.L49:
	move.l %d3,%a0
	move.b #32,(%a0)+
	move.l %a0,%d3
	subq.l #1,%d1
	addq.l #1,%a1
	cmp.l %d4,%a1
	jcs .L49
	cmp.l %d2,%d4
	jeq .L50
.L48:
	move.l %d2,%d6
	sub.l %d4,%d6
	move.l %d6,%d3
	lsr.l #2,%d3
	moveq #-4,%d5
	and.l %d6,%d5
	jeq .L65
	move.l %d0,%a2
	add.l %d4,%a2
	sub.l %a1,%a1
.L52:
	move.l #538976288,(%a2)+
	addq.l #1,%a1
	cmp.l %a1,%d3
	jhi .L52
	add.l %d5,%a0
	sub.l %d5,%d1
	cmp.l %d6,%d5
	jeq .L50
.L65:
	move.b #32,(%a0)+
	subq.l #1,%d1
	move.l %d1,%a1
	addq.l #1,%a1
	cmp.w #0,%a1
	jgt .L65
.L50:
	add.l %d2,%d0
.L4:
	movem.l -124(%fp),#15612
	unlk %fp
	rts
.L56:
	moveq #32,%d7
	btst #1,31(%fp)
	jne .L94
.L58:
	clr.b -79(%fp)
	jra .L6
.L11:
	lea (-66,%fp),%a2
	move.l %a2,%a3
	moveq #0,%d3
	move.l #___umodsi3,%d5
	lea ___udivsi3,%a5
.L13:
	move.l %d4,-(%sp)
	move.l %d2,-(%sp)
	move.l %d5,%a0
	jsr (%a0)
	addq.l #8,%sp
	move.b (%a4,%d0.l),(%a3)+
	addq.l #1,%d3
	move.l %d4,-(%sp)
	move.l %d2,-(%sp)
	jsr (%a5)
	addq.l #8,%sp
	move.l %d0,%d2
	jne .L13
	move.l %d3,%d5
	subq.l #1,%d5
	jra .L12
.L89:
	subq.l #1,20(%fp)
	move.b #43,-79(%fp)
	jra .L6
.L93:
	move.l %d6,%a0
	move.b #48,(%a0)
	move.b #120,1(%a0)
	addq.l #2,%d6
	jra .L25
.L91:
	subq.l #1,20(%fp)
	jra .L9
.L92:
	move.l %d6,%a0
	addq.l #1,%d6
	move.b #48,(%a0)+
	jra .L25
.L90:
	subq.l #2,20(%fp)
	jra .L9
.L88:
	neg.l %d2
	subq.l #1,20(%fp)
	move.b #45,-79(%fp)
	jra .L6
.L55:
	moveq #0,%d0
	movem.l -124(%fp),#15612
	unlk %fp
	rts
.L61:
	move.l %d0,%d2
	jra .L27
.L59:
	move.l %d0,%d2
	jra .L15
.L63:
	move.l %d6,%a0
	jra .L38
.L62:
	move.l %d6,%a0
	jra .L29
.L64:
	move.l %d0,%a0
	jra .L48
.L60:
	move.l %d6,%a0
	jra .L17
.LC2:
	.ascii "<NULL>\0"
	.even
__ZL11ee_vsprintfPcPKcPv:
	link.w %fp,#-64
	movem.l #16188,-(%sp)
	move.l 12(%fp),%a2
	move.l 16(%fp),%a0
	move.b (%a2),%d1
	move.l 8(%fp),%a4
	jeq .L269
	move.l #.LC0,%d3
	move.l #___modsi3,%d2
	move.l #___floatsisf,%d4
	lea (-24,%fp),%a1
	move.l %a1,-28(%fp)
.L267:
	cmp.b #37,%d1
	jeq .L369
.L262:
	move.b %d1,(%a4)+
	move.b 1(%a2),%d1
	addq.l #1,%a2
	jne .L267
.L263:
	move.l %a4,%d0
	sub.l 8(%fp),%d0
.L97:
	clr.b (%a4)
	movem.l -104(%fp),#15612
	unlk %fp
	rts
.L369:
	lea (1,%a2),%a1
	move.l %a1,%a3
	moveq #0,%d6
	move.b (%a3)+,%d0
	move.b %d0,%d5
	add.b #-32,%d5
	cmp.b #16,%d5
	jls .L370
.L101:
	move.b %d0,%d5
	add.b #-48,%d5
	cmp.b #9,%d5
	jhi .L109
	lea (1,%a1),%a5
	move.l %a1,%a2
	sub.l %a3,%a3
.L110:
	lea (%a3,%a3.l),%a1
	add.l %a1,%a1
	lea (%a1,%a3.l),%a3
	add.l %a3,%a3
	ext.w %d0
	lea -48(%a3,%d0.w),%a3
	addq.l #1,%a2
	move.b (%a5)+,%d0
	move.b %d0,%d5
	add.b #-48,%d5
	cmp.b #9,%d5
	jls .L110
.L111:
	cmp.b #46,%d0
	jeq .L371
.L271:
	move.w #-1,%a5
.L113:
	cmp.b #108,%d0
	jeq .L118
.L377:
	cmp.b #76,%d0
	jeq .L118
	move.w #-1,%a1
	move.b %d0,%d5
	add.b #-65,%d5
	cmp.b #55,%d5
	jls .L372
.L120:
	cmp.b #37,%d0
	jeq .L262
	move.b #37,(%a4)+
	move.b (%a2),%d1
	jne .L262
	move.l %a4,%d0
	sub.l 8(%fp),%d0
	jra .L97
.L370:
	and.l #255,%d5
	add.l %d5,%d5
	move.w .L107(%pc,%d5.l),%d5
	jmp %pc@(2,%d5:w)
.L107:
	.word .L102-.L107
	.word .L101-.L107
	.word .L101-.L107
	.word .L103-.L107
	.word .L101-.L107
	.word .L101-.L107
	.word .L101-.L107
	.word .L101-.L107
	.word .L101-.L107
	.word .L101-.L107
	.word .L101-.L107
	.word .L104-.L107
	.word .L101-.L107
	.word .L105-.L107
	.word .L101-.L107
	.word .L101-.L107
	.word .L106-.L107
.L106:
	moveq #1,%d5
	or.l %d5,%d6
	move.l %a1,%a2
	addq.l #1,%a1
.L373:
	move.b (%a3)+,%d0
	move.b %d0,%d5
	add.b #-32,%d5
	cmp.b #16,%d5
	jhi .L101
	jra .L370
.L105:
	moveq #16,%d0
	or.l %d0,%d6
	move.l %a1,%a2
	addq.l #1,%a1
	jra .L373
.L104:
	moveq #4,%d5
	or.l %d5,%d6
	move.l %a1,%a2
	addq.l #1,%a1
	jra .L373
.L103:
	moveq #32,%d0
	or.l %d0,%d6
	move.l %a1,%a2
	addq.l #1,%a1
	jra .L373
.L102:
	moveq #8,%d7
	or.l %d7,%d6
	move.l %a1,%a2
	addq.l #1,%a1
	jra .L373
.L372:
	and.l #255,%d5
	add.l %d5,%d5
	move.w .L132(%pc,%d5.l),%d5
	jmp %pc@(2,%d5:w)
.L132:
	.word .L121-.L132
	.word .L120-.L132
	.word .L120-.L132
	.word .L120-.L132
	.word .L122-.L132
	.word .L120-.L132
	.word .L122-.L132
	.word .L120-.L132
	.word .L120-.L132
	.word .L120-.L132
	.word .L120-.L132
	.word .L120-.L132
	.word .L120-.L132
	.word .L120-.L132
	.word .L120-.L132
	.word .L120-.L132
	.word .L120-.L132
	.word .L120-.L132
	.word .L120-.L132
	.word .L120-.L132
	.word .L120-.L132
	.word .L120-.L132
	.word .L120-.L132
	.word .L123-.L132
	.word .L120-.L132
	.word .L120-.L132
	.word .L120-.L132
	.word .L120-.L132
	.word .L120-.L132
	.word .L120-.L132
	.word .L120-.L132
	.word .L120-.L132
	.word .L124-.L132
	.word .L120-.L132
	.word .L125-.L132
	.word .L126-.L132
	.word .L120-.L132
	.word .L122-.L132
	.word .L120-.L132
	.word .L120-.L132
	.word .L126-.L132
	.word .L120-.L132
	.word .L120-.L132
	.word .L120-.L132
	.word .L120-.L132
	.word .L120-.L132
	.word .L127-.L132
	.word .L128-.L132
	.word .L120-.L132
	.word .L120-.L132
	.word .L129-.L132
	.word .L120-.L132
	.word .L130-.L132
	.word .L120-.L132
	.word .L120-.L132
	.word .L274-.L132
.L109:
	cmp.b #42,%d0
	jeq .L374
	move.l %a1,%a2
	move.w #-1,%a3
	cmp.b #46,%d0
	jne .L271
.L371:
	lea (1,%a2),%a5
	move.b 1(%a2),%d0
	move.b %d0,%d5
	add.b #-48,%d5
	cmp.b #9,%d5
	jls .L375
	cmp.b #42,%d0
	jeq .L376
	move.l %a5,%a2
	sub.l %a5,%a5
.L397:
	cmp.b #108,%d0
	jne .L377
.L118:
	ext.w %d0
	move.w %d0,%a1
	move.b 1(%a2),%d0
	addq.l #1,%a2
	move.b %d0,%d5
	add.b #-65,%d5
	cmp.b #55,%d5
	jhi .L120
	jra .L372
.L375:
	lea (2,%a2),%a1
	move.l %a5,%a2
	sub.l %a5,%a5
.L115:
	move.l %a5,%d5
	add.l %a5,%d5
	add.l %d5,%d5
	lea (%a5,%d5.l),%a5
	add.l %a5,%a5
	ext.w %d0
	lea -48(%a5,%d0.w),%a5
	addq.l #1,%a2
	move.b (%a1)+,%d0
	move.b %d0,%d5
	add.b #-48,%d5
	cmp.b #9,%d5
	jhi .L113
	move.l %a5,%d5
	add.l %a5,%d5
	add.l %d5,%d5
	lea (%a5,%d5.l),%a5
	add.l %a5,%a5
	ext.w %d0
	lea -48(%a5,%d0.w),%a5
	addq.l #1,%a2
	move.b (%a1)+,%d0
	move.b %d0,%d5
	add.b #-48,%d5
	cmp.b #9,%d5
	jls .L115
	jra .L113
.L121:
	moveq #64,%d5
	or.l %d5,%d6
.L124:
	moveq #108,%d7
	cmp.l %a1,%d7
	jeq .L378
	lea (4,%a0),%a1
	move.l %a1,-32(%fp)
	move.l (%a0),%a5
	moveq #0,%d7
	move.b (%a5),%d7
	tst.l %d7
	jeq .L202
	moveq #99,%d0
	cmp.l %d7,%d0
	jge .L379
	move.l #___divsi3,%d5
	pea 100.w
	move.l %d7,-(%sp)
	move.l %d5,%a0
	jsr (%a0)
	addq.l #8,%sp
	move.l #.LC0,-40(%fp)
	move.l %d3,%a1
	move.b (%a1,%d0.l),-24(%fp)
	pea 100.w
	move.l %d7,-(%sp)
	move.l %d2,%a0
	jsr (%a0)
	addq.l #8,%sp
	move.l %d0,%d7
	pea 10.w
	move.l %d0,-(%sp)
	move.l %d5,%a1
	jsr (%a1)
	addq.l #8,%sp
	move.l %d3,%a0
	move.b (%a0,%d0.l),-23(%fp)
	pea 10.w
	move.l %d7,-(%sp)
	move.l %d2,%a1
	jsr (%a1)
	addq.l #8,%sp
	move.l %d0,%d7
	moveq #4,%d1
	move.w #3,%a1
	moveq #2,%d0
	move.l -40(%fp),%a0
	move.b (%a0,%d7.l),-24(%fp,%d0.l)
.L205:
	move.b #46,-24(%fp,%a1.l)
	moveq #0,%d7
	move.b 1(%a5),%d7
	tst.l %d7
	jeq .L207
.L390:
	moveq #99,%d0
	cmp.l %d7,%d0
	jge .L380
	move.l #___divsi3,%d5
	pea 100.w
	move.l %d7,-(%sp)
	move.l %d1,-56(%fp)
	move.l %a1,-60(%fp)
	move.l %d5,%a0
	jsr (%a0)
	addq.l #8,%sp
	move.l #.LC0,-40(%fp)
	move.l -56(%fp),%d1
	move.l %d3,%a0
	move.b (%a0,%d0.l),-24(%fp,%d1.l)
	pea 100.w
	move.l %d7,-(%sp)
	move.l %d2,%a0
	jsr (%a0)
	addq.l #8,%sp
	move.l %d0,%d7
	pea 10.w
	move.l %d0,-(%sp)
	move.l %d5,%a0
	jsr (%a0)
	addq.l #8,%sp
	move.l -60(%fp),%a1
	move.l %d3,%a0
	move.b (%a0,%d0.l),-22(%fp,%a1.l)
	move.l %a1,%d1
	addq.l #3,%d1
	pea 10.w
	move.l %d7,-(%sp)
	move.l %d1,-56(%fp)
	move.l %d2,%a1
	jsr (%a1)
	addq.l #8,%sp
	move.l %d0,%d7
	move.l -56(%fp),%d1
.L211:
	move.l -40(%fp),%a0
	move.b (%a0,%d7.l),-24(%fp,%d1.l)
	addq.l #1,%d1
.L210:
	move.b #46,-24(%fp,%d1.l)
	move.l %d1,%d5
	addq.l #1,%d5
	move.l %d5,-36(%fp)
	moveq #0,%d7
	move.b 2(%a5),%d7
	tst.l %d7
	jeq .L212
.L391:
	moveq #99,%d0
	cmp.l %d7,%d0
	jge .L381
	move.l #___divsi3,%d5
	pea 100.w
	move.l %d7,-(%sp)
	move.l %d1,-56(%fp)
	move.l %d5,%a1
	jsr (%a1)
	addq.l #8,%sp
	move.l #.LC0,-40(%fp)
	move.l -36(%fp),%a1
	move.l %d3,%a0
	move.b (%a0,%d0.l),-24(%fp,%a1.l)
	pea 100.w
	move.l %d7,-(%sp)
	move.l %d2,%a0
	jsr (%a0)
	addq.l #8,%sp
	move.l %d0,%d7
	pea 10.w
	move.l %d0,-(%sp)
	move.l %d5,%a1
	jsr (%a1)
	addq.l #8,%sp
	move.l -56(%fp),%d1
	move.l %d3,%a0
	move.b (%a0,%d0.l),-22(%fp,%d1.l)
	addq.l #3,%d1
	move.l %d1,-36(%fp)
	pea 10.w
	move.l %d7,-(%sp)
	move.l %d2,%a1
	jsr (%a1)
	addq.l #8,%sp
	move.l %d0,%d7
.L216:
	move.l -36(%fp),%a1
	move.l -40(%fp),%a0
	move.b (%a0,%d7.l),-24(%fp,%a1.l)
	move.l %a1,%d7
	addq.l #1,%d7
.L215:
	move.b #46,-24(%fp,%d7.l)
	move.l %d7,%d1
	addq.l #1,%d1
	moveq #0,%d0
	move.b 3(%a5),%d0
	move.l %d0,%a5
	cmp.w #0,%a5
	jeq .L217
.L392:
	moveq #99,%d5
	cmp.l %a5,%d5
	jge .L382
	move.l #___divsi3,%d5
	pea 100.w
	move.l %a5,-(%sp)
	move.l %d1,-56(%fp)
	move.l %d5,%a0
	jsr (%a0)
	addq.l #8,%sp
	move.l #.LC0,-40(%fp)
	move.l -56(%fp),%d1
	move.l %d3,%a1
	move.b (%a1,%d0.l),-24(%fp,%d1.l)
	pea 100.w
	move.l %a5,-(%sp)
	move.l %d2,%a0
	jsr (%a0)
	addq.l #8,%sp
	move.l %d0,%a5
	pea 10.w
	move.l %d0,-(%sp)
	move.l %d5,%a1
	jsr (%a1)
	addq.l #8,%sp
	move.l %d3,%a0
	move.b (%a0,%d0.l),-22(%fp,%d7.l)
	move.l %d7,%d1
	addq.l #3,%d1
	pea 10.w
	move.l %a5,-(%sp)
	move.l %d1,-56(%fp)
	move.l %d2,%a1
	jsr (%a1)
	addq.l #8,%sp
	move.l %d0,%a5
	move.l -56(%fp),%d1
.L221:
	move.l -40(%fp),%a0
	move.b (%a0,%a5.l),-24(%fp,%d1.l)
	move.l %d1,%a5
	addq.l #1,%a5
.L220:
	btst #4,%d6
	jne .L222
	lea (-1,%a3),%a1
	cmp.l %a3,%a5
	jge .L291
	move.l %a3,%d5
	sub.l %a5,%d5
	move.l %a4,%d1
	move.l %a4,%d0
	neg.l %d0
	moveq #3,%d6
	and.l %d6,%d0
	move.l %d5,%a3
	cmp.l %d5,%d0
	jcc .L223
	move.l %d0,%a3
.L223:
	cmp.w #0,%a3
	jeq .L292
	moveq #0,%d0
.L225:
	move.l %d1,%a0
	move.b #32,(%a0)+
	move.l %a0,%d1
	subq.l #1,%a1
	addq.l #1,%d0
	cmp.l %a3,%d0
	jcs .L225
	cmp.l %d5,%a3
	jeq .L226
.L224:
	move.l %d5,%d7
	sub.l %a3,%d7
	move.l %d7,%d1
	lsr.l #2,%d1
	moveq #-4,%d6
	and.l %d7,%d6
	jeq .L307
	lea (%a4,%a3.l),%a3
	moveq #0,%d0
.L228:
	move.l #538976288,(%a3)+
	addq.l #1,%d0
	cmp.l %d0,%d1
	jhi .L228
	add.l %d6,%a0
	sub.l %d6,%a1
	cmp.l %d7,%d6
	jeq .L226
.L307:
	move.b #32,(%a0)+
	subq.l #1,%a1
	move.l %a1,%d0
	addq.l #1,%d0
	cmp.l %a5,%d0
	jgt .L307
.L226:
	add.l %d5,%a4
	lea (-1,%a5),%a3
.L222:
	move.l %a5,%d5
	jle .L383
.L231:
	move.l %d5,%d7
	lsr.l #2,%d7
	move.l %d7,-36(%fp)
	moveq #-4,%d6
	and.l %d5,%d6
	jeq .L293
	moveq #3,%d0
	cmp.l %d5,%d0
	scs %d0
	neg.b %d0
	move.l %a4,%d7
	or.l -28(%fp),%d7
	moveq #3,%d1
	and.l %d1,%d7
	seq %d7
	neg.b %d7
	and.b %d7,%d0
	cmp.b #1,%d0
	jne .L293
	lea (-24,%fp),%a1
	move.l %a4,%a0
	moveq #0,%d0
	move.l -36(%fp),%d1
.L233:
	move.l (%a1)+,(%a0)+
	addq.l #1,%d0
	cmp.l %d0,%d1
	jhi .L233
	lea (%a4,%d6.l),%a0
	cmp.l %d5,%d6
	jeq .L234
	lea (-24,%fp),%a1
	add.l %d6,%a1
.L235:
	move.b (%a1)+,(%a0)+
	addq.l #1,%d6
	cmp.l %a5,%d6
	jlt .L235
.L234:
	add.l %d5,%a4
	cmp.l %a3,%a5
	jge .L364
	lea (-1,%a3),%a1
	move.l %a3,%d5
	sub.l %a5,%d5
	move.l %a4,%d6
	move.l %a4,%d0
	neg.l %d0
	moveq #3,%d7
	and.l %d7,%d0
	cmp.l %d0,%d5
	jcc .L237
	move.l %d5,%d0
.L237:
	tst.l %d0
	jeq .L294
	moveq #0,%d1
.L239:
	move.l %d6,%a0
	move.b #32,(%a0)+
	move.l %a0,%d6
	subq.l #1,%a1
	addq.l #1,%d1
	cmp.l %d0,%d1
	jcs .L239
	cmp.l %d5,%d0
	jeq .L240
.L238:
	move.l %d5,%d7
	sub.l %d0,%d7
	move.l %d7,%d1
	lsr.l #2,%d1
	moveq #-4,%d6
	and.l %d7,%d6
	jeq .L306
	lea (%a4,%d0.l),%a3
	moveq #0,%d0
.L242:
	move.l #538976288,(%a3)+
	addq.l #1,%d0
	cmp.l %d0,%d1
	jhi .L242
	add.l %d6,%a0
	sub.l %d6,%a1
	cmp.l %d7,%d6
	jeq .L240
.L306:
	move.b #32,(%a0)+
	subq.l #1,%a1
	move.l %a1,%d0
	addq.l #1,%d0
	cmp.l %a5,%d0
	jgt .L306
.L240:
	add.l %d5,%a4
.L364:
	move.b 1(%a2),%d1
	move.l -32(%fp),%a0
.L389:
	addq.l #1,%a2
	tst.b %d1
	jne .L267
	jra .L263
.L128:
	moveq #-1,%d0
	cmp.l %a3,%d0
	jeq .L384
	move.l %a0,%d5
	addq.l #4,%d5
	move.l %d6,-(%sp)
	move.l %a5,-(%sp)
	move.l %a3,-(%sp)
	pea 16.w
	move.l (%a0),-(%sp)
	move.l %a4,-(%sp)
	jsr __ZL6numberPcliiii
	move.l %d0,%a4
	move.b 1(%a2),%d1
	lea (24,%sp),%sp
	move.l %d5,%a0
.L395:
	addq.l #1,%a2
	tst.b %d1
	jne .L267
	jra .L263
.L127:
	moveq #8,%d1
	move.l (%a0),%d0
	addq.l #4,%a0
	move.l %d6,-(%sp)
	move.l %a5,-(%sp)
	move.l %a3,-(%sp)
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	move.l %a4,-(%sp)
	move.l %a0,-56(%fp)
	jsr __ZL6numberPcliiii
	move.l %d0,%a4
	move.b 1(%a2),%d1
	lea (24,%sp),%sp
	move.l -56(%fp),%a0
.L385:
	addq.l #1,%a2
	tst.b %d1
	jne .L267
	jra .L263
.L126:
	moveq #2,%d1
	or.l %d1,%d6
	move.b #10,%d1
	move.l (%a0),%d0
	addq.l #4,%a0
	move.l %d6,-(%sp)
	move.l %a5,-(%sp)
	move.l %a3,-(%sp)
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	move.l %a4,-(%sp)
	move.l %a0,-56(%fp)
	jsr __ZL6numberPcliiii
	move.l %d0,%a4
	move.b 1(%a2),%d1
	lea (24,%sp),%sp
	move.l -56(%fp),%a0
	jra .L385
.L125:
	btst #4,%d6
	jne .L133
	move.l %a3,%d6
	subq.l #1,%d6
	move.l %d6,%d0
	jle .L275
	move.l %a4,%d5
	move.l %a4,%d1
	neg.l %d1
	moveq #3,%d7
	and.l %d7,%d1
	move.l %d6,%a3
	cmp.l %d6,%d1
	jcc .L134
	move.l %d1,%a3
.L134:
	cmp.w #0,%a3
	jeq .L276
	moveq #0,%d1
.L136:
	move.l %d5,%a1
	move.b #32,(%a1)+
	move.l %a1,%d5
	subq.l #1,%d0
	addq.l #1,%d1
	cmp.l %a3,%d1
	jcs .L136
	cmp.l %d6,%a3
	jeq .L137
.L135:
	move.l %d6,%a5
	sub.l %a3,%a5
	move.l %a5,%d5
	lsr.l #2,%d5
	move.l %a5,%d7
	moveq #-4,%d1
	and.l %d1,%d7
	jeq .L308
	lea (%a4,%a3.l),%a3
	moveq #0,%d1
.L139:
	move.l #538976288,(%a3)+
	addq.l #1,%d1
	cmp.l %d1,%d5
	jhi .L139
	add.l %d7,%a1
	sub.l %d7,%d0
	cmp.l %a5,%d7
	jeq .L137
.L308:
	move.b #32,(%a1)+
	subq.l #1,%d0
	tst.l %d0
	jgt .L308
.L137:
	lea (4,%a0),%a1
	add.l %d6,%a4
	move.b 3(%a0),(%a4)+
	move.b 1(%a2),%d1
	move.l %a1,%a0
.L394:
	addq.l #1,%a2
	tst.b %d1
	jne .L267
	jra .L263
.L123:
	moveq #64,%d0
	or.l %d0,%d6
	moveq #16,%d1
	move.l (%a0),%d0
	addq.l #4,%a0
	move.l %d6,-(%sp)
	move.l %a5,-(%sp)
	move.l %a3,-(%sp)
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	move.l %a4,-(%sp)
	move.l %a0,-56(%fp)
	jsr __ZL6numberPcliiii
	move.l %d0,%a4
	move.b 1(%a2),%d1
	lea (24,%sp),%sp
	move.l -56(%fp),%a0
	jra .L385
.L122:
	lea (8,%a0),%a1
	move.l %a1,-44(%fp)
	move.l 4(%a0),-(%sp)
	move.l (%a0),-(%sp)
	jsr ___truncdfsf2
	addq.l #8,%sp
	move.l %d0,%d7
	moveq #-1,%d0
	cmp.l %a3,%d0
	jeq .L245
	move.l %a3,%d5
	subq.l #1,%d5
	move.l #___ltsf2,-36(%fp)
.L246:
	moveq #-1,%d0
	move.l #___fixsfsi,-32(%fp)
	cmp.l %a5,%d0
	jeq .L249
	move.l %d7,-(%sp)
	lea ___fixsfsi,%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l %d0,-40(%fp)
.L250:
	moveq #1,%d6
	tst.l %d5
	jle .L253
	moveq #0,%d0
.L254:
	move.l %d6,%d1
	add.l %d6,%d1
	add.l %d1,%d1
	add.l %d1,%d6
	add.l %d6,%d6
	addq.l #1,%d0
	cmp.l %d0,%d5
	jne .L254
.L253:
	clr.l -(%sp)
	move.l %d7,-(%sp)
	move.l -36(%fp),%a0
	jsr (%a0)
	addq.l #8,%sp
	tst.l %d0
	jlt .L386
.L255:
	cmp.w #0,%a3
	jle .L257
	lea (%a4,%a3.l),%a3
	move.l #___divsi3,%d5
	move.l %a2,-36(%fp)
	move.l %d7,%a2
	move.l %a3,%d7
	move.l %d5,%a3
	move.l -40(%fp),%d5
.L258:
	move.l %d6,-(%sp)
	move.l %d5,-(%sp)
	jsr (%a3)
	addq.l #8,%sp
	pea 10.w
	move.l %d0,-(%sp)
	move.l %d2,%a1
	jsr (%a1)
	addq.l #8,%sp
	move.l %d3,%a0
	move.b (%a0,%d0.l),(%a4)+
	pea 10.w
	move.l %d6,-(%sp)
	jsr (%a3)
	addq.l #8,%sp
	move.l %d0,%d6
	cmp.l %a4,%d7
	jne .L258
	move.l %a2,%d7
	move.l -36(%fp),%a2
.L257:
	cmp.w #0,%a5
	jeq .L365
	move.b #46,(%a4)+
	move.l %a4,%a3
	moveq #10,%d5
	moveq #0,%d6
	move.l #___mulsf3,%d1
	move.l %a4,-36(%fp)
	move.l %a2,-40(%fp)
	move.l -32(%fp),%a2
	move.l %d1,%a4
.L260:
	move.l %d5,-(%sp)
	move.l %d4,%a1
	jsr (%a1)
	move.l %d7,(%sp)
	move.l %d0,-(%sp)
	jsr (%a4)
	addq.l #4,%sp
	move.l %d0,(%sp)
	jsr (%a2)
	moveq #10,%d1
	move.l %d1,(%sp)
	move.l %d0,-(%sp)
	move.l %d2,%a0
	jsr (%a0)
	addq.l #8,%sp
	move.l %d3,%a1
	move.b (%a1,%d0.l),(%a3)+
	move.l %d5,%d0
	add.l %d5,%d0
	add.l %d0,%d0
	add.l %d0,%d5
	add.l %d5,%d5
	addq.l #1,%d6
	cmp.l %a5,%d6
	jlt .L260
	move.l -36(%fp),%a4
	move.l -40(%fp),%a2
	cmp.w #0,%a5
	jle .L387
	add.l %a5,%a4
.L365:
	move.b 1(%a2),%d1
	move.l -44(%fp),%a0
	addq.l #1,%a2
	jne .L267
	jra .L263
.L130:
	moveq #10,%d1
	move.l (%a0),%d0
	addq.l #4,%a0
	move.l %d6,-(%sp)
	move.l %a5,-(%sp)
	move.l %a3,-(%sp)
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	move.l %a4,-(%sp)
	move.l %a0,-56(%fp)
	jsr __ZL6numberPcliiii
	move.l %d0,%a4
	move.b 1(%a2),%d1
	lea (24,%sp),%sp
	move.l -56(%fp),%a0
	jra .L385
.L129:
	lea (4,%a0),%a1
	move.l %a1,-32(%fp)
	move.l (%a0),%d5
	jeq .L388
	move.l %d5,%a0
	tst.b (%a0)
	jeq .L279
.L398:
	cmp.w #0,%a5
	jeq .L279
	move.l %d5,%a0
	addq.l #1,%a0
	move.l %d5,%d0
.L155:
	addq.l #1,%d0
	tst.b (%a0)+
	jeq .L362
	subq.l #1,%a5
	cmp.w #0,%a5
	jne .L155
.L362:
	sub.l %d5,%d0
.L153:
	btst #4,%d6
	jne .L156
	lea (-1,%a3),%a1
	cmp.l %a3,%d0
	jge .L280
	move.l %a3,%d7
	sub.l %d0,%d7
	move.l %a4,%a0
	move.l %a4,%d1
	neg.l %d1
	moveq #3,%d6
	and.l %d6,%d1
	move.l %d7,%a3
	cmp.l %d7,%d1
	jcc .L157
	move.l %d1,%a3
.L157:
	cmp.w #0,%a3
	jeq .L281
	moveq #0,%d1
	move.l %a0,%d6
.L159:
	move.l %d6,%a0
	move.b #32,(%a0)+
	move.l %a0,%d6
	subq.l #1,%a1
	addq.l #1,%d1
	cmp.l %a3,%d1
	jcs .L159
	cmp.l %d7,%a3
	jeq .L160
.L158:
	move.l %d7,%d1
	sub.l %a3,%d1
	move.l %d1,-36(%fp)
	move.l %d1,%d6
	lsr.l #2,%d6
	moveq #-4,%d1
	and.l -36(%fp),%d1
	move.l %d1,%a5
	jeq .L311
	lea (%a4,%a3.l),%a3
	moveq #0,%d1
.L162:
	move.l #538976288,(%a3)+
	addq.l #1,%d1
	cmp.l %d1,%d6
	jhi .L162
	add.l %a5,%a0
	sub.l %a5,%a1
	cmp.l -36(%fp),%a5
	jeq .L160
.L311:
	move.b #32,(%a0)+
	subq.l #1,%a1
	move.l %a1,%d1
	addq.l #1,%d1
	cmp.l %d0,%d1
	jgt .L311
.L160:
	move.l %d0,%a3
	subq.l #1,%a3
	add.l %d7,%a4
.L156:
	tst.l %d0
	jle .L165
	move.l %d0,%d6
	lsr.l #2,%d6
	move.l %d6,-36(%fp)
	moveq #-4,%d7
	and.l %d0,%d7
	move.l %d7,%a5
	jeq .L282
	moveq #3,%d1
	cmp.l %d0,%d1
	scs %d1
	neg.b %d1
	move.l %a4,%d6
	or.l %d5,%d6
	moveq #3,%d7
	and.l %d7,%d6
	seq %d6
	neg.b %d6
	and.b %d6,%d1
	move.l %d5,%a0
	addq.l #4,%a0
	cmp.l %a4,%a0
	scs %d7
	neg.b %d7
	lea (4,%a4),%a1
	cmp.l %d5,%a1
	scs %d6
	neg.b %d6
	or.b %d6,%d7
	and.b %d7,%d1
	cmp.b #1,%d1
	jne .L282
	move.l %d5,%a1
	move.l %a4,%a0
	moveq #0,%d1
	move.l -36(%fp),%d6
	move.l %a5,%d7
.L167:
	move.l (%a1)+,(%a0)+
	addq.l #1,%d1
	cmp.l %d1,%d6
	jhi .L167
	lea (%a4,%d7.l),%a0
	add.l %d7,%d5
	cmp.l %d0,%d7
	jeq .L168
	move.l %d5,%a1
.L169:
	move.b (%a1)+,(%a0)+
	addq.l #1,%d7
	cmp.l %d0,%d7
	jlt .L169
.L168:
	add.l %d0,%a4
.L165:
	cmp.l %a3,%d0
	jge .L364
	lea (-1,%a3),%a1
	sub.l %d0,%a3
	move.l %a4,%d6
	move.l %a4,%d1
	neg.l %d1
	moveq #3,%d7
	and.l %d7,%d1
	cmp.l %d1,%a3
	jcc .L171
	move.l %a3,%d1
.L171:
	tst.l %d1
	jeq .L283
	moveq #0,%d5
.L173:
	move.l %d6,%a0
	move.b #32,(%a0)+
	move.l %a0,%d6
	subq.l #1,%a1
	addq.l #1,%d5
	cmp.l %d1,%d5
	jcs .L173
	cmp.l %a3,%d1
	jeq .L174
.L172:
	move.l %a3,%d7
	sub.l %d1,%d7
	move.l %d7,%d5
	lsr.l #2,%d5
	moveq #-4,%d6
	and.l %d7,%d6
	jeq .L310
	lea (%a4,%d1.l),%a5
	moveq #0,%d1
.L176:
	move.l #538976288,(%a5)+
	addq.l #1,%d1
	cmp.l %d1,%d5
	jhi .L176
	add.l %d6,%a0
	sub.l %d6,%a1
	cmp.l %d7,%d6
	jeq .L174
.L310:
	move.b #32,(%a0)+
	subq.l #1,%a1
	move.l %a1,%d1
	addq.l #1,%d1
	cmp.l %d1,%d0
	jlt .L310
.L174:
	add.l %a3,%a4
	move.b 1(%a2),%d1
	move.l -32(%fp),%a0
	jra .L389
.L274:
	moveq #16,%d1
	move.l (%a0),%d0
	addq.l #4,%a0
	move.l %d6,-(%sp)
	move.l %a5,-(%sp)
	move.l %a3,-(%sp)
	move.l %d1,-(%sp)
	move.l %d0,-(%sp)
	move.l %a4,-(%sp)
	move.l %a0,-56(%fp)
	jsr __ZL6numberPcliiii
	move.l %d0,%a4
	move.b 1(%a2),%d1
	lea (24,%sp),%sp
	move.l -56(%fp),%a0
	jra .L385
.L374:
	lea (2,%a2),%a5
	lea (4,%a0),%a1
	move.l (%a0),%a3
	cmp.w #0,%a3
	jlt .L112
	move.b 2(%a2),%d0
	move.l %a5,%a2
	move.l %a1,%a0
	jra .L111
.L202:
	move.b #48,-24(%fp)
	moveq #2,%d1
	move.w #1,%a1
	move.b #46,-24(%fp,%a1.l)
	moveq #0,%d7
	move.b 1(%a5),%d7
	tst.l %d7
	jne .L390
.L207:
	move.b #48,-24(%fp,%d1.l)
	move.l %a1,%d1
	addq.l #2,%d1
	move.b #46,-24(%fp,%d1.l)
	move.l %d1,%d5
	addq.l #1,%d5
	move.l %d5,-36(%fp)
	moveq #0,%d7
	move.b 2(%a5),%d7
	tst.l %d7
	jne .L391
.L212:
	move.b #48,-24(%fp,%d5.l)
	move.l %d1,%d7
	addq.l #2,%d7
	move.b #46,-24(%fp,%d7.l)
	move.l %d7,%d1
	addq.l #1,%d1
	moveq #0,%d0
	move.b 3(%a5),%d0
	move.l %d0,%a5
	cmp.w #0,%a5
	jne .L392
.L217:
	move.b #48,-24(%fp,%d1.l)
	move.l %d7,%a5
	addq.l #2,%a5
	jra .L220
.L279:
	moveq #0,%d0
	jra .L153
.L275:
	move.l %d6,%a3
.L133:
	lea (4,%a0),%a1
	move.l %a4,%a5
	move.b 3(%a0),(%a5)+
	move.l %a3,%d6
	subq.l #1,%d6
	move.l %d6,%d0
	jle .L393
	move.l %a5,%d7
	move.l %a5,%d1
	neg.l %d1
	moveq #3,%d5
	and.l %d5,%d1
	cmp.l %d1,%d6
	jcc .L144
	move.l %d6,%d1
.L144:
	tst.l %d1
	jeq .L277
	moveq #0,%d5
.L146:
	move.l %d7,%a0
	move.b #32,(%a0)+
	move.l %a0,%d7
	subq.l #1,%d0
	addq.l #1,%d5
	cmp.l %d5,%d1
	jhi .L146
	cmp.l %d6,%d1
	jeq .L147
.L145:
	move.l %d6,%a3
	sub.l %d1,%a3
	move.l %a3,%d7
	lsr.l #2,%d7
	move.l %d7,-32(%fp)
	move.l %a3,%d7
	moveq #-4,%d5
	and.l %d5,%d7
	jeq .L309
	lea 1(%a4,%d1.l),%a4
	moveq #0,%d1
	move.l -32(%fp),%d5
.L149:
	move.l #538976288,(%a4)+
	addq.l #1,%d1
	cmp.l %d1,%d5
	jhi .L149
	add.l %d7,%a0
	sub.l %d7,%d0
	cmp.l %a3,%d7
	jeq .L147
.L309:
	move.b #32,(%a0)+
	subq.l #1,%d0
	tst.l %d0
	jgt .L309
.L147:
	lea (%a5,%d6.l),%a4
	move.b 1(%a2),%d1
	move.l %a1,%a0
	jra .L394
.L112:
	move.l %a3,%d7
	neg.l %d7
	move.l %d7,%a3
	moveq #16,%d0
	or.l %d0,%d6
	move.b 2(%a2),%d0
	move.l %a5,%a2
	move.l %a1,%a0
	jra .L111
.L383:
	moveq #1,%d5
	jra .L231
.L245:
	move.l #___ltsf2,-36(%fp)
	move.l #0x3f800000,-(%sp)
	move.l %d7,-(%sp)
	lea ___ltsf2,%a0
	jsr (%a0)
	addq.l #8,%sp
	tst.l %d0
	jlt .L295
	moveq #1,%d5
	sub.l %a3,%a3
	move.l %a2,%d6
	lea ___ltsf2,%a2
.L247:
	move.l %d5,%d0
	add.l %d5,%d0
	add.l %d0,%d0
	add.l %d0,%d5
	add.l %d5,%d5
	addq.l #1,%a3
	move.l %d5,-(%sp)
	move.l %d4,%a1
	jsr (%a1)
	move.l %d0,(%sp)
	move.l %d7,-(%sp)
	jsr (%a2)
	addq.l #8,%sp
	tst.l %d0
	jge .L247
	move.l %d6,%a2
	move.l %a3,%d5
	subq.l #1,%d5
	jra .L246
.L384:
	moveq #1,%d1
	or.l %d1,%d6
	move.w #8,%a3
	move.l %a0,%d5
	addq.l #4,%d5
	move.l %d6,-(%sp)
	move.l %a5,-(%sp)
	move.l %a3,-(%sp)
	pea 16.w
	move.l (%a0),-(%sp)
	move.l %a4,-(%sp)
	jsr __ZL6numberPcliiii
	move.l %d0,%a4
	move.b 1(%a2),%d1
	lea (24,%sp),%sp
	move.l %d5,%a0
	jra .L395
.L386:
	move.b #45,(%a4)+
	jra .L255
.L378:
	lea (4,%a0),%a5
	move.l (%a0),%a1
	lea .LC0,%a0
	btst #6,%d6
	jeq .L181
	lea .LC1,%a0
.L181:
	moveq #0,%d0
	move.b (%a1),%d0
	move.l %d0,%d1
	asr.l #4,%d1
	move.b (%a0,%d1.l),-24(%fp)
	moveq #15,%d1
	and.l %d1,%d0
	move.b (%a0,%d0.l),-23(%fp)
	move.b #58,-22(%fp)
	moveq #0,%d0
	move.b 1(%a1),%d0
	move.l %d0,%d1
	asr.l #4,%d1
	move.b (%a0,%d1.l),-21(%fp)
	moveq #15,%d5
	and.l %d5,%d0
	move.b (%a0,%d0.l),-20(%fp)
	move.b #58,-19(%fp)
	moveq #0,%d0
	move.b 2(%a1),%d0
	move.l %d0,%d1
	asr.l #4,%d1
	move.b (%a0,%d1.l),-18(%fp)
	and.l %d5,%d0
	move.b (%a0,%d0.l),-17(%fp)
	move.b #58,-16(%fp)
	moveq #0,%d0
	move.b 3(%a1),%d0
	move.l %d0,%d1
	asr.l #4,%d1
	move.b (%a0,%d1.l),-15(%fp)
	and.l %d5,%d0
	move.b (%a0,%d0.l),-14(%fp)
	move.b #58,-13(%fp)
	moveq #0,%d0
	move.b 4(%a1),%d0
	move.l %d0,%d1
	asr.l #4,%d1
	move.b (%a0,%d1.l),-12(%fp)
	and.l %d5,%d0
	move.b (%a0,%d0.l),-11(%fp)
	move.b #58,-10(%fp)
	moveq #0,%d0
	move.b 5(%a1),%d0
	move.l %d0,%d1
	asr.l #4,%d1
	move.b (%a0,%d1.l),-9(%fp)
	and.l %d5,%d0
	move.b (%a0,%d0.l),-8(%fp)
	btst #4,%d6
	jne .L182
	lea (-1,%a3),%a1
	moveq #17,%d6
	cmp.l %a3,%d6
	jge .L285
	lea (-17,%a3),%a3
	move.l %a4,%d5
	move.l %a4,%d0
	neg.l %d0
	moveq #3,%d7
	and.l %d7,%d0
	move.l %a3,%d1
	cmp.l %a3,%d0
	jcs .L396
.L183:
	tst.l %d1
	jeq .L286
	moveq #0,%d0
.L185:
	move.l %d5,%a0
	move.b #32,(%a0)+
	move.l %a0,%d5
	subq.l #1,%a1
	addq.l #1,%d0
	cmp.l %d1,%d0
	jcs .L185
	cmp.l %a3,%d1
	jeq .L186
.L184:
	move.l %a3,%d7
	sub.l %d1,%d7
	move.l %d7,%d5
	lsr.l #2,%d5
	moveq #-4,%d6
	and.l %d7,%d6
	jeq .L305
	add.l %a4,%d1
	moveq #0,%d0
	move.l %d1,-32(%fp)
	move.l %a0,%d1
	move.l -32(%fp),%a0
.L188:
	move.l #538976288,(%a0)+
	addq.l #1,%d0
	cmp.l %d0,%d5
	jhi .L188
	move.l %d1,%a0
	add.l %d6,%a0
	sub.l %d6,%a1
	cmp.l %d7,%d6
	jeq .L186
.L305:
	move.b #32,(%a0)+
	subq.l #1,%a1
	move.l %a1,%d0
	addq.l #1,%d0
	moveq #17,%d1
	cmp.l %d0,%d1
	jlt .L305
.L186:
	add.l %a3,%a4
	move.w #16,%a3
.L182:
	move.l %a4,%d0
	or.l -28(%fp),%d0
	moveq #3,%d5
	and.l %d5,%d0
	jne .L287
	move.l -24(%fp),(%a4)
	move.l -20(%fp),4(%a4)
	move.l -16(%fp),8(%a4)
	move.l -12(%fp),12(%a4)
	lea (16,%a4),%a1
	moveq #1,%d1
	move.b #16,%d0
	lea (-24,%fp),%a0
	add.l %d0,%a0
	moveq #-24,%d6
	add.l %fp,%d6
	add.l %d6,%d1
	add.l %d1,%d0
.L192:
	move.b (%a0)+,(%a1)+
	cmp.l %a0,%d0
	jne .L192
	moveq #17,%d6
	add.l %a4,%d6
	moveq #17,%d7
	cmp.l %a3,%d7
	jge .L288
	lea (-1,%a3),%a1
	lea (-17,%a3),%a3
	move.l %d6,%d5
	move.l %d6,%d0
	neg.l %d0
	moveq #3,%d1
	and.l %d1,%d0
	cmp.l %d0,%a3
	jcc .L194
	move.l %a3,%d0
.L194:
	tst.l %d0
	jeq .L289
	moveq #0,%d1
.L196:
	move.l %d5,%a0
	move.b #32,(%a0)+
	move.l %a0,%d5
	subq.l #1,%a1
	addq.l #1,%d1
	cmp.l %d1,%d0
	jhi .L196
	cmp.l %a3,%d0
	jeq .L197
.L195:
	move.l %a3,%d7
	sub.l %d0,%d7
	move.l %d7,%d1
	lsr.l #2,%d1
	moveq #-4,%d5
	and.l %d7,%d5
	jeq .L304
	lea 17(%a4,%d0.l),%a4
	moveq #0,%d0
.L199:
	move.l #538976288,(%a4)+
	addq.l #1,%d0
	cmp.l %d0,%d1
	jhi .L199
	add.l %d5,%a0
	sub.l %d5,%a1
	cmp.l %d7,%d5
	jeq .L197
.L304:
	move.b #32,(%a0)+
	subq.l #1,%a1
	move.l %a1,%d0
	addq.l #1,%d0
	moveq #17,%d5
	cmp.l %d0,%d5
	jlt .L304
.L197:
	lea (%a3,%d6.l),%a4
	move.b 1(%a2),%d1
	move.l %a5,%a0
.L399:
	addq.l #1,%a2
	tst.b %d1
	jne .L267
	jra .L263
.L376:
	move.l %a2,%d5
	addq.l #2,%d5
	lea (4,%a0),%a1
	move.l (%a0),%a5
	move.b 2(%a2),%d0
	move.l %d5,%a2
	move.l %a1,%a0
	cmp.w #0,%a5
	jge .L113
	sub.l %a5,%a5
	jra .L397
.L269:
	moveq #0,%d0
	clr.b (%a4)
	movem.l -104(%fp),#15612
	unlk %fp
	rts
.L380:
	move.l #.LC0,-40(%fp)
	moveq #9,%d0
	cmp.l %d7,%d0
	jge .L211
	pea 10.w
	move.l %d7,-(%sp)
	move.l %d1,-56(%fp)
	move.l %a1,-60(%fp)
	jsr ___divsi3
	addq.l #8,%sp
	move.l -56(%fp),%d1
	move.l %d3,%a0
	move.b (%a0,%d0.l),-24(%fp,%d1.l)
	move.l -60(%fp),%a1
	move.l %a1,%d1
	addq.l #2,%d1
	pea 10.w
	move.l %d7,-(%sp)
	move.l %d1,-56(%fp)
	move.l %d2,%a1
	jsr (%a1)
	addq.l #8,%sp
	move.l %d0,%d7
	move.l -56(%fp),%d1
	move.l -40(%fp),%a0
	move.b (%a0,%d7.l),-24(%fp,%d1.l)
	addq.l #1,%d1
	jra .L210
.L379:
	moveq #9,%d0
	cmp.l %d7,%d0
	jge .L290
	pea 10.w
	move.l %d7,-(%sp)
	jsr ___divsi3
	addq.l #8,%sp
	move.l #.LC0,-40(%fp)
	move.l %d3,%a0
	move.b (%a0,%d0.l),-24(%fp)
	pea 10.w
	move.l %d7,-(%sp)
	move.l %d2,%a1
	jsr (%a1)
	addq.l #8,%sp
	move.l %d0,%d7
	moveq #3,%d1
	move.w #2,%a1
	moveq #1,%d0
	move.l -40(%fp),%a0
	move.b (%a0,%d7.l),-24(%fp,%d0.l)
	jra .L205
.L382:
	move.l #.LC0,-40(%fp)
	moveq #9,%d0
	cmp.l %a5,%d0
	jge .L221
	pea 10.w
	move.l %a5,-(%sp)
	move.l %d1,-56(%fp)
	jsr ___divsi3
	addq.l #8,%sp
	move.l -56(%fp),%d1
	move.l %d3,%a0
	move.b (%a0,%d0.l),-24(%fp,%d1.l)
	move.l %d7,%d1
	addq.l #2,%d1
	pea 10.w
	move.l %a5,-(%sp)
	move.l %d1,-56(%fp)
	move.l %d2,%a1
	jsr (%a1)
	addq.l #8,%sp
	move.l %d0,%a5
	move.l -56(%fp),%d1
	move.l -40(%fp),%a0
	move.b (%a0,%a5.l),-24(%fp,%d1.l)
	move.l %d1,%a5
	addq.l #1,%a5
	jra .L220
.L381:
	move.l #.LC0,-40(%fp)
	moveq #9,%d0
	cmp.l %d7,%d0
	jge .L216
	pea 10.w
	move.l %d7,-(%sp)
	move.l %d1,-56(%fp)
	jsr ___divsi3
	addq.l #8,%sp
	move.l -36(%fp),%a1
	move.l %d3,%a0
	move.b (%a0,%d0.l),-24(%fp,%a1.l)
	move.l -56(%fp),%d1
	addq.l #2,%d1
	move.l %d1,-36(%fp)
	pea 10.w
	move.l %d7,-(%sp)
	move.l %d2,%a0
	jsr (%a0)
	addq.l #8,%sp
	move.l %d0,%d7
	move.l -36(%fp),%a1
	move.l -40(%fp),%a0
	move.b (%a0,%d7.l),-24(%fp,%a1.l)
	move.l %a1,%d7
	addq.l #1,%d7
	jra .L215
.L249:
	move.l %d7,-(%sp)
	lea ___fixsfsi,%a1
	jsr (%a1)
	move.l %d0,-40(%fp)
	move.l %d0,(%sp)
	move.l %d4,%a0
	jsr (%a0)
	move.l %d0,(%sp)
	move.l %d7,-(%sp)
	jsr ___eqsf2
	addq.l #8,%sp
	tst.l %d0
	jeq .L296
	move.l %d7,%d6
	sub.l %a5,%a5
	move.l #___mulsf3,%d1
	move.l %d5,-48(%fp)
	move.l %a3,%d5
	move.l %a2,-52(%fp)
	lea ___fixsfsi,%a2
	move.l %d1,%a3
.L251:
	move.l #0x41200000,-(%sp)
	move.l %d6,-(%sp)
	jsr (%a3)
	addq.l #8,%sp
	move.l %d0,%d6
	addq.l #1,%a5
	move.l %d0,-(%sp)
	jsr (%a2)
	move.l %d0,(%sp)
	move.l %d4,%a1
	jsr (%a1)
	move.l %d6,(%sp)
	move.l %d0,-(%sp)
	jsr ___eqsf2
	addq.l #8,%sp
	tst.l %d0
	jne .L251
	move.l %d5,%a3
	move.l -48(%fp),%d5
	move.l -52(%fp),%a2
	jra .L250
.L290:
	moveq #2,%d1
	move.w #1,%a1
	moveq #0,%d0
	move.l #.LC0,-40(%fp)
	move.l -40(%fp),%a0
	move.b (%a0,%d7.l),-24(%fp,%d0.l)
	jra .L205
.L388:
	move.l #.LC2,%d5
	move.l %d5,%a0
	tst.b (%a0)
	jeq .L279
	jra .L398
.L396:
	move.l %d0,%d1
	jra .L183
.L387:
	move.w #1,%a5
	add.l %a5,%a4
	jra .L365
.L291:
	move.l %a1,%a3
	move.l %a5,%d5
	jgt .L231
	jra .L383
.L288:
	move.l %d6,%a4
	move.b 1(%a2),%d1
	move.l %a5,%a0
	jra .L399
.L280:
	move.l %a1,%a3
	jra .L156
.L296:
	sub.l %a5,%a5
	jra .L250
.L285:
	move.l %a1,%a3
	jra .L182
.L295:
	moveq #-1,%d5
	sub.l %a3,%a3
	jra .L246
.L289:
	move.l %d6,%a0
	jra .L195
.L393:
	move.l %a5,%a4
	move.b 1(%a2),%d1
	move.l %a1,%a0
	jra .L394
.L287:
	move.l %a4,%a1
	moveq #17,%d1
	moveq #0,%d0
	lea (-24,%fp),%a0
	add.l %d0,%a0
	moveq #-24,%d6
	add.l %fp,%d6
	add.l %d6,%d1
	add.l %d1,%d0
	jra .L192
.L286:
	move.l %a4,%a0
	jra .L184
.L276:
	move.l %a4,%a1
	jra .L135
.L281:
	move.l %a4,%a0
	jra .L158
.L294:
	move.l %a4,%a0
	jra .L238
.L293:
	move.l %a4,%a0
	moveq #0,%d6
	lea (-24,%fp),%a1
	add.l %d6,%a1
	jra .L235
.L277:
	move.l %a5,%a0
	jra .L145
.L292:
	move.l %a4,%a0
	jra .L224
.L283:
	move.l %a4,%a0
	jra .L172
.L282:
	move.l %a4,%a0
	moveq #0,%d7
	move.l %d5,%a1
	jra .L169
	.even
	.globl	__Z10ee_sprintfPcPKcz
__Z10ee_sprintfPcPKcz:
	link.w %fp,#0
	pea 16(%fp)
	move.l 12(%fp),-(%sp)
	move.l 8(%fp),-(%sp)
	jsr __ZL11ee_vsprintfPcPKcPv
	lea (12,%sp),%sp
	unlk %fp
	rts
	.even
	.globl	ee_printf
ee_printf:
	link.w %fp,#0
	pea 12(%fp)
	move.l 8(%fp),-(%sp)
	pea __ZL13ee_printf_buf
	jsr __ZL11ee_vsprintfPcPKcPv
	move.l #__ZL13ee_printf_buf,%d0
	unlk %fp
	rts
.lcomm __ZL13ee_printf_buf,256
