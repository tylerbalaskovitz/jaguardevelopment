#NO_APP
	.text
	.even
	.globl	__Z10BCX_TmpStrm
__Z10BCX_TmpStrm:
	link.w %fp,#0
	move.l #_BCX_TmpStr_buffer,%d0
	move.l 8(%fp),%d1
	move.l %d0,%a0
	clr.b (%a0,%d1.l)
	unlk %fp
	rts
	.even
	.globl	__Z6stringii
__Z6stringii:
	link.w %fp,#0
	move.l 8(%fp),%d0
	jle .L6
	lea _BCX_TmpStr_buffer,%a0
	clr.b (%a0,%d0.l)
	move.l %d0,-(%sp)
	move.l 12(%fp),-(%sp)
	move.l %a0,-(%sp)
	jsr _memset
	lea (12,%sp),%sp
	unlk %fp
	rts
.L6:
	clr.b _BCX_TmpStr_buffer+1
	move.l #_BCX_TmpStr_buffer,%d0
	unlk %fp
	rts
	.even
	.globl	__Z12convert_utf8Pc
__Z12convert_utf8Pc:
	link.w %fp,#0
	movem.l #15392,-(%sp)
	move.l 8(%fp),%d4
	clr.b __ZZ12convert_utf8PcE1c
	clr.b __ZZ12convert_utf8PcE1d
	clr.w __ZZ12convert_utf8PcE1i
	clr.w __ZZ12convert_utf8PcE1j
	pea 2048.w
	clr.l -(%sp)
	pea __ZZ12convert_utf8PcE9converted
	jsr _memset
	lea (12,%sp),%sp
	moveq #0,%d2
	clr.w %d3
	lea _strlen,%a2
	move.l %d4,-(%sp)
	jsr (%a2)
	addq.l #4,%sp
	move.w %d3,%a0
	cmp.l %a0,%d0
	jcs .L20
.L18:
	lea (%a0,%d4.l),%a0
	move.b (%a0),%d0
	move.b %d0,__ZZ12convert_utf8PcE1c
	cmp.b #-61,%d0
	jeq .L21
	move.l %d2,%a0
	add.l #__ZZ12convert_utf8PcE9converted,%a0
	move.b %d0,(%a0)
	move.w %d2,%d0
	addq.w #1,%d0
	move.w %d0,__ZZ12convert_utf8PcE1j
	addq.w #1,%d3
	move.w %d3,__ZZ12convert_utf8PcE1i
	addq.l #1,%d2
.L28:
	move.l %d4,-(%sp)
	jsr (%a2)
	addq.l #4,%sp
	move.w %d3,%a0
	cmp.l %a0,%d0
	jcc .L18
.L20:
	move.w %d2,%a0
	add.l #__ZZ12convert_utf8PcE9converted,%a0
	move.b #0,(%a0)
	pea __ZZ12convert_utf8PcE9converted
	jsr _strlen
	lea _BCX_TmpStr_buffer,%a2
	clr.b (%a2,%d0.l)
	move.l #__ZZ12convert_utf8PcE9converted,(%sp)
	move.l %a2,-(%sp)
	jsr _strcpy
	move.l %a2,%d0
	movem.l -20(%fp),#1084
	unlk %fp
	rts
.L21:
	addq.l #1,%a0
	move.b (%a0),%d0
	move.b %d0,__ZZ12convert_utf8PcE1d
	cmp.b #-86,%d0
	jeq .L22
	cmp.b #-94,%d0
	jeq .L23
	cmp.b #-82,%d0
	jeq .L24
	cmp.b #-76,%d0
	jeq .L25
	cmp.b #-69,%d0
	jeq .L26
	cmp.b #-71,%d0
	jeq .L27
	move.b #65,__ZZ12convert_utf8PcE1c
	moveq #65,%d0
	addq.w #1,%d3
.L29:
	move.l %d2,%a0
	add.l #__ZZ12convert_utf8PcE9converted,%a0
	move.b %d0,(%a0)
	move.w %d2,%d0
	addq.w #1,%d0
	move.w %d0,__ZZ12convert_utf8PcE1j
	addq.w #1,%d3
	move.w %d3,__ZZ12convert_utf8PcE1i
	addq.l #1,%d2
	jra .L28
.L22:
	move.b #41,__ZZ12convert_utf8PcE1c
	moveq #41,%d0
	addq.w #1,%d3
	jra .L29
.L23:
	move.b #36,__ZZ12convert_utf8PcE1c
	moveq #36,%d0
	addq.w #1,%d3
	jra .L29
.L24:
	move.b #60,__ZZ12convert_utf8PcE1c
	moveq #60,%d0
	addq.w #1,%d3
	jra .L29
.L25:
	move.b #43,__ZZ12convert_utf8PcE1c
	moveq #43,%d0
	addq.w #1,%d3
	jra .L29
.L26:
	move.b #125,__ZZ12convert_utf8PcE1c
	moveq #125,%d0
	addq.w #1,%d3
	jra .L29
.L27:
	move.b #126,__ZZ12convert_utf8PcE1c
	moveq #126,%d0
	addq.w #1,%d3
	jra .L29
.LC0:
	.ascii "Press fire to start              \0"
.LC1:
	.ascii "Appuyez sur le feu pour commencer\0"
.LC2:
	.ascii "Premi il fuoco per iniziare      \0"
.LC3:
	.ascii "Hi   \0"
.LC4:
	.ascii "Salut\0"
.LC5:
	.ascii "Ciao \0"
.LC6:
	.ascii "Bye      \0"
.LC7:
	.ascii "Au revoir\0"
.LC8:
	.ascii "Addio    \0"
.LC9:
	.ascii "You win    \0"
.LC10:
	.ascii "Vous gagnez\0"
.LC11:
	.ascii "Hai vinto  \0"
.LC12:
	.ascii "You lose   \0"
.LC13:
	.ascii "Tu as perdu\0"
.LC14:
	.ascii "Hai presso \0"
.LC15:
	.ascii "Get ready\0"
.LC16:
	.ascii "Sois pret\0"
.LC17:
	.ascii "Preparati\0"
.LC18:
	.ascii "Press A,B,C to switch languages\0"
.LC19:
	.ascii "Special characters can work... \303\252\303\242\303\256\303\264\303\273\303\271\0"
	.even
	.globl	__Z9basicmainv
__Z9basicmainv:
	link.w %fp,#0
	movem.l #12348,-(%sp)
	clr.l _jsfFontIndx
	clr.l _jsfFontSize
	clr.l __ZL8language
	pea 34.w
	pea .LC0
	pea __ZL17message_pressfire
	lea _memcpy,%a2
	jsr (%a2)
	pea 34.w
	pea .LC1
	pea __ZL17message_pressfire+40
	jsr (%a2)
	pea 34.w
	pea .LC2
	pea __ZL17message_pressfire+80
	jsr (%a2)
	lea (36,%sp),%sp
	pea 6.w
	pea .LC3
	pea __ZL8messages
	jsr (%a2)
	pea 6.w
	pea .LC4
	pea __ZL8messages+240
	jsr (%a2)
	pea 6.w
	pea .LC5
	pea __ZL8messages+480
	jsr (%a2)
	lea (36,%sp),%sp
	pea 10.w
	pea .LC6
	pea __ZL8messages+48
	jsr (%a2)
	pea 10.w
	pea .LC7
	pea __ZL8messages+288
	jsr (%a2)
	pea 10.w
	pea .LC8
	pea __ZL8messages+528
	jsr (%a2)
	lea (36,%sp),%sp
	pea 12.w
	pea .LC9
	pea __ZL8messages+96
	jsr (%a2)
	pea 12.w
	pea .LC10
	pea __ZL8messages+336
	jsr (%a2)
	pea 12.w
	pea .LC11
	pea __ZL8messages+576
	jsr (%a2)
	lea (36,%sp),%sp
	pea 12.w
	pea .LC12
	pea __ZL8messages+144
	jsr (%a2)
	pea 12.w
	pea .LC13
	pea __ZL8messages+384
	jsr (%a2)
	pea 12.w
	pea .LC14
	pea __ZL8messages+624
	jsr (%a2)
	lea (36,%sp),%sp
	pea 10.w
	pea .LC15
	pea __ZL8messages+192
	jsr (%a2)
	pea 10.w
	pea .LC16
	pea __ZL8messages+432
	jsr (%a2)
	pea 10.w
	pea .LC17
	pea __ZL8messages+672
	jsr (%a2)
	lea (32,%sp),%sp
	clr.l (%sp)
	clr.l -(%sp)
	lea rapLocate,%a3
	jsr (%a3)
	move.l #.LC18,_js_r_textbuffer
	addq.l #8,%sp
	lea _rapPrint,%a2
	jsr (%a2)
	pea 190.w
	clr.l -(%sp)
	jsr (%a3)
	pea .LC19
	lea __Z12convert_utf8Pc,%a4
	jsr (%a4)
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	jsr (%a2)
	clr.l __ZL4pad1
	move.l #_jsfVsync,%d2
	lea jsfGetPad,%a5
.L36:
	clr.l -(%sp)
	move.l %d2,%a0
	jsr (%a0)
	moveq #1,%d0
	move.l %d0,(%sp)
	jsr (%a5)
	move.l %d0,__ZL4pad1
	move.l %d0,%d1
	and.l JAGPAD_C,%d1
	addq.l #4,%sp
	jeq .L32
	clr.l __ZL8language
.L33:
	pea 16.w
	clr.l -(%sp)
	jsr (%a3)
	move.l __ZL8language,%d1
	move.l %d1,%d0
	add.l %d1,%d0
	add.l %d0,%d0
	add.l %d1,%d0
	lsl.l #3,%d0
	add.l #__ZL17message_pressfire,%d0
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	clr.w __ZL1i
	clr.w %d0
.L35:
	ext.l %d0
	lsl.l #3,%d0
	move.l %d0,%a0
	pea 32(%a0)
	clr.l -(%sp)
	jsr (%a3)
	move.w __ZL1i,%a0
	move.l %a0,%d3
	add.l %a0,%d3
	add.l %a0,%d3
	lsl.l #4,%d3
	move.l __ZL8language,%d0
	lsl.l #4,%d0
	move.l %d0,%d1
	lsl.l #4,%d1
	sub.l %d0,%d1
	add.l %d3,%d1
	add.l #__ZL8messages,%d1
	move.l %d1,-(%sp)
	jsr (%a4)
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	jsr (%a2)
	move.w __ZL1i,%d0
	addq.w #1,%d0
	move.w %d0,__ZL1i
	cmp.w #5,%d0
	jgt .L36
	ext.l %d0
	lsl.l #3,%d0
	move.l %d0,%a0
	pea 32(%a0)
	clr.l -(%sp)
	jsr (%a3)
	move.w __ZL1i,%a0
	move.l %a0,%d3
	add.l %a0,%d3
	add.l %a0,%d3
	lsl.l #4,%d3
	move.l __ZL8language,%d0
	lsl.l #4,%d0
	move.l %d0,%d1
	lsl.l #4,%d1
	sub.l %d0,%d1
	add.l %d3,%d1
	add.l #__ZL8messages,%d1
	move.l %d1,-(%sp)
	jsr (%a4)
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	jsr (%a2)
	move.w __ZL1i,%d0
	addq.w #1,%d0
	move.w %d0,__ZL1i
	cmp.w #5,%d0
	jle .L35
	jra .L36
.L32:
	move.l %d0,%d1
	and.l JAGPAD_B,%d1
	jeq .L34
	moveq #1,%d0
	move.l %d0,__ZL8language
	pea 16.w
	clr.l -(%sp)
	jsr (%a3)
	move.l __ZL8language,%d1
	move.l %d1,%d0
	add.l %d1,%d0
	add.l %d0,%d0
	add.l %d1,%d0
	lsl.l #3,%d0
	add.l #__ZL17message_pressfire,%d0
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	clr.w __ZL1i
	clr.w %d0
	jra .L35
.L34:
	and.l JAGPAD_A,%d0
	jeq .L33
	moveq #2,%d0
	move.l %d0,__ZL8language
	pea 16.w
	clr.l -(%sp)
	jsr (%a3)
	move.l __ZL8language,%d1
	move.l %d1,%d0
	add.l %d1,%d0
	add.l %d0,%d0
	add.l %d1,%d0
	lsl.l #3,%d0
	add.l #__ZL17message_pressfire,%d0
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	clr.w __ZL1i
	clr.w %d0
	jra .L35
	.globl	_BCX_TmpStr_buffer
	.bss
_BCX_TmpStr_buffer:
	.skip 256
	.globl	colliders
	.data
	.even
colliders:
	.long	raptor_collisionlist
	.globl	sprite
	.even
sprite:
	.long	RAPTOR_sprite_table
.lcomm __ZL8language,4
.lcomm __ZL17message_pressfire,120
.lcomm __ZL8messages,720
.lcomm __ZL4pad1,4
.lcomm __ZL1i,2
.lcomm __ZZ12convert_utf8PcE1c,2
.lcomm __ZZ12convert_utf8PcE1d,2
.lcomm __ZZ12convert_utf8PcE1i,2
.lcomm __ZZ12convert_utf8PcE1j,2
.lcomm __ZZ12convert_utf8PcE9converted,2048
