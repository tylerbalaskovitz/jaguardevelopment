#NO_APP
	.text
.LC0:
	.ascii "Jaguar GD\0"
.LC1:
	.ascii "GD Cart Detected\0"
.LC2:
	.ascii "GD Cart NOT Detected\0"
.LC3:
	.ascii "GD $:\0"
.LC4:
	.ascii "%s\0"
.LC5:
	.ascii "GD #:\0"
.LC6:
	.ascii "SD Card Inserted: \0"
.LC7:
	.ascii "YES\0"
.LC8:
	.ascii "NO\0"
.LC9:
	.ascii "ERR\0"
.LC10:
	.ascii "SD #:\0"
.LC11:
	.ascii "N/A\0"
.LC12:
	.ascii "A to Toggle LED\0"
.LC13:
	.ascii "C to Reset GD\0"
.LC14:
	.ascii "1 to Send Debug message to COM Port\0"
.LC15:
	.ascii "4 to Load a File\0"
.LC16:
	.ascii "5 to Save a File\0"
.LC17:
	.ascii "Load Success: N/A\0"
.LC18:
	.ascii "Save Success: N/A\0"
.LC19:
	.ascii "JagStudio GD Debug Print. Count: \0"
.LC20:
	.ascii "%s% d\15\0"
.LC21:
	.ascii "  \0"
.LC22:
	.ascii "Load Success:\0"
.LC23:
	.ascii "%s% d%s\0"
.LC24:
	.ascii "Save Success:\0"
.LC25:
	.ascii "CLEARED\0"
	.even
	.globl	__Z9basicmainv
__Z9basicmainv:
	link.w %fp,#0
	movem.l #16188,-(%sp)
	clr.l __ZL4pad1
	clr.b __ZL8ledState
	clr.l __ZL7counter
	moveq #1,%d0
	move.l %d0,_jsfFontIndx
	move.l %d0,_jsfFontSize
	pea 182.w
	pea 120.w
	move.l #rapLocate,%d2
	move.l %d2,%a0
	jsr (%a0)
	move.l #.LC0,_js_r_textbuffer
	addq.l #8,%sp
	move.l #_rapPrint,%d3
	move.l %d3,%a0
	jsr (%a0)
	clr.l _jsfFontSize
	clr.l _jsfFontIndx
	pea 20.w
	pea 20.w
	move.l %d2,%a0
	jsr (%a0)
	addq.l #8,%sp
	cmp.w #1,raptor_GD_detect.l
	jeq .L23
	move.l #.LC2,_js_r_textbuffer
	move.l %d3,%a0
	jsr (%a0)
.L3:
	jsr rapGDGetCartSerial
	pea 30.w
	pea 20.w
	move.l %d2,%a0
	jsr (%a0)
	clr.l _jsfFontIndx
	addq.l #4,%sp
	move.l #.LC3,(%sp)
	pea .LC4
	lea ee_printf,%a5
	jsr (%a5)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	lea _rapPrint,%a2
	move.l %d3,%a0
	jsr (%a0)
	pea 30.w
	pea 60.w
	move.l %d2,%a0
	jsr (%a0)
	moveq #1,%d0
	move.l %d0,_jsfFontIndx
	addq.l #4,%sp
	move.l #raptor_GD_ASERIAL,(%sp)
	pea .LC4
	jsr (%a5)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	move.l %d3,%a0
	jsr (%a0)
	clr.l _jsfFontIndx
	pea 40.w
	pea 20.w
	move.l %d2,%a0
	jsr (%a0)
	clr.l _jsfFontIndx
	move.l #.LC5,_js_r_textbuffer
	addq.l #8,%sp
	move.l %d3,%a0
	jsr (%a0)
	pea 40.w
	pea 60.w
	move.l %d2,%a0
	jsr (%a0)
	moveq #1,%d0
	move.l %d0,_jsfFontIndx
	addq.l #4,%sp
	move.l #__ZL12serialString,(%sp)
	pea raptor_GD_SERIAL
	pea 16.w
	lea rapHexToStr,%a4
	jsr (%a4)
	addq.l #8,%sp
	move.l #__ZL12serialString,(%sp)
	pea .LC4
	jsr (%a5)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	move.l %d3,%a0
	jsr (%a0)
	clr.l _jsfFontIndx
	pea 50.w
	pea 20.w
	move.l %d2,%a0
	jsr (%a0)
	move.l #.LC6,_js_r_textbuffer
	addq.l #8,%sp
	move.l %d3,%a0
	jsr (%a0)
	pea 50.w
	pea 170.w
	move.l %d2,%a0
	jsr (%a0)
	moveq #1,%d0
	move.l %d0,_jsfFontIndx
	addq.l #8,%sp
	jsr rapGDCardInserted
	move.w %d0,__ZL12cardInserted
	cmp.w #1,%d0
	jeq .L24
	tst.w %d0
	jne .L6
	move.l #.LC8,_js_r_textbuffer
	jsr (%a2)
.L5:
	pea 60.w
	pea 20.w
	move.l %d2,%a0
	jsr (%a0)
	clr.l _jsfFontIndx
	addq.l #4,%sp
	move.l #.LC10,(%sp)
	pea .LC4
	lea ee_printf,%a3
	jsr (%a5)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	lea _rapPrint,%a2
	move.l %d3,%a0
	jsr (%a0)
	moveq #1,%d0
	move.l %d0,_jsfFontIndx
	pea 60.w
	pea 60.w
	move.l %d2,%a0
	jsr (%a0)
	addq.l #8,%sp
	cmp.w #1,__ZL12cardInserted.l
	jeq .L25
	pea .LC11
	pea .LC4
	jsr (%a3)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	pea 110.w
	pea 20.w
	move.l %d2,%a0
	jsr (%a0)
	clr.l _jsfFontIndx
	move.l #.LC12,_js_r_textbuffer
	addq.l #8,%sp
	move.l %d3,%a0
	jsr (%a0)
	pea 120.w
	pea 20.w
	move.l %d2,%a0
	jsr (%a0)
	clr.l _jsfFontIndx
	move.l #.LC13,_js_r_textbuffer
	addq.l #8,%sp
	move.l %d3,%a0
	jsr (%a0)
	pea 130.w
	pea 20.w
	move.l %d2,%a0
	jsr (%a0)
	clr.l _jsfFontIndx
	move.l #.LC14,_js_r_textbuffer
	addq.l #8,%sp
	move.l %d3,%a0
	jsr (%a0)
	pea 140.w
	pea 20.w
	move.l %d2,%a0
	jsr (%a0)
	clr.l _jsfFontIndx
	move.l #.LC15,_js_r_textbuffer
	addq.l #8,%sp
	move.l %d3,%a0
	jsr (%a0)
	pea 150.w
	pea 20.w
	move.l %d2,%a0
	jsr (%a0)
	clr.l _jsfFontIndx
	move.l #.LC16,_js_r_textbuffer
	addq.l #8,%sp
	move.l %d3,%a0
	jsr (%a0)
	clr.l _jsfFontIndx
	pea 70.w
	pea 20.w
	move.l %d2,%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l #.LC17,(%sp)
	pea .LC4
	jsr (%a5)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	move.l %d3,%a0
	jsr (%a0)
	pea 80.w
	pea 20.w
	move.l %d2,%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l #.LC18,(%sp)
	pea .LC4
	jsr (%a5)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	move.l %d3,%a0
	jsr (%a0)
	lea _jsfVsync,%a3
	lea jsfGetPadPressed,%a2
	move.l #rapGDSetLEDOn,%d5
	lea rapGDSetLEDOff,%a4
	move.l #rapGDReset,%d4
	move.l #rapGDDebugPrint,%d6
	move.l #rapGDLoadFile,%d7
.L19:
	addq.l #1,__ZL7counter
	clr.l -(%sp)
	jsr (%a3)
	moveq #1,%d1
	move.l %d1,(%sp)
	jsr (%a2)
	move.l %d0,__ZL4pad1
	move.l %d0,%d1
	and.l JAGPAD_A,%d1
	addq.l #4,%sp
	jeq .L10
.L27:
	move.b __ZL8ledState,%d0
	addq.b #1,%d0
	and.b #1,%d0
	move.b %d0,__ZL8ledState
	cmp.b #1,%d0
	jeq .L26
	jsr (%a4)
	addq.l #1,__ZL7counter
	clr.l -(%sp)
	jsr (%a3)
	moveq #1,%d1
	move.l %d1,(%sp)
	jsr (%a2)
	move.l %d0,__ZL4pad1
	move.l %d0,%d1
	and.l JAGPAD_A,%d1
	addq.l #4,%sp
	jne .L27
.L10:
	move.l %d0,%d1
	and.l JAGPAD_C,%d1
	jne .L28
	move.l %d0,%d1
	and.l JAGPAD_1,%d1
	jne .L29
	move.l %d0,%d1
	and.l JAGPAD_4,%d1
	jne .L30
	move.l %d0,%d1
	and.l JAGPAD_5,%d1
	jne .L31
	and.l JAGPAD_0,%d0
	jeq .L19
	pea __ZL9gfxBuffer
	move.l #168960,-(%sp)
	jsr jsfClearBuffer
	addq.l #8,%sp
	pea 90.w
	pea 20.w
	move.l %d2,%a0
	jsr (%a0)
	clr.l _jsfFontIndx
	addq.l #4,%sp
	move.l #.LC25,(%sp)
	pea .LC4
	jsr (%a5)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	move.l %d3,%a0
	jsr (%a0)
	jra .L19
.L28:
	pea 1.w
	move.l %d4,%a0
	jsr (%a0)
	addq.l #4,%sp
	jra .L19
.L26:
	move.l %d5,%a0
	jsr (%a0)
	jra .L19
.L29:
	move.l __ZL7counter,-(%sp)
	pea .LC19
	pea .LC20
	jsr (%a5)
	move.l %d0,_js_r_textbuffer
	lea (12,%sp),%sp
	move.l %d6,%a0
	jsr (%a0)
	jra .L19
.L30:
	move.b #92,__ZL8fullpath
	move.b #33,__ZL8fullpath+1
	move.b #76,__ZL8fullpath+2
	move.b #79,__ZL8fullpath+3
	move.b #71,__ZL8fullpath+4
	move.b #79,__ZL8fullpath+5
	move.b #46,__ZL8fullpath+6
	move.b #74,__ZL8fullpath+7
	move.b #65,__ZL8fullpath+8
	move.b #71,__ZL8fullpath+9
	clr.b __ZL8fullpath+10
	pea __ZL9gfxBuffer
	pea __ZL8fullpath
	move.l %d7,%a0
	jsr (%a0)
	move.l %d0,__ZL7success
	move.l sprite,%a0
	move.l #__ZL9gfxBuffer,44(%a0)
	clr.w 12(%a0)
	addq.l #8,%sp
	pea 70.w
	pea 20.w
	move.l %d2,%a0
	jsr (%a0)
	clr.l _jsfFontIndx
	addq.l #4,%sp
	move.l #.LC21,(%sp)
	move.l __ZL7success,-(%sp)
	pea .LC22
	pea .LC23
	jsr (%a5)
	move.l %d0,_js_r_textbuffer
	lea (16,%sp),%sp
	move.l %d3,%a0
	jsr (%a0)
	jra .L19
.L31:
	move.b #92,__ZL8fullpath
	move.b #33,__ZL8fullpath+1
	move.b #76,__ZL8fullpath+2
	move.b #79,__ZL8fullpath+3
	move.b #71,__ZL8fullpath+4
	move.b #79,__ZL8fullpath+5
	move.b #46,__ZL8fullpath+6
	move.b #83,__ZL8fullpath+7
	move.b #65,__ZL8fullpath+8
	move.b #86,__ZL8fullpath+9
	clr.b __ZL8fullpath+10
	move.l #168960,-(%sp)
	pea __ZL9gfxBuffer
	pea __ZL8fullpath
	jsr rapGDSaveFile
	move.l %d0,__ZL7success
	addq.l #8,%sp
	moveq #80,%d0
	move.l %d0,(%sp)
	pea 20.w
	move.l %d2,%a0
	jsr (%a0)
	clr.l _jsfFontIndx
	addq.l #4,%sp
	move.l #.LC21,(%sp)
	move.l __ZL7success,-(%sp)
	pea .LC24
	pea .LC23
	jsr (%a5)
	move.l %d0,_js_r_textbuffer
	lea (16,%sp),%sp
	move.l %d3,%a0
	jsr (%a0)
	jra .L19
.L25:
	jsr rapGDGetCardSerial
	pea __ZL12serialString
	pea raptor_SD_SERIAL
	pea 16.w
	jsr (%a4)
	addq.l #8,%sp
	move.l #__ZL12serialString,(%sp)
	pea .LC4
	jsr (%a3)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a2)
	pea 110.w
	pea 20.w
	move.l %d2,%a0
	jsr (%a0)
	clr.l _jsfFontIndx
	move.l #.LC12,_js_r_textbuffer
	addq.l #8,%sp
	move.l %d3,%a0
	jsr (%a0)
	pea 120.w
	pea 20.w
	move.l %d2,%a0
	jsr (%a0)
	clr.l _jsfFontIndx
	move.l #.LC13,_js_r_textbuffer
	addq.l #8,%sp
	move.l %d3,%a0
	jsr (%a0)
	pea 130.w
	pea 20.w
	move.l %d2,%a0
	jsr (%a0)
	clr.l _jsfFontIndx
	move.l #.LC14,_js_r_textbuffer
	addq.l #8,%sp
	move.l %d3,%a0
	jsr (%a0)
	pea 140.w
	pea 20.w
	move.l %d2,%a0
	jsr (%a0)
	clr.l _jsfFontIndx
	move.l #.LC15,_js_r_textbuffer
	addq.l #8,%sp
	move.l %d3,%a0
	jsr (%a0)
	pea 150.w
	pea 20.w
	move.l %d2,%a0
	jsr (%a0)
	clr.l _jsfFontIndx
	move.l #.LC16,_js_r_textbuffer
	addq.l #8,%sp
	move.l %d3,%a0
	jsr (%a0)
	clr.l _jsfFontIndx
	pea 70.w
	pea 20.w
	move.l %d2,%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l #.LC17,(%sp)
	pea .LC4
	jsr (%a5)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	move.l %d3,%a0
	jsr (%a0)
	pea 80.w
	pea 20.w
	move.l %d2,%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l #.LC18,(%sp)
	pea .LC4
	jsr (%a5)
	move.l %d0,_js_r_textbuffer
	addq.l #8,%sp
	move.l %d3,%a0
	jsr (%a0)
	lea _jsfVsync,%a3
	lea jsfGetPadPressed,%a2
	move.l #rapGDSetLEDOn,%d5
	lea rapGDSetLEDOff,%a4
	move.l #rapGDReset,%d4
	move.l #rapGDDebugPrint,%d6
	move.l #rapGDLoadFile,%d7
	jra .L19
.L6:
	move.l #.LC9,_js_r_textbuffer
	jsr (%a2)
	jra .L5
.L24:
	move.l #.LC7,_js_r_textbuffer
	jsr (%a2)
	jra .L5
.L23:
	move.l #.LC1,_js_r_textbuffer
	move.l %d3,%a0
	jsr (%a0)
	jra .L3
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
	jle .L42
.L37:
	lea (4,%a0),%a2
	move.l (%a0),%d0
	jeq .L36
	move.l %d0,-(%sp)
	jsr (%a3)
	addq.l #4,%sp
	add.l %d0,%d4
.L36:
	subq.l #1,%d3
	move.l %a2,%a0
	tst.l %d3
	jgt .L37
.L42:
	lea _BCX_TmpStr_buffer,%a0
	clr.b (%a0,%d4.l)
	moveq #12,%d3
	add.l %fp,%d3
	lea _strcat,%a2
	tst.l %d2
	jle .L43
.L40:
	move.l %d3,%a0
	addq.l #4,%d3
	move.l (%a0),%d0
	jeq .L39
	move.l %d0,-(%sp)
	pea _BCX_TmpStr_buffer
	jsr (%a2)
	addq.l #8,%sp
.L39:
	subq.l #1,%d2
	tst.l %d2
	jgt .L40
.L43:
	move.l #_BCX_TmpStr_buffer,%d0
	movem.l -20(%fp),#3100
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
.lcomm __ZL4pad1,4
.lcomm __ZL8ledState,2
.lcomm __ZL7counter,4
.lcomm __ZL12serialString,2048
.lcomm __ZL12cardInserted,2
.lcomm __ZL8fullpath,2048
.lcomm __ZL9gfxBuffer,168960
.lcomm __ZL7success,4
