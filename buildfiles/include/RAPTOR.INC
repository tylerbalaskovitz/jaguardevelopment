;;
;; RAPTOR INCLUDE FILE 
;; 
;; DO NOT MODIFY
;;

sprite_tabwidth			equ				192				; bytewidth of a single sprite entry in sprite database (below)
sprite_obj				equ				0				; pointer to object in OL
sprite_active			equ				4				; active flag (-1 = inactive)
sprite_x				equ				8				; x position in 16.16
sprite_y				equ				12				; y position in 16.16
sprite_xadd				equ				16				; x velocity to add in 16.16
sprite_yadd				equ				20				; y velocity to add in 16.16
sprite_flip				equ				24				; if set, add _width to X and set mirror
sprite_width			equ				28				; width of sprite
sprite_height			equ				32				; height of sprite
sprite_vbox				equ				36				; vertical distance from midpoint for collision clipping
sprite_hbox				equ				40				; horizontal distance from midpoint for collision clipping
sprite_gfxbase			equ				44				; pointer to phrase aligned sprite bitmap data
sprite_framesz			equ				48				; size of sprite frame in bytes (offset to next frame)
sprite_framedel			equ				52				; vblanks till next sprite animation frame
sprite_curframe			equ				56				; current frame number (or 0 for no frames)
sprite_maxframe			equ				60				; maximum frame for sprite
sprite_animloop			equ				64				; -1 = loop animation, 1=terminate on loop
sprite_wrap				equ				68				; flag for wrap or disable on leaving screen
sprite_timer			equ				72				; frames to stay alive, or -2 for infinite
sprite_track			equ				76				; -1 = use fract update, else pointer to x.y co-ords
sprite_colchk			equ				80				; -1 = no collision detection
sprite_scaled			equ				84				; -1 = unscaled, 1 = scaled
sprite_scale_x			equ				88				; x-scaler
sprite_scale_y			equ				92				; y-scaler
sprite_CLUT				equ				96				; -1 for no change, else CLUT to use for sprite if <16bit
sprite_animspd			equ				100				; animation speed
sprite_bytewid			equ				104				; width of one scanline of sprite in bytes
sprite_tracktop			equ				108				; loop point for tracking, or -1 for exit
sprite_was_hit			equ				112				; set to +ve if by the collision routine if sprite hit
sprite_coffx			equ				116				; offset from center for bounding box (hbox)
sprite_coffy			equ				120				; offset from center for bounding box (vbox)
sprite_remhit			equ				124				; 1 = remove if hit, else leave onscreen
sprite_bboxlink			equ				128				; -1, or pointer to bounding box link data
sprite_hitpoint			equ				132				; hitpoints of damage to take before removal
sprite_damage			equ				136				; damage to deal
sprite_flash			equ				140				; <<< CURRENTLY DOES NOTHING <<<
sprite_gwidth			equ				144				; graphics width
sprite_rmotion			equ				148				; pointer to RMotion animation
sprite_rmcurfrm			equ				152				; RMotion internal
sprite_rmfrm			equ				156				; RMotion internal
sprite_bdepth			equ				160				; Bit depth of sprite
sprite_cryrgb			equ				164				; CRY/RGB flag of sprite
sprite_trans			equ				168				; Transparency flag of sprite
sprite_userdat1			equ				172				; User Data
sprite_userdat2			equ				176				; User Data
sprite_userdat3			equ				180				; User Data
sprite_userdat4			equ				184				; User Data
sprite_indexnumber		equ				188				; Sprite index number (Used by JagStudio higher level languages - also makes table 192 bytes for shift offsets)

particle_tabwidth		equ				44				; bytewidth of a single particle entry in particle database (below)
particle_active			equ				0				; particle in use flag
particle_x				equ				4				; x position in 16.16 format
particle_y				equ 			8				; y position in 16.16 format
particle_angle			equ 			12				; angle (0-511) 0=right
particle_speed			equ				16				; speed of particle 
particle_angspd			equ 			20				; angular speed of particle (+=clockwise/-=anticlock)
particle_colour			equ				24				; initial colour (0-15)
particle_coldec			equ				28				; colour decay rate (in frames)
particle_curdec			equ				32				; counter for above
particle_life			equ				36				; pixel timetime (in frames)
particle_address		equ				40				; position in ram where particle was ploted (used to clear)

;;
;; Human readables for RAPINIT.S
;;

is_active				equ				1				; Object is ACTIVE 
is_inactive				equ 			-1				; Object is INACTIVE
is_normal				equ 			1				; Object is normal orientation
is_flipped				equ 			-1				; Object is flipped Horizontally
ani_rept				equ				-1				; Object will play animation chain looped
ani_once				equ 			1				; Object will play animation chain once, then terminate itself
edge_wrap				equ				1				; Object will wrap when moving off the edge of the screen
edge_ignore				equ				0				; Object will not be removed or wrap when moving off edge of screen
edge_kill				equ				-1				; Object will terminate itself when moving off the edge of the screen
spr_inf					equ 			-2				; Object will stay active until another condition to remove it is met
spr_linear				equ 			-1				; Object will use standard co-ordinates (else points to x/y table)
spr_scale				equ				1				; Object is scaled bitmap
spr_unscale				equ 			-1				; Object is normal bitmap
no_CLUT					equ 			-1				; Object does not use a CLUT (16/24 bit mode)
is_trans				equ 			1				; Object is Transparent
is_opaque				equ 			0				; Object is Opaque
can_hit					equ				1				; Object can be hit
cant_hit				equ 			-1				; Object can't be hit
cd_remove				equ 			1				; Object will be terminated if it collides with another object
cd_keep					equ				-1				; Object will remain if it collides with another object
is_cry					equ 			-1				; Object is CRY16 bitmap
is_RGB					equ				1				; Object is RGB mode
single					equ				-1				; Object only has one bounding box for collision detection, otherwise pointer to multibox data


;; changes for BRA objects
;;
;; set sprite_active to +1 if BRA to be updated, else it will remain as-is

obj_bra_y				equ				sprite_y		; store Y comparison
obj_bra_type			equ				sprite_x		; store BRA type (BAlways, BLess, BMore)
obj_isBRA				equ				sprite_timer	; set to -3 if BRA object
obj_link				equ				sprite_xadd		; jump offset in objects

;;
;; RAPTOR runtime equates
;;

left_edge				equ				32				; used for clipping - DO NOT CHANGE
ob_list					equ				$200000-$8000	; address of Object List
ob_list1				equ				ob_list+$4000	; address of Shadow Object List
vidCRY16				equ				%000			; MASK for CRY mode
vidRGB24				equ				%010			; MASK for RGB24 mode
vidDIRECT16				equ				%100			; MASK for direct16 mode
vidRGB16				equ				%110			; MASK for RGB16 mode
vidENABLE				equ				%1				; MASK for Video ENABLE
vidDISABLE				equ				%0				; MASK for Video DISABLE
vidVARMOD_OFF			equ				%0				; MASK for VARMOD off
vidVARMOD_ON			equ				%1				; MASK for VARMOD on
rcd_normal				equ				1				; RAPTOR Collision Mode flag
rcd_testonly			equ				-1				; RAPTOR Collision Mode flag
PAL_vert_off			equ				42				; Vertical offset to first PAL scanline 
BR_always				equ				2				; Used when building objects
BR_more					equ				1				; Used when building objects
BR_less					equ				0				; Used when building objects
raptor_structwid		equ				148				; Size of a single RAPTOR object in _RAPINIT.S
initial_list			equ				0				; Initial list to display after INIT
sprite_max				equ				512				; Maximum number of sprites
hitmask_flash			equ				-5				; used if collision FLASH enabled
RAPTOR_topclip_line		equ	 			1				; used internally to clip objects on the upper border
		
;;
;; RAPTOR Text Output Command Codes
;;
		
raptor_t_quit			equ				-1				; End of string
raptor_t_lf				equ				-2				; Line Feed
raptor_t_font_idx		equ				-3				; Set Font INDEX
raptor_t_font_siz		equ				-4				; Set Font SIZE
raptor_t_pos_xy			equ				-5				; Set cursor position
raptor_t_home			equ				-6				; Home the cursor
raptor_t_right			equ				-7				; Subspace right 2 pixels

raptor_clk_freeze		equ				0				; command number to stop the clock
raptor_clk_cdown		equ				4				; command number for clock to count down
raptor_clk_cup			equ				8				; command number for clock to count up

;;
;; RAPTOR EXTERNALS
;;
;; Functions start with RAPTOR_
;; Variables start with raptor_ (Mostly!)
;;

;; Setup functions
;; ----------------------------------------------------------------------------------------------------

	.extern		RAPTOR_Install							; Internal object use
	.extern		RAPTOR_HWinit							; documented
	.extern		RAPTOR_InitVideo						; Internal object use
	.extern		RAPTOR_start_video						; documented
	.extern		RAPTOR_setlist							; documented
	.extern		RAPTOR_init_calc_angle					; documented
	.extern		RAPTOR_flashcheck						; -------
	
;; Core Functions 
;; ----------------------------------------------------------------------------------------------------

	.extern		RAPTOR_HANDLER							; documented
	.extern		RAPTOR_UPDATE_ALL						; documented
	.extern		RAPTOR_UPDATE_SPRITES					; documented
	.extern		RAPTOR_VB_INTERUPT						; documented
	.extern		RAPTOR_ERROR							; documented
	.extern		RAPTOR_call_GPU_code					; documented
	.extern		RAPTOR_call_GPU_code_STOP				; documented
	.extern		RAPTOR_call_GPU_code_nowait				; documented

;; Object Handling functions and exposed variables
;; ----------------------------------------------------------------------------------------------------

	.extern		RAPTOR_wait_frame						; documented
	.extern		RAPTOR_wait_frame_UPDATE_ALL			; documented
	.extern		RAPTOR_CreateObject						; documented
	.extern		RAPTOR_rmw								; documented
	.extern		RAPTOR_setpalt							; documented
	.extern		RAPTOR_reflect							; documented
	.extern		RAPTOR_setup_object_xyg					; documented
	.extern		RAPTOR_setup_object_xg					; documented
	.extern		RAPTOR_setup_object_g					; documented
	.extern		RAPTOR_setup_object_xy					; documented
	.extern		RAPTOR_setup_object_xyz					; documented
	.extern		RAPTOR_setup_object_bra					; documented
	.extern		RAPTOR_obj_shift						; documented
	.extern		RAPTOR_objsort							; documented
	.extern		RAPTOR_attach_rmotion					; documented
	
	.extern		raptor_spritetab						; documented
	.extern		raptor_fade_delay						; documented
	
;; Collision functions and exposed variables	
;; ----------------------------------------------------------------------------------------------------

	.extern		RAPTOR_GPU_COLLISION					; documented
	.extern		RAPTOR_GPU_COLLISION_USERTABLE			; documented

	.extern		raptor_collisionlist					; documented
	.extern		raptor_col_user							; documented
	.extern		raptor_result							; documented
	.extern		raptor_targetl							; documented
	.extern		raptor_targeth							; documented
	.extern		raptor_sourcel							; documented
	.extern		raptor_sourceh							; documented
	.extern		raptor_type								; documented

;; Teamtap functions and exposed variables
;; ----------------------------------------------------------------------------------------------------

	.extern		RAPTOR_check_left_teamptap				; Check if left teamtap is present
	.extern		RAPTOR_read_left_teamtap_state			; Scan the ports in the left teamtap
	.extern		RAPTOR_read_left_teamtap_pad			; Return a left teamtap pad state
	.extern		RAPTOR_check_right_teamptap				; Check if right teamtap is present
	.extern		RAPTOR_read_right_teamtap_state			; Scan the ports in the right teamtap
	.extern		RAPTOR_read_right_teamtap_pad			; Return a right teamtap pad state

	.extern		raptor_left_teamtap						; connection status of left teamtap
	.extern		raptor_left_teamtap_pad0				; U235 compatible long for Left Pad 0
	.extern		raptor_left_teamtap_pad1				; U235 compatible long for Left Pad 1
	.extern		raptor_left_teamtap_pad2				; U235 compatible long for Left Pad 2
	.extern		raptor_left_teamtap_pad3				; U235 compatible long for Left Pad 3
	.extern		raptor_right_teamtap					; connection status of Right teamtap
	.extern		raptor_right_teamtap_pad0				; U235 compatible long for Right Pad 0
	.extern		raptor_right_teamtap_pad1				; U235 compatible long for Right Pad 1
	.extern		raptor_right_teamtap_pad2				; U235 compatible long for Right Pad 2
	.extern		raptor_right_teamtap_pad3				; U235 compatible long for Right Pad 3

	
;; Map module functions and exposed variables	
;; ----------------------------------------------------------------------------------------------------
	
	.extern		RAPTOR_map_update_GPU					; documented
	.extern		RAPTOR_init_map_objs					; documented
	.extern		RAPTOR_map_set_position					; documented
	
	.extern		raptor_maptop_obj						; documented
	.extern		raptor_tiles_x							; documented
	.extern		raptor_tiles_y							; documented
	.extern		raptor_tilesperx						; documented
	.extern		raptor_tilespery						; documented
	.extern		raptor_mapwidth							; documented
	.extern		raptor_mapheight						; documented
	.extern		raptor_maxparts							; documented (raptor_particle pixels)
	.extern		raptor_mapindex							; documented
	.extern		raptor_mapbmptiles						; documented
	.extern		raptor_tilerem_mask						; documented
	.extern		raptor_map_position_x					; documented
	.extern		raptor_map_position_y					; documented
	.extern		raptor_gmap_startx
	.extern		raptor_gmap_starty
	.extern		raptor_map_tiles_bits
		
;; Particle modele functions and exposed variables
;; ----------------------------------------------------------------------------------------------------
	
	.extern		RAPTOR_UPDATE_PARTICLES					; documented
	.extern		RAPTOR_UPDATE_PARTICLES_ERASE			; documented
	.extern		RAPTOR_UPDATE_PARTICLES_PLOT			; documented
	.extern		RAPTOR_particle_injection_GPU			; documented
	.extern		RAPTOR_particles_GPU_erase				; documented
	.extern		RAPTOR_particles_GPU_plot				; documented
	.extern		RAPTOR_update_particles_GPU				; documented
	.extern		RAPTOR_particle_init					; documented
	.extern		RAPTOR_particle_clear					; documented
	.extern		RAPTOR_GPUcalcangle						; Internal object use
	.extern		RAPTOR_calc_angle						; documented

	.extern		RAPTOR_particle_trigtable				; documented		
	.extern		RAPTOR_particle_gfxbase					; documented		
	.extern		raptor_part_inject_addr					; documented
	.extern		raptor_gpu_x1							; documented
	.extern		raptor_gpu_y1							; documented
	.extern		raptor_gpu_x2							; documented
	.extern		raptor_gpu_y2							; documented
	.extern		raptor_ang_search						; documented
	.extern		raptor_partbuf_x						; documented
	.extern		raptor_partbuf_y						; documented
	.extern		raptor_pdriftx							; documented
	.extern		raptor_pdrifty							; documented
	.extern		raptor_pgfx								; documented
	.extern		raptor_pgfxe							; documented
	.extern		raptor_partitab							; documented
	
;; Graphic data manipulation functions and exposed variables
;; ----------------------------------------------------------------------------------------------------
	
	.extern		RAPTOR_move_palette						; documented
	.extern		RAPTOR_GFXConvert						; documented
	.extern 	RAPTOR_fade_clut						; documented
	.extern		RAPTOR_fade_clutindex					; documented

;; Blitter 	functions and exposed variables
;; ----------------------------------------------------------------------------------------------------

	.extern		RAPTOR_blitter							; documented
	.extern		raptor_blitter_use						; documented
	.extern		raptor_blitlist_ptr						; documented
	

;; Compression functions and exposed variables
;; ----------------------------------------------------------------------------------------------------
	
	.extern		RAPTOR_d_lz77							; documented
	.extern		RAPTOR_NRVUnpack						; documented
	.extern		RAPTOR_NRV2E_GPU_depack					; documented (RAPTOR_NRVunpack)
	.extern		raptor_nrv2e_source						; documented (RAPTOR_NRVunpack)
	.extern		raptor_nrv2e_destination				; documented (RAPTOR_NRVunpack)
	.extern		RAPTOR_ShrinklerDecompress				; documented
	.extern		RAPTOR_PackFireDecompress				; documented
	.extern		RAPTOR_PackFire_TinyDecompress			; documented
	
;; Score management functions and exposed variables	
;; ----------------------------------------------------------------------------------------------------
	
	.extern		RAPTOR_chk_highscores					; documented
	.extern		RAPTOR_resort_score_table				; documented
	.extern		raptor_last_score_hex					; documented
	.extern		raptor_last_score_name					; documented
	.extern		raptor_user_savedata					; documented
	.extern		raptor_highscores1_hex					; documented
	.extern		raptor_highscores1_nam					; documented
	.extern		raptor_highscores2_hex					; documented
	.extern		raptor_highscores2_nam					; documented
	.extern		raptor_highscores3_hex					; documented
	.extern		raptor_highscores3_nam					; documented
	.extern		raptor_highscores4_hex					; documented
	.extern		raptor_highscores4_nam					; documented
	.extern		raptor_highscores5_hex					; documented
	.extern		raptor_highscores5_nam					; documented

;; Debugging Console functions and exposed variables	
;; ----------------------------------------------------------------------------------------------------

	.extern		RAPTOR_console_update_registers			; documented
	.extern		RAPTOR_console_update_usermonitors		; documented
	.extern		RAPTOR_console_update_textline			; documented
	.extern		RAPTOR_console_inverse					; documented
	.extern		raptor_console_x						; documented
	.extern		raptor_console_y						; documented
	.extern		raptor_console_visible					; documented
	.extern		raptor_console_monitors					; documented

;; Clock functions and exposed variables	
;; ----------------------------------------------------------------------------------------------------

	.extern 	RAPTOR_setclock							; documented
	.extern 	RAPTOR_addclock							; documented
	.extern 	RAPTOR_subclock							; documented
	
	.extern 	raptor_clock_jiffies					; documented
	.extern 	raptor_clock_mode						; documented
	.extern 	raptor_clock_hex						; documented
	.extern 	raptor_clock_val						; documented
	
;; Print/Output functions and exposed variables	
;; ----------------------------------------------------------------------------------------------------

	.extern		RAPTOR_print							; documented					
	.extern		RAPTOR_printr							; documented
	.extern		RAPTOR_HEXtoDEC							; documented
	.extern		RAPTOR_HEXtoASCII
	.extern		RAPTOR_use8x8fontpal					; ----------
	.extern		RAPTOR_use8x16fontpal					; ----------
	.extern		RAPTOR_use16x16fontpal					; ----------
	.extern		RAPTOR_usepartipal						; ----------
	
	.extern		raptor_partipal							; documented
	.extern		raptor_font8x8_pal						; documented
	.extern		raptor_font8x16_pal						; documented
	.extern		raptor_font16x16_pal					; documented
	.extern		raptor_8x8_addr							; documented
	.extern		raptor_8x16_addr						; documented
	.extern		raptor_16x16_addr						; documented

;; MemoryTrak and EEPROM (Note: 2K EEPROM ONLY) functions and exposed variables	
;; ----------------------------------------------------------------------------------------------------

	.extern		raptor_MTwork							; documented
	.extern		raptor_mtapp							; documented
	.extern		raptor_mtfn								; documented
	.extern		raptor_MT_save_length					; documented
	.extern		raptor_MT_start_address					; documented
	.extern		RAPTOR_eeReadLongWord					; documented
	.extern		RAPTOR_eeWriteLongWord					; documented
	.extern		RAPTOR_eeWriteWord						; documented
	.extern		RAPTOR_eeReadWord						; documented
	.extern		RAPTOR_eeWriteBank						; documented
	.extern		RAPTOR_eeReadBank						; documented
	.extern		RAPTOR_eeUpdateChecksum					; documented
	.extern		RAPTOR_eeValidateChecksum				; documented
	
;; Misc functions and exposed variables	
;; ----------------------------------------------------------------------------------------------------
	
	.extern		RAPTOR_Version							; documented
	.extern		RAPTOR_update_offscreenlist				; documented
	.extern		RAPTOR_random							; documented
	.extern		raptor_vidmode							; documented
	.extern		raptor_videnable						; documented
	.extern		raptor_varmod							; documented
	.extern		raptor_VI								; documented
	.extern		raptor_top_of_bss						; documented
	.extern		raptor_trashram							; documented
	.extern		raptor_uvbi_jmp							; documented
	.extern		raptor_poobjl							; documented
	.extern		raptor_probjl							; documented
	.extern		raptor_inittab							; documented
	.extern		raptor_ticks							; documented
	.extern		raptor_liststart						; documented (RAPTOR_setlist)
	.extern		raptor_ntsc_flag						; documented
	.extern		raptor_vbl_time_remain					; documented
	.extern		raptor_table_starts						; -------

;; Required from RAPTOR Apps to pass back into the RAPTOR.O
;; ----------------------------------------------------------------------------------------------------

	.extern		RAPTOR_PRE_Object_List					; Required for RAPTOR.O integration
	.extern		RAPTOR_POST_Object_List					; Required for RAPTOR.O integration
	.extern		_trashram								; Required for some of the examples

;END OF FILE.

