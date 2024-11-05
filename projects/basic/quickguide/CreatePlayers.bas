DIM speedTemp as INTEGER
DIM temp as INTEGER
DIM tempY as INTEGER
DIM tempYStart as INTEGER
DIM yGrowth as INTEGER
DIM letterHolder as String
DIM tempName as String
DIM counter as INTEGER
DIM startNumber as INTEGER
DIM endNumber as INTEGER
DIM stepNumber as INTEGER
startNumber = 1
endNumber = 20 
stepNumber = 1
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
	print SPACE$(50)
	print "Your name:",tempName
	rapLocate 10, tempY+=yGrowth
	print CHR$(temp) 
	rapLocate 10, tempY+=yGrowth
	print "ASCII value as ", temp
	tempY=tempYStart
END FUNCTION

FUNCTION confirmName()


END FUNCTION

FUNCTION clearName()
	CLEAR(tempName) 
END FUNCTION

FUNCTION addLetter(tempName as String)
	speedTemp=0
	IF speedTemp = 20 THEN 
		letterHolder=CHR$(temp)
		tempName= CONCAT(tempName,letterHolder)
	ENDIF	

END FUNCTION

