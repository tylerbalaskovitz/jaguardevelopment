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
rapPrint "1        : Play SFX in channel 1"

rapLocate 20,40
rapPrint "2        : Play SFX in channel 2"

rapLocate 20,70
rapPrint "3        : Start / Stop MuLaw Music"

DIM musicPlaying AS CHAR						' Flag to decide if music is playing
musicPlaying = 0

DO

	pad1 = jsfGetPadPressed(1)					' Get singular debounced button presses

	IF pad1 BAND JAGPAD_1 THEN					' Play SFX in channel 1
	
		zeroPlaySample(1, strptr(explode_sam), (strptr(explode_sam_end)-strptr(explode_sam)+3) and 0xfffffffc, (46168/8000), Zero_Audio_8bit_Signed)

	ENDIF
	
	IF pad1 BAND JAGPAD_2 THEN					' Play SFX in channel 2
	
		zeroPlaySample(2, strptr(explode_sam), (strptr(explode_sam_end)-strptr(explode_sam)+3) and 0xfffffffc, (46168/16000), Zero_Audio_8bit_Signed)
	
	ENDIF	

	IF pad1 BAND JAGPAD_3 THEN					' Play MuLaw Music in channel 3 or Stop it if already playing
	
		musicPlaying = (musicPlaying + 1) & 1	' Cycle between 0 and 1
	
		IF musicPlaying = 0 THEN
			zeroPlaySample(3, (void *)0, 0, (46168/8000), 0)	' Stop all sound on channel 3
		ELSE
			zeroPlaySample(3, (void *)(gamemusic0), ((gamemusic0_end)-(gamemusic0)+3) and 0xfffffffc, (46168/22050), Zero_Audio_Looping|Zero_Audio_8bit_muLaw)
		ENDIF
	
	ENDIF	

	VSYNC

LOOP