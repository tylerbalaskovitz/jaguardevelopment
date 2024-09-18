' -------------------------------------------------------------------------------------------------------------------------------
'
' Z-Sort Example
'
' -------------------------------------------------------------------------------------------------------------------------------
' NOTE: The sprites in the object list MUST have an active sprite before AND after them (which aren't included in the sort).
'			In this example, the S and E sprites are the active begin and end sprites.
'			In your final game, these could be other legitimate sprites or even small dummy sprites.
' -------------------------------------------------------------------------------------------------------------------------------


' -----------------------------------------------------------------------
' Define your sprite names here.  In the order of objects in rapinit.s
' -----------------------------------------------------------------------
const sprParticleLayer% = 0
const spriteStart		= 1
const sprite1			= spriteStart+1
const sprite2			= sprite1+1
const sprite3			= sprite2+1
const sprite4			= sprite3+1
const sprite5			= sprite4+1
const sprite6			= sprite5+1
const sprite7			= sprite6+1
const sprite8			= sprite7+1
const spriteend			= sprite8+1

const totalSprites 		= 8					' zero based count -   0 to 7 = 8 sprites
const topy				= 30				' Top y position of screen to bounce down
const bottomy			= 150				' Bottom y position of screen to bounce up

dim i as integer


jsfSetFontIndx(1)			' Set font style
jsfSetFontSize(1)			' Set font size


rapLocate 130,192			' Position the text cursor
rapPrint "Z-Sorting"		' Print some text on the screen

dim position as integer
dim gfx as integer


' Set up the sprites - set their positions and graphics
position = 140
gfx = sprite[sprite1].gfxbase
for i = 0 to totalSprites-1

	sprite[sprite1+i].x_ = position
	sprite[sprite1+i].y_ = position
	sprite[sprite1+i].gfxbase = gfx
	
	position -= 14	
	gfx += 32*32*2							' Images are stored consecutively. Just add on width*height*depth

next i



' Main Loop
Do

	rapSortSprites(sprite1,R_sprite_y,totalSprites,SPRSORT_HIGH)					' Sort the sprites.  Start from sprite1, sort using the Y position, sort all 8 sprites and put highest at the back.	
																					' Sort order can be;   (High will put highest values at the back. Low will put lowest at the back).
																					'	SPRSORT_HIGH
																					'	SPRSORT_LOW

	' Iterate over the sprites and check if they have hit the top or bottom boundry.
	'	If so, reverse their direction.
	for i = 0 to totalSprites-1
	
		if sprite[sprite1+i].y_ < topy Then
			sprite[sprite1+i].yadd *= -1			' Negate the direction
		elseif sprite[sprite1+i].y_ > bottomy Then
			sprite[sprite1+i].yadd *= -1			' Negate the direction
		endif

	next i


	VSYNC					' Screen Update
	
LOOP