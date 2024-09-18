
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Jaguar Development System Source Code					   
; Copyright (c) 1994, 1995 Atari Corp.
; ALL RIGHTS RESERVED
;
; Project: eeprom.s - E2PROM Read & Write Functions (Non-Handshaking Version)
;  Module: eeprom.s - Low & High Level Read/Write Functions
;
; Revision History:
;	24-Sep-93 -  DS: Created
;     	29-Nov-94 - SDS: Modified to use delay rather than busy poll
;       	         for wait after write.
;       15-Dec-94 - SDS: Added Eeprom series of high level calls.
;	18-Jan-95 - SDS: Renamed calls from Eeprom... to ee...
;                        for more signifigant letters in Alcyon
;                        compilation.
;       14-Mar-95 - SDS: Fixed two routines to not save D0 so an
;                        error code is actually returned.
;       22-Sep-95 -  MF: Added Library identification header string
;       12-Sep-12 - ZER: Modified for the EEPROM chip used on the Jagtopus cartridge
;		30-Jan-23 - Spor: Modified Read/Write Bank storage to only save 600 bytes (120 x 5 boards).
;							Leaving remaining space available as custom user data storage.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.include "jaguar.inc"	

;;;;;;;;;;;;;;;;;;;
;;; Global Symbols

		.globl eeWriteWord
		.globl eeWriteSingleBank
		.globl eeReadSingleBank
		.globl eeWriteBank
		.globl eeReadWord
		.globl eeReadBank
		.globl eeUpdateChecksum
		.globl eeValidateChecksum

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;	Hi-Score on-board-cartridge EEPROM primitives 
;;;	for use by Jaguar game cartridge developers.
;;;
;;; 2048 bytes (accessible as 1024 words) of non-volatile
;;; memory are available on Jagtopus game cartridges to
;;;	preserve Hi-scores or other game status The last
;;;     word (word #1023) should be used for a checksum on
;;;	data validity.
;;;
;;; Data is retained for up to 100 years, and a minimum
;;;     of 1,000,000 write cycles is assured, according to
;;;	product literature. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

GPIO_0		.equ	$f14800		;General purpose I/O #0
GPIO_1		.equ	$f15000		;General purpose I/O #1

;   Equates derived from the above
;   to allow indirect with 16-bit displacement addressing

GPIO_0of	.equ	GPIO_0-JOYSTICK	;offset to GPIO_0 (when addr reg Ax -> JOY1) 
GPIO_1of	.equ	GPIO_1-JOYSTICK	;offset to GPIO_1 (when addr reg Ax -> JOY1) 

;   Commands tested on:
;   ON Semiconductors CAT93C86
;
;  13-bit commands..
;                    CBA9876543210

eREAD       .equ    %1100000000000  ;read from EEPROM
eEWEN       .equ    %1001100000000  ;Erase/write Enable
eWRITE      .equ    %1010000000000  ;Write selected register
eEWDS       .equ    %1000000000000  ;Erase/Write disable (default)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  DO (data out)	- is read on bit0 of JOY1
;  DI (data in) 	- is written on bit0 of GPIO_0
;  CS (chip select)	- is pulsed low by any access to GPIO_1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Procedure: eeWriteWord
;;;            Write a word to EEPROM and ensure it was written.
;;;
;;;  Inputs: d0.w = data to be written
;;;      d1.w = least signifigant 10 bits specify write address (0-1023)  
;;;
;;; Returns: d0.w = Non-zero indicates an error occurred

eeWriteWord:
		move.l	d2,-(sp)
		move.w	d0,d2		; Save value

		bsr	eewrite		; Write value
		bsr	eeread		; Read value back

		cmp.w	d0,d2		; Are they the same?
		bne	.badwrite

		move.w	#$0,d0		; Success
		bra	.ewwout
.badwrite:
		move.w	#$1,d0
.ewwout:
		move.l	(sp)+,d2
		rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Procedure: eeReadWord
;;;            Read a word from the EEPROM.
;;;
;;;  Inputs: d1.w = least signifigant 10 bits specify write address (0-1023)  
;;;
;;; Returns: d0.w = Word read

eeReadWord:
		bsr	eeread
		rts
		
		
		
		

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Procedure: eeWriteSingleBank
;;;            Write a single scoreboard to EEPROM (120 bytes or 60 WORDS).
;;;
;;;  Inputs: a0.l = Pointer to data buffer containing words to write
;;;			 d4.w = Number of scoreboard (0-4)
;;;
;;; Returns: d0.w = Non-zero indicates an error occurred

eeWriteSingleBank:
		movem.l a0/d1-d4,-(sp)

		clr.w	d1					; Address counter
		
		mulu.w	#60,d4				; Multiply scoreboard number by 60 to get start point		
		move.w	d4,d1				; Move Start point into counter
		move.w	#59,d2				; Number of iterations
		
.loopwritesingle:
		move.w	(a0)+,d0

		move.w	d0,d3				; Copy it.

		bsr	eewrite					; Write the word
		bsr	eeread					; Read the word back

		cmp.w	d0,d3				; Are they the same?
		beq	.nextwordsingle

		bra	.errwritesingle
.nextwordsingle:
		addq	#1,d1
		dbra	d2,.loopwritesingle

		move.w	#$0,d0
		bra	.ewboutsingle
.errwritesingle:
		move.w	#$1,d0	
.ewboutsingle:
		movem.l	(sp)+,a0/d1-d4
		rts
		

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Procedure: eeReadSingleBank
;;;            Read a single scoreboard to EEPROM (120 bytes or 60 WORDS).
;;;
;;;  Inputs: a0.l = Destination buffer of write data  
;;;			 d4.w = Number of scoreboard (0-4)
;;;
;;; Returns: d0.w = Non-zero indicates an error occurred

eeReadSingleBank:
		movem.l	a0/d1-d4,-(sp)

		clr.w	d1						; Address counter
		mulu.w	#60,d4					; Multiply scoreboard number by 60 to get start point		
		move.w	d4,d1					; Move Start point into counter
		move.w	#59,d2					; Number of iterations
		
.nextreadSingle:
		jsr	eeread						; Read data
		move.w	d0,(a0)+				; Store data in buffer
		
		addq	#1,d1
		dbra	d2,.nextreadSingle
				
		move.w	#$0,d0

		movem.l	(sp)+,a0/d1-d4
		rts		

		
		
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Procedure: eeWriteBank
;;;            Write 300 words to EEPROM plus one checksum word.
;;;
;;;  Inputs: a0.l = Pointer to data buffer containing 300 words to write
;;;
;;; Returns: d0.w = Non-zero indicates an error occurred

eeWriteBank:
		movem.l a0/d1-d3,-(sp)

		clr.w	d1			; Address counter
		clr.w	d2			; Checksum Accumulator
.loopwrite:
		move.w	(a0)+,d0
		add.w	d0,d2		; Add value to checksum

		move.w	d0,d3		; Copy it.

		bsr	eewrite			; Write the word
		bsr	eeread			; Read the word back

		cmp.w	d0,d3		; Are they the same?
		beq	.nextword

		bra	.errwrite
.nextword:
		addq.w	#1,d1
        cmp.w   #299,d1      ; Write 300 words (60 words per board x 5 boards)
		ble	.loopwrite
		
		eor.w	#$FFFF,d2	; IMPORTANT!!!
		move.w	d2,d0
		
		bsr	eewrite
		bsr	eeread
		
		cmp.w	d0,d2
		bne	.errwrite
		
		move.w	#$0,d0
		bra	.ewbout
.errwrite:
		move.w	#$1,d0	
.ewbout:
		movem.l	(sp)+,a0/d1-d3
		rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Procedure: eeReadBank
;;;            Read a bank of 300 words (+ checksum) from the EEPROM.
;;;
;;;  Inputs: a0.l = Destination buffer of write data  
;;;
;;; Returns: d0.w = Non-zero indicates an error occurred

eeReadBank:
		movem.l	a0/d1-d2,-(sp)

		clr.w	d1			; Address counter
		clr.w	d2			; Checksum accumulator
.nextread:
		jsr	eeread			; Read data
		add.w	d0,d2		; Add to checksum
		move.w	d0,(a0)+	; Store data in buffer
		
		addq.w	#1,d1
        cmp.w   #299,d1     ; Read 300 words (60 words per board x 5 boards)
		ble	.nextread
		
		eor.w	#$FFFF,d2	; IMPORTANT!!!

		bsr	eeread
		cmp.w	d0,d2		; Do checksums match?
		bne	.bankerror
		
		move.w	#$0,d0
		bra	.eerbout
.bankerror:
		move.w	#$1,d0	
.eerbout:
		movem.l	(sp)+,a0/d1-d2
		rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Procedure: eeUpdateChecksum
;;;            Read a bank of 1023 words, calculate a new checksum, and write it.
;;;
;;; Returns: d0.w = Non-zero indicates an error occurred

eeUpdateChecksum:
		movem.l	d1-d2,-(sp)

		clr.w	d1		; Address counter
		clr.w	d2		; Checksum accumulator
.nextread:
		bsr	eeread		; Read data
		add.w	d0,d2		; Add to checksum
		
		addq.w	#1,d1
        cmp.w   #1023,d1
		blt	.nextread
		
		eor.w	#$FFFF,d2	; IMPORTANT!!!

		move.w	d2,d0
		jsr	eeWriteWord	; Will return error in D0

		movem.l	(sp)+,d1-d2
		rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Procedure: eeValidateChecksum
;;;            Read a bank of 1023 words (+ checksum) and return
;;;	       an error code if checksum does not validate.
;;;
;;; Returns: d0.w = Non-zero indicates an error occurred

eeValidateChecksum:
		movem.l	d1-d2,-(sp)

		clr.w	d1		; Address counter
		clr.w	d2		; Checksum accumulator
.nextread:
		bsr	eeread		; Read data
		add.w	d0,d2		; Add to checksum
		
		addq.w	#1,d1
        cmp.w   #1023,d1
		blt	.nextread
		
		eor.w	#$FFFF,d2	; IMPORTANT!!!

		bsr	eeread
		cmp.w	d0,d2		; Do checksums match?
		bne	.bankerror
		
		move.w	#$0,d0
		bra	.eerbout
.bankerror:
		move.w	#$1,d0	
.eerbout:
		movem.l	(sp)+,d1-d2
		rts


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; LOW-LEVEL PRIMITIVE (DO NOT CALL DIRECTLY...OR MODIFY FOR THAT MATTER)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Procedure: eewrite
;;;            Write a word to EEPROM
;;;
;;;  Inputs: d0.w = data to be written
;;;      d1.w = least signifigant 10 bits specify write address (0-1023)  
;;;

eewrite:
		movem.l	a0/d0-d3,-(sp)
		lea	JOYSTICK,a0  	;set ptr to EEPROM i/o addresses

		tst.w	GPIO_1of(a0)	;strobe ChipSelect

		move.w	#eEWEN,d2	;erase/write enable command
        bsr out13bits    ;send it to EEPROM

		tst.w	GPIO_1of(a0)	;strobe ChipSelect

        andi.w  #$3ff,d1    ;force write addr to be legit (0-1023)
		ori.w	#eWRITE,d1	;form WRITE command
		move.w	d1,d2
        bsr out13bits    ;send it to EEPROM

		move.w	d0,d2		;get 16-bit data word to send
		bsr	out16bit	;  & send it

		tst.w	GPIO_1of(a0)	;strobe ChipSelect

;;; We wait for 6 ms (tEW + 1 ms) to ensure write has completed because the
;;; chip status report can't be relied upon in our case.

        move.w  #2874,d0        ; Wait 6 msecs
wrwait:
		nop			
		nop
		nop
		nop
		nop
		nop
		dbra	d0,wrwait

		move.w	#eEWDS,d2	;get erase/write disable command
        bsr out13bits    ;send it

		tst.w	GPIO_1of(a0)	;strobe ChipSelect

		movem.l	(sp)+,a0/d0-d3
		rts			;we're done

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; LOW-LEVEL PRIMITIVE (DO NOT CALL DIRECTLY...OR MODIFY FOR THAT MATTER)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Procedure: eeread
;;;            Read a word from EEPROM
;;;
;;;  Inputs: d1.w = least signifigant 6 bits specify read address (0-1023)  
;;;
;;; Returns: d0.w = data as read from EEPROM
;;;

eeread:
		movem.l	a0/d1-d3,-(sp)
		lea	JOYSTICK,a0 	;set ptr to EEPROM i/o address

		tst.w	GPIO_1of(a0)	;strobe ChipSelect

        andi.w  #$3ff,d1     ;force legit read addr
		ori.w	#eREAD,d1
		move.w	d1,d2
        bsr out13bits

		moveq	#0,d0
		moveq	#15,d2		;pick up 17 bits (1st is dummy)
inlp:	
		tst.w	GPIO_0of(a0)
		nop
		move.w	(a0),d1
		lsr.w	#1,d1
		addx.w	d0,d0
		nop
		nop
		nop
		nop
		nop
		nop
		dbra	d2,inlp

		movem.l	(sp)+,a0/d1-d3
		rts

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Procedures: out16bit/out13bits
;;;             Output 'x' bits to the eeprom.
;;;	      Serial data sent to device is written to DI, bit0 of GPIO_0
;;;
;;; Inputs: a0.l = JOYSTICK
;;;         d2.w = 13/16-bit data word to write
;;;
;;; Register Usage: d2.w, d3.l are destroyed
;;;			     

out16bit:
		rol.w	#1,d2		;align 1st serial data bit (bit15) to bit0
		moveq	#15,d3		;send 16 bits
        bra.s   out13lp
out13bits:
        rol.w   #4,d2       ;align 1st serial data bit (bit12) to bit0
        moveq   #12,d3      ;send 13
out13lp:
		move.w	d2,GPIO_0of(a0)	;write next bit
		nop
		nop
		nop			;delay next write
		nop
		nop
		nop
		rol.w	#1,d2		;adjust bit0 for next datum
        dbra    d3,out13lp  ;go for all 13 or all 16
		rts


