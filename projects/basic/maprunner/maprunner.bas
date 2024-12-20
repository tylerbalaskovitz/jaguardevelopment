' -----------------------------------------------------------------------
'
' Random Map builder
' Sporadic 08/2015
'
' -----------------------------------------------------------------------
'
' Set the SEED variable to change the map before compiling.
'
' -----------------------------------------------------------------------

CONST SEED% = 50							' Change this to another value to create a different map

DIM textlayer%          :   textlayer=0
DIM sand%               :   sand=1
DIM sprwall%            :   sprwall=sand+100


'Load CLUTS
jsfLoadClut(strptr(SPRITE_TILE_SAND_clut),1,16)
jsfLoadClut(strptr(SPRITE_TILE_ROCK3_clut),2,16)   


'Get sprite tile graphic addresses
DIM sprwallgfx%         :   sprwallgfx=0
DIM sprfloorgfx%        :   sprfloorgfx=0
sprwallgfx=sprite[sprwall].gfxbase
sprfloorgfx=sprite[sand].gfxbase


'Map array to hold tile types.
dim mapsize%            :   mapsize=32
DIM map%[32,32]         :   map[32,32]


' Used to hold current tile locations/graphics and be pushed to the Powa
DIM mapx%[100]          :   mapx[100]   
DIM mapy%[100]          :   mapy[100]
DIM mapgfx%[100]        :   mapgfx[100]
DIM mapclut%[100]       :   mapclut[100]


'Misc vars
dim i%                  :   i = 0
dim loopx               :   loopx=0
dim loopy               :   loopy=0
dim viewportx%          :   viewportx=0
dim viewporty%          :   viewporty=0
dim viewportmaxx%       :   viewportmaxx=9
dim viewportmaxy%       :   viewportmaxy=9
DIM framecounter%       :   framecounter=0  
DIM pad1%               :   pad1=0  
dim buildSteps%         :   buildSteps=0
dim dir%                :   dir=0
dim px%                 :   px=0
dim py%                 :   py=0


'Viewport starting position.
viewportx = mapsize/2
viewporty = mapsize/2

randomize(SEED%)

'Work out how long to build the map for based on size.
buildSteps = (mapsize * mapsize) + 500
px = mapsize/2
py = mapsize/2


'Show a loading message
jsfSetFontIndx(1)
jsfSetFontSize(1)
rapLocate 16,18
rapPrint "Please Wait: Building map"

jsfSetFontIndx(0)
jsfSetFontSize(0)

' Build the map.  Start from the middle and randomly step different directions until loop ends.
WHILE buildSteps > 0
    
    'Set current tile to be Floor graphic
    map[px,py] = 1
    
    'Pick a random direction to step
    dir = RNDRANGE(0, 4)  '0=up  1=right  2=down   3=left
    
    'move in the random direction selected
    if dir > 0 and dir <= 1 and py > 1 then
        py--
    elseif dir > 1 and dir <= 2 and px < mapsize-2 then
        px++
    elseif dir > 2 and dir <= 3 and py < mapsize-2 then
        py++
    elseif dir > 3 and dir <= 4 and px > 1 then
        px--
    end if

    buildSteps--
	
	'Display loading progress
	rapLocate 16,50
    PRINT "Steps Left: ",buildSteps
WEND

CLS
call updatemap

'Lay the sprites out into a grid.
i=0
FOR loopx = 0 TO viewportmaxx
    FOR loopy = 0 TO viewportmaxy       
        mapx[i] = ((90+(loopx*16))<<16)		'	Set the x position of the tile in the array
        mapy[i] = ((32+(loopy*16))<<16)  	'	Set the y position of the tile in the array       
        i++
    NEXT        
NEXT

'Perform a mass-update of all 100 sprite objects to set all their x and y positions based on the values in the arrays.
jsfSprlistFieldSet(sand,R_sprite_x,100,strptr(mapx))
jsfSprlistFieldSet(sand,R_sprite_y,100,strptr(mapy))


'Show instructions
jsfSetFontIndx(1)
jsfSetFontSize(1)
rapLocate 60,190
rapPrint "DPAD: UP/DOWN/LEFT/RIGHT"

'''''''''''''''''''''''''''''''''''''''
' MAIN LOOP
'''''''''''''''''''''''''''''''''''''''
DO      
    CALL move   
    
    VSYNC

LOOP
'''''''''''''''''''''''''''''''''''''''
' MAIN LOOP END
'''''''''''''''''''''''''''''''''''''''



'Get player input and update map graphics if movement occurred
SUB move

    framecounter++    
    IF framecounter>2 THEN  
	
		DIM RAW refreshmap AS CHAR														' create a temporary variable to store the update flag
		refreshmap = 0
	
        pad1=jsfGetPad(1)																' Get Pad Input
        
        IF (pad1 BAND JAGPAD_LEFT AND viewportx>0) THEN									' If we can move left then update viewport pointer and redraw the map
            viewportx--
            framecounter=0
            refreshmap = 1																' Set flag to request map is updated
        ELSEIF (pad1 BAND JAGPAD_RIGHT AND (viewportx+viewportmaxx)<mapsize-1) THEN
            viewportx++
            framecounter=0
            refreshmap = 1																' Set flag to request map is updated
        ENDIF
        
        IF (pad1 BAND JAGPAD_UP AND viewporty>0) THEN
            viewporty--
            framecounter=0
            refreshmap = 1																' Set flag to request map is updated
        ELSEIF (pad1 BAND JAGPAD_DOWN AND (viewporty+viewportmaxy)<mapsize-1) THEN
            viewporty++
            framecounter=0
            refreshmap = 1																' Set flag to request map is updated
        ENDIF
		
		'If flag is set then go and redraw the map based on the new viewport position.
		IF refreshmap = 1 THEN
			CALL updatemap
		ENDIF
        
    ENDIF   
END SUB


'Update map graphics
SUB updatemap
    i=0

    'Iterate over current viewport of 10x10 tiles and set the sprites to match the viewport over the map
    FOR loopx = 0 TO viewportmaxx
        FOR loopy = 0 TO viewportmaxy                       
            
            if map[viewportx+loopx,viewporty+loopy] = 1 then
                mapgfx[i] = sprfloorgfx							'	Set the array GFXBASE that will be sent to the mass object update below
                mapclut[i] = 1									'	Set the array CLUT that will be sent to the mass object update below
            else                
                mapgfx[i] = sprwallgfx							'	Set the array GFXBASE that will be sent to the mass object update below
                mapclut[i] = 2									'	Set the array CLUT that will be sent to the mass object update below
            end if
                
            i++
        NEXT        
    NEXT
    
	'These are much faster to update all 100 objects instead of looping over them all
    jsfSprlistFieldSet(sand,R_sprite_gfxbase,100,strptr(mapgfx))	'	Perform a mass-update of all 100 tile sprite objects to set their GFXBASE from the array
    jsfSprlistFieldSet(sand,R_sprite_CLUT,100,strptr(mapclut))		'	Perform a mass-update of all 100 tile sprite objects to set their CLUT from the array

END SUB


'Function to return a random number within the range specified.
FUNCTION RNDRANGE!(low!, high!)
   
   IF (low! > high!) THEN 
     DIM t! 
     t! = low!
     low! = high!
     high! = t!
   END IF 
   
   FUNCTION = (high! - low! + 1.0) * RND + low!
 
END FUNCTION 

