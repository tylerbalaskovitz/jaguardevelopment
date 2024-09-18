' -----------------------------------------------------------------------
'
' Scaling Sprite Example
'   Scale a sprite based on X and Y variables.
'   Note: Scaled sprites cost the Object Processor time - so use carefully and test on Hardware.
'
' -----------------------------------------------------------------------


' -----------------------------------------------------------------------
' Define your sprite names here.  In the order of objects in rapinit.s
' -----------------------------------------------------------------------
const sprShip% = 0
const sprParticleLayer% = 1


DIM pad1 AS INTEGER			:	pad1=0
DIM scaleX AS INTEGER		:	scaleX=32
DIM scaleY AS INTEGER		:	scaleY=32

jsfSetFontIndx(1)			' Set font style
jsfSetFontSize(1)			' Set font size
rapLocate 90,182			' Position the text cursor
rapPrint "Scaling Example"	' Print some text on the screen


jsfSetFontIndx(0)
jsfSetFontSize(0)

rapLocate 32,40
rapPrint "DPAD = Change X/Y Scale"

rapLocate 32,56
rapPrint "B    = Reset Scale to 1:1"

rapLocate 32,100
rapPrint "Scale X:"
rapLocate 32,130
rapPrint "Scale Y:"


jsfLoadClut(strptr(SHIP_clut),1,16) 	'Load in the 16 colours for the Ship sprite (put in CLUT 1 and there are 16 colours).

sprite[sprShip].scaled = R_spr_scale	' For scaling to work the sprite MUST have the scaled property set to R_spr_scale.  (sprites default to R_spr_unscale).
										' This can also be set in the rapinit.s object list.


' Main Loop
Do
	pad1 = jsfGetPad(LEFT_PAD)								' Get Input
	
	IF pad1 BAND JAGPAD_RIGHT AND scaleX < 228 THEN			' Scale up WIDTH (as long as we are less than 229)
	
		scaleX = scaleX + 1

	ELSEIF pad1 BAND JAGPAD_LEFT AND scaleX > 0 THEN		' Scale down WIDTH (as long as we are more than 0)
	
		scaleX = scaleX - 1
	
	ENDIF
	
	
	IF pad1 BAND JAGPAD_UP AND scaleY < 228 THEN			' Scale up HEIGHT (as long as we are less than 229)
	
		scaleY = scaleY + 1

	ELSEIF pad1 BAND JAGPAD_DOWN AND scaleY > 0 THEN		' Scale down HEIGHT (as long as we are more than 0)
	
		scaleY = scaleY - 1
	
	ENDIF
	
	
	IF pad1 BAND JAGPAD_B THEN								' Reset scale ratio to 1:1
	
		scaleX = 32
		scaleY = 32
	
	ENDIF
	
	
	'Print out the current scaleX and scaleY values
	jsfSetFontIndx(1)
	
	rapLocate 104,100
	rapPrint "    "
	rapLocate 104,100
	jsfPrintInt scaleX
	
	rapLocate 104,130
	rapPrint "    "
	rapLocate 104,130
	jsfPrintInt scaleY
	
	
	'Scale the sprite based on our variables.
	' NOTE: For this to work the sprite MUST have the scaled property set to R_spr_scale.
	'		This can be done in the rapinit.s object list or you can set it in code.
	
	sprite[sprShip].scale_x = scaleX				'Set the X scale of the sprite.  This can be 0-228.  32 is 1:1.  <32 are smaller.  >32 are larger.
	sprite[sprShip].scale_y = scaleY				'Set the Y scale of the sprite.  This can be 0-228.  32 is 1:1.  <32 are smaller.  >32 are larger.


	VSYNC					' Screen Update
	
LOOP