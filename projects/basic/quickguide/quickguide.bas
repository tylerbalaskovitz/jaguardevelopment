' -----------------------------------------------------------------------
'
' Example project from the quickstart guide.
'
' -----------------------------------------------------------------------


' -----------------------------------------------------------------------
' Define your sprite names here.  In the order of objects in rapinit.s
' -----------------------------------------------------------------------
$include "ControllerTypes.bas" 
$include "MainMenu.bas" 
$include "PlayerVariables.bas"
const sprParticleLayer% = 0
const sprBug1% = 1							' sprBug1 is the name of your sprite to move around.  Its the 2nd object in the list.
DIM spaces as INTEGER
scrolling = 0



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
