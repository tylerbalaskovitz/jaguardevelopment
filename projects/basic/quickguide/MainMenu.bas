DIM scrolling AS INTEGER
DIM spaces as INTEGER
scrolling = 0


FUNCTION ScrollString(scrolling AS INTEGER, tx AS INTEGER, ty as INTEGER, spaces AS INTEGER, inputString AS STRING)
 IF scrolling = 1 THEN
	rapLocate tx,ty							' Position the text cursor
		if LEN(inputString) >= 9 then
		spaces =0 
		else
		spaces = 2
		endif
	 print "Congratulations!",inputString," is the winner!",SPACE$(spaces)
	 VSYNC
ELSE
	rapLocate tx,ty							' Position the text cursor
	rapPrint "Who will be today's winner?"						' Print some text on the screen
ENDIF
END FUNCTION
