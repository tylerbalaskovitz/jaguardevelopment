' -----------------------------------------------------------------------
'
' Random Number Generator
'
' -----------------------------------------------------------------------


' -----------------------------------------------------------------------
' Define your sprite names here.  In the order of objects in rapinit.s
' -----------------------------------------------------------------------
const sprParticleLayer% = 0


jsfSetFontIndx(1)								' Set font style
jsfSetFontSize(1)								' Set font size


rapLocate 46,132								' Position the text cursor
rapPrint "Press B to get Random number"			' Instructions

rapLocate 36,152								' Position the text cursor
rapPrint "Press C to get small Random number"	' Instructions

rapLocate 120,182								' Position the text cursor
rapPrint "JagStudio"							' Print some text on the screen

DIM pad1 AS INTEGER			:	pad1 = 0

DIM rndnumber AS INTEGER						' Set up our variable to hold the random number
rndnumber = rapRND()							' Get a random number (This always starts from the same seed)
rapLocate 120,20
jsfPrintInt rndnumber

' Main Loop
Do
	
	pad1 = jsfGetPadPressed(LEFT_PAD)			' Get a single button press
	IF pad1 BAND JAGPAD_B THEN					' You could start your game loop from here with a random number
	
		rapLocate 120,20
		rapPrint "                "
		rapLocate 120,20
		rndnumber = rapRND()					' Get a random number
		jsfPrintInt rndnumber					' Print the result
		
	ELSEIF pad1 BAND JAGPAD_C THEN				' C will generate a masked, shortened number
	
		rapLocate 120,20
		rapPrint "                "
		rapLocate 120,20
		rndnumber = rapRND()					' Get a random number
		jsfPrintInt (rndnumber & 255)			' The '& 255' will limit the result to 0-255 range.  This must be a power of 2 minus 1. 
												'	Eg.  7,15,31,63,127,255,511    etc
	ENDIF
	
	
	VSYNC										' Screen Update
	
LOOP
