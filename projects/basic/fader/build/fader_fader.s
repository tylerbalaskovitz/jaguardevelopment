#NO_APP
	.text
.LC0:
	.ascii "JagStudio\0"
	.even
	.globl	__Z9basicmainv
__Z9basicmainv:
	link.w %fp,#0
	move.l %a3,-(%sp)
	move.l %a2,-(%sp)
	moveq #1,%d0
	move.l %d0,_jsfFontIndx
	move.l %d0,_jsfFontSize
	move.w #1,raptor_fade_delay
	pea 192.w
	pea 130.w
	jsr rapLocate
	move.l #.LC0,_js_r_textbuffer
	addq.l #8,%sp
	jsr _rapPrint
	lea __ZL8blankpal,%a0
.L2:
	clr.l (%a0)+
	cmp.l #__ZL8blankpal+512,%a0
	jne .L2
	move.l #128,__ZL1i
	pea 256.w
	clr.l -(%sp)
	pea __ZL8blankpal
	jsr jsfLoadClut
	lea (12,%sp),%sp
	lea rapFadeClut,%a3
	lea _jsfVsync,%a2
.L5:
	clr.l __ZL1i
.L3:
	pea LOGO_clut
	pea 256.w
	clr.l -(%sp)
	jsr (%a3)
	addq.l #8,%sp
	clr.l (%sp)
	jsr (%a2)
	move.l __ZL1i,%d0
	addq.l #1,%d0
	move.l %d0,__ZL1i
	addq.l #4,%sp
	moveq #60,%d1
	cmp.l %d0,%d1
	jge .L3
	clr.l __ZL1i
.L4:
	pea __ZL8blankpal
	pea 256.w
	clr.l -(%sp)
	jsr (%a3)
	addq.l #8,%sp
	clr.l (%sp)
	jsr (%a2)
	move.l __ZL1i,%d0
	addq.l #1,%d0
	move.l %d0,__ZL1i
	addq.l #4,%sp
	moveq #60,%d1
	cmp.l %d0,%d1
	jlt .L5
	pea __ZL8blankpal
	pea 256.w
	clr.l -(%sp)
	jsr (%a3)
	addq.l #8,%sp
	clr.l (%sp)
	jsr (%a2)
	move.l __ZL1i,%d0
	addq.l #1,%d0
	move.l %d0,__ZL1i
	addq.l #4,%sp
	moveq #60,%d1
	cmp.l %d0,%d1
	jge .L4
	jra .L5
	.globl	colliders
	.data
	.even
colliders:
	.long	raptor_collisionlist
	.globl	sprite
	.even
sprite:
	.long	RAPTOR_sprite_table
.lcomm __ZL1i,4
.lcomm __ZL8blankpal,512
