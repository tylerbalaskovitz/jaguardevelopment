DIM Counter AS INTEGER
DIM StepNumber AS INTEGER
DIM playerNumber AS INTEGER
playerNumber = 0 
StepNumber = 1


FUNCTION drawScoreboard(maxPlayers AS INTEGER)
	tempX = 10
	tempY = 60
	yGrowth = 20
	defaultY = 60
	defaultX = 10

FOR Counter = playerNumber TO maxPlayers STEP StepNumber
IF Counter = 0 THEN
	rapLocate tempX, tempY
	print "# "
	rapLocate tempX+=xGrowth, tempY
	print "Name:"
	rapLocate tempX+=xGrowth, tempY
	print "Score"
	rapLocate tempX+=xGrowth, tempY
ENDIF
IF Counter >= 1 THEN
	rapLocate tempX, tempY
	print playerNumber 
	rapLocate tempX+=xGrowth, tempY
	print players$[Counter] 
	rapLocate tempX+=xGrowth, tempY
	print playerScores[Counter] 
ENDIF
NEXT
END FUNCTION
