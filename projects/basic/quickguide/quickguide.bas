' -----------------------------------------------------------------------
'
' Example project from the quickstart guide.
'
' -----------------------------------------------------------------------


' -----------------------------------------------------------------------
' Define your sprite names here.  In the order of objects in rapinit.s
' -----------------------------------------------------------------------
const sprParticleLayer% = 0
const sprBug1% = 1							' sprBug1 is the name of your sprite to move around.  Its the 2nd object in the list.
const sprBug2% = 2							' This is the auto-moving sprite

DIM pad1 AS INTEGER							' Value to store the joypad movement in


jsfSetFontIndx(1)							' Set font style
jsfSetFontSize(1)							' Set font size


rapLocate 130,182							' Position the text cursor
rapPrint "JagStudio"						' Print some text on the screen


' Main Loop
Do

	pad1 = jsfGetPad(LEFT_PAD)				' Get the buttons pressed on the joypad

    IF pad1 BAND JAGPAD_UP THEN   			' If up is pressed, move the sprite up
        sprite[sprBug1].y_ -= 2       		' Subtract 2 from the y position
    ELSEIF pad1 BAND JAGPAD_DOWN THEN   	' If down is pressed, move the sprite down
        sprite[sprBug1].y_ += 2       		' Add 2 to the y position
    ENDIF

    IF pad1 BAND JAGPAD_LEFT THEN   		' If left is pressed, move the sprite left
        sprite[sprBug1].x_ -= 2       		' Subtract 2 from the x position
    ELSEIF pad1 BAND JAGPAD_RIGHT THEN   	' If right is pressed, move the sprite right
        sprite[sprBug1].x_ += 2       		' Add 2 to the x position
    ENDIF
	
	
	IF pad1 BAND JAGPAD_B THEN   			' If B is pressed, play the sound effect
		
		'channel, start of sound, end of sound, Hz, options.
		
		zeroPlaySample(1, strptr(explode_sam), (strptr(explode_sam_end)-strptr(explode_sam)+3) and 0xfffffffc, (46168/8000), Zero_Audio_8bit_Signed)
    
	ENDIF


	VSYNC									' this is required so the sprites update on the screen
	
LOOP