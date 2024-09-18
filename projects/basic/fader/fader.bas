' -----------------------------------------------------------------------
'
' CLUT Fading example
'
' -----------------------------------------------------------------------


' -----------------------------------------------------------------------
' Define your sprite names here.  In the order of objects in rapinit.s
' -----------------------------------------------------------------------
const sprParticleLayer% = 0


jsfSetFontIndx(1)			' Set font style
jsfSetFontSize(1)			' Set font size

rapFadeDelay=1

rapLocate 130,192			' Position the text cursor
rapPrint "JagStudio"		' Print some text on the screen

dim i as integer

' Create a list of blank palette entries (128 integers = 256 shorts)
dim blankpal[128] as integer
for i = 0 to 127
	blankpal[i] = 0				' Set to black
next i

jsfLoadClut(strptr(blankpal),0,256)		' Default the CLUT to all black entries (load all black entries into the CLUT)

' Main Loop
Do
	
	' Loop 60 times to get to the end (as we have a rapFadeDelay set to 1)
	for i = 0 to 60

		rapFadeClut(0,256,(int *)strptr(LOGO_clut))		' Fade one step from the current CLUT values to the LOGO_clut palette.
		
		vsync											' update the screen
	
	next i
	
	' Now fade back to black
	for i = 0 to 60

		rapFadeClut(0,256,(int *)strptr(blankpal))
		
		vsync
	
	next i
	
LOOP