DIM sorted AS INTEGER
DIM Counter AS INTEGER
DIM tempScore AS INTEGER
DIM tempName AS STRING 
DIM StepNumber AS INTEGER
DIM playerNumber AS INTEGER
DIM k AS INTEGER
DIM j AS INTEGER
playerNumber = 0 
StepNumber = 1

DIM rankPlayers$[6]
DIM rankPlayerScores[6]

FUNCTION drawRankings(maxPlayers AS INTEGER)
	tempX = 10
	tempY = 75 
	yGrowth = 20
	xGrowth = 40
	defaultY = tempY 
	defaultX = 10
	Counter = 0

IF sorted = 0 THEN
	FOR Counter = playerNumber TO maxPlayers STEP StepNumber
		rankPlayers$[Counter] = players$[Counter]
		rankPlayerScores[Counter] = playerScores[Counter]
	NEXT

	Counter = 1
	FOR Counter = playerNumber TO maxPlayers-1 STEP StepNumber	
	tempName = rankPlayers$[Counter]
	tempScore = rankPlayerScores[Counter]
	j = Counter-1
	WHILE j >= 0 && rankPlayerScores[j] < tempScore
		rankPlayerScores[j+1] = rankPlayerScores[j]
		rankPlayers$[j+1] = rankPlayers$[j]	
		j-=1
	WEND
	rankPlayerScores[j+1] = tempScore
	rankPlayers$[j+1] = tempName
	NEXT
sorted = 1
ENDIF

Counter = 0
FOR Counter = playerNumber TO maxPlayers STEP StepNumber
IF Counter = 0 THEN
	rapLocate (tempX*9), tempY-15
	print "Player Ranks"
	rapLocate tempX, tempY
	print " #"
	rapLocate tempX+=xGrowth, tempY
	print "Name:"
	rapLocate tempX+=(xGrowth*4)+10, tempY
	print "Score"
ENDIF
IF Counter >= 1 THEN
	rapLocate tempX, tempY+=yGrowth
	print Counter 
	rapLocate tempX+=xGrowth, tempY
	print rankPlayers$[Counter-1] 
	rapLocate tempX+=(xGrowth*4)+10, tempY
	print rankPlayerScores[Counter-1] 
ENDIF
	tempX = defaultX
NEXT
	tempY = defaultY
END FUNCTION
