DIM temp as INTEGER
DIM letterHolder$ as String
DIM tempName as String
temp = 0
tempName = ""

FUNCTION registerPlayer(temp as INTEGER, tempName as STRING)
rapLocate 10,0
print "Write your players name" 
rapLocate 10,30
print CHR$(temp) 
rapLocate 10,40
print "Your name:",tempName
END FUNCTION

FUNCTION clearName(tempName as String)

END FUNCTION

FUNCTION addLetter(tempName as String, temp as INTEGER)
	letterHolder$=CHR$(temp)
	tempName = tempName + letterHolder
END FUNCTION

