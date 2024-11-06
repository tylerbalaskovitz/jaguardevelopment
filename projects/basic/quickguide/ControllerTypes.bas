
'Selects the players by Keypad value
FUNCTION selectWinnerKeypad(pad1 as INTEGER)
    IF pad1 BAND JAGPAD_1 THEN   			' If up is pressed, move the sprite up
    AssignWinner(players$[0])
    ENDIF

    IF pad1 BAND JAGPAD_2 THEN   		' If left is pressed, move the sprite left
    AssignWinner(players$[1])
    ENDIF
	
    IF pad1 BAND JAGPAD_3 THEN   		' If left is pressed, move the sprite left
    AssignWinner(players$[2])
    ENDIF
    
    IF pad1 BAND JAGPAD_4 THEN   		' If left is pressed, move the sprite left
    AssignWinner(players$[3])
    ENDIF

    IF pad1 BAND JAGPAD_5 THEN   		' If left is pressed, move the sprite left
    AssignWinner(players$[4])
    ENDIF

    IF pad1 BAND JAGPAD_6 THEN   		' If left is pressed, move the sprite left
    AssignWinner(players$[5])
    ENDIF

    IF pad1 BAND JAGPAD_7 THEN   		' If left is pressed, move the sprite left
    ENDIF
    
    IF pad1 BAND JAGPAD_8 THEN   		' If left is pressed, move the sprite left
    ENDIF

END FUNCTION

'writes the players name
FUNCTION writePlayerName(pad1 as INTEGER)
    IF pad1 BAND JAGPAD_UP THEN   			' If up is pressed, move the sprite up
    speedTemp+=1
    checkTemps()
    ENDIF

    IF pad1 BAND JAGPAD_DOWN THEN   		' If left is pressed, move the sprite left
    speedTemp-=1
    checkTemps()
    ENDIF
	
    IF pad1 BAND JAGPAD_OPTION THEN   		' If left is pressed, move the sprite left
	    clearName()
    ENDIF
    IF pad1 BAND JAGPAD_A THEN   		' If left is pressed, move the sprite left
   	removeLetter()
    ENDIF
    
    IF pad1 BAND JAGPAD_B THEN   		' If left is pressed, move the sprite left
	addLetter(tempName)
    ENDIF

    IF pad1 BAND JAGPAD_C THEN   		' If left is pressed, move the sprite left
    confirmName(selectedPlayer)
    ENDIF

    IF pad1 BAND JAGPAD_1 THEN   		' If left is pressed, move the sprite left
    selectedPlayer = 0 
    ENDIF

    IF pad1 BAND JAGPAD_2 THEN   		' If left is pressed, move the sprite left
    selectedPlayer = 1 
    ENDIF
    
    IF pad1 BAND JAGPAD_3 THEN   		' If left is pressed, move the sprite left
    selectedPlayer = 2 
    ENDIF
    IF pad1 BAND JAGPAD_4 THEN   		' If left is pressed, move the sprite left
    selectedPlayer = 3 
    ENDIF

    IF pad1 BAND JAGPAD_5 THEN   		' If left is pressed, move the sprite left
    selectedPlayer = 4 
    ENDIF
    
    IF pad1 BAND JAGPAD_6 THEN   		' If left is pressed, move the sprite left
    selectedPlayer = 5 
    ENDIF
    IF pad1 BAND JAGPAD_7 THEN   		' If left is pressed, move the sprite left
    ENDIF

    IF pad1 BAND JAGPAD_8 THEN   		' If left is pressed, move the sprite left
    ENDIF
    
    IF pad1 BAND JAGPAD_9 THEN   		' If left is pressed, move the sprite left
    ENDIF

    IF pad1 BAND JAGPAD_0 THEN   		' If left is pressed, move the sprite left
	    inputSpeed+=1
		    IF inputSpeed > 5 THEN
		    changeCase()
	    inputSpeed = 0
	    ENDIF
    ENDIF
END FUNCTION

FUNCTION checkTemps()
	if speedTemp >5 then
		speedTemp=0
		temp+=1
	endif
	if speedTemp < -5 then
		speedTemp=0
		temp-=1
	endif
	if upperCase = 1 then
		if temp < upperCaseLow then
		 temp = upperCaseHigh 
		endif
		 if temp > upperCaseHigh then
		 temp = upperCaseLow 
		endif
	endif
	if upperCase = 0 then
		if temp < lowerCaseLow then
		 temp = lowerCaseHigh 
		endif
		 if temp > lowerCaseHigh then
		 temp = lowerCaseLow 
		endif
	endif
END FUNCTION

FUNCTION keepScore(pad1 as INTEGER)
    IF pad1 BAND JAGPAD_UP THEN   			' If up is pressed, move the sprite up
    speedTemp+=1
    checkTemps()
    ENDIF

    IF pad1 BAND JAGPAD_DOWN THEN   		' If left is pressed, move the sprite left
    speedTemp-=1
    checkTemps()
    ENDIF
	
    IF pad1 BAND JAGPAD_OPTION THEN   		' If left is pressed, move the sprite left
	    clearName()
    ENDIF
    IF pad1 BAND JAGPAD_A THEN   		' If left is pressed, move the sprite left
   	removeLetter()
    ENDIF
    
    IF pad1 BAND JAGPAD_B THEN   		' If left is pressed, move the sprite left
	addLetter(tempName)
    ENDIF

    IF pad1 BAND JAGPAD_C THEN   		' If left is pressed, move the sprite left
    confirmName(selectedPlayer)
    ENDIF

    IF pad1 BAND JAGPAD_1 THEN   		' If left is pressed, move the sprite left
    selectedPlayer = 0 
    ENDIF

    IF pad1 BAND JAGPAD_2 THEN   		' If left is pressed, move the sprite left
    selectedPlayer = 1 
    ENDIF
    
    IF pad1 BAND JAGPAD_3 THEN   		' If left is pressed, move the sprite left
    selectedPlayer = 2 
    ENDIF
    IF pad1 BAND JAGPAD_4 THEN   		' If left is pressed, move the sprite left
    selectedPlayer = 3 
    ENDIF

    IF pad1 BAND JAGPAD_5 THEN   		' If left is pressed, move the sprite left
    selectedPlayer = 4 
    ENDIF
    
    IF pad1 BAND JAGPAD_6 THEN   		' If left is pressed, move the sprite left
    selectedPlayer = 5 
    ENDIF
    IF pad1 BAND JAGPAD_7 THEN   		' If left is pressed, move the sprite left
    ENDIF

    IF pad1 BAND JAGPAD_8 THEN   		' If left is pressed, move the sprite left
    ENDIF
    
    IF pad1 BAND JAGPAD_9 THEN   		' If left is pressed, move the sprite left
    ENDIF

    IF pad1 BAND JAGPAD_0 THEN   		' If left is pressed, move the sprite left
	    inputSpeed+=1
		    IF inputSpeed > 5 THEN
		    changeCase()
	    inputSpeed = 0
	    ENDIF
    ENDIF
END FUNCTION
FUNCTION changeScreenKeypad(pad1 as INTEGER)
    IF pad1 BAND JAGPAD_HASH THEN   		' If left is pressed, move the sprite left
	    IF inputSpeed > 5 THEN
		    cls
		    screenNumber-=1 
	    ENDIF
	    inputSpeed = 0
    ENDIF

	IF pad1 BAND JAGPAD_STAR THEN
	    IF inputSpeed > 5 THEN
		    cls
		    screenNumber+=1 
	    ENDIF
	    inputSpeed = 0
	    	cls
		writeName()
	ENDIF
	IF pad1 BAND JAGPAD_B THEN   			' If B is pressed, play the sound effect
		
	ENDIF
END FUNCTION
