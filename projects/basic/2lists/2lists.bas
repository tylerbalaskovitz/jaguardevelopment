' -----------------------------------------------------------------------
'
' switching raptor object lists
'
' -----------------------------------------------------------------------

DIM frcount as integer : frcount=0
jsfSetFontIndx(0)
jsfSetFontSize(0)

'Load palettes
jsfLoadClut(strptr(BMP_PLAYER_clut),1,16)
jsfLoadClut(strptr(BMP_ENEMY_clut),2,16)

do

    frcount++
    
	'Switch object list every 120 and 240 frames
    IF frcount=120 THEN 
	
        VSYNC
		rapSetActiveList(1)			' Change to list 1		(lists defined in rapinit.s)
		
    ELSEIF frcount=240 THEN
	
        VSYNC
		rapSetActiveList(0)			' Change to list 0		(lists defined in rapinit.s)
        frcount=0
		
    ENDIF
    
    DPOKE BG,frcount*64				' Change background colour
    
    VSYNC
	
loop



