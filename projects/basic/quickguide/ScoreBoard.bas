DIM Counter AS INTEGER
DIM StepNumber AS INTEGER
DIM playerNumber AS INTEGER
playerNumber = 0 
StepNumber = 1


FUNCTION drawScoreboard(maxPlayers AS INTEGER)
	tempX = 10
	tempY = 60
	yGrowth = 20
	xGrowth = 40
	defaultY = 60
	defaultX = 10

FOR Counter = playerNumber TO maxPlayers-1 STEP StepNumber
IF Counter = 0 THEN
	rapLocate tempX, tempY
	print "# "
	rapLocate tempX+=xGrowth, tempY
	print "Name:"
	rapLocate tempX+=xGrowth, tempY
	print "Score"
	rapLocate tempX+=(xGrowth*3), tempY
ENDIF
IF Counter >= 100 THEN
	rapLocate tempX, tempY+=yGrowth
	print playerNumber 
	rapLocate tempX+=xGrowth, tempY+=yGrowth
	print players$[Counter] 
	rapLocate tempX+=xGrowth, tempY+=yGrowth
	print playerScores[Counter] 
ENDIF
	tempX = defaultX
NEXT
	tempY = defaultY
END FUNCTION
