' -----------------------------------------------------------------------
'
' CalcAngle Example.
'	This will automatically move the enemy sprite towards the player.
'	
'	It works out the 0-511 'angle' between the two sprite positions.
'		Then looks up the Vector to get from point A to B
'
' -----------------------------------------------------------------------


' -----------------------------------------------------------------------
' Define your sprite names here.  In the order of objects in rapinit.s
' -----------------------------------------------------------------------
const sprParticleLayer% = 0
const sprBug1% = 1							' sprBug1 is the name of your sprite to move around.  Its the 2nd object in the list.
const sprBug2% = 2							' This is the auto-moving sprite
const sprBug3% = 3							' This is the auto-moving sprite

DIM pad1 AS INTEGER							' Value to store the joypad movement in

jsfSetFontIndx(1)			' Set font style
jsfSetFontSize(1)			' Set font size


rapLocate 130,182			' Position the text cursor
rapPrint "CalcAngle"		' Print some text on the screen
rapLocate 118,210			' Position the text cursor
rapPrint "DPAD To Move"		' Print some text on the screen

dim angle as integer					' Somewhere to store the 0-511 angle.

DIM calcAngleBuffer[65540] as char		' Create a 64k (+4 bytes) buffer for Raptor to populate with the angle lookup table.

rapInitCalcAngle(calcAngleBuffer)		' Tell Raptor to initilise the buffer ready for use.  You only need to call this once at startup.


jsfSetFontIndx(0)
jsfSetFontSize(0)


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

	
	' Look up the 0-511 'angle' between the enemy and the player positions.
	'	NOTE: We must pass the integer portions of the positions  (hence .x_ and .y_ )
	angle = rapCalcAngle(sprite[sprBug2].x_, sprite[sprBug2].y_, sprite[sprBug1].x_, sprite[sprBug1].y_)


	' Print out the angle found
	rapLocate 20,30
	print "0-511 Angle: ";angle
	
	
	' Ask Raptor to look up the Vector for the angle.
	' This will set the results in rapAngle_xAdd and rapAngle_yAdd
	' NOTE: rapAngle_xAdd and rapAngle_yAdd are 16.16 numbers.
	'		You can multiply/shift the result to speed up or slow down the amount.
	rapAngleVector(angle)		
	
	
	' Print out the results.
	rapLocate 20,50
	print "Vector X: ";rapAngle_xAdd
	
	rapLocate 20,70
	print "Vector Y: ";rapAngle_yAdd

	
	' Set the enemy sprite moving automatically on the new X and Y vector.
	sprite[sprBug2].xadd = rapAngle_xAdd
	sprite[sprBug2].yadd = rapAngle_yAdd
	
	
	
	
	
	
	
	' Move the other enemy towards the player but faster than the previous one.
	angle = rapCalcAngle(sprite[sprBug3].x_, sprite[sprBug3].y_, sprite[sprBug1].x_, sprite[sprBug1].y_)
	rapAngleVector(angle)
	sprite[sprBug3].xadd = rapAngle_xAdd<<2		' Multiply the vector amount by 4
	sprite[sprBug3].yadd = rapAngle_yAdd<<2		' Multiply the vector amount by 4
	
	


	VSYNC					' Screen Update
	
LOOP