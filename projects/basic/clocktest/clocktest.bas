' -----------------------------------------------------------------------
'
' Clock Test example project
' Sporadic 2021
'
' -----------------------------------------------------------------------


' -----------------------------------------------------------------------
' Define your sprite names here.  In the order of objects in rapinit.s
' -----------------------------------------------------------------------
const sprParticleLayer% = 0


jsfSetFontIndx(1)			' Set font style
jsfSetFontSize(1)			' Set font size


DIM pad1 AS INTEGER			:	pad1=0


rapLocate 70,182						' Position the text cursor
rapPrint "JagStudio Clock Example"		' Print some text on the screen

jsfSetFontIndx(0)						' Set font style
jsfSetFontSize(0)						' Set font size

rapLocate 20,10
rapPrint "A   : Start Counting Up"

rapLocate 20,30
rapPrint "B   : Stop Counting"

rapLocate 20,50
rapPrint "C   : Start Counting Down"

rapLocate 20,70
rapPrint "1   : Add 10 Seconds"

rapLocate 20,90
rapPrint "2   : subtract 10 Seconds"

rapSetClock(0)									' Default the Clock to 0 seconds.
rapClockMode = Clock_Freeze						' Make sure we start in stopped state.

jsfSetFontIndx(1)								' Set font style

' Main Loop
Do

	rapLocate 50,130
	rapPrint "ASCII Value: "
	rapPrintCont rapClockValue					' Print the ascii value
	
	
	rapLocate 50,150
	rapPrint "Raw Value:      "
	rapLocate 138,150
	jsfPrintInt rapClockHex						' Print the raw numerical value
	
	
	pad1 = jsfGetPadPressed(LEFT_PAD)			' Get singular debounced button presses

	IF pad1 BAND JAGPAD_A THEN
	
		rapClockMode = Clock_Countup

	ELSEIF pad1 BAND JAGPAD_B THEN
	
		rapClockMode = Clock_Freeze

	ELSEIF pad1 BAND JAGPAD_C THEN
	
		rapClockMode = Clock_Countdown

	ELSEIF pad1 BAND JAGPAD_1 THEN
	
		rapAddClock(10)

	ELSEIF pad1 BAND JAGPAD_2 THEN
	
		rapSubClock(10)

	ENDIF
	

	VSYNC					' Screen Update
	
LOOP