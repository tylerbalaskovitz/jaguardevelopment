' -----------------------------------------------------------------------
'
' Example project from the quickstart guide.
'
' -----------------------------------------------------------------------


' -----------------------------------------------------------------------
' Define your sprite names here.  In the order of objects in rapinit.s
' -----------------------------------------------------------------------
$include "controllerTypes.bas" 
$include "MainMenu.bas" 
const sprParticleLayer% = 0
const sprBug1% = 1							' sprBug1 is the name of your sprite to move around.  Its the 2nd object in the list.
DIM screenNumber as INTEGER
DIM pad1 AS INTEGER							' Value to store the joypad movement in
DIM tx AS INTEGER							' Value to store the joypad movement in
DIM ty AS INTEGER							' Value to store the joypad movement in
DIM winner AS STRING
DIM players$[6]
DIM spaces as INTEGER
winner = ""
tx = 38
ty = 182
players$[0]="Tyler"
players$[1] = "Loving"
players$[2] = "John"
players$[3] = "Navraj"
players$[4] = "Matt"
players$[5] = "Christian"
scrolling = 0
screenNumber = 0 'Scren 0 Scrolling, Screen 1 Input Name 
jsfSetFontIndx(0)							' Set font style
jsfSetFontSize(1)							' Set font size
FUNCTION AssignWinner(inputString AS STRING)
    winner = inputString  ' Assign the value to the global string
	scrolling = 1	
END FUNCTION


FUNCTION writeName()
	screenNumber = 1
END FUNCTION

' Main Loop
Do
	pad1 = jsfGetPad(LEFT_PAD)				' Get the buttons pressed on the joypad
IF screenNumber = 0 THEN
	ScrollString(scrolling, tx, ty, spaces, winner)
	if scrolling = 1 THEN 
	tx-=2
	ENDIF
	selectWinnerKeypad(pad1)
ENDIF
IF screenNumber = 1 THEN

ENDIF
changeScreenKeypad(pad1)
		'channel, start of sound, end of sound, Hz, options.
		
'		zeroPlaySample(1, strptr(explode_sam), (strptr(explode_sam_end)-strptr(explode_sam)+3) and 0xfffffffc, (46168/8000), Zero_Audio_8bit_Signed)


	VSYNC									' this is required so the sprites update on the screen
	
LOOP
