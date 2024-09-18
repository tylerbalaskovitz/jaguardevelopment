' -----------------------------------------------------------------------
'
' Horizontal Image scroller.  Handy for game backdrop scrolling.
' Sporadic 2016
'
' -----------------------------------------------------------------------
'
' How it works: Smooth scroll the sprite by 16 pixels.
'				After that, move the Gfx base address on by a 16 pixel chunk and reset the sprite back to the start position.
'				Carry on smooth scrolling the sprite and repeat the above.
' Note: 		The background image is 8 bit which is why we add 16 to the base address. If it was 4 bit, then only add 8 to the base address.
' Purpose: 		It's more efficient for the object processor to handle a narrower image than one many screens wide.
'				For this we are moving a 'window' over the image being viewed.
'
' -----------------------------------------------------------------------

'Set default font size and type
jsfSetFontIndx(0)
jsfSetFontSize(1)

'print instructions on the screen
rapLocate 60,190
rapPrint "DPAD Left/Right to scroll"

'set up index variables for use with the sprite[] accessor.  These equate to the object positions within the object list in rapinit.s
dim backgroundObject as integer			:	backgroundObject 		= 0
dim particleLayerObject as integer		:	particleLayerObject 	= 1

'Load CLUT
jsfLoadClut(strptr(BACKGROUND_clut),0,256)

'Other variables
DIM pad1 			AS INTEGER	: pad1=0
DIM scrollX 		AS INTEGER
DIM scrollXmax 		AS INTEGER
DIM backgroundGfx 	AS INTEGER

'Scroll Max is the total distance right the image can scroll to the right
scrollXmax = INT((1280-370))		' (maximum image width) - (screenwidth+16 pixels)
scrollX = 0

'Background sprite start position
sprite[backgroundObject].x = -16<<16

'Get base address of the background sprite graphic before any changes are made.
backgroundGfx = sprite[backgroundObject].gfxbase


DO

	pad1=jsfGetPad(1)														'Get pad input
	IF pad1 BAND JAGPAD_LEFT AND scrollX > 0 THEN
		sprite[backgroundObject].x += (1<<16)								'Smooth scroll the background sprite.		
		IF sprite[backgroundObject].x > -1<<16 THEN							'When it has moved 16 pixels, reset sprite position and bump the graphic address by 16 pixels.		
			scrollX -= 16													'track how far scrolled in 16 pixel chunks.		
			sprite[backgroundObject].gfxbase = backgroundGfx + scrollX		'Move(scroll) the graphic address by the amount scrolled.	
			sprite[backgroundObject].x = -16<<16							'Reset the position of the sprite ready to smooth scroll the next 16 pixels.
		ENDIF
	ELSEIF pad1 BAND JAGPAD_RIGHT AND scrollX < scrollXmax THEN		
		sprite[backgroundObject].x -= (1<<16)								'Same as above but going the other way.
		IF sprite[backgroundObject].x < -15<<16 THEN			
			scrollX += 16			
			sprite[backgroundObject].gfxbase = backgroundGfx + scrollX		'We are still adding the scrolled amount of 16 pixel chunks on to the base address	
			sprite[backgroundObject].x = 0<<16								'Reset the position of the sprite ready to smooth scroll the next 16 pixels.
		ENDIF
	ENDIF
	
	VSYNC																	'Update screen
	
LOOP

