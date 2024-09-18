#NO_APP
	.text
	.even
	.globl	_jsfDebugMessage
_jsfDebugMessage:
	link.w %fp,#0
#APP
| 356 "jstudio_functions.c" 1
	movem.l	d0-d7/a0-a6,-(a7)			
	move.l	_js_r_textbuffer,a0				
	jsr		RAPTOR_console_update_textline	
	movem.l	(a7)+,d0-d7/a0-a6				
	
| 1238 "jstudio_functions.c" 1
	jsr		RAPTOR_console_update_registers		
	jsr		RAPTOR_console_update_usermonitors	
	
#NO_APP
	moveq #1,%d0
	move.l %d0,raptor_console_visible
	unlk %fp
	rts
	.even
	.globl	_jsfDebugMessageHalt
_jsfDebugMessageHalt:
	link.w %fp,#0
#APP
| 356 "jstudio_functions.c" 1
	movem.l	d0-d7/a0-a6,-(a7)			
	move.l	_js_r_textbuffer,a0				
	jsr		RAPTOR_console_update_textline	
	movem.l	(a7)+,d0-d7/a0-a6				
	
| 1238 "jstudio_functions.c" 1
	jsr		RAPTOR_console_update_registers		
	jsr		RAPTOR_console_update_usermonitors	
	
#NO_APP
	moveq #1,%d0
	move.l %d0,raptor_console_visible
	unlk %fp
	jra RAPTOR_ERROR
	.even
	.globl	jsfGetPad
jsfGetPad:
	link.w %fp,#0
	move.l %d1,-(%sp)
	move.l 8(%fp),%a0
	move.w AUDIOPLAYER,%d1
	jeq .L16
	moveq #1,%d0
	cmp.w #2,%d1
	jeq .L17
	cmp.l %a0,%d0
	jeq .L18
	moveq #2,%d1
	cmp.l %a0,%d1
	jeq .L19
.L14:
	moveq #0,%d0
.L8:
	move.l (%sp)+,%d1
	unlk %fp
	rts
.L17:
	cmp.l %a0,%d0
	jeq .L20
	moveq #2,%d1
	cmp.l %a0,%d1
	jne .L14
	move.l DSP_pad2,%d0
	move.l (%sp)+,%d1
	unlk %fp
	rts
.L16:
	moveq #1,%d1
	cmp.l %a0,%d1
	jeq .L21
	moveq #2,%d1
	cmp.l %a0,%d1
	jne .L8
#APP
| 1926 "jstudio_functions.c" 1
		movem.l d0-d4,-(sp)
	jsr Input_Read
	movem.l d0-d4,zero_left_pad
	movem.l (sp)+,d0-d4
	
#NO_APP
	move.l zero_right_pad,%d0
	move.l (%sp)+,%d1
	unlk %fp
	rts
.L18:
	move.l U235SE_pad1,%d0
	move.l (%sp)+,%d1
	unlk %fp
	rts
.L19:
	move.l U235SE_pad2,%d0
	move.l (%sp)+,%d1
	unlk %fp
	rts
.L20:
	move.l DSP_pad1,%d0
	move.l (%sp)+,%d1
	unlk %fp
	rts
.L21:
#APP
| 1917 "jstudio_functions.c" 1
		movem.l d0-d4,-(sp)
	jsr Input_Read
	movem.l d0-d4,zero_left_pad
	movem.l (sp)+,d0-d4
	
#NO_APP
	move.l zero_left_pad,%d0
	move.l (%sp)+,%d1
	unlk %fp
	rts
	.even
	.globl	__Z17jsfGetPadPressed1v
__Z17jsfGetPadPressed1v:
	link.w %fp,#0
	move.l %d1,-(%sp)
	move.l _pad1,%d0
	move.l %d0,_pad1Last
	move.w AUDIOPLAYER,%d1
	jeq .L28
	cmp.w #2,%d1
	jeq .L29
	move.l U235SE_pad1,%d1
	move.l %d1,_pad1
	not.l %d0
	move.l %d0,_pad1Prev
	and.l %d1,%d0
	move.l (%sp)+,%d1
	unlk %fp
	rts
.L29:
	move.l DSP_pad1,%d1
	move.l %d1,_pad1
	not.l %d0
	move.l %d0,_pad1Prev
	and.l %d1,%d0
	move.l (%sp)+,%d1
	unlk %fp
	rts
.L28:
#APP
| 1917 "jstudio_functions.c" 1
		movem.l d0-d4,-(sp)
	jsr Input_Read
	movem.l d0-d4,zero_left_pad
	movem.l (sp)+,d0-d4
	
#NO_APP
	move.l zero_left_pad,%d1
	move.l %d1,_pad1
	not.l %d0
	move.l %d0,_pad1Prev
	and.l %d1,%d0
	move.l (%sp)+,%d1
	unlk %fp
	rts
	.even
	.globl	__Z17jsfGetPadPressed2v
__Z17jsfGetPadPressed2v:
	link.w %fp,#0
	move.l %d1,-(%sp)
	move.l _pad2,%d0
	move.l %d0,_pad2Last
	move.w AUDIOPLAYER,%d1
	jeq .L36
	cmp.w #2,%d1
	jeq .L37
	move.l U235SE_pad2,%d1
	move.l %d1,_pad2
	not.l %d0
	move.l %d0,_pad2Prev
	and.l %d1,%d0
	move.l (%sp)+,%d1
	unlk %fp
	rts
.L37:
	move.l DSP_pad2,%d1
	move.l %d1,_pad2
	not.l %d0
	move.l %d0,_pad2Prev
	and.l %d1,%d0
	move.l (%sp)+,%d1
	unlk %fp
	rts
.L36:
#APP
| 1926 "jstudio_functions.c" 1
		movem.l d0-d4,-(sp)
	jsr Input_Read
	movem.l d0-d4,zero_left_pad
	movem.l (sp)+,d0-d4
	
#NO_APP
	move.l zero_right_pad,%d1
	move.l %d1,_pad2
	not.l %d0
	move.l %d0,_pad2Prev
	and.l %d1,%d0
	move.l (%sp)+,%d1
	unlk %fp
	rts
	.even
	.globl	jsfGetPadPressed
jsfGetPadPressed:
	link.w %fp,#0
	move.l %d1,-(%sp)
	move.l 8(%fp),%d0
	moveq #1,%d1
	cmp.l %d0,%d1
	jeq .L43
	moveq #2,%d1
	cmp.l %d0,%d1
	jeq .L44
	move.l (%sp)+,%d1
	unlk %fp
	rts
.L44:
	move.l (%sp)+,%d1
	unlk %fp
	jra __Z17jsfGetPadPressed2v
.L43:
	move.l (%sp)+,%d1
	unlk %fp
	jra __Z17jsfGetPadPressed1v
	.even
	.globl	rapUnpack
rapUnpack:
	link.w %fp,#0
	move.l 8(%fp),raptor_nrv2e_source
	move.l 12(%fp),raptor_nrv2e_destination
#APP
| 422 "jstudio_functions.c" 1
	  movem.l a0,-(sp)
| 423 "jstudio_functions.c" 1
	  lea		RAPTOR_NRV2E_GPU_depack,a0
| 424 "jstudio_functions.c" 1
		jsr 	RAPTOR_call_GPU_code
| 425 "jstudio_functions.c" 1
	  movem.l (sp)+,a0
#NO_APP
	unlk %fp
	rts
	.even
	.globl	jsfUnpack68k
jsfUnpack68k:
	link.w %fp,#0
#APP
| 633 "jstudio_functions.c" 1
		movem.l d0-d7/a0-a6,-(sp)                                             
	move.l 8(a6),a0                                                                  
	move.l 12(a6),a1                                                                  
	|------------------------------------------------------------------------------- 
	|  n2e_d.ash -- NRV2E decompression in 68000 assembly                            
	|                                                                                
	|  This file is part of the UCL data compression library.                        
	|                                                                                
	|  Copyright (C) 1996-2004 Markus Franz Xaver Johannes Oberhumer                 
	|  All Rights Reserved.                                                          
	|                                                                                
	|  The UCL library is free software; you can redistribute it and/or              
	|  modify it under the terms of the GNU General Public License as                
	|  published by the Free Software Foundation; either version 2 of                
	|  the License, or (at your option) any later version.                           
	|                                                                                
	|  The UCL library is distributed in the hope that it will be useful,            
	|  but WITHOUT ANY WARRANTY; without even the implied warranty of                
	|  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                 
	|  GNU General Public License for more details.                                  
	|                                                                                
	|  You should have received a copy of the GNU General Public License             
	|  along with the UCL library; see the file COPYING.                             
	|  If not, write to the Free Software Foundation, Inc.,                          
	|  59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.                      
	|                                                                                
	|  Markus F.X.J. Oberhumer                                                       
	|  <markus@oberhumer.com>                                                        
	|  http://www.oberhumer.com/opensource/ucl/                                      
	|                                                                                
	|------------------------------------------------------------------------------- 
	                                                                                 
	| ------------- DECOMPRESSION -------------                                      
	                                                                                 
	| decompress from a0 to a1                                                       
	|   note: must preserve d4 and a5-a7                                             
	                                                                                 
	|                                                                                
	| On entry:                                                                      
	|   a0  src pointer                                                              
	|   a1  dest pointer                                                             
	|                                                                                
	| On exit:                                                                       
	|   d1.l = 0x00008000                                                            
	|   d2.l = 0                                                                     
	|                                                                                
	| Register usage:                                                                
	|   a3  m_pos                                                                    
	|                                                                                
	|   d0  bit buffer                                                               
	|   d1  m_off                                                                    
	|   d2  m_len                                                                    
	|   d5  last_m_off                                                               
	|                                                                                
	|   d6  constant: -$500                                                          
	|   d7  constant: 0                                                              
	|                                                                                
	|                                                                                
	| Notes:                                                                         
	|   we have max_match = 65535, so we can use word arithmetics on d2              
	|   we have max_offset < 2**23, so we can use partial word arithmetics on d1     
	|                                                                                
	                                                                                 
	| ------------- constants & macros -------------                                 
	depack2e:                                                                        
	                moveq   #-0x50,D6       |   0xffffffb0                           
	                lsl.w   #4,D6           |   << 4                                 
	                                                                                 
	                moveq   #0,D7                                                    
	                moveq   #-1,D5          | last_off = -1                          
	                                                                                 
	| init d0 with high bit set                                                      
	||move.b  #$80,d0               | init d0.b for FILLBYTES                        
	                moveq   #-128,D0        | d0.b = $80                             
	                bra.s   decompr_start                                            
	                                                                                 
	                                                                                 
	| ------------- DECOMPRESSION -------------                                      
	                                                                                 
	decompr_literal:                                                                 
	                move.b  (A0)+,(A1)+                                              
	                                                                                 
	decompr_start:                                                                   
	decompr_loop:                                                                    
	| optimization: carry is clear -> we know that bits are available                
	|   cost literal:   4 +  8 + 10                                                  
	|   cost match:     4 + 10                                                       
	|   cost fillbits:  4 +  8 +  8                                                  
	                add.b   D0,D0                                                    
	                bcc.s   decompr_match                                            
	                bne.s   decompr_literal                                          
	                move.b  (A0)+,D0                                                 
	                addx.b  D0,D0                                                    
	                bcs.s   decompr_literal                                          
	                                                                                 
	                                                                                 
	decompr_match:                                                                   
	                moveq   #1,D1                                                    
	                moveq   #0,D2                                                    
	decompr_l1:                                                                      
	                add.b   D0,D0                                                    
	                bne.s   _l00                                                     
	                move.b  (A0)+,D0                                                 
	                addx.b  D0,D0                                                    
	_l00:                                                                            
	                addx.w  D1,D1                                                    
	| optimization: carry is clear -> we know that bits are available                
	|   cost loop continue:  4 + 10                                                  
	|   cost loop break:    4 +  8 + 10                                              
	|   cost fillbits:      4 +  8 +  8                                              
	                add.b   D0,D0                                                    
	                bcc.s   Lcon0                                                    
	                bne.s   decompr_break1                                           
	                move.b  (A0)+,D0                                                 
	                addx.b  D0,D0                                                    
	                bcs.s   decompr_break1                                           
	Lcon0:                                                                           
	                subq.w  #1,D1                                                    
	                add.b   D0,D0                                                    
	                bne.s   _l01                                                     
	                move.b  (A0)+,D0                                                 
	                addx.b  D0,D0                                                    
	_l01:                                                                            
	                addx.w  D1,D1                                                    
	                bpl.s   decompr_l1                                               
	                bra.s   decompr_end                                              
	decompr_break1:                                                                  
	                subq.w  #3,D1                                                    
	                bcs.s   decompr_prev_dist | last m_off                           
	                lsl.l   #8,D1                                                    
	                move.b  (A0)+,D1                                                 
	                not.l   D1                                                       
	                asr.l   #1,D1                                                    
	                bcc.s   decompr_get_mlen2                                        
	                                                                                 
	decompr_get_mlen1:                                                               
	                add.b   D0,D0                                                    
	                bne.s   _l02                                                     
	                move.b  (A0)+,D0                                                 
	                addx.b  D0,D0                                                    
	_l02:                                                                            
	                addx.w  D2,D2                                                    
	                bra.s   decompr_got_mlen                                         
	decompr_prev_dist:                                                               
	                move.l  D5,D1                                                    
	                add.b   D0,D0                                                    
	                bne.s   _l03                                                     
	                move.b  (A0)+,D0                                                 
	                addx.b  D0,D0                                                    
	_l03:                                                                            
	                bcs.s   decompr_get_mlen1                                        
	decompr_get_mlen2:                                                               
	                addq.w  #1,D2                                                    
	                add.b   D0,D0                                                    
	                bne.s   _l04                                                     
	                move.b  (A0)+,D0                                                 
	                addx.b  D0,D0                                                    
	_l04:                                                                            
	                bcs.s   decompr_get_mlen1                                        
	                                                                                 
	decompr_l2:                                                                      
	                add.b   D0,D0                                                    
	                bne.s   _l05                                                     
	                move.b  (A0)+,D0                                                 
	                addx.b  D0,D0                                                    
	_l05:                                                                            
	                addx.w  D2,D2                                                    
	| optimization: carry is clear -> we know that bits are available                
	|   cost loop continue:  4 + 10                                                  
	|   cost loop break:    4 +  8 + 10                                              
	|   cost fillbits:      4 +  8 +  8                                              
	                add.b   D0,D0                                                    
	                bcc.s   decompr_l2                                               
	                bne.s   Lbreak0                                                  
	                move.b  (A0)+,D0                                                 
	                addx.b  D0,D0                                                    
	                bcc.s   decompr_l2                                               
	Lbreak0:                                                                         
	                addq.w  #2,D2                                                    
	                                                                                 
	                                                                                 
	                                                                                 
	decompr_got_mlen:                                                                
	                move.l  D1,D5                                                    
	                lea     0(A1,D1.l),A3                                            
	                                                                                 
	| must use sub as cmp doesn't affect the X flag                                  
	                sub.l   D6,D1                                                    
	                addx.w  D7,D2                                                    
	                                                                                 
	| TODO: partly unroll this loop; could use some magic with d7 for address        
	|       computations, then compute a nice `jmp yyy(pc,dx.w)'                     
	                                                                                 
	|   cost for any m_len:   12 + 22 * (m_len - 1) + 4                              
	|     38, 60, 82, 104, 126, 148, 170, 192, 214, 236                              
	                move.b  (A3)+,(A1)+     | 12                                     
	Lcopy0:         move.b  (A3)+,(A1)+     | 12                                     
	                dbra    D2,Lcopy0       | 10 / 14                                
	                                                                                 
	                bra     decompr_loop                                             
	decompr_end:                                                                     
	                |rts                                                             
	                movem.l (sp)+,d0-d7/a0-a6                                        
	| vi:ts=8:et                                                                     
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	jsfSprlistFieldSetvalOffset
jsfSprlistFieldSetvalOffset:
	link.w %fp,#0
#APP
| 661 "jstudio_functions.c" 1
		movem.l d0/d1/d2/a0,-(sp)
	move.l 	8(%fp),d0			
	move.l 	d0,d1				
	lsl 		#7,d0				
	lsl 		#6,d1				
	add.l 		d1,d0				
	add.l 		12(%fp),%d0			
	move.l 	raptor_liststart,%a0
	lea 		(a0,d0.l),a0		
	move.l 	24(a6),d2			
	move.l 	d2,d1				
	lsl 		#7,d2				
	lsl 		#6,d1				
	add.l 		d1,d2				
	move.l 	20(a6),d0			
	move.l 	16(a6),d1			
	subq.w 	#1,d1				
	sprlistloop6:					
	move.l 	d0,(a0)				
	add.l 		d2,a0				
	dbra 		d1,sprlistloop6		
	movem.l 	(sp)+,d0/d1/d2/a0	
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	jsfSprlistFieldModOffset
jsfSprlistFieldModOffset:
	link.w %fp,#0
#APP
| 687 "jstudio_functions.c" 1
		movem.l d0/d1/d2/a0/a1,-(sp)
	move.l 	8(%fp),d0			
	move.l 	d0,d1				
	lsl 		#7,d0				
	lsl 		#6,d1				
	add.l 		d1,d0				
	add.l 		12(%fp),%d0			
	move.l 	raptor_liststart,%a0
	lea 		(a0,d0.l),a0		
	move.l 	24(a6),d0			
	move.l 	d0,d1				
	lsl 		#7,d0				
	lsl 		#6,d1				
	add.l 		d1,d0				
	move.l 	20(a6),a1			
	move.l 	16(a6),d1			
	subq.w 	#1,d1				
	sprlistloop5:	move.l (a1)+,d2	
	add.l 		d2,(a0)				
	add.l 		d0,a0				
	dbra 		d1,sprlistloop5		
	movem.l 	(sp)+,d0/d1/d2/a0/a1
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	jsfSprlistFieldSetOffset
jsfSprlistFieldSetOffset:
	link.w %fp,#0
#APP
| 712 "jstudio_functions.c" 1
		movem.l d0/d1/a0/a1,-(sp)
	move.l 	8(%fp),d0			
	move.l 	d0,d1				
	lsl 		#7,d0				
	lsl 		#6,d1				
	add.l 		d1,d0				
	add.l 		12(%fp),%d0			
	move.l 	raptor_liststart,%a0
	lea 		(a0,d0.l),a0		
	move.l 	24(a6),d0			
	move.l 	d0,d1				
	lsl 		#7,d0				
	lsl 		#6,d1				
	add.l 		d1,d0				
	move.l 	20(a6),a1			
	move.l 	16(a6),d1			
	subq.w 	#1,d1				
	sprlistloop4:	move.l (a1)+,(a0)
	add.l 		d0,a0				
	dbra 		d1,sprlistloop4		
	movem.l (sp)+,d0/d1/a0/a1
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	jsfSprlistFieldSetval
jsfSprlistFieldSetval:
	link.w %fp,#0
#APP
| 733 "jstudio_functions.c" 1
		movem.l d0/d1/a0,-(sp)		
	move.l 	8(%fp),d0			
	move.l 	d0,d1				
	lsl 		#7,d0				
	lsl 		#6,d1				
	add.l 		d1,d0				
	add.l 		12(%fp),%d0			
	move.l 	raptor_liststart,%a0
	lea 		(a0,d0.l),a0		
	move.l 	20(a6),d0			
	move.l 	16(a6),d1			
	subq.w 	#1,d1				
	sprlistloop3:					
	move.l 	d0,(a0)				
	lea 		192(a0),a0			
	dbra 		d1,sprlistloop3		
	movem.l 	(sp)+,d0/d1/a0		
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	jsfSprlistFieldMod
jsfSprlistFieldMod:
	link.w %fp,#0
#APP
| 754 "jstudio_functions.c" 1
		movem.l d0/d1/d3/a0/a1,-(sp)
	move.l 	8(%fp),d0			
	move.l 	d0,d1				
	lsl 		#7,d0				
	lsl 		#6,d1				
	add.l 		d1,d0				
	add.l 		12(%fp),%d0			
	move.l 	raptor_liststart,%a0
	lea 		(a0,d0.l),a0		
	move.l 	20(a6),a1			
	move.l 	16(a6),d1			
	subq.w 	#1,d1				
	sprlistloop2:	move.l (a1)+,d3	
	add.l 		d3,(a0)				
	lea 		192(a0),a0			
	dbra 		d1,sprlistloop2		
	movem.l 	(sp)+,d0/d1/d3/a0/a1
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	jsfSprlistFieldSet
jsfSprlistFieldSet:
	link.w %fp,#0
#APP
| 774 "jstudio_functions.c" 1
		movem.l d0/d1/a0/a1,-(sp)	
	move.l 	8(%fp),d0			
	move.l 	d0,d1				
	lsl 		#7,d0				
	lsl 		#6,d1				
	add.l 		d1,d0				
	add.l 		12(%fp),%d0			
	move.l 	raptor_liststart,%a0
	lea 		(a0,d0.l),a0		
	move.l 	20(a6),a1			
	move.l 	16(a6),d1			
	subq.w 	#1,d1				
	sprlistloop:	move.l (a1)+,(a0)
	lea 		192(a0),a0			
	dbra 		d1,sprlistloop		
	movem.l 	(sp)+,d0/d1/a0/a1	
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	_cls
_cls:
	link.w %fp,#0
	unlk %fp
	jra RAPTOR_particle_clear
	.even
	.globl	_jsfPlot
_jsfPlot:
	link.w %fp,#0
#APP
| 816 "jstudio_functions.c" 1
	movem.l	d0-d4/a0,-(a6)
				move.l	8(a7),d0
				move.l	12(a7),d1
				move.b	_plot_colour,d2
				moveq	#15,d4
				btst	#0,d0
				beq.s	plot_even
				lsr.b	#4,d2
				moveq	#-16,d4
	plot_even:	asr.w	#1,d0
				lea		RAPTOR_particle_gfx,a0
				add.w	d0,a0
				move.w	d1,d3
				asl.w	#5,d3
				asl.w	#7,d1
				add.w	d1,a0
				add.w	d3,a0
				and.b	d4,(a0)
				or.b	d2,(a0)
				movem.l	(a6)+,d0-d4/a0
#NO_APP
	unlk %fp
	rts
	.even
	.globl	_jsfVsync
_jsfVsync:
	link.w %fp,#0
	move.l %d1,-(%sp)
	move.l 8(%fp),%d0
	jne .L57
	move.b #4,%d0
	cmp.l jsfVsyncFlag.l,%d0
	jeq .L58
#APP
| 825 "jstudio_functions.c" 1
		jsr		RAPTOR_wait_frame_UPDATE_ALL
	
#NO_APP
.L56:
	move.l -4(%fp),%d1
	unlk %fp
	rts
.L57:
	move.l 8(%fp),%d0
	moveq #1,%d1
	cmp.l %d0,%d1
	jeq .L62
	move.l 8(%fp),%d0
	moveq #2,%d1
	cmp.l %d0,%d1
	jne .L56
	clr.l jsfVsyncFlag
	move.l -4(%fp),%d1
	unlk %fp
	rts
.L62:
	moveq #4,%d0
	move.l %d0,jsfVsyncFlag
	move.l -4(%fp),%d1
	unlk %fp
	rts
.L58:
	jsr RAPTOR_wait_frame
	clr.l jsfVsyncFlag
	move.l -4(%fp),%d1
	unlk %fp
	rts
	.even
	.globl	jsfDelay
jsfDelay:
	link.w %fp,#0
	movem.l #16480,-(%sp)
	move.l 8(%fp),%a1
	cmp.w #0,%a1
	jle .L64
	moveq #0,%d1
	lea RAPTOR_wait_frame,%a2
.L71:
	moveq #4,%d0
	cmp.l jsfVsyncFlag.l,%d0
	jeq .L67
#APP
| 825 "jstudio_functions.c" 1
		jsr		RAPTOR_wait_frame_UPDATE_ALL
	
#NO_APP
	addq.l #1,%d1
	cmp.l %d1,%a1
	jne .L71
.L64:
	movem.l -12(%fp),#1538
	unlk %fp
	rts
.L67:
	jsr (%a2)
	clr.l jsfVsyncFlag
	addq.l #1,%d1
	cmp.l %d1,%a1
	jne .L71
	jra .L64
	.even
	.globl	jsfEEPROMFullRead
jsfEEPROMFullRead:
	link.w %fp,#0
#APP
| 858 "jstudio_functions.c" 1
		movem.l d1-a5,-(sp)              
	lea raptor_highscores1_hex,a0   	
	jsr eeReadBank                     
	ext.l d0 |sign extend d0           
	movem.l (sp)+,d1-a5
#NO_APP
	unlk %fp
	rts
	.even
	.globl	jsfEEPROMWordRead
jsfEEPROMWordRead:
	link.w %fp,#0
#APP
| 866 "jstudio_functions.c" 1
		movem.l d1-a5,-(sp)              
	move.l 8(a6),d1                    
	jsr eeReadWord                     
	movem.l (sp)+,d1-a5
#NO_APP
	unlk %fp
	rts
	.even
	.globl	jsfEEPROMBoardRead
jsfEEPROMBoardRead:
	link.w %fp,#0
	move.l %d1,-(%sp)
	move.l 8(%fp),%d0
#APP
| 871 "jstudio_functions.c" 1
		movem.l d1-a5,-(sp)					
	
#NO_APP
	moveq #4,%d1
	cmp.l %d0,%d1
	jcc .L87
.L78:
#APP
| 891 "jstudio_functions.c" 1
	lea raptor_highscores1_hex,a0		
	
| 897 "jstudio_functions.c" 1
	move.l 8(a6),d4                        
	jsr eeReadSingleBank               	
	ext.l d0 |sign extend d0           	
	movem.l (sp)+,d1-a5
#NO_APP
	move.l (%sp)+,%d1
	unlk %fp
	rts
.L87:
	add.l %d0,%d0
	move.w .L84(%pc,%d0.l),%d0
	jmp %pc@(2,%d0:w)
.L84:
	.word .L78-.L84
	.word .L80-.L84
	.word .L81-.L84
	.word .L82-.L84
	.word .L83-.L84
.L82:
#APP
| 885 "jstudio_functions.c" 1
	lea raptor_highscores4_hex,a0		
	
| 897 "jstudio_functions.c" 1
	move.l 8(a6),d4                        
	jsr eeReadSingleBank               	
	ext.l d0 |sign extend d0           	
	movem.l (sp)+,d1-a5
#NO_APP
	move.l (%sp)+,%d1
	unlk %fp
	rts
.L83:
#APP
| 888 "jstudio_functions.c" 1
	lea raptor_highscores5_hex,a0		
	
| 897 "jstudio_functions.c" 1
	move.l 8(a6),d4                        
	jsr eeReadSingleBank               	
	ext.l d0 |sign extend d0           	
	movem.l (sp)+,d1-a5
#NO_APP
	move.l (%sp)+,%d1
	unlk %fp
	rts
.L80:
#APP
| 879 "jstudio_functions.c" 1
	lea raptor_highscores2_hex,a0		
	
| 897 "jstudio_functions.c" 1
	move.l 8(a6),d4                        
	jsr eeReadSingleBank               	
	ext.l d0 |sign extend d0           	
	movem.l (sp)+,d1-a5
#NO_APP
	move.l (%sp)+,%d1
	unlk %fp
	rts
.L81:
#APP
| 882 "jstudio_functions.c" 1
	lea raptor_highscores3_hex,a0		
	
| 897 "jstudio_functions.c" 1
	move.l 8(a6),d4                        
	jsr eeReadSingleBank               	
	ext.l d0 |sign extend d0           	
	movem.l (sp)+,d1-a5
#NO_APP
	move.l (%sp)+,%d1
	unlk %fp
	rts
	.even
	.globl	jsfEEPROMFullWrite
jsfEEPROMFullWrite:
	link.w %fp,#0
#APP
| 906 "jstudio_functions.c" 1
		movem.l d1-a5,-(sp)              
	lea raptor_highscores1_hex,a0   	
	jsr eeWriteBank                    
	ext.l d0 |sign extend d0           
	movem.l (sp)+,d1-a5
#NO_APP
	unlk %fp
	rts
	.even
	.globl	jsfEEPROMWordWrite
jsfEEPROMWordWrite:
	link.w %fp,#0
#APP
| 915 "jstudio_functions.c" 1
		movem.l d1-a5,-(sp)              
	move.l 12(a6),d0                   
	move.l 8(a6),d1                    
	jsr eeWriteWord                    
	movem.l (sp)+,d1-a5
#NO_APP
	unlk %fp
	rts
	.even
	.globl	jsfEEPROMBoardWrite
jsfEEPROMBoardWrite:
	link.w %fp,#0
	move.l %d1,-(%sp)
	move.l 8(%fp),%d0
#APP
| 920 "jstudio_functions.c" 1
		movem.l d1-a5,-(sp)					
	
#NO_APP
	moveq #4,%d1
	cmp.l %d0,%d1
	jcc .L101
.L92:
#APP
| 940 "jstudio_functions.c" 1
	lea raptor_highscores1_hex,a0		
	
| 946 "jstudio_functions.c" 1
	move.l 8(a6),d4                        
	jsr eeWriteSingleBank                   
	ext.l d0 |sign extend d0                
	movem.l (sp)+,d1-a5
#NO_APP
	move.l (%sp)+,%d1
	unlk %fp
	rts
.L101:
	add.l %d0,%d0
	move.w .L98(%pc,%d0.l),%d0
	jmp %pc@(2,%d0:w)
.L98:
	.word .L92-.L98
	.word .L94-.L98
	.word .L95-.L98
	.word .L96-.L98
	.word .L97-.L98
.L96:
#APP
| 934 "jstudio_functions.c" 1
	lea raptor_highscores4_hex,a0		
	
| 946 "jstudio_functions.c" 1
	move.l 8(a6),d4                        
	jsr eeWriteSingleBank                   
	ext.l d0 |sign extend d0                
	movem.l (sp)+,d1-a5
#NO_APP
	move.l (%sp)+,%d1
	unlk %fp
	rts
.L97:
#APP
| 937 "jstudio_functions.c" 1
	lea raptor_highscores5_hex,a0		
	
| 946 "jstudio_functions.c" 1
	move.l 8(a6),d4                        
	jsr eeWriteSingleBank                   
	ext.l d0 |sign extend d0                
	movem.l (sp)+,d1-a5
#NO_APP
	move.l (%sp)+,%d1
	unlk %fp
	rts
.L94:
#APP
| 928 "jstudio_functions.c" 1
	lea raptor_highscores2_hex,a0		
	
| 946 "jstudio_functions.c" 1
	move.l 8(a6),d4                        
	jsr eeWriteSingleBank                   
	ext.l d0 |sign extend d0                
	movem.l (sp)+,d1-a5
#NO_APP
	move.l (%sp)+,%d1
	unlk %fp
	rts
.L95:
#APP
| 931 "jstudio_functions.c" 1
	lea raptor_highscores3_hex,a0		
	
| 946 "jstudio_functions.c" 1
	move.l 8(a6),d4                        
	jsr eeWriteSingleBank                   
	ext.l d0 |sign extend d0                
	movem.l (sp)+,d1-a5
#NO_APP
	move.l (%sp)+,%d1
	unlk %fp
	rts
	.even
	.globl	jsfEEPROMUserDataRead
jsfEEPROMUserDataRead:
	link.w %fp,#0
#APP
| 962 "jstudio_functions.c" 1
		movem.l d1-a5,-(sp)              					
	lea raptor_user_savedata,a0							
	move.w	#256,d2				| Number of iterations		
	move.l #511,d1                   						
	loopreaduserdata:										
		jsr eeReadWord                     					
		move.w	d0,(a0)+	| Store data in buffer			
		addq	#1,d1										
		dbra	d2,loopreaduserdata							
	movem.l (sp)+,d1-a5
#NO_APP
	unlk %fp
	rts
	.even
	.globl	jsfEEPROMUserDataWrite
jsfEEPROMUserDataWrite:
	link.w %fp,#0
#APP
| 977 "jstudio_functions.c" 1
		movem.l d1-a5,-(sp)              					
	lea raptor_user_savedata,a0							
	move.w	#256,d2				| Number of iterations		
	move.l #511,d1                   						
	loopwriteuserdata:										
		move.w	(a0)+,d0									
		jsr eeWriteWord										
		addq	#1,d1										
		dbra	d2,loopwriteuserdata						
	movem.l (sp)+,d1-a5
#NO_APP
	unlk %fp
	rts
	.even
	.globl	jsfEEPROM
jsfEEPROM:
	link.w %fp,#0
#APP
| 1004 "jstudio_functions.c" 1
		movem.l d1-a5,-(sp)                                                   
	move.l 12(a6),a0                                                                  
	tst.l 8(a6)                                                                       
	beq.s savestuff                                                                   
	jsr eeReadBank                                                                    
	bra getout                                                                        
	                                                                                  
	savestuff:                                                                        
	jsr eeWriteBank                                                                   
	|move.w #0x134,0xF00058
	                                                                                  
	                                                                                  
	getout: ext.l d0 |sign extend d0                                                  
	movem.l (sp)+,d1-a5
#NO_APP
	unlk %fp
	rts
	.even
	.globl	jsfEEPROMWord
jsfEEPROMWord:
	link.w %fp,#0
#APP
| 1023 "jstudio_functions.c" 1
		movem.l d1-a5,-(sp)                                                   
	move.l 16(a6),d0                                                                  
	move.l 12(a6),d1                                                                  
	tst.l 8(a6)                                                                       
	beq.s savestuffword                                                                   
	jsr eeReadWord                                                                    
	bra getoutword                                                                        
	                                                                                  
	savestuffword:                                                                        
	jsr eeWriteWord                                                                   
	|move.w #0x134,0xF00058
	                                                                                  
	                                                                                  
	getoutword:                                                   
	movem.l (sp)+,d1-a5
#NO_APP
	unlk %fp
	rts
	.even
	.globl	jsfEEPROMBoard
jsfEEPROMBoard:
	link.w %fp,#0
#APP
| 1042 "jstudio_functions.c" 1
		movem.l d1-a5,-(sp)                                                   
	move.l 16(a6),d4                                                                  
	move.l 12(a6),a0                                                                  
	tst.l 8(a6)                                                                       
	beq.s savestuffboard                                                                   
	jsr eeReadSingleBank                                                                    
	bra getoutboard                                                                        
	                                                                                  
	savestuffboard:                                                                        
	jsr eeWriteSingleBank                                                                   
	|move.w #0x134,0xF00058
	                                                                                  
	                                                                                  
	getoutboard: ext.l d0 |sign extend d0                                                  
	movem.l (sp)+,d1-a5
#NO_APP
	unlk %fp
	rts
	.even
	.globl	jsfLoadClut
jsfLoadClut:
	link.w %fp,#0
	movem.l #32624,-(%sp)
	move.l 8(%fp),%d4
	move.l 16(%fp),%d0
	move.w 14(%fp),%d6
	move.w %d0,%d1
	jle .L108
	ext.l %d6
	move.l %d6,%a1
	add.l #491552,%a1
	move.l %a1,%d2
	lsl.l #5,%d2
	move.l %d2,%a1
	move.w %d0,%d7
	lsl.l #5,%d6
	move.l %d6,%a2
	add.l #15729664,%a2
	move.w %d0,%d2
	lsr.w #1,%d2
	move.w %d2,%d0
	add.w %d2,%d0
	jeq .L113
	cmp.w #1,%d1
	shi %d3
	neg.b %d3
	moveq #3,%d5
	and.l %d4,%d5
	seq %d5
	neg.b %d5
	and.b %d5,%d3
	move.l %d4,%d5
	addq.l #4,%d5
	cmp.l %a2,%d5
	scs %d5
	neg.b %d5
	add.l #15729668,%d6
	cmp.l %d4,%d6
	scs %d6
	neg.b %d6
	or.b %d6,%d5
	and.b %d5,%d3
	cmp.b #1,%d3
	jne .L113
	move.l %d4,%a3
	sub.l %a0,%a0
.L111:
	move.l (%a3)+,(%a2)+
	addq.l #1,%a0
	cmp.w %a0,%d2
	jhi .L111
	moveq #0,%d2
	move.w %d0,%d2
	add.l %d2,%d2
	add.l %d2,%d4
	add.l %d2,%a1
	cmp.w %d7,%d0
	jeq .L108
	move.l %d4,%a0
.L112:
	move.w (%a0)+,(%a1)+
	addq.w #1,%d0
	cmp.w %d1,%d0
	jlt .L112
.L108:
	movem.l (%sp)+,#3838
	unlk %fp
	rts
.L113:
	clr.w %d0
	move.l %d4,%a0
	jra .L112
	.even
	.globl	jsfClearBuffer
jsfClearBuffer:
	link.w %fp,#0
#APP
| 1063 "jstudio_functions.c" 1
		movem.l		d7/a0,-(a7)                  	
		move.l 		8(a6),d7                       	
		move.l 		12(a6),a0                       
		asr.l 		#2,d7                       	
		.jsferase:	clr.l	(a0)+                   
		subq.l		#1,d7                           
		bne.s		.jsferase                       
		movem.l		(a7)+,d7/a0                     
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	jsfSort
jsfSort:
	link.w %fp,#0
	movem.l #32636,-(%sp)
	move.l 12(%fp),%d6
	moveq #1,%d0
	cmp.l %d6,%d0
	jcc .L119
	move.l 8(%fp),%a3
	lea jsfSort,%a5
.L132:
	move.l %d6,%d1
	subq.l #1,%d1
	move.l %d1,%d5
	lsr.l #1,%d5
	move.l %d5,%d0
	add.l %d5,%d0
	add.l %d0,%d0
	move.l (%a3,%d0.l),%d2
	move.l %a3,%a2
	moveq #1,%d3
	move.l %d3,%d4
	subq.l #1,%d4
	move.l %a2,%a4
	move.l %d2,%d0
	sub.l (%a2),%d0
	tst.l %d0
	jle .L138
.L141:
	lea (4,%a2),%a0
	move.l %a0,%a2
	addq.l #1,%d3
.L143:
	move.l %d3,%d4
	subq.l #1,%d4
	move.l %a2,%a4
	move.l %d2,%d0
	sub.l (%a2),%d0
	tst.l %d0
	jgt .L141
.L138:
	move.l %d1,%d0
	add.l %d1,%d0
	add.l %d0,%d0
	move.l %d2,%a0
	sub.l (%a3,%d0.l),%a0
	cmp.w #0,%a0
	jge .L123
	subq.l #4,%d0
	subq.l #1,%d1
	move.l %d0,%a1
	subq.l #4,%a1
	move.l %d2,%a0
	sub.l (%a3,%d0.l),%a0
	cmp.w #0,%a0
	jge .L123
.L133:
	move.l %a1,%d0
	subq.l #1,%d1
	move.l %d0,%a1
	subq.l #4,%a1
	move.l %d2,%a0
	sub.l (%a3,%d0.l),%a0
	cmp.w #0,%a0
	jlt .L133
.L123:
	cmp.l %d4,%d1
	jls .L125
	lea (%a3,%d0.l),%a1
	move.l %a1,%d2
	move.l %a2,%d7
	or.l %d7,%d2
	moveq #3,%d7
	and.l %d7,%d2
	lea (4,%a2),%a0
	jne .L126
	cmp.l %a1,%a0
	scs %d2
	neg.b %d2
	move.l %a1,%d7
	addq.l #4,%d7
	cmp.l %a2,%d7
	scs %d7
	neg.b %d7
	or.b %d7,%d2
	jeq .L126
	move.l (%a2),%d0
	move.l (%a1),(%a2)
	move.l %d0,(%a1)
.L127:
	cmp.l %d5,%d4
	jeq .L142
	cmp.l %d5,%d1
	jeq .L134
	move.l %d5,%a4
	add.l %d5,%a4
	add.l %a4,%a4
	lea (%a3,%a4.l),%a4
	subq.l #1,%d1
	move.l (%a4),%d2
.L144:
	move.l %a0,%a2
	addq.l #1,%d3
	jra .L143
.L142:
	move.l %d1,%a4
	add.l %d1,%a4
	add.l %a4,%a4
	lea (%a3,%a4.l),%a4
	move.l %d1,%d5
	subq.l #1,%d1
	move.l (%a4),%d2
	jra .L144
.L134:
	move.l %d4,%d5
	subq.l #1,%d1
	move.l (%a4),%d2
	jra .L144
.L126:
	move.b (%a2),%d2
	move.b (%a1),(%a2)
	move.b %d2,(%a1)
	move.b 1(%a2),%d2
	lea 1(%a3,%d0.l),%a1
	move.b (%a1),1(%a2)
	move.b %d2,(%a1)
	move.b 2(%a2),%d2
	lea 2(%a3,%d0.l),%a1
	move.b (%a1),2(%a2)
	move.b %d2,(%a1)
	move.b 3(%a2),%d2
	lea 3(%a3,%d0.l),%a1
	move.b (%a1),3(%a2)
	move.b %d2,(%a1)
	jra .L127
.L125:
	addq.l #1,%d1
	sub.l %d1,%d6
	cmp.l %d1,%d6
	jls .L130
	move.l %d1,-(%sp)
	move.l %a3,-(%sp)
	jsr (%a5)
	add.l %d1,%d1
	add.l %d1,%d1
	add.l %d1,%a3
	addq.l #8,%sp
	moveq #1,%d0
	cmp.l %d6,%d0
	jcs .L132
.L119:
	movem.l -48(%fp),#16126
	unlk %fp
	rts
.L130:
	move.l %d6,-(%sp)
	move.l %d1,%d0
	add.l %d1,%d0
	add.l %d0,%d0
	pea (%a3,%d0.l)
	jsr (%a5)
	addq.l #8,%sp
	move.l %d1,%d6
	moveq #1,%d0
	cmp.l %d6,%d0
	jcs .L132
	jra .L119
	.even
	.globl	rapInitCalcAngle
rapInitCalcAngle:
	link.w %fp,#0
#APP
| 1183 "jstudio_functions.c" 1
		movem.l d0,-(sp)				
	move.l 	8(a6),d0				
	jsr		RAPTOR_init_calc_angle	
	movem.l 	(sp)+,d0				
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapCalcAngle
rapCalcAngle:
	link.w %fp,#0
#APP
| 1194 "jstudio_functions.c" 1
		movem.l d1-d3,-(sp)				
	move.l 	8(a6),d0				
	move.l 	12(a6),d1				
	move.l 	16(a6),d2				
	move.l 	20(a6),d3				
	jsr		RAPTOR_calc_angle		
	movem.l 	(sp)+,d1-d3				
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapAngleVector
rapAngleVector:
	link.w %fp,#0
#APP
| 1210 "jstudio_functions.c" 1
		movem.l d0/a0,-(sp)						
	move.l 	8(a6),d0						
	lsl.l 		#3,d0							
	lea		RAPTOR_particle_trigtable,a0	
	add.l		d0,a0							
	move.l 	(a0)+,rapAngle_xAdd				
	move.l 	(a0),rapAngle_yAdd				
	movem.l 	(sp)+,d0/a0						
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapDebugSetMonitor
rapDebugSetMonitor:
	link.w %fp,#0
#APP
| 1222 "jstudio_functions.c" 1
	movem.l d0/a0,-(a7)				
	move.l	8(a6),d0					
	lea 	raptor_console_monitors,a0	
	lsl.l	#2,d0						
	add.l	d0,a0						
	move.l 12(a6),(a0)					
	movem.l (sp)+,d0/a0
#NO_APP
	unlk %fp
	rts
	.even
	.globl	_rapDebugPrint
_rapDebugPrint:
	link.w %fp,#0
#APP
| 1230 "jstudio_functions.c" 1
	movem.l	d0-d7/a0-a6,-(a7)			
	move.l	_js_r_textbuffer,a0				
	jsr		RAPTOR_console_update_textline	
	movem.l	(a7)+,d0-d7/a0-a6				
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapDebugUpdate
rapDebugUpdate:
	link.w %fp,#0
#APP
| 1238 "jstudio_functions.c" 1
	jsr		RAPTOR_console_update_registers		
	jsr		RAPTOR_console_update_usermonitors	
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapDebugSetXY
rapDebugSetXY:
	link.w %fp,#0
	move.l 8(%fp),raptor_console_x
	move.l 12(%fp),raptor_console_y
	unlk %fp
	rts
	.even
	.globl	rapDebugSetVisible
rapDebugSetVisible:
	link.w %fp,#0
	move.l %d1,-(%sp)
	moveq #1,%d0
	cmp.l 8(%fp),%d0
	sne %d0
	ext.w %d0
	ext.l %d0
	moveq #1,%d1
	or.l %d0,%d1
	move.l %d1,raptor_console_visible
	move.l (%sp)+,%d1
	unlk %fp
	rts
	.even
	.globl	rapHiscoreSort
rapHiscoreSort:
	link.w %fp,#0
#APP
| 1261 "jstudio_functions.c" 1
		movem.l d1/a0,-(a7)									
	move.l 8(a6),d1										
	move.l 12(a6),a0										
	jsr RAPTOR_resort_score_table							
	movem.l (a7)+,d1/a0
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapBlitlist
rapBlitlist:
	link.w %fp,#0
#APP
| 1273 "jstudio_functions.c" 1
	movem.l a0,-(sp)                               
	move.l 8(a6),a0                                   
	move.l jsfVsyncFlag,-(sp)	|save update flag      
	move.l #0,jsfVsyncFlag		|disable auto update   
	jsr RAPTOR_blitter		                           
	move.l (sp)+,jsfVsyncFlag	|restore update flag   
	movem.l (sp)+,a0                               
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapNumToStr
rapNumToStr:
	link.w %fp,#0
#APP
| 1282 "jstudio_functions.c" 1
		movem.l d1/d4/a0,-(sp)
	movem.l 8(a6),d1/d4/a0
	jsr RAPTOR_HEXtoDEC
	clr.b 1(a0,d4.w)    |hex2dec expects digits-1 in d4 and we want to zero out the byte after the last digit
	movem.l (sp)+,d1/d4/a0
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapHexToStr
rapHexToStr:
	link.w %fp,#0
#APP
| 1294 "jstudio_functions.c" 1
		movem.l d0/a0/a1,-(sp)				
	movem.l 8(a6),d0/a0/a1					
	move.l d0,d1							
	lsl #1,d1								
	sub.l #1,d0							
	jsr RAPTOR_HEXtoASCII					
	clr.b 1(a1,d1.w)    |hex2dec expects digits-1 in d4 and we want to zero out the byte after the last digit
	movem.l (sp)+,d0/a0/a1					
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	RBRA
RBRA:
	link.w %fp,#0
#APP
| 1302 "jstudio_functions.c" 1
		movem.l d0-d3/a6,-(sp) |lolol
	movem.l 8(a6),d0-d3
	jsr RAPTOR_setup_object_bra
	movem.l (sp)+,d0-d3/a6    |lolol
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapHiscoreCheck
rapHiscoreCheck:
	link.w %fp,#0
#APP
| 1312 "jstudio_functions.c" 1
		movem.l d1-d7/a0-a5,-(sp)							
	move.l 8(a6),d0										
	move.l 12(a6),a0										
	move.l 16(a6),d1										
	jsr RAPTOR_chk_highscores								
	movem.l (sp)+,d1-d7/a0-a5								
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapFadeSingle
rapFadeSingle:
	link.w %fp,#0
#APP
| 1321 "jstudio_functions.c" 1
		move.l d1,-(a7)
	move.w 10(a6),d1
	move.w 8(a6),d0
	jsr RAPTOR_fade_clutindex
	move.l (a7)+,d1
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapFadeClut
rapFadeClut:
	link.w %fp,#0
#APP
| 1331 "jstudio_functions.c" 1
		movem.l d7/a1,-(a7)
	move.l 16(a6),a1
	move.l 12(a6),d7
	move.l 8(a6),d0
	jsr RAPTOR_fade_clut
	movem.l (a7)+,d7/a1
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapSetActiveList
rapSetActiveList:
	link.w %fp,#0
#APP
| 1340 "jstudio_functions.c" 1
	movem.l	d0-d7/a0-a6,-(a7)
				move.l 8+60(sp),d0
	    		jsr		RAPTOR_setlist
				movem.l	(a7)+,d0-d7/a0-a6
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapCollide
rapCollide:
	link.w %fp,#0
#APP
| 1345 "jstudio_functions.c" 1
		movem.l	d1-d7/a0-a6,-(a7)
#NO_APP
	moveq #0,%d0
	move.l %d0,raptor_result
	move.l 8(%fp),raptor_sourcel
	move.l 12(%fp),raptor_sourceh
	move.l 16(%fp),raptor_targetl
	move.l 20(%fp),raptor_targeth
#APP
| 1351 "jstudio_functions.c" 1
		lea		RAPTOR_GPU_COLLISION,a0
| 1352 "jstudio_functions.c" 1
		jsr 	RAPTOR_call_GPU_code
| 1353 "jstudio_functions.c" 1
		movem.l	(a7)+,d1-d7/a0-a6
#NO_APP
	move.l raptor_result,%d0
	unlk %fp
	rts
	.even
	.globl	rapParticleInject
rapParticleInject:
	link.w %fp,#0
	moveq #12,%d0
	add.l 8(%fp),%d0
	move.l %d0,raptor_part_inject_addr
#APP
| 1367 "jstudio_functions.c" 1
	movem.l	d0-a6,-(a7)
	lea		RAPTOR_particle_injection_GPU,a0
	jsr 	RAPTOR_call_GPU_code
	movem.l	(a7)+,d0-a6
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapSetMapLoc
rapSetMapLoc:
	link.w %fp,#0
	move.l 8(%fp),raptor_map_position_x
	move.l 12(%fp),raptor_map_position_y
#APP
| 1376 "jstudio_functions.c" 1
		movem.l	d0-d7/a0-a6,-(a7)
	jsr		RAPTOR_map_set_position
	movem.l	(a7)+,d0-d7/a0-a6
#NO_APP
	unlk %fp
	rts
	.even
	.globl	_rapPrint
_rapPrint:
	link.w %fp,#0
#APP
| 1389 "jstudio_functions.c" 1
	movem.l	d0-d7/a0-a6,-(a7)	
	move.l	_js_r_xpos,d0		
	move.l	_js_r_ypos,d1		
	move.l	_jsfFontSize,d2			
	move.l	_jsfFontIndx,d3			
	move.l	_js_r_textbuffer,a0		
	jsr		RAPTOR_print			
	movem.l	(a7)+,d0-d7/a0-a6		
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	_rapPrintCont
_rapPrintCont:
	link.w %fp,#0
#APP
| 1399 "jstudio_functions.c" 1
	movem.l	d0-d7/a0-a6,-(a7)		
	move.l	_jsfFontSize,d2		
	move.l	_jsfFontIndx,d3		
	move.l	_js_r_textbuffer,a0	
	jsr		RAPTOR_printr		
	movem.l	(a7)+,d0-d7/a0-a6			
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapLocate
rapLocate:
	link.w %fp,#0
	move.l 8(%fp),_js_r_xpos
	move.l 12(%fp),_js_r_ypos
	unlk %fp
	rts
	.even
	.globl	rapUpdateOffscreenList
rapUpdateOffscreenList:
	link.w %fp,#0
#APP
| 1414 "jstudio_functions.c" 1
	movem.l	d0-d7/a0-a6,-(a7)
				move.l 8(a6),d0
	    		jsr		RAPTOR_update_offscreenlist
				movem.l	(a7)+,d0-d7/a0-a6
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapSpriteShift
rapSpriteShift:
	link.w %fp,#0
#APP
| 1431 "jstudio_functions.c" 1
	movem.l	d0-d2/a0,-(a7)		
	move.l 	16(%fp),d0			
	move.l 	d0,d1				
	lsl 		#7,d0				
	lsl 		#6,d1				
	add.l 		d1,d0				
	move.l 	raptor_liststart,%a0
	lea 		(a0,d0.l),a0		
	move.l 	8(a6),d0			
	move.l 	12(a6),d1			
	move.l 	20(a6),d2			
	jsr 		RAPTOR_obj_shift	
	movem.l	(a7)+,d0-d2/a0
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapSetClock
rapSetClock:
	link.w %fp,#0
#APP
| 1439 "jstudio_functions.c" 1
		move.l	d0,-(a7)		
				move.l 	8(a6),d0		
	    		jsr		RAPTOR_setclock	
				move.l	(a7)+,d0
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapAddClock
rapAddClock:
	link.w %fp,#0
#APP
| 1447 "jstudio_functions.c" 1
		movem.l	d0,-(a7)		
				move.l 	8(a6),d0		
	    		jsr		RAPTOR_addclock	
				movem.l	(a7)+,d0
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapSubClock
rapSubClock:
	link.w %fp,#0
#APP
| 1455 "jstudio_functions.c" 1
		movem.l	d0,-(a7)		
				move.l 	8(a6),d0		
	    		jsr		RAPTOR_subclock	
				movem.l	(a7)+,d0
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapSortSprites
rapSortSprites:
	link.w %fp,#0
#APP
| 1472 "jstudio_functions.c" 1
	movem.l	d0-d2/a0,-(a7)		
	move.l 	8(%fp),d0			
	move.l 	d0,d1				
	lsl 		#7,d0				
	lsl 		#6,d1				
	add.l 		d1,d0				
	move.l 	raptor_liststart,%a0
	lea 		(a0,d0.l),a0		
	move.l 	12(a6),d0			
	move.l 	16(a6),d1			
	move.l 	20(a6),d2			
	jsr 		RAPTOR_objsort		
	movem.l	(a7)+,d0-d2/a0
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapFlashCheck
rapFlashCheck:
	link.w %fp,#0
#APP
| 1477 "jstudio_functions.c" 1
			jsr		RAPTOR_flashcheck								
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapGDGetCartSerial
rapGDGetCartSerial:
	link.w %fp,#0
#APP
| 1489 "jstudio_functions.c" 1
	jsr 	RAPTOR_GD_GetCartSerial
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapGDCardInserted
rapGDCardInserted:
	link.w %fp,#0
#APP
| 1501 "jstudio_functions.c" 1
		jsr 			RAPTOR_GD_CardIn		
		cmp.b			#1,d0					
		bne				.rapGDCartSerial_no		
		moveq			#1,d0					
		jmp				.rapGDCartSerial_end	
	.rapGDCartSerial_no:						
		moveq			#0,d0					
	.rapGDCartSerial_end:						
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapGDSetLEDOn
rapGDSetLEDOn:
	link.w %fp,#0
#APP
| 1509 "jstudio_functions.c" 1
		movem.l	d0,-(a7)			
		moveq	#1,d0				
		jsr		RAPTOR_GD_SetLED	
		movem.l	(a7)+,d0			
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapGDSetLEDOff
rapGDSetLEDOff:
	link.w %fp,#0
#APP
| 1517 "jstudio_functions.c" 1
		movem.l	d0,-(a7)			
		moveq	#0,d0				
		jsr		RAPTOR_GD_SetLED	
		movem.l	(a7)+,d0			
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapGDReset
rapGDReset:
	link.w %fp,#0
#APP
| 1525 "jstudio_functions.c" 1
		movem.l	d0,-(a7)			
		move.l 	8(a6),d0			
		jmp		RAPTOR_GD_Reset		
		movem.l	(a7)+,d0			
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapGDGetCardSerial
rapGDGetCardSerial:
	link.w %fp,#0
#APP
| 1530 "jstudio_functions.c" 1
	jsr 	RAPTOR_GD_GetCardSerial
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapGDDebugPrint
rapGDDebugPrint:
	link.w %fp,#0
#APP
| 1538 "jstudio_functions.c" 1
		movem.l	d0-d7/a0-a6,-(a7)				
		move.l	_js_r_textbuffer,a0				
		jsr		RAPTOR_GD_DebugString			
		movem.l	(a7)+,d0-d7/a0-a6				
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapGDLoadFile
rapGDLoadFile:
	link.w %fp,#0
#APP
| 1547 "jstudio_functions.c" 1
		movem.l	a0-a1,-(a7)				
		move.l 	8(a6),a0				
		move.l 	12(a6),a1				
		jsr		RAPTOR_GD_LoadFile		
		movem.l	(a7)+,a0-a1				
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapGDSaveFile
rapGDSaveFile:
	link.w %fp,#0
#APP
| 1557 "jstudio_functions.c" 1
		movem.l	a0-a1,-(a7)				
		move.l 	8(a6),a0				
		move.l 	12(a6),a1				
		move.l 	16(a6),d0				
		jsr		RAPTOR_GD_SaveFile		
		movem.l	(a7)+,a0-a1				
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapGDBIOSVersion
rapGDBIOSVersion:
	link.w %fp,#0
#APP
| 1562 "jstudio_functions.c" 1
		jsr		RAPTOR_GD_BIOSVersion		
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapGDROMWriteEnable
rapGDROMWriteEnable:
	link.w %fp,#0
#APP
| 1568 "jstudio_functions.c" 1
		move.l 	8(a6),d0					
		jsr		RAPTOR_GD_ROMWriteEnable	
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapGDDirOpen
rapGDDirOpen:
	link.w %fp,#0
#APP
| 1576 "jstudio_functions.c" 1
		movem.l	a0,-(a7)			
		move.l 	8(a6),a0			
		jsr		RAPTOR_GD_DirOpen	
		movem.l	(a7)+,a0			
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapGDDirRead
rapGDDirRead:
	link.w %fp,#0
#APP
| 1582 "jstudio_functions.c" 1
		move.l 	8(a6),d0			
		jsr		RAPTOR_GD_DirRead	
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapGDDirClose
rapGDDirClose:
	link.w %fp,#0
#APP
| 1588 "jstudio_functions.c" 1
		move.l 	8(a6),d0			
		jsr		RAPTOR_GD_DirClose	
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapGDFileOpen
rapGDFileOpen:
	link.w %fp,#0
#APP
| 1597 "jstudio_functions.c" 1
		movem.l	a0,-(a7)			
		move.l 	8(a6),d0			
		move.l 	12(a6),a0			
		jsr		RAPTOR_GD_FileOpen	
		movem.l	(a7)+,a0			
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapGDFileRead
rapGDFileRead:
	link.w %fp,#0
#APP
| 1608 "jstudio_functions.c" 1
		movem.l	d1-d2/a0,-(a7)			
		move.l 	8(a6),d0				
		move.l 	12(a6),d1				
		move.l 	16(a6),d2				
		move.l 	20(a6),a0				
		jsr		RAPTOR_GD_FileRead		
		movem.l	(a7)+,d1-d2/a0			
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapGDFileWrite
rapGDFileWrite:
	link.w %fp,#0
#APP
| 1618 "jstudio_functions.c" 1
		movem.l	d1/a0,-(a7)				
		move.l 	8(a6),d0				
		move.l 	12(a6),d1				
		move.l 	16(a6),a0				
		jsr		RAPTOR_GD_FileWrite		
		movem.l	(a7)+,d1/a0				
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapGDFileClose
rapGDFileClose:
	link.w %fp,#0
#APP
| 1624 "jstudio_functions.c" 1
		move.l 	8(a6),d0			
		jsr		RAPTOR_GD_FileClose	
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapGDFileSeek
rapGDFileSeek:
	link.w %fp,#0
#APP
| 1634 "jstudio_functions.c" 1
		movem.l	d1-d2/a0,-(a7)			
		move.l 	8(a6),d0				
		move.l 	12(a6),d1				
		move.l 	16(a6),d2				
		jsr		RAPTOR_GD_FileSeek		
		movem.l	(a7)+,d1-d2/a0			
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapGDFileTell
rapGDFileTell:
	link.w %fp,#0
#APP
| 1640 "jstudio_functions.c" 1
		move.l 	8(a6),d0			
		jsr		RAPTOR_GD_FileTell	
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapGDFileSize
rapGDFileSize:
	link.w %fp,#0
#APP
| 1646 "jstudio_functions.c" 1
		move.l 	8(a6),d0			
		jsr		RAPTOR_GD_FileSize	
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapGDFileInfo
rapGDFileInfo:
	link.w %fp,#0
#APP
| 1656 "jstudio_functions.c" 1
		movem.l	a0-a1,-(a7)				
		move.l 	8(a6),d0				
		move.l 	12(a6),a0				
		move.l 	16(a6),a1				
		jsr		RAPTOR_GD_FileInfo		
		movem.l	(a7)+,a0-a1				
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapGDFTimeToASCII
rapGDFTimeToASCII:
	link.w %fp,#0
#APP
| 1663 "jstudio_functions.c" 1
		move.w 	8(a6),d0				
		move.l 	12(a6),a0				
		jsr		RAPTOR_ftime_to_ascii	
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapGDFDateToASCII
rapGDFDateToASCII:
	link.w %fp,#0
#APP
| 1670 "jstudio_functions.c" 1
		move.w 	8(a6),d0				
		move.l 	12(a6),a0				
		jsr		RAPTOR_fdate_to_ascii	
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapUseParticlePalette
rapUseParticlePalette:
	link.w %fp,#0
#APP
| 1676 "jstudio_functions.c" 1
		move.l 	8(a6),d0						
	jsr		RAPTOR_usepartipal				
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapUse8x8fontPalette
rapUse8x8fontPalette:
	link.w %fp,#0
#APP
| 1682 "jstudio_functions.c" 1
		move.l 	8(a6),d0						
	jsr		RAPTOR_use8x8fontpal			
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapUse8x16fontPalette
rapUse8x16fontPalette:
	link.w %fp,#0
#APP
| 1688 "jstudio_functions.c" 1
		move.l 	8(a6),d0						
	jsr		RAPTOR_use8x16fontpal			
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapUse16x16fontPalette
rapUse16x16fontPalette:
	link.w %fp,#0
#APP
| 1694 "jstudio_functions.c" 1
		move.l 	8(a6),d0						
	jsr		RAPTOR_use16x16fontpal			
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	u235PlaySample
u235PlaySample:
	link.w %fp,#0
	tst.w AUDIOPLAYER
	jeq .L208
#APP
| 1717 "jstudio_functions.c" 1
		movem.l d0-d1,-(a7)			
	move.l 12(a6),d1				
	move.l 8(a6),d0				
	lsl.w	#8,d1					
	lsl.w	#4,d0					
	or.w	d0,d1					
	addq.w	#2,d1					
	jsr RAPTOR_U235queuesample		
	movem.l (a7)+,d0-d1			
	
#NO_APP
	unlk %fp
	rts
.L208:
	jsr RAPTOR_ERROR
#APP
| 1717 "jstudio_functions.c" 1
		movem.l d0-d1,-(a7)			
	move.l 12(a6),d1				
	move.l 8(a6),d0				
	lsl.w	#8,d1					
	lsl.w	#4,d0					
	or.w	d0,d1					
	addq.w	#2,d1					
	jsr RAPTOR_U235queuesample		
	movem.l (a7)+,d0-d1			
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	u235PlaySampleFreq
u235PlaySampleFreq:
	link.w %fp,#0
	tst.w AUDIOPLAYER
	jeq .L213
#APP
| 1737 "jstudio_functions.c" 1
		movem.l d0-d2,-(a7)			
	move.l 16(a6),d1				
	move.l 12(a6),d2				
	move.l 8(a6),d0				
	lsr.l	#1,d1					
	swap.w	d1						
	lsl.w	#8,d2					
	lsl.w	#4,d0					
	or.w	d2,d1					
	or.w	d0,d1					
	addq.w	#4,d1					
	jsr RAPTOR_U235queuesample		
	movem.l (a7)+,d0-d2			
	
#NO_APP
	unlk %fp
	rts
.L213:
	jsr RAPTOR_ERROR
#APP
| 1737 "jstudio_functions.c" 1
		movem.l d0-d2,-(a7)			
	move.l 16(a6),d1				
	move.l 12(a6),d2				
	move.l 8(a6),d0				
	lsr.l	#1,d1					
	swap.w	d1						
	lsl.w	#8,d2					
	lsl.w	#4,d0					
	or.w	d2,d1					
	or.w	d0,d1					
	addq.w	#4,d1					
	jsr RAPTOR_U235queuesample		
	movem.l (a7)+,d0-d2			
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	u235ChannelFreq
u235ChannelFreq:
	link.w %fp,#0
	tst.w AUDIOPLAYER
	jeq .L218
#APP
| 1755 "jstudio_functions.c" 1
								movem.l d0-d1,-(a7)			
	move.l 12(a6),d1				
	move.l 8(a6),d0				
	lsr.w	#1,d1					
	swap.w	d1						
	lsl.w	#4,d0					
	or.w	d0,d1					
	addq.w	#7,d1					
	jsr RAPTOR_U235queuesample		
	movem.l (a7)+,d0-d1			
	
#NO_APP
	unlk %fp
	rts
.L218:
	jsr RAPTOR_ERROR
#APP
| 1755 "jstudio_functions.c" 1
								movem.l d0-d1,-(a7)			
	move.l 12(a6),d1				
	move.l 8(a6),d0				
	lsr.w	#1,d1					
	swap.w	d1						
	lsl.w	#4,d0					
	or.w	d0,d1					
	addq.w	#7,d1					
	jsr RAPTOR_U235queuesample		
	movem.l (a7)+,d0-d1			
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	u235KillChannel
u235KillChannel:
	link.w %fp,#0
	tst.w AUDIOPLAYER
	jeq .L223
#APP
| 1768 "jstudio_functions.c" 1
		movem.l d1,-(a7)	
	move.l 8(a6),d1				
	lsl.w	#4,d1					
	addq.w	#1,d1					
	jsr RAPTOR_U235queuesample		
	movem.l (a7)+,d1				
	
#NO_APP
	unlk %fp
	rts
.L223:
	jsr RAPTOR_ERROR
#APP
| 1768 "jstudio_functions.c" 1
		movem.l d1,-(a7)	
	move.l 8(a6),d1				
	lsl.w	#4,d1					
	addq.w	#1,d1					
	jsr RAPTOR_U235queuesample		
	movem.l (a7)+,d1				
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	u235ChannelVol
u235ChannelVol:
	link.w %fp,#0
	tst.w AUDIOPLAYER
	jeq .L228
#APP
| 1784 "jstudio_functions.c" 1
		movem.l d0-d1,-(a7)	
	move.l 12(a6),d1				
	move.l 8(a6),d0				
	lsl.w	#8,d1					
	lsl.w	#4,d0					
	or.w	d0,d1					
	addq.w	#3,d1					
	jsr RAPTOR_U235queuesample		
	movem.l (a7)+,d0-d1			
	
#NO_APP
	unlk %fp
	rts
.L228:
	jsr RAPTOR_ERROR
#APP
| 1784 "jstudio_functions.c" 1
		movem.l d0-d1,-(a7)	
	move.l 12(a6),d1				
	move.l 8(a6),d0				
	lsl.w	#8,d1					
	lsl.w	#4,d0					
	or.w	d0,d1					
	addq.w	#3,d1					
	jsr RAPTOR_U235queuesample		
	movem.l (a7)+,d0-d1			
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	_u235GetPad
_u235GetPad:
	link.w %fp,#0
	move.l %d1,-(%sp)
	move.l 8(%fp),%d0
	moveq #1,%d1
	cmp.l %d0,%d1
	jeq .L235
	moveq #2,%d1
	cmp.l %d0,%d1
	jeq .L236
	moveq #0,%d0
	move.l (%sp)+,%d1
	unlk %fp
	rts
.L236:
	move.l U235SE_pad2,%d0
	move.l (%sp)+,%d1
	unlk %fp
	rts
.L235:
	move.l U235SE_pad1,%d0
	move.l (%sp)+,%d1
	unlk %fp
	rts
	.even
	.globl	__Z14u235PlayModuleis
__Z14u235PlayModuleis:
	link.w %fp,#0
	move.l %d2,-(%sp)
	move.l %d1,-(%sp)
	move.l 8(%fp),%d1
	move.w 14(%fp),%d2
	tst.w AUDIOPLAYER
	jeq .L244
	tst.l %d1
	jle .L240
.L246:
#APP
| 1806 "jstudio_functions.c" 1
	move.l 8(a6),a0
	jsr RAPTOR_U235setmodule
	
#NO_APP
	cmp.w #1,%d2
	jeq .L245
#APP
| 1814 "jstudio_functions.c" 1
	jsr RAPTOR_U235gomodule_mono
#NO_APP
	move.l -8(%fp),%d1
	move.l -4(%fp),%d2
	unlk %fp
	rts
.L244:
	jsr RAPTOR_ERROR
	tst.l %d1
	jgt .L246
.L240:
	move.l -8(%fp),%d1
	move.l -4(%fp),%d2
	unlk %fp
	jra RAPTOR_U235stopmodule
.L245:
#APP
| 1810 "jstudio_functions.c" 1
	jsr RAPTOR_U235gomodule_stereo
#NO_APP
	move.l -8(%fp),%d1
	move.l -4(%fp),%d2
	unlk %fp
	rts
	.even
	.globl	__Z14u235StopModulev
__Z14u235StopModulev:
	link.w %fp,#0
	tst.w AUDIOPLAYER
	jeq .L251
	unlk %fp
	jra RAPTOR_U235stopmodule
.L251:
	jsr RAPTOR_ERROR
	unlk %fp
	jra RAPTOR_U235stopmodule
	.even
	.globl	__Z11u235Silencev
__Z11u235Silencev:
	link.w %fp,#0
	tst.w AUDIOPLAYER
	jeq .L256
	unlk %fp
	jra RAPTOR_U235SilenceChannels
.L256:
	jsr RAPTOR_ERROR
	unlk %fp
	jra RAPTOR_U235SilenceChannels
	.even
	.globl	u235ChangeReplayFrq
u235ChangeReplayFrq:
	link.w %fp,#0
	tst.w AUDIOPLAYER
	jeq .L261
#APP
| 1848 "jstudio_functions.c" 1
		movem.l d0-d1,-(a7)
	move.l 8(a6),d0
	move.l 12(a6),d1
	jsr RAPTOR_U235ChangeReplayFrq
	movem.l (a7)+,d0-d1
	
#NO_APP
	unlk %fp
	rts
.L261:
	jsr RAPTOR_ERROR
#APP
| 1848 "jstudio_functions.c" 1
		movem.l d0-d1,-(a7)
	move.l 8(a6),d0
	move.l 12(a6),d1
	jsr RAPTOR_U235ChangeReplayFrq
	movem.l (a7)+,d0-d1
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	_u235ModuleVol
_u235ModuleVol:
	link.w %fp,#0
	move.l 8(%fp),U235SE_music_vol
	unlk %fp
	rts
	.even
	.globl	_u235SampleVol
_u235SampleVol:
	link.w %fp,#0
	move.l 8(%fp),U235SE_sfx_vol
	unlk %fp
	rts
	.even
	.globl	u235StopDSP
u235StopDSP:
	link.w %fp,#0
	tst.w AUDIOPLAYER
	jeq .L268
#APP
| 1866 "jstudio_functions.c" 1
	jsr RAPTOR_U235stopDSP
#NO_APP
	unlk %fp
	rts
.L268:
	jsr RAPTOR_ERROR
#APP
| 1866 "jstudio_functions.c" 1
	jsr RAPTOR_U235stopDSP
#NO_APP
	unlk %fp
	rts
	.even
	.globl	u235Init
u235Init:
	link.w %fp,#0
	tst.w AUDIOPLAYER
	jeq .L273
#APP
| 1878 "jstudio_functions.c" 1
		movem.l 	d0-d1,-(sp)			
	move.l    		8(a6),d0			
	move.l    		12(a6),d1			
	jsr			RAPTOR_U235init		
	movem.l 		(sp)+,d0-d1			
	
#NO_APP
	unlk %fp
	rts
.L273:
	jsr RAPTOR_ERROR
#APP
| 1878 "jstudio_functions.c" 1
		movem.l 	d0-d1,-(sp)			
	move.l    		8(a6),d0			
	move.l    		12(a6),d1			
	jsr			RAPTOR_U235init		
	movem.l 		(sp)+,d0-d1			
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	u235Restart
u235Restart:
	link.w %fp,#0
	tst.w AUDIOPLAYER
	jeq .L296
#APP
| 1886 "jstudio_functions.c" 1
	jsr RAPTOR_U235stopDSP
#NO_APP
	moveq #4,%d0
	cmp.l jsfVsyncFlag.l,%d0
	jeq .L278
.L297:
#APP
| 825 "jstudio_functions.c" 1
		jsr		RAPTOR_wait_frame_UPDATE_ALL
	
#NO_APP
	moveq #4,%d0
	cmp.l jsfVsyncFlag.l,%d0
	jeq .L282
.L298:
#APP
| 825 "jstudio_functions.c" 1
		jsr		RAPTOR_wait_frame_UPDATE_ALL
	
| 1895 "jstudio_functions.c" 1
		movem.l d0-d1,-(sp)				
	move.l    	8(a6),d0				
	move.l    	12(a6),d1				
	jsr		RAPTOR_U235init			
	movem.l 	(sp)+,d0-d1				
	
#NO_APP
	moveq #4,%d0
	cmp.l jsfVsyncFlag.l,%d0
	jeq .L286
.L299:
#APP
| 825 "jstudio_functions.c" 1
		jsr		RAPTOR_wait_frame_UPDATE_ALL
	
#NO_APP
.L294:
	moveq #4,%d0
	cmp.l jsfVsyncFlag.l,%d0
	jeq .L290
#APP
| 825 "jstudio_functions.c" 1
		jsr		RAPTOR_wait_frame_UPDATE_ALL
	
#NO_APP
	unlk %fp
	rts
.L296:
	jsr RAPTOR_ERROR
#APP
| 1886 "jstudio_functions.c" 1
	jsr RAPTOR_U235stopDSP
#NO_APP
	moveq #4,%d0
	cmp.l jsfVsyncFlag.l,%d0
	jne .L297
.L278:
	jsr RAPTOR_wait_frame
	clr.l jsfVsyncFlag
	moveq #4,%d0
	cmp.l jsfVsyncFlag.l,%d0
	jne .L298
.L282:
	jsr RAPTOR_wait_frame
	clr.l jsfVsyncFlag
#APP
| 1895 "jstudio_functions.c" 1
		movem.l d0-d1,-(sp)				
	move.l    	8(a6),d0				
	move.l    	12(a6),d1				
	jsr		RAPTOR_U235init			
	movem.l 	(sp)+,d0-d1				
	
#NO_APP
	moveq #4,%d0
	cmp.l jsfVsyncFlag.l,%d0
	jne .L299
.L286:
	jsr RAPTOR_wait_frame
	clr.l jsfVsyncFlag
	jra .L294
.L290:
	jsr RAPTOR_wait_frame
	clr.l jsfVsyncFlag
	unlk %fp
	rts
	.even
	.globl	zeroGetPad
zeroGetPad:
	link.w %fp,#0
	move.l %d1,-(%sp)
	move.l 8(%fp),%d0
	moveq #1,%d1
	cmp.l %d0,%d1
	jeq .L306
	moveq #2,%d1
	cmp.l %d0,%d1
	jeq .L307
	move.l (%sp)+,%d1
	unlk %fp
	rts
.L307:
#APP
| 1926 "jstudio_functions.c" 1
		movem.l d0-d4,-(sp)
	jsr Input_Read
	movem.l d0-d4,zero_left_pad
	movem.l (sp)+,d0-d4
	
#NO_APP
	move.l zero_right_pad,%d0
	move.l (%sp)+,%d1
	unlk %fp
	rts
.L306:
#APP
| 1917 "jstudio_functions.c" 1
		movem.l d0-d4,-(sp)
	jsr Input_Read
	movem.l d0-d4,zero_left_pad
	movem.l (sp)+,d0-d4
	
#NO_APP
	move.l zero_left_pad,%d0
	move.l (%sp)+,%d1
	unlk %fp
	rts
	.even
	.globl	zeroPlaySample
zeroPlaySample:
	link.w %fp,#0
	cmp.w #1,AUDIOPLAYER.l
	jeq .L312
#APP
| 1945 "jstudio_functions.c" 1
	movem.l d0/a0/d1/d2/d3,-(a7)
	move.l	8(a6),d0
	move.l	12(a6),a0
	move.l	16(a6),d1
	move.l	20(a6),d2
	move.l	24(a6),d3
	jsr		Audio_Play
	movem.l (sp)+,d0/a0/d1/d2/d3
#NO_APP
	unlk %fp
	rts
.L312:
	jsr RAPTOR_ERROR
#APP
| 1945 "jstudio_functions.c" 1
	movem.l d0/a0/d1/d2/d3,-(a7)
	move.l	8(a6),d0
	move.l	12(a6),a0
	move.l	16(a6),d1
	move.l	20(a6),d2
	move.l	24(a6),d3
	jsr		Audio_Play
	movem.l (sp)+,d0/a0/d1/d2/d3
#NO_APP
	unlk %fp
	rts
	.even
	.globl	zeroPlay
zeroPlay:
	link.w %fp,#0
	cmp.w #1,AUDIOPLAYER.l
	jeq .L317
#APP
| 1971 "jstudio_functions.c" 1
	movem.l d0/a0/a1/d1/d2/d3,-(a7)
	move.l	12(a6),a0			
	move.l	16(a6),d1			
	sub.l a0,d1				
	addq.l #3,d1				
	and.w #0xfffc,d1			
	move.l	8(a6),d0			
	move.l	20(a6),d2			
	move.l	24(a6),d3			
	jsr	Audio_Play			
	movem.l (sp)+,d0/a0/a1/d1/d2/d3
#NO_APP
	unlk %fp
	rts
.L317:
	jsr RAPTOR_ERROR
#APP
| 1971 "jstudio_functions.c" 1
	movem.l d0/a0/a1/d1/d2/d3,-(a7)
	move.l	12(a6),a0			
	move.l	16(a6),d1			
	sub.l a0,d1				
	addq.l #3,d1				
	and.w #0xfffc,d1			
	move.l	8(a6),d0			
	move.l	20(a6),d2			
	move.l	24(a6),d3			
	jsr	Audio_Play			
	movem.l (sp)+,d0/a0/a1/d1/d2/d3
#NO_APP
	unlk %fp
	rts
	.even
	.globl	zeroClearChannel
zeroClearChannel:
	link.w %fp,#0
	cmp.w #1,AUDIOPLAYER.l
	jeq .L322
#APP
| 1987 "jstudio_functions.c" 1
	movem.l d0/a0/d1/d2/d3,-(a7)
	move.l	8(a6),d0		
	move.l	#0,a0			
	move.l	#0,d1			
	move.l	#0,d2			
	move.l	#0,d3			
	jsr		Audio_Play	
	movem.l (sp)+,d0/a0/d1/d2/d3
#NO_APP
	unlk %fp
	rts
.L322:
	jsr RAPTOR_ERROR
#APP
| 1987 "jstudio_functions.c" 1
	movem.l d0/a0/d1/d2/d3,-(a7)
	move.l	8(a6),d0		
	move.l	#0,a0			
	move.l	#0,d1			
	move.l	#0,d2			
	move.l	#0,d3			
	jsr		Audio_Play	
	movem.l (sp)+,d0/a0/d1/d2/d3
#NO_APP
	unlk %fp
	rts
	.even
	.globl	LSPGetPad
LSPGetPad:
	link.w %fp,#0
	move.l %d1,-(%sp)
	move.l 8(%fp),%d0
	moveq #1,%d1
	cmp.l %d0,%d1
	jeq .L329
	moveq #2,%d1
	cmp.l %d0,%d1
	jeq .L330
	moveq #0,%d0
	move.l (%sp)+,%d1
	unlk %fp
	rts
.L330:
	move.l DSP_pad2,%d0
	move.l (%sp)+,%d1
	unlk %fp
	rts
.L329:
	move.l DSP_pad1,%d0
	move.l (%sp)+,%d1
	unlk %fp
	rts
	.even
	.globl	LSPPlayModule
LSPPlayModule:
	link.w %fp,#0
	cmp.w #2,AUDIOPLAYER.l
	jeq .L333
	jsr RAPTOR_ERROR
.L333:
#APP
| 2019 "jstudio_functions.c" 1
		movem.l 	d0-d7/a0-a6,-(a7)		
	move.l 	8(a6),a0				
	move.l 	12(a6),a1				
	jsr 		RAPTOR_LSP_playmodule	
	movem.l 	(a7)+,d0-d7/a0-a6		
	
#NO_APP
	unlk %fp
	rts
	.even
	.globl	LSPStartMusic
LSPStartMusic:
	link.w %fp,#0
	cmp.w #2,AUDIOPLAYER.l
	jeq .L337
	jsr RAPTOR_ERROR
.L337:
#APP
| 2027 "jstudio_functions.c" 1
	jsr RAPTOR_LSP_startmusic
#NO_APP
	unlk %fp
	rts
	.even
	.globl	LSPStopMusic
LSPStopMusic:
	link.w %fp,#0
	cmp.w #2,AUDIOPLAYER.l
	jeq .L341
	jsr RAPTOR_ERROR
.L341:
#APP
| 2034 "jstudio_functions.c" 1
	jsr RAPTOR_LSP_stopmusic
#NO_APP
	unlk %fp
	rts
	.even
	.globl	LSPMusicToggle
LSPMusicToggle:
	link.w %fp,#0
	cmp.w #2,AUDIOPLAYER.l
	jeq .L345
	jsr RAPTOR_ERROR
.L345:
#APP
| 2041 "jstudio_functions.c" 1
	jsr RAPTOR_LSP_onoff
#NO_APP
	unlk %fp
	rts
	.even
	.globl	LSPStartDSP
LSPStartDSP:
	link.w %fp,#0
	cmp.w #2,AUDIOPLAYER.l
	jeq .L349
	jsr RAPTOR_ERROR
.L349:
#APP
| 2049 "jstudio_functions.c" 1
	jsr RAPTOR_LSP_StartDSP
#NO_APP
	unlk %fp
	rts
	.even
	.globl	LSPPlaySampleLoop
LSPPlaySampleLoop:
	link.w %fp,#0
	cmp.w #2,AUDIOPLAYER.l
	jeq .L353
	jsr RAPTOR_ERROR
.L353:
#APP
| 2072 "jstudio_functions.c" 1
	movem.l d0-d7/a0-a6,-(a7)
	move.l	8(a6),d0			
	move.l	12(a6),d1			
	move.l	16(a6),d2			
	move.l	20(a6),d3			
	move.l	24(a6),d4			
	lsl.l 	#8,d4				
	move.l	28(a6),d5			
	move.l	32(a6),d6			
	jsr	RAPTOR_LSP_Sample	
	movem.l (a7)+,d0-d7/a0-a6
#NO_APP
	unlk %fp
	rts
	.even
	.globl	LSPPlaySample
LSPPlaySample:
	link.w %fp,#0
	cmp.w #2,AUDIOPLAYER.l
	jeq .L357
	jsr RAPTOR_ERROR
.L357:
#APP
| 2095 "jstudio_functions.c" 1
	movem.l d0-d7/a0-a6,-(a7)
	move.l	8(a6),d0			
	move.l	12(a6),d1			
	move.l	#silence,d2			
	move.l	#fin_silence,d3		
	move.l	16(a6),d4			
	lsl.l 	#8,d4				
	move.l	20(a6),d5			
	move.l	24(a6),d6			
	jsr	RAPTOR_LSP_Sample	
	movem.l (a7)+,d0-d7/a0-a6
#NO_APP
	unlk %fp
	rts
	.even
	.globl	rapCheckTTExists
rapCheckTTExists:
	link.w %fp,#0
	move.l %d1,-(%sp)
	move.l 8(%fp),%d0
	jeq .L365
	moveq #1,%d1
	cmp.l %d0,%d1
	jeq .L366
	move.l (%sp)+,%d1
	unlk %fp
	rts
.L366:
#APP
| 2123 "jstudio_functions.c" 1
			moveq	#0,d0										
		jsr		RAPTOR_check_right_teamptap					
		tst.l	raptor_right_teamtap						
		bmi		endrighttt									
		moveq	#1,d0										
	endrighttt:       										
		ext.l d0 							|sign extend d0 
	
#NO_APP
	move.l (%sp)+,%d1
	unlk %fp
	rts
.L365:
#APP
| 2112 "jstudio_functions.c" 1
			moveq	#0,d0										
		jsr		RAPTOR_check_left_teamptap					
		tst.l	raptor_left_teamtap							
		bmi		endlefttt									
		moveq	#1,d0										
	endlefttt:       										
		ext.l d0 							|sign extend d0 
	
#NO_APP
	move.l (%sp)+,%d1
	unlk %fp
	rts
	.even
	.globl	rapGetTTState
rapGetTTState:
	link.w %fp,#0
	move.l %d1,-(%sp)
	move.l 8(%fp),%d0
	jeq .L372
	moveq #1,%d1
	cmp.l %d0,%d1
	jeq .L373
	move.l (%sp)+,%d1
	unlk %fp
	rts
.L373:
#APP
| 2158 "jstudio_functions.c" 1
			movem.l d0,-(sp)						
		jsr		RAPTOR_read_right_teamtap_state	
		moveq	#0,d0							
		jsr		RAPTOR_read_right_teamtap_pad	
		moveq	#1,d0							
		jsr		RAPTOR_read_right_teamtap_pad	
		moveq	#2,d0							
		jsr		RAPTOR_read_right_teamtap_pad	
		moveq	#3,d0							
		jsr		RAPTOR_read_right_teamtap_pad	
		movem.l (sp)+,d0						
	
#NO_APP
	move.l (%sp)+,%d1
	unlk %fp
	rts
.L372:
#APP
| 2143 "jstudio_functions.c" 1
			movem.l d0,-(sp)						
		jsr		RAPTOR_read_left_teamtap_state	
		moveq	#0,d0							
		jsr		RAPTOR_read_left_teamtap_pad	
		moveq	#1,d0							
		jsr		RAPTOR_read_left_teamtap_pad	
		moveq	#2,d0							
		jsr		RAPTOR_read_left_teamtap_pad	
		moveq	#3,d0							
		jsr		RAPTOR_read_left_teamtap_pad	
		movem.l (sp)+,d0						
	
#NO_APP
	move.l (%sp)+,%d1
	unlk %fp
	rts
	.even
	.globl	rapGetTTPad
rapGetTTPad:
	link.w %fp,#0
	move.l %d1,-(%sp)
	move.l 8(%fp),%a0
	move.l 12(%fp),%d0
	moveq #1,%d1
	cmp.w #0,%a0
	jne .L376
	cmp.l %d0,%d1
	jeq .L379
	jge .L392
	moveq #2,%d1
	cmp.l %d0,%d1
	jeq .L380
	move.b #3,%d1
	cmp.l %d0,%d1
	jne .L390
	move.l raptor_left_teamtap_pad3,%d0
	move.l (%sp)+,%d1
	unlk %fp
	rts
.L376:
	cmp.l %a0,%d1
	jeq .L393
.L390:
	moveq #0,%d0
	move.l (%sp)+,%d1
	unlk %fp
	rts
.L393:
	cmp.l %d0,%d1
	jeq .L384
	jge .L394
	moveq #2,%d1
	cmp.l %d0,%d1
	jeq .L385
	move.b #3,%d1
	cmp.l %d0,%d1
	jne .L390
	move.l raptor_right_teamtap_pad3,%d0
	move.l (%sp)+,%d1
	unlk %fp
	rts
.L379:
	move.l raptor_left_teamtap_pad1,%d0
	move.l (%sp)+,%d1
	unlk %fp
	rts
.L380:
	move.l raptor_left_teamtap_pad2,%d0
	move.l (%sp)+,%d1
	unlk %fp
	rts
.L392:
	tst.l %d0
	jne .L390
	move.l raptor_left_teamtap_pad0,%d0
	move.l (%sp)+,%d1
	unlk %fp
	rts
.L385:
	move.l raptor_right_teamtap_pad2,%d0
	move.l (%sp)+,%d1
	unlk %fp
	rts
.L384:
	move.l raptor_right_teamtap_pad1,%d0
	move.l (%sp)+,%d1
	unlk %fp
	rts
.L394:
	tst.l %d0
	jne .L390
	move.l raptor_right_teamtap_pad0,%d0
	move.l (%sp)+,%d1
	unlk %fp
	rts
	.globl	rapAngle_yAdd
	.bss
	.even
rapAngle_yAdd:
	.skip 4
	.globl	rapAngle_xAdd
	.even
rapAngle_xAdd:
	.skip 4
	.globl	_pad2Prev
	.even
_pad2Prev:
	.skip 4
	.globl	_pad1Prev
	.even
_pad1Prev:
	.skip 4
	.globl	_pad2Last
	.even
_pad2Last:
	.skip 4
	.globl	_pad1Last
	.even
_pad1Last:
	.skip 4
	.globl	_pad2
	.even
_pad2:
	.skip 4
	.globl	_pad1
	.even
_pad1:
	.skip 4
	.globl	_xcpt
	.data
	.even
_xcpt:
	.long	1
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.globl	_js_r_textbuffer
	.bss
	.even
_js_r_textbuffer:
	.skip 4
	.globl	_yt2
	.even
_yt2:
	.skip 8
	.globl	_y
	.even
_y:
	.skip 8
	.globl	_errno
	.even
_errno:
	.skip 4
	.globl	zero_left_pad
	.even
zero_left_pad:
	.skip 4
	.globl	zero_right_pad
	.even
zero_right_pad:
	.skip 4
	.globl	zero_mousex_delta
	.even
zero_mousex_delta:
	.skip 4
	.globl	zero_mousey_delta
	.even
zero_mousey_delta:
	.skip 4
	.globl	zero_rotary_delta
	.even
zero_rotary_delta:
	.skip 4
	.globl	_plot_colour
_plot_colour:
	.skip 1
	.globl	_jsfFontIndx
	.even
_jsfFontIndx:
	.skip 4
	.globl	_jsfFontSize
	.even
_jsfFontSize:
	.skip 4
	.globl	_js_r_ypos
	.even
_js_r_ypos:
	.skip 4
	.globl	_js_r_xpos
	.even
_js_r_xpos:
	.skip 4
	.globl	colliders
	.data
	.even
colliders:
	.long	raptor_collisionlist
	.globl	sprite
	.even
sprite:
	.long	RAPTOR_sprite_table
