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

DIM tx AS INTEGER							' Value to store the joypad movement in
tx = 130
DIM ty AS INTEGER							' Value to store the joypad movement in
ty = 182

DIM hori AS INTEGER							' Value to store the joypad movement in
DIM hori AS INTEGER							' Value to store the joypad movement in
hori = 0

DIM scroll AS INTEGER							' Value to store the joypad movement in
scroll = 0

DIM winner AS STRING							' Value to store the joypad movement in
winner="?"
DIM v1 AS STRING							' Value to store the joypad movement in
v1="Tyler"

DIM v2 AS STRING							' Value to store the joypad movement in
v2="Navraj"
DIM v3 AS STRING							' Value to store the joypad movement in
v3="Loving"
DIM v4 AS STRING							' Value to store the joypad movement in
v4="Matthew"
DIM v5 AS STRING							' Value to store the joypad movement in
v5="John"
DIM v6 AS STRING							' Value to store the joypad movement in
v6="Christian"
jsfSetFontIndx(1)							' Set font style

jsfSetFontSize(1)							' Set font size



FUNCTION scroll AS STRING 
	 if scroll = 1 then
		 tx -= 2
		 rapLocate tx,ty
		 print "Congrats!",winner," is the winner!",space$(2)
	 elseif scroll = 0 then
		rapLocate tx,ty							' Position the text cursor
		rapPrint "Who will be today's winner?"						' Print some text on the screen
	 endif
END FUNCTION

FUNCTION writeWinner(w) AS STRING 
         winner=w
         rapLocate tx,ty
	 scroll = 1
END FUNCTION
' Main Loop
Do
	scroll

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

	IF pad1 BAND JAGPAD_1 THEN   			
	writeWinner(v1)	
		
    
	ENDIF

	IF pad1 BAND JAGPAD_2 THEN   			
		
	writeWinner(v2)	
		
    
	ENDIF
	IF pad1 BAND JAGPAD_3 THEN   			
		
	writeWinner(v3)	
		
    
	ENDIF
	IF pad1 BAND JAGPAD_4 THEN   			
		
	writeWinner(v4)	
		
    
	ENDIF
	IF pad1 BAND JAGPAD_5 THEN   			
		
	writeWinner(v5)	
		
    
	ENDIF
	IF pad1 BAND JAGPAD_6 THEN   			
		
	writeWinner(v6)	
		
    
	ENDIF
	IF pad1 BAND JAGPAD_7 THEN   			
		
		
    
	ENDIF
	IF pad1 BAND JAGPAD_8 THEN   			
		
		
    
	ENDIF
	IF pad1 BAND JAGPAD_9 THEN   			
		
		
    
	ENDIF
	VSYNC									' this is required so the sprites update on the screen
	
LOOP
