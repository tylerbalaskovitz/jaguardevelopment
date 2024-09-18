;
; Template ASM Project
;

			include				"rapapp.s"								; Keep this here.
			
			.text	
	

;	
; MAIN Program entry point.
;	

	.globl	__Z9basicmainv
__Z9basicmainv:
	
	
	;; do some text output
			
			lea			txt_greeting,a0										; point to a text string
			move.l		#70,d0												; x=20
			move.l		#20,d1												; y=20
			moveq		#0,d2												; Font Size = 0 (8x8)
			moveq		#0,d3												; Font Index = 0
			jsr			RAPTOR_print										; PRINT the string

	
LOOP:		bra		LOOP													; Loop around!




;;
;; Some text to demo the RAPTOR_print command
;;
	
txt_greeting:	
			dc.b	"JagStudio ASM Project"
			dc.b	raptor_t_quit											; end of string
			.even