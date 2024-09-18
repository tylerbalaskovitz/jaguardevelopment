#NO_APP
	.text
.LC0:
	.ascii "Collision List\0"
	.even
	.globl	__Z9basicmainv
__Z9basicmainv:
	link.w %fp,#-12
	movem.l #14396,-(%sp)
	moveq #1,%d0
	move.l %d0,_jsfFontIndx
	move.l %d0,_jsfFontSize
	pea 202.w
	pea 100.w
	jsr rapLocate
	move.l #.LC0,_js_r_textbuffer
	addq.l #8,%sp
	jsr _rapPrint
	moveq #1,%d1
	move.l %d1,__ZL1i
	move.l sprite,%a0
	moveq #1,%d0
	lea RAPTOR_random,%a3
	lea _rand,%a5
	lea ___floatsisf,%a4
	lea ___mulsf3,%a2
	move.l #___subsf3,%d3
	move.l #___fixsfsi,%d2
.L2:
	move.l %d0,%d1
	add.l %d0,%d1
	add.l %d1,%d0
	lsl.l #6,%d0
	moveq #1,%d4
	move.l %d4,4(%a0,%d0.l)
	move.l sprite,%a0
	add.l %d0,%a0
	move.l %a0,-12(%fp)
	jsr (%a3)
	move.l -12(%fp),%a0
	and.w #255,%d0
	move.w %d0,8(%a0)
	move.l __ZL1i,%d0
	move.l %d0,%d1
	add.l %d0,%d1
	add.l %d1,%d0
	lsl.l #6,%d0
	move.l sprite,%a0
	add.l %d0,%a0
	move.l %a0,-12(%fp)
	jsr (%a3)
	move.l -12(%fp),%a0
	and.w #255,%d0
	move.w %d0,12(%a0)
	move.l __ZL1i,%d0
	move.l %d0,%d1
	add.l %d0,%d1
	add.l %d1,%d0
	lsl.l #6,%d0
	move.l sprite,%a0
	add.l %d0,%a0
	move.l %a0,-12(%fp)
	jsr (%a5)
	move.l %d0,-4(%fp)
	jsr (%a5)
	move.l %d0,-8(%fp)
	move.l -4(%fp),-(%sp)
	jsr (%a4)
	move.l #0x30000000,(%sp)
	move.l %d0,-(%sp)
	jsr (%a2)
	addq.l #8,%sp
	move.l %d0,-4(%fp)
	move.l -8(%fp),-(%sp)
	jsr (%a4)
	move.l #0x30000000,(%sp)
	move.l %d0,-(%sp)
	jsr (%a2)
	addq.l #4,%sp
	move.l %d0,(%sp)
	move.l -4(%fp),-(%sp)
	move.l %d3,%a1
	jsr (%a1)
	addq.l #4,%sp
	move.l #0x48800000,(%sp)
	move.l %d0,-(%sp)
	jsr (%a2)
	addq.l #4,%sp
	move.l %d0,(%sp)
	move.l %d2,%a1
	jsr (%a1)
	addq.l #4,%sp
	move.l -12(%fp),%a0
	move.l %d0,16(%a0)
	move.l __ZL1i,%d0
	move.l %d0,%d1
	add.l %d0,%d1
	add.l %d1,%d0
	lsl.l #6,%d0
	move.l sprite,%a0
	add.l %d0,%a0
	move.l %a0,-12(%fp)
	jsr (%a5)
	move.l %d0,-4(%fp)
	jsr (%a5)
	move.l %d0,-8(%fp)
	move.l -4(%fp),-(%sp)
	jsr (%a4)
	move.l #0x30000000,(%sp)
	move.l %d0,-(%sp)
	jsr (%a2)
	addq.l #8,%sp
	move.l %d0,-4(%fp)
	move.l -8(%fp),-(%sp)
	jsr (%a4)
	move.l #0x30000000,(%sp)
	move.l %d0,-(%sp)
	jsr (%a2)
	addq.l #4,%sp
	move.l %d0,(%sp)
	move.l -4(%fp),-(%sp)
	move.l %d3,%a1
	jsr (%a1)
	addq.l #4,%sp
	move.l #0x48800000,(%sp)
	move.l %d0,-(%sp)
	jsr (%a2)
	addq.l #4,%sp
	move.l %d0,(%sp)
	move.l %d2,%a1
	jsr (%a1)
	addq.l #4,%sp
	move.l -12(%fp),%a0
	move.l %d0,20(%a0)
	move.l sprite,%a0
	move.l __ZL1i,%d0
	move.l %d0,%d1
	add.l %d0,%d1
	add.l %d0,%d1
	lsl.l #6,%d1
	move.l %d4,80(%a0,%d1.l)
	addq.l #1,%d0
	move.l %d0,__ZL1i
	moveq #30,%d1
	cmp.l %d0,%d1
	jge .L2
	lea rapCollide,%a5
	lea _jsfVsync,%a4
.L8:
	pea 30.w
	pea 1.w
	pea 30.w
	pea 1.w
	jsr (%a5)
	move.l %d0,__ZL15globalCollision
	lea (16,%sp),%sp
	jlt .L3
	clr.l __ZL1i
	moveq #0,%d1
	move.l colliders,%a1
.L12:
	move.l %d1,%d0
	lsl.l #3,%d0
	move.l (%a1,%d0.l),%a0
	move.l %a0,__ZL16collisionSprAddr
	jlt .L5
.L16:
	move.l 188(%a0),%d0
	move.l %d0,__ZL17collisionSprIndex
	move.l %d0,%a2
	add.l %d0,%a2
	add.l %a2,%d0
	lsl.l #6,%d0
	move.l sprite,%a2
	add.l %d0,%a2
	tst.l 56(%a2)
	jeq .L15
	addq.l #1,%d1
	move.l %d1,__ZL1i
	move.l %d1,%d0
	lsl.l #3,%d0
	move.l (%a1,%d0.l),%a0
	move.l %a0,__ZL16collisionSprAddr
	jge .L16
.L5:
	addq.l #1,%d1
	move.l %d1,__ZL1i
.L3:
	clr.l -(%sp)
	jsr (%a4)
	addq.l #4,%sp
	jra .L8
.L15:
	moveq #9,%d4
	move.l %d4,56(%a2)
	jsr (%a3)
	move.l %d0,%d2
	jsr (%a3)
	move.w %d2,%d1
	and.w #3,%d1
	and.w #3,%d0
	sub.w %d0,%d1
	move.w %d1,16(%a2)
	move.l __ZL17collisionSprIndex,%d0
	move.l %d0,%a2
	add.l %d0,%a2
	add.l %a2,%d0
	lsl.l #6,%d0
	move.l sprite,%a2
	add.l %d0,%a2
	jsr (%a3)
	move.l %d0,%d2
	jsr (%a3)
	move.w %d2,%d1
	and.w #3,%d1
	and.w #3,%d0
	sub.w %d0,%d1
	move.w %d1,20(%a2)
	move.l __ZL1i,%d1
	addq.l #1,%d1
	move.l %d1,__ZL1i
	tst.l __ZL16collisionSprAddr
	jlt .L3
	move.l colliders,%a1
	jra .L12
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
	.globl	__Z4joiniz
__Z4joiniz:
	link.w %fp,#0
	movem.l #14384,-(%sp)
	lea (12,%fp),%a0
	move.l 8(%fp),%d2
	move.l %d2,%d3
	moveq #0,%d4
	lea _strlen,%a3
	tst.l %d3
	jle .L27
.L22:
	lea (4,%a0),%a2
	move.l (%a0),%d0
	jeq .L21
	move.l %d0,-(%sp)
	jsr (%a3)
	addq.l #4,%sp
	add.l %d0,%d4
.L21:
	subq.l #1,%d3
	move.l %a2,%a0
	tst.l %d3
	jgt .L22
.L27:
	lea _BCX_TmpStr_buffer,%a0
	clr.b (%a0,%d4.l)
	moveq #12,%d3
	add.l %fp,%d3
	lea _strcat,%a2
	tst.l %d2
	jle .L28
.L25:
	move.l %d3,%a0
	addq.l #4,%d3
	move.l (%a0),%d0
	jeq .L24
	move.l %d0,-(%sp)
	pea _BCX_TmpStr_buffer
	jsr (%a2)
	addq.l #8,%sp
.L24:
	subq.l #1,%d2
	tst.l %d2
	jgt .L25
.L28:
	move.l #_BCX_TmpStr_buffer,%d0
	movem.l -20(%fp),#3100
	unlk %fp
	rts
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
.lcomm __ZL1i,4
.lcomm __ZL15globalCollision,4
.lcomm __ZL16collisionSprAddr,4
.lcomm __ZL17collisionSprIndex,4
