DIM upperCase as INTEGER
DIM upperCaseLow as INTEGER
DIM upperCaseHigh as INTEGER
DIM lowerCaseLow as INTEGER
DIM lowerCaseHigh as INTEGER
DIM speedTemp as INTEGER
DIM inputSpeed as INTEGER
DIM temp as INTEGER
DIM tempX as INTEGER
DIM xGrowth as INTEGER
DIM tempY as INTEGER
DIM tempYStart as INTEGER
DIM yGrowth as INTEGER
DIM letterHolder as String
DIM tempName as String
DIM maxPlayers as INTEGER
DIM selectedPlayer as INTEGER

upperCase = 1
upperCaseLow = 65
upperCaseHigh = 90
lowerCaseLow = 97
lowerCaseHigh = 122 
inputSpeed = 0
selectedPlayer = 0 
maxPlayers = 6
speedTemp = 0
temp = 0
tempName = ""





FUNCTION registerPlayer(temp as INTEGER, tempName as STRING)
	tempX = 10
	tempY = 60
	yGrowth = 20
	tempYStart = 60

	rapLocate tempX, tempY
	print "Write player ",selectedPlayer+1,"'s name"
	rapLocate tempX, tempY+=yGrowth
	print SPACE$(21)
	print "Current Name: ",players$[selectedPlayer] 
	rapLocate tempX, tempY+=yGrowth
	print SPACE$(21)
	print "New name:",tempName
	rapLocate tempX, tempY+=yGrowth
	print CHR$(temp) 
	tempY=tempYStart
END FUNCTION


FUNCTION confirmName(confirmedName as Integer)
	CLEAR(players$[confirmedName])
	players$[confirmedName] = CONCAT(players$[confirmedName], tempName)
END FUNCTION


FUNCTION clearName()
	CLEAR(tempName) 
END FUNCTION

FUNCTION removeLetter()
	inputSpeed+=1
	IF inputSpeed > 5 THEN 
	IF LEN(tempName) > 0 THEN 
		tempName=MID$(tempName, 1, LEN(tempName)-1)
	ENDIF	
	inputSpeed = 0
	ENDIF	


END FUNCTIOn

FUNCTION addLetter(tempName as String)
	inputSpeed+=1
	if inputSpeed > 5 then
	IF LEN(tempName) < 11 THEN
		letterHolder=CHR$(temp)
		tempName= CONCAT(tempName,letterHolder)
	ENDIF
	inputSpeed = 0
	ENDIF	
END FUNCTION

FUNCTION changeCase()
	IF upperCase = 1 THEN 
		temp+=32
		upperCase = 0
	ELSE 
		temp-=32
		upperCase = 1
	ENDIF
END FUNCTION
