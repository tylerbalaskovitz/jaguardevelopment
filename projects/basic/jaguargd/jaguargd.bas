' -----------------------------------------------------------------------
'
' Jaguar RetroHQ GD Functions Test
'
' NOTE: Make sure you have copied !LOGO.JAG from this projects folder called
'		'copycontentstosdcardroot' to the root of your SD card.
'
' -----------------------------------------------------------------------


' -----------------------------------------------------------------------
' Define your sprite names here.  In the order of objects in rapinit.s
' -----------------------------------------------------------------------
const sprBackground% = 0
const sprParticleLayer% = 1

' Some variables
DIM pad1 AS INTEGER					:	pad1 = 0
DIM cardInserted AS SHORT
DIM gfxBuffer[352*240*2] AS CHAR	' Reserve some memory to store our graphics
DIM success AS INTEGER
DIM fullpath$
DIM ledState AS CHAR				:		ledState = 0
DIM counter AS INTEGER				:		counter = 0
DIM serialString$


jsfSetFontIndx(1)			' Set font style
jsfSetFontSize(1)			' Set font size
rapLocate 120,182			' Position the text cursor
rapPrint "Jaguar GD"		' Print some text on the screen


' Print out if a GD cart is detected.
jsfSetFontSize(0)
jsfSetFontIndx(0)
rapLocate 20,20
if rapGDDetect = 1 THEN					' This will be 1 for Detected, otherwise its not detected.
	rapPrint "GD Cart Detected"
else
	rapPrint "GD Cart NOT Detected"
endif


' Serial Numbers.
rapGDGetCartSerial()					' Fetch the serial numbers and populate the relevant variables.


' Print out the ACSII Version of the GD Serial.
rapLocate 20,30
jsfSetFontIndx(0)
print "GD $:"
rapLocate 60,30
jsfSetFontIndx(1)
print rapGDASERIAL$						' The internal variable used to store the ASCII serial.


' Print out the Hex version of the GD Serial as a string.
jsfSetFontIndx(0)
rapLocate 20,40
jsfSetFontIndx(0)
rapPrint "GD #:"
rapLocate 60,40
jsfSetFontIndx(1)
rapHexToStr(16,strptr(rapGDSERIAL),serialString$)	' We need to convert the Hex to a String
print serialString$




' Detect if an SD Card is inserted.
jsfSetFontIndx(0)
rapLocate 20,50
rapPrint "SD Card Inserted: "
rapLocate 170,50
jsfSetFontIndx(1)
cardInserted = rapGDCardInserted()	' Store the state of the SD Card.
if cardInserted = 1 THEN			' If the result is 1 then it is inserted.  Otherwise, no card found.
	rapPrint "YES"
elseif cardInserted = 0 THEN
	rapPrint "NO"
else
	rapPrint "ERR"
endif


' If the SD Card is inserted, get its serial number.
rapLocate 20,60
jsfSetFontIndx(0)
print "SD #:"
jsfSetFontIndx(1)
rapLocate 60,60
if cardInserted = 1 THEN		' If the card is inserted, we can look up it's serial
	rapGDGetCardSerial()		' Look up the SD Card Serial number.
	rapHexToStr(16,strptr(rapGDSDSERIAL),serialString$)		' Convert the HEX serial number for a string
	print serialString$										' Print out the string serial
Else
	print "N/A"
endif


' Print out some control instructions
rapLocate 20,110
jsfSetFontIndx(0)
rapPrint "A to Toggle LED"

rapLocate 20,120
jsfSetFontIndx(0)
rapPrint "C to Reset GD"

rapLocate 20,130
jsfSetFontIndx(0)
rapPrint "1 to Send Debug message to COM Port"

rapLocate 20,140
jsfSetFontIndx(0)
rapPrint "4 to Load a File"

rapLocate 20,150
jsfSetFontIndx(0)
rapPrint "5 to Save a File"

jsfSetFontIndx(0)
rapLocate 20,70
print "Load Success: N/A"
rapLocate 20,80
print "Save Success: N/A"	




' Main Loop
Do	

	' Just update a counter.
	counter++

	VSYNC					' Screen Update
	
	pad1 = jsfGetPadPressed(LEFT_PAD)					' Get single button pressed	
	IF pad1 BAND JAGPAD_A THEN	
		
		ledState = (ledState+1) & 1		' Toggle a variable between 0 and 1.  Turn on the LED when the variable is 1
		
		if ledState = 1	then
			rapGDSetLEDOn()				' Turn on the LED
		else
			rapGDSetLEDOff()			' Turn off the LED
		endif
	
	ELSEIF pad1 BAND JAGPAD_C THEN	
		
		rapGDReset(GD_RESET_MENU)		' Reset the console back to the SD menu.
	
	ELSEIF pad1 BAND JAGPAD_1 THEN	
	
		rapGDDebugPrint "JagStudio GD Debug Print. Count: ";counter		' Send this message to the COM port for external debugging.
	
	ELSEIF pad1 BAND JAGPAD_4 THEN	
		
		fullpath$ = "\!LOGO.JAG"										' The full path and filename for the file we wish to load.
		success = rapGDLoadFile(strptr(fullpath$),strptr(gfxBuffer))	' Load the file and populate its contents into the gfxBuffer we have already declared.
		sprite[sprBackground].gfxbase = (int)gfxBuffer								' Tell this sprite to display the gfxBuffer for it's contents.
		sprite[sprBackground].y_ = 0												' Make the sprite visible (is off screen by default in rapinit.s)
		rapLocate 20,70
		jsfSetFontIndx(0)
		print "Load Success:";success;"  "								' success=0 if the load worked.  If it's -1 then it failed.

	ELSEIF pad1 BAND JAGPAD_5 THEN	
		
		fullpath$ = "\!LOGO.SAV"												' The full path and filename for the file we wish to save.
		success = rapGDSaveFile(strptr(fullpath$),strptr(gfxBuffer),352*240*2)	' Save the contents of gfxBuffer to a file with the full path suppled. 
																				'	Also pass in the size of the buffer (file) we are creating.
		rapLocate 20,80
		jsfSetFontIndx(0)
		print "Save Success:";success;"  "								' success=0 if the load worked.  If it's -1 then it failed.
	
	ELSEIF pad1 BAND JAGPAD_0 THEN	
		
		jsfClearBuffer(352*240*2, strptr(gfxBuffer))	
		
		rapLocate 20,90
		jsfSetFontIndx(0)
		print "CLEARED"		
	
	endif
	
	
	
	
LOOP