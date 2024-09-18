#NO_APP
	.globl	sprite
	.data
	.even
sprite:
	.long	RAPTOR_sprite_table
	.globl	colliders
	.even
colliders:
	.long	raptor_collisionlist
	.text
.LC0:
	.ascii "Z-Sorting\0"
	.even
	.globl	__Z9basicmainv
__Z9basicmainv:
	link.w %fp,#0
	movem.l #8240,-(%sp)
	moveq #1,%d0
	move.l %d0,_jsfFontIndx
	move.l %d0,_jsfFontSize
	pea 192.w
	pea 130.w
	jsr rapLocate
	move.l #.LC0,_js_r_textbuffer
	addq.l #8,%sp
	jsr _rapPrint
	move.l sprite,%a0
	move.l 428(%a0),%d0
	moveq #115,%d1
	not.b %d1
	move.w %d1,392(%a0)
	move.w %d1,396(%a0)
	move.w #126,584(%a0)
	move.w #126,588(%a0)
	move.l %d0,%d1
	add.l #2048,%d1
	move.l %d1,620(%a0)
	move.w #112,776(%a0)
	move.w #112,780(%a0)
	add.l #2048,%d1
	move.l %d1,812(%a0)
	move.w #98,968(%a0)
	move.w #98,972(%a0)
	add.l #2048,%d1
	move.l %d1,1004(%a0)
	move.w #84,1160(%a0)
	move.w #84,1164(%a0)
	add.l #2048,%d1
	move.l %d1,1196(%a0)
	move.w #70,1352(%a0)
	move.w #70,1356(%a0)
	add.l #2048,%d1
	move.l %d1,1388(%a0)
	move.w #56,1544(%a0)
	move.w #56,1548(%a0)
	add.l #2048,%d1
	move.l %d1,1580(%a0)
	move.w #42,1736(%a0)
	move.w #42,1740(%a0)
	add.l #2048,%d1
	move.l %d1,1772(%a0)
	moveq #28,%d1
	move.l %d1,__ZZ9basicmainvE8position
	add.l #16384,%d0
	move.l %d0,__ZZ9basicmainvE3gfx
	moveq #8,%d0
	move.l %d0,__ZZ9basicmainvE1i
	lea rapSortSprites,%a3
	lea _jsfVsync,%a2
	pea -1.w
	pea 8.w
	pea 12.w
	pea 2.w
	jsr (%a3)
	clr.l __ZZ9basicmainvE1i
	move.l sprite,%d2
	lea (16,%sp),%sp
	sub.l %a1,%a1
	moveq #0,%d0
	moveq #0,%d1
.L4:
	move.l %d1,%a0
	add.l %d1,%a0
	add.l %a0,%d1
	lsl.l #6,%d1
	add.l #384,%d1
	move.l %d2,%a0
	add.l %d1,%a0
	move.w 12(%a0),%d1
	cmp.w #29,%d1
	jgt .L2
.L9:
	neg.l 20(%a0)
.L3:
	addq.l #1,%d0
	moveq #7,%d1
	cmp.l %d0,%d1
	jlt .L8
.L6:
	move.l %d0,%a1
	move.l %d0,%d1
	move.l %d1,%a0
	add.l %d1,%a0
	add.l %a0,%d1
	lsl.l #6,%d1
	add.l #384,%d1
	move.l %d2,%a0
	add.l %d1,%a0
	move.w 12(%a0),%d1
	cmp.w #29,%d1
	jle .L9
.L2:
	cmp.w #150,%d1
	jle .L3
	neg.l 20(%a0)
	move.l %a1,%d0
	addq.l #1,%d0
	moveq #7,%d1
	cmp.l %d0,%d1
	jge .L6
.L8:
	move.l %d0,__ZZ9basicmainvE1i
	clr.l -(%sp)
	jsr (%a2)
	addq.l #4,%sp
	pea -1.w
	pea 8.w
	pea 12.w
	pea 2.w
	jsr (%a3)
	clr.l __ZZ9basicmainvE1i
	move.l sprite,%d2
	lea (16,%sp),%sp
	sub.l %a1,%a1
	moveq #0,%d0
	moveq #0,%d1
	jra .L4
.lcomm __ZZ9basicmainvE8position,4
.lcomm __ZZ9basicmainvE3gfx,4
.lcomm __ZZ9basicmainvE1i,4
