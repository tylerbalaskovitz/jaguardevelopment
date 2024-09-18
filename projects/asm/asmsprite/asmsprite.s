;
; Template ASM Project
;
			include				"rapapp.s"
			
			.text	
	
ID_backdrop						equ				0										; RAPTOR Object number for the backdrop
ID_player						equ				ID_backdrop+1							; RAPTOR Object number for player
ID_enemy						equ				ID_player+1								; RAPTOR Object number for the first enemy
ID_textlayer					equ				ID_enemy+50								; RAPTOR Object number for text layer

CLUT_player						equ				0										; 16 colour sub index into the 256 colour CLUT for the player sprite
CLUT_enemy						equ				1										; CLUT for enemies
CLUT_text						equ				15										; Text / Particle layer ALWAYS uses CLUT15	
	
	
	
	
;; MAIN ENTRY POINT
.globl	__Z9basicmainv
__Z9basicmainv:

	
	; Use a JagStudio function to load in the clut.
	; Load the CLUT from the player sprite into CLUT position 0 (CLUT_player)
			pea 	16.w					; 16 colours in this clut
			pea 	CLUT_player.w			; CLUT Index we are copying to
			pea 	BMP_PLAYER_clut			; Address of the assets CLUT
			lea 	jsfLoadClut,a2
			jsr 	(a2)
			
	
	; Manually load in 16 CLUT colours yourself (this is faster)
	; Load the CLUT from the enemy sprite into CLUT position 1 (CLUT_enemy)
			movem.l	BMP_ENEMY_clut,d0-d7
			movem.l	d0-d7,CLUT+(32*CLUT_enemy)
	
	
	;; configure the initial enemy positions
			jsr		Enemy_Initial_Positions		
	
	
	;; put some text on the screen
			
			lea		txt_hello_world,a0													; point to a text string
			move.l	#20,d0																; x=20
			move.l	#20,d1																; y=20
			moveq	#0,d2																; Font Size = 0 (8x8)
			moveq	#0,d3																; Font Index = 0
			jsr		RAPTOR_print														; PRINT the version

			clr.l	U235SE_pad1															; clear pad input flags
		
LOOP:		jsr		RAPTOR_wait_frame_UPDATE_ALL										; Sync to VBLANK and Update ALL RAPTOR objects
			jsr		Enemy_Update_Positions												; Make them march!
			jsr		Player_Update_Position												; Move the player
			bra		LOOP	
			
			
			
;;
;; Subroutines
;;
			
Enemy_Initial_Positions:
			move.l	#$00008000,enemy_direction											; X addition in 16.16 (so 0.5 pixels / update)
			lea		RAPTOR_sprite_table+(ID_enemy*sprite_tabwidth),a0					; point to RAPTOR object table
			move.l	#40,d1																; initial Y
			move.l	#4,d7																; 5 rows
.vert:		move.l	#20,d0																; initial X per row
			move.l	#9,d6																; 10 per row
.horiz:		move.l	enemy_direction,sprite_xadd(a0)										; x-addition value
			move.w	d0,sprite_x(a0)														; set x-position
			move.w	d1,sprite_y(a0)														; set y-position
			lea		sprite_tabwidth(a0),a0												; next object
			add.w	#20,d0																; add 20 to x
			dbra	d6,.horiz															; loop for horiz
			add.w	#20,d1																; add 20 to y
			dbra	d7,.vert															; loop for vertical
			rts																			; exit

enemy_direction:	dc.l	$00008000
			
Enemy_Update_Positions:
			lea		RAPTOR_sprite_table+(ID_enemy*sprite_tabwidth),a0					; point to RAPTOR object table
; check if any enemies hit the edge:
			move.l	#49,d7																; 50 enemies
.edgechk:	move.w	sprite_x(a0),d0														; get x-position of current enemy	
			cmp.w	#19,d0																; left edge?
			beq		.change_direction													; if yes, change direction on all enemies
			cmp.w	#320,d0																; right edge?
			beq		.change_direction													; if yes, change direction on all enemies
			lea		sprite_tabwidth(a0),a0												; next object
			dbra	d7,.edgechk															; loop around for all
			rts																			; exit
			
; ok, we need to change the direction of all enemies
.change_direction:
			not.w	enemy_direction														; flip X addition value
			move.l	enemy_direction,d0													; get the X-value
			lea		RAPTOR_sprite_table+(ID_enemy*sprite_tabwidth),a0					; point to RAPTOR object table
			move.l	#49,d7																; 50 enemies
.change:	move.l	d0,sprite_xadd(a0)													; write new direction
			cmp.w	#220,sprite_y(a0)													; Y on player line?
			beq		Enemy_Initial_Positions												; if yes, reset everything!
			add.w	#10,sprite_y(a0)													; drop down 10 lines of pixels
			lea		sprite_tabwidth(a0),a0												; next object
			dbra	d7,.change															; loop around for all
			rts																			; exit

Player_Update_Position:
			lea		RAPTOR_sprite_table+(ID_player*sprite_tabwidth),a0					; point to RAPTOR object table
			move.w	sprite_x(a0),d0														; get player's current X position
			move.l	U235SE_pad1,d1														; get PAD1 status (from U235)

.chk_left:	btst	#U235SE_BBUT_LEFT,d1												; was LEFT pressed?
			beq		.chk_right															; if not, check next condition
			cmp.w	#20,d0																; already at far-left position?
			beq		.chk_done															; if so, don't move and exit routine
			subq	#1,d0																; subtract 1 from X-positoin
			bra		.chk_done															; exit the routine
	
.chk_right:	btst	#U235SE_BBUT_RIGHT,d1												; was RIGHT pressed?
			beq		.chk_done															; if not, exit the routine
			cmp.w	#320,d0																; alrady at far-right position?
			beq		.chk_done															; if so, don't move and exit routine
			addq	#1,d0																; add 1 to X-position
		
.chk_done:	move.w	d0,sprite_x(a0)														; store the new x-position
			rts																			; exit
	

;;
;; Some text to demo the RAPTOR_print command
;;
	
txt_hello_world:	
			dc.b	raptor_t_font_siz,0													; set font size to 0 (8x8)
			dc.b	"Use DPAD Left and Right"
			dc.b	raptor_t_quit														; end of string
			.even		

