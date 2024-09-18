#NO_APP
	.text
.LC0:
	.ascii "JagStudio\0"
.LC1:
	.ascii " LSP \0"
.LC2:
	.ascii "Test\0"
.LC3:
	.ascii "B        : Play SFX\0"
.LC4:
	.ascii "C        : Loop SFX\0"
.LC5:
	.ascii "2        : Restart Module\0"
.LC6:
	.ascii "3        : Toggle Module On/Off\0"
.LC7:
	.ascii "4        : Stop Module\0"
.LC8:
	.ascii "5        : Start Module\0"
.LC9:
	.ascii "A Pressed\0"
.LC10:
	.ascii "B Pressed\0"
.LC11:
	.ascii "C Pressed\0"
.LC12:
	.ascii "0 Pressed\0"
.LC13:
	.ascii "1 Pressed\0"
.LC14:
	.ascii "2 Pressed\0"
.LC15:
	.ascii "3 Pressed\0"
.LC16:
	.ascii "4 Pressed\0"
.LC17:
	.ascii "5 Pressed\0"
.LC18:
	.ascii "6 Pressed\0"
.LC19:
	.ascii "7 Pressed\0"
.LC20:
	.ascii "8 Pressed\0"
.LC21:
	.ascii "9 Pressed\0"
.LC22:
	.ascii "* Pressed\0"
.LC23:
	.ascii "# Pressed\0"
.LC24:
	.ascii "Option Pressed\0"
.LC25:
	.ascii "Pause Pressed\0"
.LC26:
	.ascii "Up Pressed\0"
.LC27:
	.ascii "Down Pressed\0"
.LC28:
	.ascii "Left Pressed\0"
.LC29:
	.ascii "Right Pressed\0"
.LC30:
	.ascii "              \0"
	.even
	.globl	__Z9basicmainv
__Z9basicmainv:
	link.w %fp,#0
	movem.l #16188,-(%sp)
	moveq #1,%d0
	move.l %d0,_jsfFontSize
	move.l %d0,_jsfFontIndx
	pea 200.w
	pea 80.w
	lea rapLocate,%a2
	jsr (%a2)
	move.l #.LC0,_js_r_textbuffer
	addq.l #8,%sp
	lea _rapPrint,%a3
	jsr (%a3)
	clr.l _jsfFontIndx
	move.l #.LC1,_js_r_textbuffer
	lea _rapPrintCont,%a4
	jsr (%a4)
	moveq #1,%d0
	move.l %d0,_jsfFontIndx
	move.l #.LC2,_js_r_textbuffer
	jsr (%a4)
	clr.l _jsfFontIndx
	clr.l _jsfFontSize
	clr.l __ZL4pad1
	pea 60.w
	pea 20.w
	jsr (%a2)
	move.l #.LC3,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a3)
	pea 80.w
	pea 20.w
	jsr (%a2)
	move.l #.LC4,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a3)
	pea 100.w
	pea 20.w
	jsr (%a2)
	move.l #.LC5,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a3)
	pea 120.w
	pea 20.w
	jsr (%a2)
	move.l #.LC6,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a3)
	pea 140.w
	pea 20.w
	jsr (%a2)
	move.l #.LC7,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a3)
	pea 160.w
	pea 20.w
	jsr (%a2)
	move.l #.LC8,_js_r_textbuffer
	addq.l #8,%sp
	jsr (%a3)
	moveq #1,%d0
	move.l %d0,_jsfFontIndx
	pea __ZL13modBankBuffer
	move.l #8397488,-(%sp)
	move.l #rapUnpack,%d3
	move.l %d3,%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l #__ZL14modMusicBuffer,(%sp)
	move.l #8458416,-(%sp)
	move.l %d3,%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l #__ZL13modBankBuffer,(%sp)
	pea __ZL14modMusicBuffer
	move.l #LSPPlayModule,%d7
	move.l %d7,%a0
	jsr (%a0)
	addq.l #8,%sp
	move.l #_jsfVsync,%d2
	lea jsfGetPadPressed,%a5
	move.l #LSPPlaySample,%d4
	move.l #LSPPlaySampleLoop,%d6
	move.l #LSPStopMusic,%d5
	lea jsfGetPad,%a4
.L31:
	clr.l -(%sp)
	move.l %d2,%a0
	jsr (%a0)
	moveq #1,%d0
	move.l %d0,(%sp)
	jsr (%a5)
	move.l %d0,__ZL4pad1
	move.l %d0,%d1
	and.l JAGPAD_B,%d1
	addq.l #4,%sp
	jne .L33
.L3:
	move.l %d0,%d1
	and.l JAGPAD_C,%d1
	jne .L34
	move.l %d0,%d1
	and.l JAGPAD_2,%d1
	jne .L35
	move.l %d0,%d1
	and.l JAGPAD_3,%d1
	jne .L36
	move.l %d0,%d1
	and.l JAGPAD_4,%d1
	jne .L37
	and.l JAGPAD_5,%d0
	jne .L38
.L4:
	pea 1.w
	jsr (%a4)
	move.l %d0,__ZL4pad1
	move.l #180,(%sp)
	pea 20.w
	jsr (%a2)
	move.l __ZL4pad1,%d0
	move.l %d0,%d1
	and.l JAGPAD_A,%d1
	addq.l #8,%sp
	jne .L39
.L9:
	move.l %d0,%d1
	and.l JAGPAD_B,%d1
	jne .L40
	move.l %d0,%d1
	and.l JAGPAD_C,%d1
	jne .L41
	move.l %d0,%d1
	and.l JAGPAD_0,%d1
	jne .L42
	move.l %d0,%d1
	and.l JAGPAD_1,%d1
	jne .L43
	move.l %d0,%d1
	and.l JAGPAD_2,%d1
	jne .L44
	move.l %d0,%d1
	and.l JAGPAD_3,%d1
	jne .L45
	move.l %d0,%d1
	and.l JAGPAD_4,%d1
	jne .L46
	move.l %d0,%d1
	and.l JAGPAD_5,%d1
	jne .L47
	move.l %d0,%d1
	and.l JAGPAD_6,%d1
	jne .L48
	move.l %d0,%d1
	and.l JAGPAD_7,%d1
	jne .L49
	move.l %d0,%d1
	and.l JAGPAD_8,%d1
	jne .L50
	move.l %d0,%d1
	and.l JAGPAD_9,%d1
	jne .L51
	move.l %d0,%d1
	and.l JAGPAD_STAR,%d1
	jne .L52
	move.l %d0,%d1
	and.l JAGPAD_HASH,%d1
	jne .L53
	move.l %d0,%d1
	and.l JAGPAD_OPTION,%d1
	jne .L54
	move.l %d0,%d1
	and.l JAGPAD_PAUSE,%d1
	jne .L55
	move.l %d0,%d1
	and.l JAGPAD_UP,%d1
	jne .L56
	move.l %d0,%d1
	and.l JAGPAD_DOWN,%d1
	jne .L57
	move.l %d0,%d1
	and.l JAGPAD_LEFT,%d1
	jne .L58
	and.l JAGPAD_RIGHT,%d0
	jne .L59
	move.l #.LC30,_js_r_textbuffer
	jsr (%a3)
	clr.l -(%sp)
	move.l %d2,%a0
	jsr (%a0)
	moveq #1,%d0
	move.l %d0,(%sp)
	jsr (%a5)
	move.l %d0,__ZL4pad1
	move.l %d0,%d1
	and.l JAGPAD_B,%d1
	addq.l #4,%sp
	jeq .L3
.L33:
	clr.l -(%sp)
	pea 63.w
	pea 7389.w
	pea explode_sam_end
	pea explode_sam
	move.l %d4,%a0
	jsr (%a0)
	lea (20,%sp),%sp
	pea 1.w
	jsr (%a4)
	move.l %d0,__ZL4pad1
	move.l #180,(%sp)
	pea 20.w
	jsr (%a2)
	move.l __ZL4pad1,%d0
	move.l %d0,%d1
	and.l JAGPAD_A,%d1
	addq.l #8,%sp
	jeq .L9
.L39:
	move.l #.LC9,_js_r_textbuffer
	jsr (%a3)
	jra .L31
.L38:
	jsr LSPStartMusic
	jra .L4
.L40:
	move.l #.LC10,_js_r_textbuffer
	jsr (%a3)
	jra .L31
.L34:
	pea 1.w
	pea 63.w
	pea 7389.w
	pea explode_sam_end
	pea explode_sam
	pea explode_sam_end
	pea explode_sam
	move.l %d6,%a0
	jsr (%a0)
	lea (28,%sp),%sp
	jra .L4
.L35:
	move.l %d5,%a0
	jsr (%a0)
	pea __ZL13modBankBuffer
	move.l #8397488,-(%sp)
	move.l %d3,%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l #__ZL14modMusicBuffer,(%sp)
	move.l #8458416,-(%sp)
	move.l %d3,%a0
	jsr (%a0)
	addq.l #4,%sp
	move.l #__ZL13modBankBuffer,(%sp)
	pea __ZL14modMusicBuffer
	move.l %d7,%a0
	jsr (%a0)
	addq.l #8,%sp
	jra .L4
.L41:
	move.l #.LC11,_js_r_textbuffer
	jsr (%a3)
	jra .L31
.L36:
	jsr LSPMusicToggle
	jra .L4
.L42:
	move.l #.LC12,_js_r_textbuffer
	jsr (%a3)
	jra .L31
.L37:
	move.l %d5,%a0
	jsr (%a0)
	jra .L4
.L43:
	move.l #.LC13,_js_r_textbuffer
	jsr (%a3)
	jra .L31
.L44:
	move.l #.LC14,_js_r_textbuffer
	jsr (%a3)
	jra .L31
.L45:
	move.l #.LC15,_js_r_textbuffer
	jsr (%a3)
	jra .L31
.L46:
	move.l #.LC16,_js_r_textbuffer
	jsr (%a3)
	jra .L31
.L47:
	move.l #.LC17,_js_r_textbuffer
	jsr (%a3)
	jra .L31
.L48:
	move.l #.LC18,_js_r_textbuffer
	jsr (%a3)
	jra .L31
.L49:
	move.l #.LC19,_js_r_textbuffer
	jsr (%a3)
	jra .L31
.L50:
	move.l #.LC20,_js_r_textbuffer
	jsr (%a3)
	jra .L31
.L51:
	move.l #.LC21,_js_r_textbuffer
	jsr (%a3)
	jra .L31
.L52:
	move.l #.LC22,_js_r_textbuffer
	jsr (%a3)
	jra .L31
.L53:
	move.l #.LC23,_js_r_textbuffer
	jsr (%a3)
	jra .L31
.L54:
	move.l #.LC24,_js_r_textbuffer
	jsr (%a3)
	jra .L31
.L55:
	move.l #.LC25,_js_r_textbuffer
	jsr (%a3)
	jra .L31
.L56:
	move.l #.LC26,_js_r_textbuffer
	jsr (%a3)
	jra .L31
.L57:
	move.l #.LC27,_js_r_textbuffer
	jsr (%a3)
	jra .L31
.L58:
	move.l #.LC28,_js_r_textbuffer
	jsr (%a3)
	jra .L31
.L59:
	move.l #.LC29,_js_r_textbuffer
	jsr (%a3)
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
.lcomm __ZL4pad1,4
.lcomm __ZL13modBankBuffer,100000
.lcomm __ZL14modMusicBuffer,100000
