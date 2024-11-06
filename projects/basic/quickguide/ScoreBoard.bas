

FUNCTION drawScoreboard(maxPlayers AS INTEGER)
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
