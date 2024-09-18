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
.lcomm __ZL4pad1,4
.lcomm __ZL12musicPlaying,2
	.text
.LC0:
	.ascii "          JagStudio - Zero Test         \0"
.LC1:
	.ascii "1   : Play SFX on channel 1\0"
.LC2:
	.ascii "2   : Play Looping SFX on channel 2\0"
.LC3:
	.ascii "3   : Start / Stop MuLaw Music\0"
.LC4:
	.ascii "4   : Start / Stop MuLaw Music\0"
.LC5:
	.ascii "0   : Stop all sound\0"
	.even
	.globl	__Z9basicmainv
__Z9basicmainv:
	link.w %fp,#0
	movem.l #8252,-(%sp)
	moveq #1,%d0
	move.l %d0,_jsfFontIndx
	move.l %d0,_jsfFontSize
	pea 182.w
	clr.l -(%sp)
	lea rapLocate,%a3
	jsr (%a3)
	move.l #.LC0,_js_r_textbuffer
	addq.l #8,%sp
	lea _rapPrint,%a2
	jsr (%a2)
	clr.l _jsfFontIndx
	clr.l _jsfFontSize
	clr.l __ZL4pad1
	pea 10.w
	pea 20.w
	jsr (%a3)
	move.l #.LC1,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	pea 40.w
	pea 20.w
	jsr (%a3)
	move.l #.LC2,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	pea 70.w
	pea 20.w
	jsr (%a3)
	move.l #.LC3,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	pea 100.w
	pea 20.w
	jsr (%a3)
	move.l #.LC4,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	pea 130.w
	pea 20.w
	jsr (%a3)
	move.l #.LC5,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	clr.b __ZL12musicPlaying
	lea jsfGetPadPressed,%a4
	lea zeroClearChannel,%a2
	lea zeroPlay,%a5
	move.l #zeroPlaySample,%d2
	lea _jsfVsync,%a3
	pea 1.w
	jsr (%a4)
	move.l %d0,__ZL4pad1
	move.l %d0,%d1
	and.l JAGPAD_1,%d1
	addq.l #4,%sp
	jne .L11
.L2:
	move.l %d0,%d1
	and.l JAGPAD_2,%d1
	jne .L12
.L3:
	move.l %d0,%d1
	and.l JAGPAD_3,%d1
	jne .L13
.L4:
	move.l %d0,%d1
	and.l JAGPAD_4,%d1
	jne .L14
.L6:
	and.l JAGPAD_0,%d0
	jne .L15
.L8:
	clr.l -(%sp)
	jsr (%a3)
	addq.l #4,%sp
.L16:
	pea 1.w
	jsr (%a4)
	move.l %d0,__ZL4pad1
	move.l %d0,%d1
	and.l JAGPAD_1,%d1
	addq.l #4,%sp
	jeq .L2
	jra .L11
.L15:
	pea 1.w
	jsr (%a2)
	moveq #2,%d0
	move.l %d0,(%sp)
	jsr (%a2)
	moveq #3,%d1
	move.l %d1,(%sp)
	jsr (%a2)
	moveq #4,%d0
	move.l %d0,(%sp)
	jsr (%a2)
	clr.b __ZL12musicPlaying
	addq.l #4,%sp
	clr.l -(%sp)
	jsr (%a3)
	addq.l #4,%sp
	jra .L16
.L14:
	pea 3.w
	jsr (%a2)
	move.b __ZL12musicPlaying,%d0
	addq.b #1,%d0
	and.b #1,%d0
	move.b %d0,__ZL12musicPlaying
	addq.l #4,%sp
	jne .L7
	pea 4.w
	jsr (%a2)
	move.l __ZL4pad1,%d0
	addq.l #4,%sp
	and.l JAGPAD_0,%d0
	jeq .L8
	jra .L15
.L13:
	pea 4.w
	jsr (%a2)
	move.b __ZL12musicPlaying,%d0
	addq.b #1,%d0
	and.b #1,%d0
	move.b %d0,__ZL12musicPlaying
	addq.l #4,%sp
	jne .L5
	pea 3.w
	jsr (%a2)
	move.l __ZL4pad1,%d0
	addq.l #4,%sp
	move.l %d0,%d1
	and.l JAGPAD_4,%d1
	jeq .L6
	jra .L14
.L12:
	pea 1.w
	jsr (%a2)
	move.l #536870912,(%sp)
	pea 2.w
	pea explode_sam_end
	pea explode_sam
	pea 2.w
	jsr (%a5)
	move.l __ZL4pad1,%d0
	lea (20,%sp),%sp
	move.l %d0,%d1
	and.l JAGPAD_3,%d1
	jeq .L4
	jra .L13
.L11:
	pea 2.w
	jsr (%a2)
	clr.l (%sp)
	pea 5.w
	pea explode_sam_end
	pea explode_sam
	pea 1.w
	jsr (%a5)
	move.l __ZL4pad1,%d0
	lea (20,%sp),%sp
	move.l %d0,%d1
	and.l JAGPAD_2,%d1
	jeq .L3
	jra .L12
.L7:
	move.l #-1610612736,-(%sp)
	pea 2.w
	move.l #12672836,-(%sp)
	move.l #8397488,-(%sp)
	pea 4.w
	jsr (%a5)
	move.l __ZL4pad1,%d0
	lea (20,%sp),%sp
	and.l JAGPAD_0,%d0
	jeq .L8
	jra .L15
.L5:
	move.l #-1610612736,-(%sp)
	pea 2.w
	move.l #4275348,-(%sp)
	move.l #8397488,-(%sp)
	pea 3.w
	move.l %d2,%a0
	jsr (%a0)
	move.l __ZL4pad1,%d0
	lea (20,%sp),%sp
	move.l %d0,%d1
	and.l JAGPAD_4,%d1
	jeq .L6
	jra .L14
	.globl	_BCX_TmpStr_buffer
	.bss
_BCX_TmpStr_buffer:
	.skip 256
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
	lea (12,%fp),%a2
	lea _strcat,%a3
	tst.l %d2
	jle .L28
.L25:
	move.l %a2,%a0
	addq.l #4,%a2
	move.l (%a0),%d0
	jeq .L24
	move.l %d0,-(%sp)
	pea _BCX_TmpStr_buffer
	jsr (%a3)
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
