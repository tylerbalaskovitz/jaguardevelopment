' -----------------------------------------------------------------------
'
' Raptor Debug Tests
'
' -----------------------------------------------------------------------
'
' Example project demonstrating the Raptor Debug functions
'
' -----------------------------------------------------------------------

' Set up constants for our sprites
CONST sprParticleLayer%		=	0
CONST sprBugIndex%			=	sprParticleLayer+1


' Global Variables
DIM pad1 AS INTEGER
DIM dbgRequestUpdate AS CHAR
DIM dbgShowDebugWindow AS CHAR


' Set default variable values
pad1=0
dbgRequestUpdate = 0
dbgShowDebugWindow = 1


' Print the title
jsfSetFontIndx(1)								' Set font style
jsfSetFontSize(1)								' Set font size
rapLocate 0,20
rapPrint "          JagStudio Debug View"


' Print instructions
jsfSetFontIndx(0)
jsfSetFontSize(0)
rapLocate 16,50
rapPrint "DPAD to Move"

rapLocate 16,60
rapPrint "B = Show or hide the debug window"

rapLocate 16,70
rapPrint "C = Inverse debug window colours"

rapLocate 16,80
rapPrint "1 = Show quick debug message"

rapLocate 16,90
rapPrint "2 = Show quick debug message and HALT"


' Print message to show what the user monitors are.
rapLocate 16,110
jsfSetFontIndx(1)
rapPrint "User0"
jsfSetFontIndx(0)
rapPrintCont " = X Position"		' Using continuous Print so we can change font colours on the same line
jsfSetFontIndx(1)
rapPrintCont " User1"
jsfSetFontIndx(0)
rapPrintCont " = Y Position"



' Set the position of the debug window
rapDebugSetXY(19,190)


' Set up the user monitors and point them to variables to watch.
'  These will always point at the variable passed in, so you only have to set this once per variable
'  You must wrap the variable to watch in a strptr() instruction so a pointer to the variable is passed in.
rapDebugSetMonitor(0, strptr(sprite[sprBugIndex].x_))		' Set user monitor 0 to watch the x position
rapDebugSetMonitor(1, strptr(sprite[sprBugIndex].y_))		' Set user monitor 1 to watch the y position


' Print some text at the bottom of the debug window
rapDebugPrint "This is some debug text"


' Show the Debug window by default
rapDebugSetVisible(DEBUG_SHOW)	


' Initialise it
rapDebugUpdate()


DO	

	' Get joypad input
	pad1 = jsfGetPad(LEFT_PAD)

	IF pad1 BAND JAGPAD_UP THEN								' On Up, move the sprite and set flag to say we changed the position
	
		sprite[sprBugIndex].y_ -= 2							' .x_ and .y_ do not need to be scaled to <<16 (like with .x and .y)
		dbgRequestUpdate = 1

	ELSEIF pad1 BAND JAGPAD_DOWN THEN						' On Down, move the sprite and set flag to say we changed the position
	
		sprite[sprBugIndex].y_ += 2
		dbgRequestUpdate = 1

	ENDIF


	IF pad1 BAND JAGPAD_LEFT THEN							' On Left, move the sprite and set flag to say we changed the position
	
		sprite[sprBugIndex].x_ -= 2
		dbgRequestUpdate = 1

	ELSEIF pad1 BAND JAGPAD_RIGHT THEN						' On Right, move the sprite and set flag to say we changed the position
	
		sprite[sprBugIndex].x_ += 2
		dbgRequestUpdate = 1
		
	ENDIF
	
	
	' Get single pressed joypad input
	pad1 = jsfGetPadPressed(LEFT_PAD)
	
	IF pad1 BAND JAGPAD_B THEN								' B to show or hide the debug window
	
		dbgShowDebugWindow = (dbgShowDebugWindow + 1) & 1	' Alternate between 0 and 1
		
		IF dbgShowDebugWindow = 0 Then						' Hide or show the debug window based on the dbgShowDebugWindow variable
			rapDebugSetVisible(DEBUG_HIDE)
		ELSE
			rapDebugSetVisible(DEBUG_SHOW)
		ENDIF
	
	ELSEIF pad1 BAND JAGPAD_C THEN
	
		rapDebugInverse()									' Invert the debug colours
	
	ELSEIF pad1 BAND JAGPAD_1 THEN
	
		jsfDebugMessage "Quick debug message"					' Print a debug message and automatically show the debug window
	
	ELSEIF pad1 BAND JAGPAD_2 THEN
	
		jsfDebugMessageHalt "We have halted the application"	' Print a debug message, automatically show the debug window and HALT the application
	
	ENDIF
	
	
	IF dbgRequestUpdate = 1 THEN							' If we changed a value then request the debug window updates the values
		rapDebugUpdate()									' Tell Raptor that we have updated the monitor values
		dbgRequestUpdate = 0								' Reset the flag we we don't call this every tick
	ENDIF
	
	
	VSYNC													' Loop

LOOP


