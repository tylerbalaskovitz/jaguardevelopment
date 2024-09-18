' -----------------------------------------------------------------------
'
' New Project
'
' -----------------------------------------------------------------------


' -----------------------------------------------------------------------
' Define your sprite names here.  In the order of objects in rapinit.s
' -----------------------------------------------------------------------
const sprParticleLayer% = 0


jsfSetFontIndx(1)			' Set font style
jsfSetFontSize(1)			' Set font size


rapLocate 130,182			' Position the text cursor
rapPrint "JagStudio"		' Print some text on the screen


' Main Loop
Do



	VSYNC					' Screen Update
	
LOOP