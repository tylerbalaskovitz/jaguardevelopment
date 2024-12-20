' -----------------------------------------------------------------------
' Main States of the Program are here, from player creation, name creation, etc.  
' -----------------------------------------------------------------------

' -----------------------------------------------------------------------
' Define your sprite names here.  In the order of objects in rapinit.s
' -----------------------------------------------------------------------
$include "CreatePlayers.bas" 
$include "ControllerTypes.bas" 
$include "MainMenu.bas" 
$include "PlayerVariables.bas"
$include "ScoreBoard.bas"
$include "SelectPlayers.bas"
$include "Rankings.bas"
$include "Credits.bas"
const sprParticleLayer% = 0
const sprBug1% = 1


' Main Loop
Do
	'Gets the LEFT controller port
	pad1 = jsfGetPad(LEFT_PAD)

IF screenNumber = -999 THEN
	drawTitleScreen()
ENDIF
IF screenNumber = -998 THEN
	drawSelectPlayers()
ENDIF
IF screenNumber = 0 THEN
	ScrollString(scrolling, tx, ty, spaces, winner)
	if scrolling = 1 THEN 
	tx-=2
	ENDIF
ENDIF
IF screenNumber = 1 THEN
	writePlayerName(pad1)
	registerPlayer(temp, tempName)
ENDIF
IF screenNumber = 2 THEN
	keepScore(pad1)
	drawScoreboard(maxPlayers)
ENDIF
IF screenNumber = 3 THEN
	drawRankings(maxPlayers)
ENDIF
IF screenNumber = 4 THEN
	drawCredits()
ENDIF
changeScreenKeypad(pad1)

	'Updates images on screen
	VSYNC
LOOP
