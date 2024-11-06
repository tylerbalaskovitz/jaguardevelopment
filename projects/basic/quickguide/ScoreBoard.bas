DIM AS INTEGER Counterr, StepNumber
DIM playerNumber AS INTEGER
playerNumber = 0 
StartNumber = 1
EndNumber = maxPlayers 
StepNumber = 1



FUNCTION drawScoreboard(maxPlayers AS INTEGER)
	tempX = 10
	tempY = 60
	yGrowth = 20
	tempYStart = 60

 FOR Counter = playerNumber TO maxPlayers STEP StepNumber
 IF Counter = 0 THEN
	rapLocate tempX, tempY
	print "# "
	rapLocate tempX+=xGrowth, tempY
	print "Name:"
	rapLocate tempX+=xGrowth, tempY
	print "Score"
	rapLocate tempX+=xGrowth, tempY

 NEXT
END FUNCTION
