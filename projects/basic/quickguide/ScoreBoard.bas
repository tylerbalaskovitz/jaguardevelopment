DIM Counter AS INTEGER
DIM StepNumber AS INTEGER
DIM playerNumber AS INTEGER
playerNumber = 0 
StepNumber = 1


FUNCTION drawScoreboard(maxPlayers AS INTEGER)
	tempX = 10
	tempY = 75 
	yGrowth = 20
	xGrowth = 40
	defaultY = tempY 
	defaultX = 10
	Counter = 0

FOR Counter = playerNumber TO maxPlayers STEP StepNumber
IF Counter = 0 THEN
	rapLocate (tempX*9), tempY-15
	print "Point Manager"
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
	print players$[Counter-1] 
	rapLocate tempX+=(xGrowth*4)+10, tempY
	print playerScores[Counter-1] 
ENDIF
	tempX = defaultX
NEXT
	tempY = defaultY
END FUNCTION
