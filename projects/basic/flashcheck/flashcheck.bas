' -----------------------------------------------------------------------
'
' Flash card check
'  Detects if this ROM is running on a Skunk, JagGD or other.
'  NOTE: The flash check will only work if this is a ROM (not an abs).
'
' -----------------------------------------------------------------------


' -----------------------------------------------------------------------
' Define your sprite names here.  In the order of objects in rapinit.s
' -----------------------------------------------------------------------
const sprParticleLayer% = 0


jsfSetFontIndx(1)			' Set font style
jsfSetFontSize(1)			' Set font size


rapLocate 64,182			' Position the text cursor
rapPrint "Flash Cart Detection"		' Print some text on the screen

DIM flashType AS INTEGER

flashType = rapFlashCheck()							' flashType will contain FLASH_NONE, FLASH_SKUNK or FLASH_JAGGD
													' This variable can then be used as you wish to change program function.

' Main Loop
Do
	
	rapLocate 64,32
	
	' Print appropriate message on screen depending on which device was detected.
	if flashType = FLASH_NONE THEN
		rapPrint "No Flash Detected"
	elseif flashType = FLASH_SKUNK THEN
		rapPrint "Skunkboard Detected"
	elseif flashType = FLASH_JAGGD THEN
		rapPrint "JagGD Detected"
	endif

	VSYNC					' Screen Update
	
LOOP