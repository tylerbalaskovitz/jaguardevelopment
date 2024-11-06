DIM playerNumber AS INTEGER
playerNumber = 1

FUNCTION drawScoreboard(maxPlayers AS INTEGER)
	tempX = 10
	tempY = 60
	yGrowth = 20
	tempYStart = 60

	rapLocate 10, tempY
	print "# ",selectedPlayer+1,"'s name"
	rapLocate 10, tempY+=yGrowth
	print SPACE$(21)
	print "Current Name: ",players$[selectedPlayer] 
	rapLocate 10, tempY+=yGrowth
	print SPACE$(21)
	print "New name:",tempName
	rapLocate 10, tempY+=yGrowth
	print CHR$(temp) 
	tempY=tempYStart
END FUNCTION
