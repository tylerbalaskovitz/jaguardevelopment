' -----------------------------------------------------------------------
'
' Blitter Example
' Uses the Raptor Blitterlist command to draw directly onto a sprite.
' Sporadic 2020
'
' -----------------------------------------------------------------------
'
' How it works:		The Blitter list array is set up with default values.
'					The first item in the array is set to clear the 'canvas'
'					Inside the main loop the blitter list array is passed to Raptor for processing.
'					Then the list is updated with new values
'				
' Note: 			Sprite and blitter commands are all 16bit graphics.
'					BlitList contains the majority of the blitter registers.
' -----------------------------------------------------------------------

jsfSetFontIndx(0)
jsfSetFontSize(0)

DIM particles%			:	particles=0					'Variable to point to the particles object in the object list
DIM canvasSpr%			:	canvasSpr=1					'Variable to point to the canvas object in the object list

'Get location of canvas sprite graphics
DIM gfxcanvas%			:	gfxcanvas=sprite[canvasSpr].gfxbase		' Get the memory address of the graphics for the canvas sprite (destination gfx)

DIM blitlist%[131,16]										'2d Array to hold the blitter commands

'Other vars
DIM x AS INTEGER			:	x=110
DIM xmod AS INTEGER			:	xmod=2
DIM y AS INTEGER			:	y=0
DIM linecolour AS INTEGER	:	linecolour=200
DIM width AS INTEGER		:	width=100
DIM pie!        			:   pie=3.1415926535897932384626433832795
DIM rads!       			:   rads=(pie/180)
DIM sinz!
DIM sins[360] AS INTEGER
DIM sineloop AS INTEGER		:	sineloop = 0				'counter to iterate through the sine array

'Show a loading message
jsfSetFontIndx(1)
jsfSetFontSize(1)
rapLocate 16,18
rapPrint "Please Wait: Calculating Sine values"

'Create table in memory to store all INT sin values. Faster than working them out real-time
FOR y=0 to 359
    sinz=(sin(y*rads)*64)
    sins[y]=INT(sinz)
NEXT


CLS														'clear the text layer

'Show a loading message
jsfSetFontIndx(1)
jsfSetFontSize(1)
rapLocate 110,170
rapPrint "Blitlist Basic"


'Set up blitter list of commands
FOR y = 0 TO 130
	blitlist[y,0] = gfxcanvas							'Destination gfx									- A1_BASE
	blitlist[y,1] = PIXEL16|XADDPIX|WID320|PITCH1		'Destination Blitter flags							- A1_FLAGS
	blitlist[y,2] = 0									'clipping window									- A1_CLIP
	blitlist[y,3] = (y<<16)+x							'Dest location int pixel pointer - NOTE: y then x	- A1_PIXEL
	blitlist[y,4] = 0				 					'Integer Step value									- A1_STEP_INT
	blitlist[y,5] = 0				 					'Fraction Step value								- A1_STEP_FRAC
	blitlist[y,6] = 0				 					'Fractional draw position							- A1_PIXEL_POINTER
	blitlist[y,7] = 0									'Integer Increment value							- A1_INC_INT
	blitlist[y,8] = 0              						'Fractional Increment value							- A1_INC_FRACT
	blitlist[y,9] = 0  									'Source gfx											- A2_BASE
	blitlist[y,10] = 0	        						'Source Blitter flags								- A2_FLAGS
	blitlist[y,11] = linecolour+y						'Colour of pixels to write							- B_PATD
	blitlist[y,12] = 0				     				'Source location pixel pointer						- A2_PIXEL
	blitlist[y,13] = 0									'Integer Step value									- A2_STEP
	blitlist[y,14] = (1<<16)+width						'Number of pixels to write							- B_COUNT
	blitlist[y,15] = PATDSEL							'Blitter commands									- B_CMD
NEXT y


blitlist[130,0] = -1									'Last item in the array must end in -1
	
	
'Set the first item in the list to always clear the entire destination gfx (We won't change this in the main loop)
blitlist[0,0] = gfxcanvas							'Destination gfx
blitlist[0,1] = PIXEL16|XADDPHR|WID320|PITCH1		'Destination Blitter flags
blitlist[0,2] = 0									
blitlist[0,3] = 0									'Start Pixel - NOTE: y then x
blitlist[0,4] = 0				 					
blitlist[0,5] = 0				 					
blitlist[0,6] = 0				 					
blitlist[0,7] = 0									
blitlist[0,8] = 0              						
blitlist[0,9] = 0	
blitlist[0,10] = 0	
blitlist[0,11] = 0									
blitlist[0,12] = 0			
blitlist[0,13] = 0									
blitlist[0,14] = (130<<16)+320						'Number of pixels to write
blitlist[0,15] = LFU_CLEAR							'draw black pixels
	

'Main loop
DO

	vsync	

	'Pass array of blitter commands to Raptor for processing
	rapBlitlist(strptr(blitlist))
	
	'Cycle the line colour
	linecolour+=12
		
	'Update blitter list (don't have to update variables that haven't changed)
	FOR y = 1 TO 130
	
		blitlist[y,0] = gfxcanvas							'Destination gfx
		blitlist[y,3] = (y<<16)+(x+sins[sineloop>>4])			'Start Pixel - NOTE: y then x
		blitlist[y,14] = (1<<16)+width						'Number of pixels to write
		blitlist[y,11] = linecolour+y*3						'Colour of pixels to write		
		
		sineloop+=1										'Step through the stored sine values
		IF sineloop > (360<<4)-1 THEN					'wrap back to the beginning of the sine values
			sineloop=0
		ENDIF
	NEXT y
	
	blitlist[130,0] = -1								'blitter list must always terminate on a -1
	
LOOP