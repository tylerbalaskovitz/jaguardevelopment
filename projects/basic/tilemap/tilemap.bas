' -----------------------------------------------------------------------
'
' Tilemap Demo
'
' -----------------------------------------------------------------------

dim PX as int, PY as int
PX=0
PY=0

dim PAD as int

'Show instructions
jsfSetFontIndx(1)
jsfSetFontSize(1)
rapLocate 72,190
rapPrint "DPAD LEFT/RIGHT/UP/DOWN"

do
    PAD=jsfGetPad(LEFT_PAD)							' Get Left Pad input
	
	
    IF PAD band JAGPAD_UP THEN 
		PY=PY-4
    ELSEIF PAD band JAGPAD_DOWN THEN 
		PY=PY+4
	ENDIF
	
    IF PAD band JAGPAD_LEFT THEN 
		PX=PX-4
    ELSEIF PAD band JAGPAD_RIGHT THEN 
		PX=PX+4
	ENDIF
	
    IF PX<0 THEN PX=0
    IF PX>96 THEN PX=96
    IF PY<0 THEN PY=0
    IF PY>20904 THEN PY=20904
	
    rapSetMapLoc(PX<<16,PY<<16)					' Position the map to our location
	
    VSYNC
loop

