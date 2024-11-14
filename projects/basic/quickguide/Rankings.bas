DIM sorted AS INTEGER
DIM Counter AS INTEGER
DIM tempInt AS INTEGER
DIM tempName AS STRING 
DIM StepNumber AS INTEGER
DIM playerNumber AS INTEGER
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

FOR Counter = playerNumber TO maxPlayers STEP StepNumber
	rankPlayers$[Counter] = players$[Counter]
	rankPlayerScores[Counter] = playerScores[Counter]
NEXT

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
