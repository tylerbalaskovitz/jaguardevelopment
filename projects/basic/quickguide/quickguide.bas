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
const sprBug1% = 1


' Main Loop
Do
	'Gets the LEFT controller port
	pad1 = jsfGetPad(LEFT_PAD)
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

	'Updates images on screen
	VSYNC
LOOP
