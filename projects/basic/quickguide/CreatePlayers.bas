DIM speedTemp as INTEGER
DIM temp as INTEGER
DIM tempY as INTEGER
DIM tempYStart as INTEGER
DIM yGrowth as INTEGER
DIM letterHolder as String
DIM tempName as String
tempYStart =60
tempY = 60
yGrowth = 15
speedTemp = 0
temp = 0
tempName = ""

FUNCTION registerPlayer(temp as INTEGER, tempName as STRING)
	rapLocate 10, tempY
	print "Write your players name" 
	rapLocate 10, tempY+=yGrowth
	print SPACE$(35)
	print "Your name:",tempName
	rapLocate 10, tempY+=yGrowth
	print CHR$(temp) 
	rapLocate 10, tempY+=yGrowth
	print "ASCII value as ", temp
	tempY=tempYStart
END FUNCTION

FUNCTION clearName()
	CLEAR(tempName) 
END FUNCTION

FUNCTION addLetter(tempName as String)
	speedTemp+=1
	IF speedTemp = 1 THEN 
		letterHolder=CHR$(temp)
		tempName= CONCAT(tempName,letterHolder)
	ENDIF	
	speedTemp = 0
END FUNCTION

