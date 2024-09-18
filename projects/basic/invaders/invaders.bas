'
' Your code goes here
' Have fun!
'

dim ID_backdrop%, ID_player%, ID_enemy%, ID_textlayer%
ID_backdrop =0                  ' RAPTOR Object number for the backdrop
ID_player   =ID_backdrop+1      ' RAPTOR Object number for player
ID_enemy    =ID_player+1        ' RAPTOR Object number for the first enemy
ID_textlayer=ID_enemy+50        ' RAPTOR Object number for text layer

dim enemy_direction%

jsfLoadClut(strptr(BMP_PLAYER_clut),0,16)
jsfLoadClut(strptr(BMP_ENEMY_clut),1,16)

' point to player object in RAPTOR object table
' add a RMotion animation script to it
sprite[ID_player].rmotion = (int)strptr(RMA_player_animation)


'' configure the initial enemy positions
call Enemy_Initial_Positions
            
            
'' put some text on the screen
rapLocate 20,20
jsfSetFontIndx(0)
jsfSetFontSize(0)
rapPrint "SCORE:"     

'' main loop

do
    vsync                       ' Sync to VBLANK and Update ALL RAPTOR objects
    'dpoke BG,0xffff
    call Enemy_Update_Positions ' Make them march!
    call Player_Update_Position ' Move the player
    'dpoke BG,0
loop                            ' Loop around!
    
            
''
'' Subroutines
''
            
sub Enemy_Initial_Positions

    local cur_enemy%,enemy_y%,enemy_x%
    dim x as short, y as short
    
    cur_enemy=ID_enemy
    enemy_direction=0x000010000         ' X addition in 16.16 (so 0.5 pixels / update)
    enemy_y=(40<<16)                    ' initial Y
    for y=0 to 4                        ' 5 rows
        enemy_x=(20<<16)                ' initial X per row
        for x=0 to 9                    ' 10 per row
            sprite[cur_enemy].xadd = enemy_direction        ' x-addition value
            sprite[cur_enemy].x = enemy_x                   ' set x-position
            sprite[cur_enemy].y = enemy_y                   ' set y-position    
            sprite[cur_enemy].rmotion = (int)strptr(RMA_enemy_animation)' add a RMotion animation script to it
            
            enemy_x=enemy_x+(20<<16)                                ' add 20 to x
            cur_enemy=cur_enemy+1
        next x                                                      ' loop for horiz
        enemy_y=enemy_y+(20<<16)                                    ' add 20 to y
    next y                              ' loop for vertical
end sub                                 ' exit

sub Enemy_Update_Positions
    local cur_enemy%,enemy_y%,enemy_x%
    dim i as short
    
    cur_enemy=ID_enemy                  ' point to RAPTOR object table

    ' check if any enemies hit the edge:
    for i=0 to 49                       ' 50 enemies
        enemy_x=sprite[cur_enemy].x           ' get x-position of current enemy   
        if enemy_x=(19<<16) or enemy_x=(320<<16) then   ' left or right edge?
            ' if yes, change direction on all enemies
            'dpoke BG,0xf00f
            cur_enemy=ID_enemy                          ' point to RAPTOR object table
            enemy_direction=-enemy_direction            ' flip X addition value
            for i=0 to 49 ' 50 enemies
                sprite[cur_enemy].xadd = enemy_direction ' write new direction
                enemy_y=sprite[cur_enemy].y
                enemy_y=enemy_y+(10<<16)                'drop down 10 lines of pixels
                sprite[cur_enemy].y = enemy_y 
                cur_enemy=cur_enemy+1
                if enemy_y=(220<<16) then               ' Y on player line?
                    call Enemy_Initial_Positions
                    i=49                                'no need to check the rest of the sprites
                endif
            next i
        endif
        cur_enemy=cur_enemy+1
    next i                              ' loop around for all
end sub                                 ' exit
            
            
sub Player_Update_Position
    local player_x%, pad%
    player_x=sprite[ID_player].x  ' get player's current X position
    pad=jsfGetPad(1)                           ' get PAD1 status (from U235)

    if pad=JAGPAD_LEFT then                    ' was LEFT pressed?
        if player_x<>(20<<16) then          ' already at far-left position?
            player_x=player_x-(1<<16)       'subtract 1 from X-position
        endif
    elseif pad=JAGPAD_RIGHT then               ' was RIGHT pressed?
        if player_x<>(320<<16) then         'alrady at far-right position?
            player_x=player_x+(1<<16)       'add 1 to X-position
        endif
    endif
    sprite[ID_player].x = player_x  ' store the new x-position  
end sub                                     ' exit
    
