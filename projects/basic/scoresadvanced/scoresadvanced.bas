' -----------------------------------------------------------------------
'
' Multiple Highscore example code. Uses Raptor's internal highscore routines
' Remember: Raptor saves scores internally from highest to lowest!
' This example tests multiple scoreboards by saving a score to each board and then paging through them with DPAD
'
' SEE THE OTHER EXAMPLE 'eeprom' for a more in depth example.
' -----------------------------------------------------------------------

jsfSetFontSize(0)
jsfSetFontIndx(1)

dim i as short
dim j as short
dim name$
dim srcname%,dstname%
dim eeprom_present%=0
DIM tableCounter AS INTEGER
DIM tickcounter AS INTEGER
DIM pad1%               :   pad1=0

'variables to point to the scoreboards we will use
dim highscoreBoard as integer ptr
dim highscoreNames as integer
dim highscoreBoardNumber as integer

call setScoreboard(0)

rapLocate 16,16
rapPrint "Checking for existing scores"
vsync

' Check for EEPROM and if that fails
' populate the table with default values
eeprom_present=jsfEEPROM(1,rapHighscores1Score)
if eeprom_present=1 then

	rapLocate 16,32
	rapPrint "Creating Default Scores.."
	vsync

	'Checksum error, let's write some default values to EEPROM
	call createDefaultScores
	'write them
	jsfEEPROM(0,rapHighscores1Score)
	'read them back
	eeprom_present=jsfEEPROM(1,rapHighscores1Score)
else
	rapLocate 16,32
	rapPrint "Scores Found"
	vsync
endif



if eeprom_present<>0 then

	' Read error, use default values
	rapLocate 16,48
	rapPrint "No EE detected!"
	
	call createDefaultScores
	
else

	' Read ok, print saved
	rapLocate 16,48
	rapPrint "EEPROM detected!"

endif



'Save a score to each board.
saveScore("Player 1", 111, 0)
'saveScore("Player 2", 222, 1)
'saveScore("Player 3", 333, 2)
'saveScore("Player 4", 444, 3)
'saveScore("Player 5", 555, 4)

tickcounter = 0
tableCounter = 0

rapLocate 0,210
PRINT "SCOREBOARD ";tableCounter;" -DPAD LEFT/RIGHT TO VIEW"


do

	vsync
	
	'Look for input and page through each scoreboard
	pad1=jsfGetPad(1)
	IF (pad1 BAND JAGPAD_RIGHT) Then
		tableCounter++
		
		IF tableCounter > 4 Then
			tableCounter = 0
		ENDIF
		
		jsfDelay(20)
		CLS
		
		rapLocate 0,210
		PRINT "SCOREBOARD ";tableCounter;" -DPAD LEFT/RIGHT TO VIEW"
		
	ELSEIF (pad1 BAND JAGPAD_LEFT) Then
		tableCounter--
		
		IF tableCounter < 0 Then
			tableCounter = 4
		ENDIF
		
		jsfDelay(20)
		CLS
		
		rapLocate 0,210
		PRINT "SCOREBOARD ";tableCounter;" -DPAD LEFT/RIGHT TO VIEW"
		
	ENDIF	
	
	'display the current selected scoreboard
	displayScoreboard(tableCounter)

loop


'set up default names and scores
sub createDefaultScores
	
	for tableCounter = 0 TO 4
		call setScoreboard(tableCounter)

		for i=0 to 9
			highscoreBoard[i]=(9-i)*100
			
			poke (highscoreNames + (8*i)),ASC("J")		'fill in dummy name
			poke (highscoreNames + (8*i) + 1),ASC("A")	
			poke (highscoreNames + (8*i) + 2),ASC("G")	
			poke (highscoreNames + (8*i) + 3),0			'must terminate with 0 for PRINT
		next i

	next tableCounter
	
end sub


'set the pointer variables to the name and score tables depending on the table in use
sub setScoreboard(scoreboardToUse%)
	if scoreboardToUse = 0 then
		highscoreBoard = rapHighscores1Score
		highscoreNames = (int)strptr(rapHighscores1Name[0])
		highscoreBoardNumber = 0	
	elseif scoreboardToUse = 1 then
		highscoreBoard = rapHighscores2Score
		highscoreNames = (int)strptr(rapHighscores2Name[0])
		highscoreBoardNumber = 1
	elseif scoreboardToUse = 2 then
		highscoreBoard = rapHighscores3Score
		highscoreNames = (int)strptr(rapHighscores3Name[0])
		highscoreBoardNumber = 2
	elseif scoreboardToUse = 3 then
		highscoreBoard = rapHighscores4Score
		highscoreNames = (int)strptr(rapHighscores4Name[0])
		highscoreBoardNumber = 3
	elseif scoreboardToUse = 4 then
		highscoreBoard = rapHighscores5Score
		highscoreNames = (int)strptr(rapHighscores5Name[0])
		highscoreBoardNumber = 4		
	endif	
endif

'display the scores for the requested scoreboard
sub displayScoreboard(scoreboardToUse%)

	call setScoreboard(scoreboardToUse)
	
	dstname=(int)strptr(name$)  							'address of name$
	mid$(name$,9,1)=""          							'name is 8 characters, so make the 9nth a zero (for print)
		
	for i=0 to 9                                            'now, display the modified table
		rapLocate 0,8*10+8+8+8+i*8
		
		srcname = highscoreNames + (8*i)	
		lpoke dstname,lpeek(srcname)                        'copy first 4 characters to name$
		lpoke dstname+4,lpeek(srcname+4)                    'copy last 4 characters to name$
		PRINT "#";i;" - ";name$;" -";highscoreBoard[i]
	next i	

end sub

'save the score details and commit changes to eeprom/MT
sub saveScore(playername$, playerscore%, scoreboardToUse%)

	call setScoreboard(scoreboardToUse)

	name$ = playername$                                        					'the name we're going to inject to the table
	if rapHiscoreCheck(playerscore%,name$,highscoreBoardNumber) > 0 then        'check for highscore and inject score + name
		call rapHiscoreSort(highscoreBoardNumber)                               'if we have a highscore, then sort the table
	endif		
		
	rapLocate 0,8*10+8+8+8+10*8+8
	if eeprom_present<>0 then
		rapPrint "No EE detected, so no scores saved!"
	else
		eeprom_present=jsfEEPROM(0,rapHighscores1Score)
		if eeprom_present=0 then
			Print "EEPROM detected, scores saved - ";scoreboardToUse
		else
			rapPrint "EEPROM detected, save fail!"
		endif
	endif

end sub






