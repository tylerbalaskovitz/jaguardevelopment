DIM speedTemp as INTEGER
DIM temp as INTEGER
DIM tempY as INTEGER
DIM yGrowth as INTEGER
DIM letterHolder$ as String
DIM tempName as String
tempY = 60
yGrowth = 15
speedTemp = 0
temp = 0
tempName = ""

FUNCTION registerPlayer(temp as INTEGER, tempName as STRING)
	rapLocate 10, tempY
	print "Write your players name" 
	rapLocate 10, tempY+yGrowth
	print "Your name:",tempName
	rapLocate 10, tempY+yGrowth*2
	print CHR$(temp) 
	rapLocate 10, tempY+yGrowth*3
	print "ASCII value as ", temp
END FUNCTION

FUNCTION clearName(tempName as String)

END FUNCTION

FUNCTION addLetter(tempName as String, temp as INTEGER)

	letterHolder$=CHR$(temp)
END FUNCTION

