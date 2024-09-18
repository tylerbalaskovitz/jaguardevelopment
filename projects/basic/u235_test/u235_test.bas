' -----------------------------------------------------------------------
'
' Example program showing U235SE functions.
' Sporadic 2020
'
' -----------------------------------------------------------------------

jsfSetFontSize(1)							'Large font


'Example of how to set printing location and doing multiple print from that point
jsfSetFontIndx(1)							'red font
rapLocate 80,200							'print screen position
rapPrint "JagStudio"						'print first part of text string
jsfSetFontIndx(0)							'change to white font
rapPrintCont " U235 "						'continue printing from previous position with new font colour
jsfSetFontIndx(1)							'change font to red
rapPrintCont "Test"							'continue printing from previous position with new font colour


'Change font anf size back to defaults.
jsfSetFontIndx(0)
jsfSetFontSize(0)

' Set up constants for frequency limits
CONST FREQ_MAX%	= 24000
CONST FREQ_MIN% = 1000

' Variables
DIM pad1 AS INTEGER			:	pad1=0
DIM frequency AS INTEGER	:	frequency=8000

' Print static text instructions
rapLocate 20,10
rapPrint "B        : Play SFX at Fixed Freq"

rapLocate 20,40
rapPrint "C        : Play SFX at variable Freq"

rapLocate 20,50
rapPrint "Left     : Lower Frequency"

rapLocate 20,60
rapPrint "Right    : Higher Frequency"

jsfSetFontIndx(1)
rapLocate 20,76
print "Frequency:";frequency
jsfSetFontIndx(0)	


rapLocate 20,100
rapPrint "1        : Play ABS Mono Module"
rapLocate 20,120
rapPrint "2        : Play ABS Stereo Module"
rapLocate 20,140
rapPrint "3        : Play ROM Module"
rapLocate 20,160
rapPrint "4        : Stop Module"


DO

	VSYNC
	
	pad1 = jsfGetPadPressed(LEFT_PAD)					' Get single button pressed (debounced).
														' If button held down, it will only fire once.
	
	'Get single inputs
	IF pad1 BAND JAGPAD_B THEN							' B=Play sample at fixed frequency
		
		u235PlaySampleFreq(4,0,8000)
		u235PlaySampleFreq(5,0,8000)
		
	ELSEIF pad1 BAND JAGPAD_C THEN						' C=Play sample at variable frequency
	
		u235PlaySample(6,0)
		u235PlaySample(7,0)
		u235ChannelFreq(6,frequency)
		u235ChannelFreq(7,frequency)
		
		' NOTE: You could just use this;  
		'					u235PlaySampleFreq(6,0,frequency)
		'					u235PlaySampleFreq(7,0,frequency)
		
	ELSEIF pad1 BAND JAGPAD_1 THEN						' 1=Stop any module and then play in MONO
	
		u235StopModule()
		u235Silence()
		vsync
		u235PlayModule((int)strptr(Module1),MOD_MONO)
		
	ELSEIF pad1 BAND JAGPAD_2 THEN						' 2=Stop any module and then play in Stereo
	
		u235StopModule()
		u235Silence()
		vsync
		u235PlayModule((int)strptr(Module1),MOD_STEREO)
		
	ELSEIF pad1 BAND JAGPAD_3 THEN						' 3=Stop any module and then play in Stereo from ROM
	
		u235StopModule()
		u235Silence()
		vsync
		
		u235PlayModule(MOD_MENU,MOD_STEREO)
				
	ELSEIF pad1 BAND JAGPAD_4 THEN						' 3=Stop any module
	
		u235StopModule()
		u235Silence()

	ENDIF
	
	
	

	
	pad1 = jsfGetPad(LEFT_PAD)							' Get repeated button pressed (NOT debounced).
														' Allows button to be held down.
	
	'Get any repeating pad inputs
	IF pad1 BAND JAGPAD_LEFT THEN						' Left=Decrease frequency
		
		frequency -= 30
		
		IF frequency < FREQ_ MIN Then					' If less than constant limit, set to the limit
			frequency = FREQ_MIN
		ENDIF
		
		jsfSetFontIndx(1)
		rapLocate 20,76
		print "Frequency:";frequency					' Print the new value on the screen
	
	ELSEIF pad1 BAND JAGPAD_RIGHT THEN	
		
		frequency += 30
		
		IF frequency > FREQ_MAX Then					' If more than constant limit, set to the limit
			frequency = FREQ_MAX
		ENDIF
		
		jsfSetFontIndx(1)
		rapLocate 20,76
		print "Frequency:";frequency					' Print the new value on the screen
	
	ENDIF

LOOP
