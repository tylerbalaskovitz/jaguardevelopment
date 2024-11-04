DIM temp as INTEGER
DIM letterHolder$ as String
DIM tempName as String
temp = 0
tempName = ""

FUNCTION registerPlayer(temp as INTEGER, tempName as STRING)
rapLocate 10,60
print "Write your players name" 
rapLocate 10,75
print "Your name:",tempName
rapLocate 10,90
print CHR$(temp) 
END FUNCTION

FUNCTION clearName(tempName as String)

END FUNCTION

FUNCTION addLetter(tempName as String, temp as INTEGER)
	letterHolder$=CHR$(temp)
END FUNCTION

