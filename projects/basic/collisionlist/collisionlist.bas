' -----------------------------------------------------------------------
'
' Collision List
'
' -----------------------------------------------------------------------


' -----------------------------------------------------------------------
' Define your sprite names here.  In the order of objects in rapinit.s
' -----------------------------------------------------------------------
const sprParticleLayer% = 0
const spriteStart 		= 1
const spriteEnd			= 30


jsfSetFontIndx(1)							' Set font style
jsfSetFontSize(1)							' Set font size


rapLocate 100,202							' Position the text cursor
rapPrint "Collision List"					' Print some text on the screen


DIM i AS INTEGER
DIM collisionSprAddr as integer				' The memory address of the sprite that collided
DIM collisionSprIndex as integer			' The sprite index of the sprite that collided
DIM globalCollision AS INTEGER				' Flag to check if ANY collision happened


FOR i = spriteStart TO spriteEnd				' Set up starting values for all the other sprites

	sprite[i].active = R_is_active
	sprite[i].x_ = rapRND() & 255
	sprite[i].y_ = rapRND() & 255
	sprite[i].xadd = (rnd * (4<<16)) - (rnd * (4<<16))
	sprite[i].yadd = (rnd * (4<<16)) - (rnd * (4<<16))	
	sprite[i].colchk = R_can_hit						' We want the sprite to be able to collide

NEXT i


' Main Loop
Do

	globalCollision = rapCollide(spriteStart,spriteEnd,spriteStart,spriteEnd)	' Check if ANY collision happened
	if globalCollision > -1 then												' > -1 means it did
		
		i = 0		
		DO																		' Iterate over the collision list until we reach the -1 terminator
		
			collisionSprAddr = colliders[i].objectHitAddr							' Get the memory address of this sprite that collided
			if collisionSprAddr > -1 then											' If not -1 then its a sprite
				
				collisionSprIndex = jsfGetSpriteIndex(collisionSprAddr)				' Look up the list index of the sprite
				
				if sprite[collisionSprIndex].curframe = 0 then							' To save performance, only change sprite direction 
																						'	when sprite han't just collided (anim is no longer playing)
					sprite[collisionSprIndex].curframe = 9								' Change the sprite animation frame to play				
					sprite[collisionSprIndex].xadd_ = (rapRND() & 3) - (rapRND() & 3)	' Set a new random direction for the sprite x
					sprite[collisionSprIndex].yadd_ = (rapRND() & 3) - (rapRND() & 3)	' Set a new random direction for the sprite	y
				endif				
				
			endif			
			i++
		
		LOOP UNTIL collisionSprAddr < 0											' Keep iterating the collision list until the end
	
	endif

	VSYNC									' Screen Update
	
LOOP