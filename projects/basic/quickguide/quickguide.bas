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

DIM pad1 AS INTEGER							' Value to store the joypad movement in

DIM scrolling AS INTEGER							' Value to store the joypad movement in
DIM tx AS INTEGER							' Value to store the joypad movement in
DIM ty AS INTEGER							' Value to store the joypad movement in
DIM winner AS STRING
DIM p1 AS STRING
DIM p2 AS STRING
DIM p3 AS STRING
DIM p4 AS STRING
DIM p5 AS STRING
DIM p6 AS STRING
DIM spaces as INTEGER
winner = ""
tx = 38
ty = 182
p1 = "Tyler"
p2 = "Loving"
p3 = "John"
p4 = "Navraj"
p5 = "Matt"
p6 = "Christian"
scrolling = 0
jsfSetFontIndx(0)							' Set font style
jsfSetFontSize(1)							' Set font size

FUNCTION AssignWinner(inputString AS STRING)
    winner = inputString  ' Assign the value to the global string
	scrolling = 1	
END FUNCTION

FUNCTION ScrollString(inputString AS STRING)
 IF scrolling = 1 THEN
 	tx -=2
	rapLocate tx,ty							' Position the text cursor
		if LEN(inputString) >= 9 then
		spaces = 0
		else
		spaces = 2
		endif
	 print "Congratulations!",inputString," is the winner!",SPACE$(spaces)
	 VSYNC
ELSE
	rapLocate tx,ty							' Position the text cursor
	rapPrint "Who will be today's winner?"						' Print some text on the screen
 ENDIF

END FUNCTION




' Main Loop
Do

ScrollString(winner)

	pad1 = jsfGetPad(LEFT_PAD)				' Get the buttons pressed on the joypad

    IF pad1 BAND JAGPAD_1 THEN   			' If up is pressed, move the sprite up
    AssignWinner(p1)
    ENDIF

    IF pad1 BAND JAGPAD_2 THEN   		' If left is pressed, move the sprite left
    AssignWinner(p2)
    ENDIF
	
    IF pad1 BAND JAGPAD_3 THEN   		' If left is pressed, move the sprite left
    AssignWinner(p3)
    ENDIF
    
    IF pad1 BAND JAGPAD_4 THEN   		' If left is pressed, move the sprite left
    AssignWinner(p4)
    ENDIF

    IF pad1 BAND JAGPAD_5 THEN   		' If left is pressed, move the sprite left
    AssignWinner(p5)
    ENDIF

    IF pad1 BAND JAGPAD_6 THEN   		' If left is pressed, move the sprite left
    AssignWinner(p6)
    ENDIF

    IF pad1 BAND JAGPAD_7 THEN   		' If left is pressed, move the sprite left
    ENDIF
    
    IF pad1 BAND JAGPAD_8 THEN   		' If left is pressed, move the sprite left
    ENDIF

	
	IF pad1 BAND JAGPAD_B THEN   			' If B is pressed, play the sound effect
		
	ENDIF
		'channel, start of sound, end of sound, Hz, options.
		
'		zeroPlaySample(1, strptr(explode_sam), (strptr(explode_sam_end)-strptr(explode_sam)+3) and 0xfffffffc, (46168/8000), Zero_Audio_8bit_Signed)
    
	


	VSYNC									' this is required so the sprites update on the screen
	
LOOP
