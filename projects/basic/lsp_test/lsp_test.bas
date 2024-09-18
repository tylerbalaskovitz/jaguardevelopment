' -----------------------------------------------------------------------
'
' Example program showing LSP functions.
' Sporadic 2022
'
' -----------------------------------------------------------------------

jsfSetFontSize(1)							'Large font

'Example of how to set printing location and doing multiple print from that point
jsfSetFontIndx(1)							'red font
rapLocate 80,200							'print screen position
rapPrint "JagStudio"						'print first part of text string
jsfSetFontIndx(0)							'change to white font
rapPrintCont " LSP "						'continue printing from previous position with new font colour
jsfSetFontIndx(1)							'change font to red
rapPrintCont "Test"							'continue printing from previous position with new font colour


'Change font anf size back to defaults.
jsfSetFontIndx(0)
jsfSetFontSize(0)

' Variables
DIM pad1 AS INTEGER			:	pad1=0


'Create 100k sized buffers to store the mod samples and tracks
dim modBankBuffer[100000] as byte
dim modMusicBuffer[100000] as byte

' Print static text instructions
rapLocate 20,60
rapPrint "B        : Play SFX"
rapLocate 20,80
rapPrint "C        : Loop SFX"
rapLocate 20,100
rapPrint "2        : Restart Module"
rapLocate 20,120
rapPrint "3        : Toggle Module On/Off"
rapLocate 20,140
rapPrint "4        : Stop Module"
rapLocate 20,160
rapPrint "5        : Start Module"

jsfSetFontIndx(1)

'In Assets.txt, we specified these assets should be packed to save storage space.  using the '_pack' keyword.
' Therefore, we now need to unpack them into the two memory buffers we created earlier.
rapUnpack(Module1Bank,(int)(int *)modBankBuffer)
rapUnpack(Module1Music,(int)(int *)modMusicBuffer)

'Play the music module.
LSPPlayModule((int)strptr(modMusicBuffer),(int)strptr(modBankBuffer))


DO

	VSYNC
	
	'Get single button presses (uesful when you don't want buttons 'spammed'
	pad1 = jsfGetPadPressed(LEFT_PAD)
	IF pad1 BAND JAGPAD_B THEN
	
		'			  sample start address, sample end address,		freq, vol, channel
		LSPPlaySample(strptr(explode_sam), strptr(explode_sam_end), 7389, 63, 0) 	'NOTE: SFX will only play if a module is also playing.
	
	ELSEIF pad1 BAND JAGPAD_C THEN
	
		'			      sample start address, sample end address,    loop start address,  loop end address,		freq, vol, channel
		LSPPlaySampleLoop(strptr(explode_sam), strptr(explode_sam_end),strptr(explode_sam), strptr(explode_sam_end), 7389, 63, 1) ' Loop a sample
	
	ELSEIF pad1 BAND JAGPAD_2 THEN
		
		'To restart the module we have to reload the assets.
		LSPStopMusic()
		rapUnpack(Module1Bank,(int)(int *)modBankBuffer)
		rapUnpack(Module1Music,(int)(int *)modMusicBuffer)
		LSPPlayModule((int)strptr(modMusicBuffer),(int)strptr(modBankBuffer))
	ELSEIF pad1 BAND JAGPAD_3 THEN
		LSPMusicToggle()
	ELSEIF pad1 BAND JAGPAD_4 THEN
		LSPStopMusic()
	ELSEIF pad1 BAND JAGPAD_5 THEN
		LSPStartMusic()
	ENDIF		
	
	
	
	'Get button pressed that can be held down
	pad1 = jsfGetPad(LEFT_PAD)
	
	rapLocate 20,180
	IF pad1 BAND JAGPAD_A THEN
		rapPrint "A Pressed"	
	ELSEIF pad1 BAND JAGPAD_B THEN	
		rapPrint "B Pressed"		
	ELSEIF pad1 BAND JAGPAD_C THEN	
		rapPrint "C Pressed"		
	ELSEIF pad1 BAND JAGPAD_0 THEN	
		rapPrint "0 Pressed"		
	ELSEIF pad1 BAND JAGPAD_1 THEN	
		rapPrint "1 Pressed"		
	ELSEIF pad1 BAND JAGPAD_2 THEN	
		rapPrint "2 Pressed"		
	ELSEIF pad1 BAND JAGPAD_3 THEN	
		rapPrint "3 Pressed"		
	ELSEIF pad1 BAND JAGPAD_4 THEN	
		rapPrint "4 Pressed"		
	ELSEIF pad1 BAND JAGPAD_5 THEN	
		rapPrint "5 Pressed"		
	ELSEIF pad1 BAND JAGPAD_6 THEN	
		rapPrint "6 Pressed"		
	ELSEIF pad1 BAND JAGPAD_7 THEN	
		rapPrint "7 Pressed"		
	ELSEIF pad1 BAND JAGPAD_8 THEN	
		rapPrint "8 Pressed"		
	ELSEIF pad1 BAND JAGPAD_9 THEN	
		rapPrint "9 Pressed"		
	ELSEIF pad1 BAND JAGPAD_STAR THEN	
		rapPrint "* Pressed"		
	ELSEIF pad1 BAND JAGPAD_HASH THEN	
		rapPrint "# Pressed"		
	ELSEIF pad1 BAND JAGPAD_OPTION THEN	
		rapPrint "Option Pressed"		
	ELSEIF pad1 BAND JAGPAD_PAUSE THEN	
		rapPrint "Pause Pressed"	
	ELSEIF pad1 BAND JAGPAD_UP THEN	
		rapPrint "Up Pressed"	
	ELSEIF pad1 BAND JAGPAD_DOWN THEN	
		rapPrint "Down Pressed"	
	ELSEIF pad1 BAND JAGPAD_LEFT THEN	
		rapPrint "Left Pressed"	
	ELSEIF pad1 BAND JAGPAD_RIGHT THEN	
		rapPrint "Right Pressed"		
	ELSE
		rapPrint "              "
	ENDIF

LOOP
