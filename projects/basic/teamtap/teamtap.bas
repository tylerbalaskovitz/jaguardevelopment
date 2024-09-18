' -----------------------------------------------------------------------
'
' Team tap example
'	Check if a Team Tap exists on the Left and Right Jaguar Pad ports.
'	If a Team Tap is found, get all the input values from it.
'	Print out the values from the 1st Pad on the Left Team Tap and the 4th Pad on the Right Team Tap.
'
' -----------------------------------------------------------------------


' -----------------------------------------------------------------------
' Define your sprite names here.  In the order of objects in rapinit.s
' -----------------------------------------------------------------------
const sprParticleLayer% = 0


jsfSetFontIndx(1)			' Set font style
jsfSetFontSize(0)			' Set font size


rapLocate 16,16			' Position the text cursor
rapPrint "TeamTap Test"		' Print some text on the screen

DIM ttLeftExists AS INTEGER
DIM ttRightExists AS INTEGER

DIM pad1 AS INTEGER			:	pad1=0
DIM ttPadLeft1 AS INTEGER	:	ttPadLeft1 = 0
DIM ttPadLeft2 AS INTEGER	:	ttPadLeft2 = 0
DIM ttPadLeft3 AS INTEGER	:	ttPadLeft3 = 0
DIM ttPadLeft4 AS INTEGER	:	ttPadLeft4 = 0
DIM ttPadRight1 AS INTEGER	:	ttPadRight1 = 0
DIM ttPadRight2 AS INTEGER	:	ttPadRight2 = 0
DIM ttPadRight3 AS INTEGER	:	ttPadRight3 = 0
DIM ttPadRight4 AS INTEGER	:	ttPadRight4 = 0


'Check which TeamTaps are plugged into the Jaguar Ports - LEFT and/or RIGHT
ttLeftExists = rapCheckTTExists(TT_LEFT)
ttRightExists = rapCheckTTExists(TT_RIGHT)

jsfSetFontIndx(0)
rapLocate 16,40
rapPrint "TeamTap Left:"
rapLocate 128,40
rapPrint "NONE"


rapLocate 16,50
rapPrint "TeamTap Right:"
rapLocate 136,50
rapPrint "NONE"



' Main Loop
Do
	
	'Read the Pads for the Left Team Tap (if it's plugged in)
	IF ttLeftExists = 1 THEN 
	
		rapLocate 128,40
		rapPrint "YES!"
	
		rapGetTTState(TT_LEFT)							'Get the Left Team Tap state
		
		ttPadLeft1 = rapGetTTPad(TT_LEFT, TT_PAD_1)		'Get the input value of the Left TT Pad 1
		ttPadLeft2 = rapGetTTPad(TT_LEFT, TT_PAD_2)		'Get the input value of the Left TT Pad 2
		ttPadLeft3 = rapGetTTPad(TT_LEFT, TT_PAD_3)		'Get the input value of the Left TT Pad 3
		ttPadLeft4 = rapGetTTPad(TT_LEFT, TT_PAD_4)		'Get the input value of the Left TT Pad 4
	
	ENDIF
	
		
	'Read the Pads for the Right Team Tap (if it's plugged in)
	IF ttRightExists = 1 THEN
	
		rapLocate 136,50
		rapPrint "YES!"
	
		rapGetTTState(TT_RIGHT)							'Get the Right Team Tap state
		
		ttPadRight1 = rapGetTTPad(TT_RIGHT, TT_PAD_1)	'Get the input value of the Right TT Pad 1
		ttPadRight2 = rapGetTTPad(TT_RIGHT, TT_PAD_2)	'Get the input value of the Right TT Pad 2
		ttPadRight3 = rapGetTTPad(TT_RIGHT, TT_PAD_3)	'Get the input value of the Right TT Pad 3
		ttPadRight4 = rapGetTTPad(TT_RIGHT, TT_PAD_4)	'Get the input value of the Right TT Pad 4

	ENDIF


	rapLocate 20,150
	rapPrint "LEFT TT Pad 1"
	printPadState(ttPadLeft1, 20, 160)			'Print the values from Left TT Pad 1
	
	
	rapLocate 180,150
	rapPrint "RIGHT TT Pad 4"
	printPadState(ttPadRight4, 180, 160)			'Print the values from Right TT Pad 4


	'If no Team Tap in Left port, check for standard Jag input.  (printPadState will only work in this example if using u235 SE)
	IF ttLeftExists = 0 THEN 
		rapLocate 20,100
		rapPrint "LEFT Jag Pad (no TT)"
		pad1 = jsfGetPad(LEFT_PAD)
		printPadState(pad1, 20, 110)			'Print the values from Right TT Pad 4
	ENDIF
	

	VSYNC					' Screen Update
	
LOOP


' Print out the input value from the Pad State passed in at the screen X position printx
SUB printPadState(padstate AS INTEGER, printx AS INTEGER, printy AS INTEGER)

	rapLocate printx,printy
	jsfPrintInt padstate					'The INT value of the state

	rapLocate printx,printy+20
	
	
	'NOTE - YOU MUST USE PAD_A, PAD_B  etc etc.
	'		DO NOT USE THE JAGPAD_xxx  constants when working with the Team Tap.
	
	
	IF padstate BAND PAD_A THEN
		rapPrint "A Pressed"	
	ELSEIF padstate BAND PAD_B THEN	
		rapPrint "B Pressed"		
	ELSEIF padstate BAND PAD_C THEN	
		rapPrint "C Pressed"		
	ELSEIF padstate BAND PAD_0 THEN	
		rapPrint "0 Pressed"		
	ELSEIF padstate BAND PAD_1 THEN	
		rapPrint "1 Pressed"		
	ELSEIF padstate BAND PAD_2 THEN	
		rapPrint "2 Pressed"		
	ELSEIF padstate BAND PAD_3 THEN	
		rapPrint "3 Pressed"		
	ELSEIF padstate BAND PAD_4 THEN	
		rapPrint "4 Pressed"		
	ELSEIF padstate BAND PAD_5 THEN	
		rapPrint "5 Pressed"		
	ELSEIF padstate BAND PAD_6 THEN	
		rapPrint "6 Pressed"		
	ELSEIF padstate BAND PAD_7 THEN	
		rapPrint "7 Pressed"		
	ELSEIF padstate BAND PAD_8 THEN	
		rapPrint "8 Pressed"		
	ELSEIF padstate BAND PAD_9 THEN	
		rapPrint "9 Pressed"		
	ELSEIF padstate BAND PAD_STAR THEN	
		rapPrint "* Pressed"		
	ELSEIF padstate BAND PAD_HASH THEN	
		rapPrint "# Pressed"		
	ELSEIF padstate BAND PAD_OPTION THEN	
		rapPrint "Option Pressed"		
	ELSEIF padstate BAND PAD_PAUSE THEN	
		rapPrint "Pause Pressed"	
	ELSEIF padstate BAND PAD_UP THEN	
		rapPrint "Up Pressed"	
	ELSEIF padstate BAND PAD_DOWN THEN	
		rapPrint "Down Pressed"	
	ELSEIF padstate BAND PAD_LEFT THEN	
		rapPrint "Left Pressed"	
	ELSEIF padstate BAND PAD_RIGHT THEN	
		rapPrint "Right Pressed"		
	ELSE
		rapPrint "              "
	ENDIF


END SUB





