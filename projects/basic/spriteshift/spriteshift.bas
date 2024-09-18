' -----------------------------------------------------------------------
'
' Example to show multi-sprite position change.
'
' -----------------------------------------------------------------------


' -----------------------------------------------------------------------
' Define your sprite names here.  In the order of objects in rapinit.s
' -----------------------------------------------------------------------
const sprParticleLayer% = 0
const sprBug1% = 1							' 
const sprBug2% = 2							' 
const sprBug3% = 3							' 

DIM pad1 AS INTEGER							' Value to store the joypad movement in


jsfSetFontIndx(1)							' Set font style
jsfSetFontSize(1)							' Set font size
rapLocate 80,182							' Position the text cursor
rapPrint "JagStudio - SpriteShift"			' Print some text on the screen

jsfSetFontIndx(0)							' Set font style
jsfSetFontSize(0)							' Set font size
rapLocate 30,200							' Position the text cursor
rapPrint "Move Left to see offscreen sprite"' Print some text on the screen

DIM xshift AS INTEGER
DIM yshift AS INTEGER


' Main Loop
Do

	xshift = 0
	yshift = 0

	pad1 = jsfGetPad(LEFT_PAD)				' Get the buttons pressed on the joypad

    IF pad1 BAND JAGPAD_UP THEN   			' If up is pressed, move the sprite up
        yshift = -2<<16       					' Subtract 2 from the y position
    ELSEIF pad1 BAND JAGPAD_DOWN THEN   	' If down is pressed, move the sprite down
        yshift = 2<<16       					' Add 2 to the y position
    ENDIF

    IF pad1 BAND JAGPAD_LEFT THEN   		' If left is pressed, move the sprite left
        xshift = -2<<16   						' Subtract 2 from the x position
    ELSEIF pad1 BAND JAGPAD_RIGHT THEN   	' If right is pressed, move the sprite right
        xshift = 2<<16      					' Add 2 to the x position
    ENDIF
	
	IF xshift <> 0 OR yshift <> 0 THEN
		rapSpriteShift(xshift, yshift, sprBug1, 3)	' Update the position of sprBug1 and the 2 sprites that follow.
	ENDIF


	VSYNC									' this is required so the sprites update on the screen
	
LOOP