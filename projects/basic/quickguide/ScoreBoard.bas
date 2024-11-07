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
	Counter = 0

FOR Counter = playerNumber TO maxPlayers-2 STEP StepNumber
IF Counter = 0 THEN
	rapLocate tempX, tempY
	print "# "
	rapLocate tempX+=xGrowth, tempY
	print "Name:"
	rapLocate tempX+=(xGrowth*4)+10, tempY
	print "Score"
ENDIF
IF Counter >= 1 THEN
	rapLocate tempX, tempY+=yGrowth
	print playerNumber 
	rapLocate tempX+=xGrowth, tempY
	print players$[Counter] 
	rapLocate tempX+=(xGrowth*4)+10, tempY
	print playerScores[Counter] 
ENDIF
	tempX = defaultX
NEXT
	tempY = defaultY
END FUNCTION
