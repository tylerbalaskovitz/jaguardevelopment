DIM speedTemp as INTEGER
DIM inputSpeed as INTEGER
DIM temp as INTEGER
DIM tempY as INTEGER
DIM tempYStart as INTEGER
DIM yGrowth as INTEGER
DIM letterHolder as String
DIM tempName as String
DIM playerLimit as INTEGER
DIM selectedPlayer as INTEGER
inputSpeed = 0
selectedPlayer = 0 
playerLimit = 6
tempYStart =60
tempY = 60
yGrowth = 15
speedTemp = 0
temp = 0
tempName = ""

FUNCTION registerPlayer(temp as INTEGER, tempName as STRING)
	rapLocate 10, tempY
	print "Write player ",selectedPlayer+1,"'s name"
	rapLocate 10, tempY+=yGrowth
	print SPACE$(50)
	print "Your name:",tempName
	rapLocate 10, tempY+=yGrowth
	print CHR$(temp) 
	rapLocate 10, tempY+=yGrowth
	print "ASCII value as ", temp
	tempY=tempYStart
END FUNCTION

FUNCTION confirmName(confirmedName as Integer)
	CLEAR(players$[confirmedName])
	players$[confirmedName] = CONCAT(players$[confirmedName], tempName)
END FUNCTION

FUNCTION clearName()
	CLEAR(tempName) 
END FUNCTION

FUNCTION addLetter(tempName as String)
	inputSpeed+=1
	if inputSpeed > 5 then
		letterHolder=CHR$(temp)
		tempName= CONCAT(tempName,letterHolder)
	inputSpeed = 0
	endif
END FUNCTION

