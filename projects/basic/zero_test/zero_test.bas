' -----------------------------------------------------------------------
'
' Example program showing Zerosquare player functions.
' Sporadic 2020
'
' -----------------------------------------------------------------------

jsfSetFontIndx(1)
jsfSetFontSize(1)
rapLocate 0,182
rapPrint "          JagStudio - Zero Test         "

jsfSetFontIndx(0)
jsfSetFontSize(0)

DIM pad1 AS INTEGER			:	pad1=0

rapLocate 20,10
rapPrint "1   : Play SFX on channel 1"

rapLocate 20,40
rapPrint "2   : Play Looping SFX on channel 2"

rapLocate 20,70
rapPrint "3   : Start / Stop MuLaw Music"

rapLocate 20,100
rapPrint "4   : Start / Stop MuLaw Music"

rapLocate 20,130
rapPrint "0   : Stop all sound"


DIM musicPlaying AS CHAR						' Flag to decide if music is playing
musicPlaying = 0

DO

	pad1 = jsfGetPadPressed(LEFT_PAD)					' Get singular debounced button presses

	IF pad1 BAND JAGPAD_1 THEN					' Play SFX in channel 1
	
		zeroClearChannel(2)
		zeroPlay(1, strptr(explode_sam), strptr(explode_sam_end), (46168/8000), Zero_Audio_8bit_Signed)
		'zeroPlay is a simpler interface in that you only pass in the start and end addresses of the sample.

	ENDIF
	
	IF pad1 BAND JAGPAD_2 THEN					' Play SFX in channel 2
	
		zeroClearChannel(1)
		zeroPlay(2, strptr(explode_sam), strptr(explode_sam_end), (46168/16000), Zero_Audio_Looping|Zero_Audio_8bit_Signed)
	
	ENDIF	

	IF pad1 BAND JAGPAD_3 THEN					' Play MuLaw Music in channel 3 or Stop it if already playing
	
		zeroClearChannel(4)						' Stop any music playing on channel 4
	
		musicPlaying = (musicPlaying + 1) & 1	' Cycle between 0 and 1
	
		IF musicPlaying = 0 THEN
			zeroClearChannel(3)					' Stop all sound on channel 3
		ELSE
			zeroPlaySample(3, (void *)(gamemusic0), ((gamemusic0_end)-(gamemusic0)+3) and 0xfffffffc, (46168/22050), Zero_Audio_Looping|Zero_Audio_8bit_muLaw)
			'zeroPlaySample must be passed the start address and the length of the sample.
			' ((gamemusic0_end)-(gamemusic0)+3) and 0xfffffffc     <-  works out the length and aligns to 4 bytes. The simpler 'zeroPlay' does this for you
		ENDIF
	
	ENDIF		

	IF pad1 BAND JAGPAD_4 THEN					' Play MuLaw Music in channel 3 or Stop it if already playing
	
		zeroClearChannel(3)						' Stop any music playing on channel 3
		
		musicPlaying = (musicPlaying + 1) & 1	' Cycle between 0 and 1
		
		IF musicPlaying = 0 THEN
			zeroClearChannel(4)					' Stop all sound on channel 4
		ELSE
			zeroPlay(4, (void *)(gamemusic0), (void *)(gamemusic0_end), (46168/23084), Zero_Audio_Looping|Zero_Audio_8bit_muLaw)
		ENDIF
	
	ENDIF
	
	IF pad1 BAND JAGPAD_0 THEN					' Stop all Sound
		zeroClearChannel(1)
		zeroClearChannel(2)
		zeroClearChannel(3)
		zeroClearChannel(4)	
		musicPlaying = 0
	ENDIF	

	VSYNC

LOOP