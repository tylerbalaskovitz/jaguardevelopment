DIM temp as INTEGER
DIM tempName as String

FUNCTION registerPlayer(temp as INTEGER, tempName as STRING)
rapLocate 10,0
print "Write your players name" 
rapLocate 10,30
print CHR$(temp) 
rapLocate 10,40
print tempName
END FUNCTION

FUNCTION clearName()
 tempName = ""
END FUNCTION


