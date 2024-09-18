' -----------------------------------------------------------------------
'
' EEPROM Saves.
'	Example to show saving/loading EEPROM data;
'		- All Scoreboards.
'		- Single scoreboards.
'		- Individual "user data" values.
'
' -----------------------------------------------------------------------

CONST EEPROMVERSION% = 10					'This is the current version number that we will check exists in the EEPROM.
											'If the EEPROM doesn't contain this version number, then either it's out of date or not initialised.
											'you can use this when in development/testing to force a "reset" of existing EEPROM values (just change this number)

'Set up a few variables.
DIM eepromExists AS INTEGER
DIM tableCounter AS INTEGER
dim playerScore as INTEGER
DIM pad1 AS INTEGER
DIM i as SHORT


'variables to point to the scoreboards we will use. This allows us to create a generic function to set the scoreboard we are currently using.
DIM highscoreBoard as integer ptr
DIM highscoreNames as integer


'Set up some static text on the screen.
jsfSetFontIndx(0)
jsfSetFontSize(0)

rapLocate 0,16
rapPrint "OPTION : Change Board"

rapLocate 0,24
rapPrint "B      : Add a new score to board"

rapLocate 0,32
rapPrint "C      : Reset board to defaults"

rapLocate 0,40
rapPrint "0      : Save a user variable"

rapLocate 0,56
rapPrint "EEPROM Found:"


eepromExists = CheckEEPROMExists()								'Check if the EEPROM contains the correct version number. (defined in EEPROMVERSION)
IF eepromExists = 0 THEN										'0 means the EEPROM wasnt found or the version is wrong.  Therefore, we need to initialise.
	jsfEEPROMWordWrite(jsfEEPROMInitVersion,EEPROMVERSION)		'Write the EEPROM "magic key" version number. 
																'This is used on next boot up to know if we have already initialised.
	
	jsfSetFontIndx(0)
	rapLocate 144,56
	rapPrint "Initialising EEPROM..."
	
	call createDefaultScores									'create default names and scores in all 5 scoreboards.
	
	jsfEEPROMFullWrite()										'write all the 5 boards to EEPROM	
	
	for i = 0 TO 128											'initialise the userdata memory
		rapUserSaveData[i] = 0									'rapUserSaveData has 128 entries you can use to save custom data.
	next i
	jsfEEPROMUserDataWrite()									'save all 128 user data integers (long words) to EEPROM		
	
	jsfSetFontIndx(0)
	rapLocate 144,56
	eepromExists = CheckEEPROMExists()							'make sure the version has now been saved
	IF eepromExists = 0 THEN		
		rapPrint "Could not Initialise    "		
	ELSE
		rapPrint "EEPROM Initialised      "	
	ENDIF	
	
ELSE															'if the EEPROM contains the EEPROMVERSION already, just load all the data

	jsfSetFontIndx(0)
	rapLocate 144,56
	rapPrint "EEPROM Loaded"
	
	jsfEEPROMFullRead()											'load all 5 scoreboards from EEPROM
	
	'JUST FOR REFERENCE: You can also load individual boards; see below;
	'jsfEEPROMBoardRead(0)
	'jsfEEPROMBoardRead(1)
	'jsfEEPROMBoardRead(2)
	'jsfEEPROMBoardRead(3)
	'jsfEEPROMBoardRead(4)	
	
	jsfEEPROMUserDataRead()										'load all 128 integers (512 bytes) into the UserData array.
	jsfSetFontIndx(1)
	rapLocate 256,40
	jsfPrintInt rapUserSaveData[0] 								'print out one of the previous saved user data values.

ENDIF


tableCounter = 0
playerScore = 0
CALL displayScoreboard(tableCounter)							'display the current selected scoreboard


do	
	
	pad1=jsfGetPadPressed(LEFT_PAD)								'Look for input and page through each scoreboard
	IF (pad1 BAND JAGPAD_OPTION) Then							'page through the scoreboards
		tableCounter++
		
		IF tableCounter > 4 Then								'loop through the 5 scoreboards
			tableCounter = 0
		ENDIF
				
		CALL displayScoreboard(tableCounter)					'refresh the display
	
	ELSEIF (pad1 BAND JAGPAD_B) Then							'score name input

		CALL createHighscore									'display name input text and allow player to input their name
		
	ELSEIF (pad1 BAND JAGPAD_C) Then							'reset current scoreboard to defaults
			
		CALL createDefaultScoreEntries(tableCounter)			'create default names and scores in the current scoreboard
		
		jsfEEPROMBoardWrite(tableCounter)						'save the current scoreboard to EEPROM
		
		CALL displayScoreboard(tableCounter)					'refresh the display
		
	ELSEIF (pad1 BAND JAGPAD_0) Then							'save user variable
			
		rapUserSaveData[0] = 1 + (rapRND() & 4095)				'here we save a random value to the first user data entry.
																'rapUserSaveData has 128 entries you can use to save custom data.
		
		jsfEEPROMUserDataWrite()								'save all 128 user data integers to EEPROM		
		
		jsfSetFontIndx(1)
		rapLocate 256,40
		print "        "										'cheap way to clear the old printed value
		rapLocate 256,40
		jsfPrintInt rapUserSaveData[0]							'print the new user data value to screen
		
	ENDIF	
	
	VSYNC

loop


'Show the text and take input from the player to enter their name.
' This could be extended to allow character deletion/editing etc. This is just a simple example.
sub createHighscore

	playerScore = rapRND() & 4095						'pick a random score (in a game this would be the actual Score variable for the player)
	
	call setScoreboard(tableCounter)					'set the pointers to the current scoreboard
	
	LOCAL inscoreboard AS SHORT							'loop through all scores in the current scoreboard and see if our score beats any of them
	inscoreboard = 0
	for i=0 to 9
		IF playerScore > highscoreBoard[i] THEN
			inscoreboard=1								'if it is higher than an existing score, set a flag for later use.
		ENDIF
	next i	
	
	IF inscoreboard = 1 THEN							'if the flag was set (our score should be entered in the scoreboard), show inputs for the player.
	
		jsfSetFontIndx(0)
		rapLocate 0,196
		rapPrint "DPAD UP/DOWN: Pick Letter"
		rapLocate 0,204
		rapPrint "B=Choose letter.  A=Save Score"
		
		DIM RAW name[8] AS CHAR							'an 8 character array to store the players name as they input it
		
		name$ = "A       "								'the starting name default that the player can then edit.

		jsfSetFontIndx(1)
		rapLocate 0,180
		rapPrint name$

		jsfSetFontIndx(0)
		rapLocate 0,188
		rapPrint "--------"

		jsfSetFontIndx(0)
		rapLocate 148,180
		rapPrint "Score:"
		
		jsfSetFontIndx(1)
		rapLocate 200,180
		jsfPrintInt playerScore							'print out the score they achieved
		
		LOCAL scorechar% : scorechar=65					'variable to store the ascii code of the current character being input
		LOCAL scorepos% : scorepos=0					'variable to store the position in the name string we are currently editing
		
		LOCAL nameEntered AS SHORT
		nameEntered = 0									'flag to say when the player finished entering their name.
														'we use this so we know to drop out of this loop and back to the main loop.
		
		
		DO
		
			pad1=jsfGetPadPressed(LEFT_PAD)				'get the last single press on the joy pad (debounced so that you cannot hold down the buttons)
		
			IF pad1 BAND PAD_UP AND scorechar < 90 THEN	'UP - If the scorechar is less than ascii 90, allow it to scroll though the different characters.
				scorechar++
				name[scorepos] = scorechar						'set the ascii code in the name string to the current character being input
				rapLocate 0,180
				rapPrint name$									'print the name again to update the screen
			ELSEIF pad1 BAND PAD_DOWN AND scorechar > 32 THEN'DOWN - If the scorechar is greater than ascii 32, allow it to scroll though the different characters.
				scorechar--
				name[scorepos] = scorechar						'set the ascii code in the name string to the current character being input
				rapLocate 0,180
				rapPrint name$									'print the name again to update the screen
			ELSEIF pad1 BAND PAD_B AND scorepos < 7 THEN		'B - Move on to the next letter in the name string
						
				scorepos++										'advance the input position
				
				name[scorepos] = ASC("A")						'Default the next character in the name to 'A'
				scorechar = name[scorepos]						'update scorechar back to ascii code A
				
				rapLocate 0,180
				rapPrint name$									'print the name again to update the screen
						
			ELSEIF pad1 BAND PAD_A THEN
									
				if rapHiscoreCheck(playerScore,name$,tableCounter) > 0 then		'check if its a highscore and inject the score + name into the scoreboard
					call rapHiscoreSort(tableCounter,name$)						'if we have a highscore, then sort the table
					
					jsfEEPROMBoardWrite(tableCounter)							'save the single scoreboard this score belongs in
																				'This is faster than re-writing all 5 scoreboards					
					CALL displayScoreboard(tableCounter)						'refresh the scoreboard display
					
				endif
				
				nameEntered = 1													'the name entry process has finished.  flag that we are done.
						
			ENDIF
			
			VSYNC
		
		LOOP UNTIL nameEntered = 1												'loop until name entry is complete.
		
		'just some simple screen cleanup to hide all the name entry text from the screen.
		'we can just print spaces over the existing text to clear it.
		jsfSetFontIndx(0)
		rapLocate 0,196
		rapPrint "                          "
		rapLocate 0,204
		rapPrint "                              "		
		rapLocate 0,180
		rapPrint "         "
		rapLocate 0,188
		rapPrint "        "
		rapLocate 148,180
		rapPrint "       "
		rapLocate 200,180
		rapPrint "                "
	
	ENDIF


end sub


'This function will check for a "magic key" in the EEPROM (stored at jsfEEPROMInitVersion).
' The key is stored as a 16 bit 'version' number in EEPROMVERSION
' If the value in the EEPROM doesn't match the EEPROMVERSION variable then the EEPROM is either blank/uninitialised or out of date.
FUNCTION CheckEEPROMExists%

	DIM RAW savedVersion AS SHORT
	
	savedVersion = jsfEEPROMWordRead(jsfEEPROMInitVersion)
	
	jsfSetFontIndx(1)
	rapLocate 112,56
	
	IF savedVersion <> EEPROMVERSION THEN
		rapPrint "NO "
		jsfSetFontIndx(0)
		FUNCTION = 0
	ELSE
		rapPrint "YES"
		jsfSetFontIndx(0)
		FUNCTION = 1
	ENDIF

END FUNCTION



'set up default names and scores in all 5 boards
sub createDefaultScores
	
	for tableCounter = 0 TO 4								'loop over all 5 tables
		
		createDefaultScoreEntries(tableCounter)				'create the default names and scores in this scoreboard

	next tableCounter
	
end sub


'add default names and scores to a single scoreboard
sub createDefaultScoreEntries(tableCounter%)

	call setScoreboard(tableCounter)					'set the pointers to the current scoreboard

	for i=0 to 9										'loop over the 10 score entries
		highscoreBoard[i]=((10-i)*100*(tableCounter+1))	'set a default score value
		
		poke (highscoreNames + (8*i)),ASC("J")			'fill in a dummy name by poking the ascii code for each letter. 8 characters max per name!
		poke (highscoreNames + (8*i) + 1),ASC("S")	
		poke (highscoreNames + (8*i) + 2),ASC("T")	
		poke (highscoreNames + (8*i) + 3),ASC("U")
		poke (highscoreNames + (8*i) + 4),ASC("D")
		poke (highscoreNames + (8*i) + 5),ASC("I")
		poke (highscoreNames + (8*i) + 6),ASC("O")
		poke (highscoreNames + (8*i) + 7),ASC("!")
	next i

end Sub


'set the pointer variables to the name and score tables in memory depending on the table in use
sub setScoreboard(scoreboardToUse%)
	if scoreboardToUse = 0 then
		highscoreBoard = rapHighscores1Score
		highscoreNames = (int)strptr(rapHighscores1Name[0])
	elseif scoreboardToUse = 1 then
		highscoreBoard = rapHighscores2Score
		highscoreNames = (int)strptr(rapHighscores2Name[0])
	elseif scoreboardToUse = 2 then
		highscoreBoard = rapHighscores3Score
		highscoreNames = (int)strptr(rapHighscores3Name[0])
	elseif scoreboardToUse = 3 then
		highscoreBoard = rapHighscores4Score
		highscoreNames = (int)strptr(rapHighscores4Name[0])
	elseif scoreboardToUse = 4 then
		highscoreBoard = rapHighscores5Score
		highscoreNames = (int)strptr(rapHighscores5Name[0])
	endif	
end sub


'display the scores for the requested scoreboard
sub displayScoreboard(scoreboardToUse%)
	
	LOCAL displayName[9] AS CHAR	'local string variable to temporarily store each name (8 name chars + 1 extra char for string terminator)
	LOCAL srcname%,dstname%			'used to store the memory address of the source and destination names when displaying scoreboards.
	LOCAL placeCounter[3] AS CHAR	'string to temporarily store the position for each entry.	
	
	jsfSetFontIndx(1)
	rapLocate 0,166
	PRINT "SCOREBOARD ";scoreboardToUse+1;" of 5"	'print the scoreboard we are currently viewing.

	call setScoreboard(scoreboardToUse)				'make sure our scoreboard pointers are pointing to the current scoreboard (scoreboardToUse)
	
	dstname=(int)strptr(displayName$)  				'get address of displayName$
	mid$(displayName$,9,1)=""          				'displayName is 8 characters, so make the 9th is a zero (string terminator for print)
			
	'Just print spaces over existing scoreboard text ready to print the new one
	for i=0 to 9
		rapLocate 0,80+i*8
		rapPrint "                               "	'wipe the whole line out on screen
	next i	
	
	'Print out the new scores
	for i=0 to 9                                            			'10 scores in the scoreboard
		rapLocate 0,80+i*8												'work out the x/y position of the name and score to print
		
		srcname = highscoreNames + (8*i)								'point our srcname variable to the memory location of the name to print
		lpoke dstname,lpeek(srcname)                        			'copy the first 4 characters to displayName$ (stored at dstname)
		lpoke dstname+4,lpeek(srcname+4)                    			'copy the last 4 characters to displayName$ (stored at dstname)
		
		rapNumToStr(i+1,1,placeCounter$)								'pad the position number to 2 characters.  Eg. 01,02,...10
		PRINT placeCounter$;" - ";displayName$;" -";highscoreBoard[i]	'print the position, name and score
	next i	

end sub






