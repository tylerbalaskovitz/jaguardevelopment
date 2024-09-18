' Doger: super simple project by sh3-rg. Reboot 2015
' This is the first tutorial game for absolute beginners...

' ****************************************************
' * OBJECT NAMES IN ORDER OF APPEARANCE IN rapinit.s *
' ****************************************************
'
' Below is a suggested but not mandatory method of organising
'   your sprites defined in rapinit.s
' It keeps things simple with humanly-readable names and helps
'   manage sprites even if you add in sprites between others
'   during development.
' It's possible to partially automate this with ENUM.

' particle/text layer                                        0

DIM background%     :background=1   '  1 object     total    1
DIM water%          :water=2        '  1 object     total    2
DIM poulpe1%        :poulpe1=3      '  1 object     total    3
DIM poulpe2%        :poulpe2=4      '  1 object     total    4
DIM poulpe3%        :poulpe3=5      '  1 object     total    5
DIM poulpe4%        :poulpe4=6      '  1 object     total    6
DIM poulpe5%        :poulpe5=7      '  1 object     total    7
DIM poulpe6%        :poulpe6=8      '  1 object     total    8
DIM poulpe7%        :poulpe7=9      '  1 object     total    9
DIM nyan1%          :nyan1=10       '  1 object     total   10
DIM nyan2%          :nyan2=11       '  1 object     total   11
DIM nyan3%          :nyan3=12       '  1 object     total   12
DIM nyan4%          :nyan4=13       '  1 object     total   13
DIM nyan5%          :nyan5=14       '  1 object     total   14
DIM nyan6%          :nyan6=15       '  1 object     total   15
DIM nyan7%          :nyan7=16       '  1 object     total   16
DIM nyan8%          :nyan8=17       '  1 object     total   17
DIM nyan9%          :nyan9=18       '  1 object     total   18
DIM nyan10%         :nyan10=19      '  1 object     total   19
DIM nyan11%         :nyan11=20      '  1 object     total   20
DIM nyan12%         :nyan12=21      '  1 object     total   21
DIM nyan13%         :nyan13=22      '  1 object     total   22
DIM nyan14%         :nyan14=23      '  1 object     total   23
DIM nyan15%         :nyan15=24      '  1 object     total   24
DIM doge%           :doge=25        '  1 object     total   25
DIM title%          :title=26       '  1 object     total   26
DIM dead%           :dead=27        '  1 object     total   27
DIM dogeover1%      :dogeover1=28   '  1 object     total   28
DIM dogeover2%      :dogeover2=29   '  1 object     total   29
DIM dogeover3%      :dogeover3=30   '  1 object     total   30
DIM dogeover4%      :dogeover4=31   '  1 object     total   31

jsfSetFontIndx(0)
jsfSetFontSize(0)

' ****************************************************
' * REMAINING GLOBAL VARIABLES USED IN DOGER GAME    *
' ****************************************************

DIM framecounter%       :   framecounter=0                          ' We'll use this to count the number of screen updates.
DIM pad1%               :   pad1=0                                  ' This will be used to store the state of the jagpad.
DIM doge_x%             :   doge_x=0                                ' We'll use this to keep track of the Doge's position accross the screen.
DIM doge_y%             :   doge_y=0                                ' And this to keep track of the Doge's position down the screen.
DIM doge_x_init%        :   doge_x_init=144                         ' This is the Doge's x starting position in pixels.
DIM doge_y_init%        :   doge_y_init=220                         ' This is the Doge's x starting position in pixels.
DIM gamestart%          :   gamestart=0                             ' This will allow us to see if the player wants to start the game.
DIM poulpemovement%     :   poulpemovement=0                        ' When sat on the Poulperaft, we're going to copy its speed and set the Doge to match.
DIM doge1flag%          :   doge1flag=0                             ' These will be used to show the Doge has reached the far side.
DIM doge2flag%          :   doge2flag=0
DIM doge3flag%          :   doge3flag=0
DIM doge4flag%          :   doge4flag=0
DIM nyancheck%          :   nyancheck=0
DIM nyanaddy%           :   nyanaddy=0
DIM nyancount%          :   nyancount=0
DIM i%                  :   i=0


' ****************************************************
' * LOAD COLOURS FOR EACH GRAPHIC INTO THE CLUT      *
' ****************************************************

'LOADCLUT(strptr(SPRITE_BG_clut),0,16)                              ' The Jaguar's Colour Look-Up Table contains 256 entries and is used for 1,2,4 and 8-bit images.
jsfLoadClut(strptr(SPRITE_POULPES_clut),1,16)                          '   With our 4-bit (16 colour) images, we can use up to 16x16 entries from 0 to 15.
jsfLoadClut(strptr(SPRITE_NYAN_clut),2,16)                             '   You can mix and match or have individual palettes for each source graphic, up to 16.
jsfLoadClut(strptr(SPRITE_DOGE_clut),3,16)                             '   8-bit (256 colour) images use the whole CLUT. Lower colour depths use only the first entries
jsfLoadClut(strptr(SPRITE_TITLE_clut),4,16)                            '   in each of the 16x16 slots.
jsfLoadClut(strptr(SPRITE_DEAD_clut),5,16)
jsfLoadClut(strptr(SPRITE_WATER_clut),6,16)

' ****************************************************
' * SET UP SOME GAME STUFF                           *
' ****************************************************

sprite[doge].x = (doge_x_init<<16)                          ' Move the Doge to the initial x position.
sprite[doge].y = (doge_y_init<<16)                          ' Move the Doge to the initial y position.
u235PlayModule((int)strptr(MOD_BOING),MOD_STEREO)                                     ' Play the Amiga MOD track included ni assets.txt. The ((int)strptr...) stuff you need not worry
                                                                    '   about... just do it and it works :0)
nyanaddy=sprite[nyan1].gfxbase

' ****************************************************
' * MAIN GAME LOOP                                   *
' ****************************************************
DO
'   nyancount++
    
    IF gamestart=0 THEN                                             ' The title screen will display at start and only allow the game to continue once the called
        CALL waitforplayertostart                                   '   subroutine has its conditions met (push the button!). As gamestart is set to 1 this never
    ENDIF                                                           '   happens again but could be made to after a game over for instance.

    pad1=jsfGetPad(1)                                                  ' Read the jagpad state. All buttons are packed up into a bundle and stored here.

    doge_x=sprite[doge].x                                 ' Put the Doge's current x position in our x-tracker.
    doge_y=sprite[doge].y                                 ' Put the Doge's current y position in our y-tracker.

'   IF framecounter=>8 THEN                                         ' Check to see if 8 frames have ticked over.
        CALL movedoge                                               ' If so, let the Doge move again - it prevents Doge running wild like a wild Doge.
'       framecounter=0                                              ' Reset the counter for next time.
'   ENDIF
    
    VSYNC                                                           ' Sync to screen refresh.
        
    IF doge_y>=(128<<16) THEN                                       ' If Doge is in bottom half of screen, check if he hits a Nyancat.
        CALL checknyancollide
    ENDIF
    
    IF doge_y<(128<<16) AND doge_y>=(48<<16) THEN                   ' If Doge is in top half of screen check if he is sat on the Poulpes.
        CALL checkpoulpecollide
    ENDIF

    CALL nyanswitch
    
    framecounter++                                                  ' Add 1 to the frame counter. It ticks over as screen refreshes.
LOOP



' ****************************************************
' * SUBROUTINES                                      *
' ****************************************************

SUB nyanswitch

FOR i=nyan1 TO nyan9
    nyancheck=sprite[i].x
    IF nyancheck<(88<<16) THEN
        sprite[i].gfxbase = nyanaddy
    ENDIF
    IF nyancheck>=(88<<16) AND nyancheck<(136<<16) THEN
        sprite[i].gfxbase = nyanaddy+(3072)
    ENDIF
    IF nyancheck>=(136<<16) AND nyancheck<(184<<16) THEN
        sprite[i].gfxbase = nyanaddy+(3072*2)
    ENDIF
    IF nyancheck>=(184<<16) AND nyancheck<(232<<16) THEN
        sprite[i].gfxbase = nyanaddy+(3072*3)
    ENDIF   
    IF nyancheck>=(232<<16) THEN
        sprite[i].gfxbase = nyanaddy+(3072*4)
    ENDIF
NEXT i

FOR i=nyan10 TO nyan15
    nyancheck=sprite[i].x
    IF nyancheck<(88<<16) THEN
        sprite[i].gfxbase = nyanaddy+(3072*4)
    ENDIF
    IF nyancheck>=(88<<16) AND nyancheck<(136<<16) THEN
        sprite[i].gfxbase = nyanaddy+(3072*3)
    ENDIF
    IF nyancheck>=(136<<16) AND nyancheck<(184<<16) THEN
        sprite[i].gfxbase = nyanaddy+(3072*2)
    ENDIF
    IF nyancheck>=(184<<16) AND nyancheck<(232<<16) THEN
        sprite[i].gfxbase = nyanaddy+(3072)
    ENDIF   
    IF nyancheck>=(232<<16) THEN
        sprite[i].gfxbase = nyanaddy
    ENDIF
NEXT i

END SUB

' ****************************************************

SUB waitforplayertostart                                            ' The is the subroutine where we wait for the player to push the button.
    DO
        pad1=jsfGetPad(1)                                              ' Read the jagpad state.
    
        IF pad1=JAGPAD_B THEN                                          ' If B was pressed, we can move the titles off screen and begin the game.
            sprite[title].y = -255<<16
            gamestart=1                                             ' gamestart is set to 1, so the IF.. statement in the main game loop will not be true
        ENDIF                                                       '   and this sub will not be called again.
        
    LOOP UNTIL gamestart=1
END SUB

' ****************************************************

SUB movedoge                                                        ' This subroutine handles our Doge movement. It can only be called after 8 frames have ticked by.

IF framecounter=>8 THEN 
    IF (pad1 BAND JAGPAD_DOWN AND doge_y<=(212<<16)) THEN              ' Move Doge lower down screen by 16 pixels if he's not already at the bottom.
        sprite[doge].y = doge_y+(16<<16)
        framecounter=0
    ENDIF
    
    IF (pad1 BAND JAGPAD_UP AND doge_y>=(60<<16)) THEN                 ' Move Doge higher up screen by 16 pixels if he's not already near the top.
        sprite[doge].y = doge_y-(16<<16)
        framecounter=0
    ENDIF
    
    IF (pad1 BAND JAGPAD_UP AND doge_y<(64<<16)) THEN                  ' This is where we manage the Doge trying to reach the holes at the top.
        CALL dogekennels
        framecounter=0
    ENDIF       
ENDIF

IF framecounter=>1 THEN     
    IF (pad1 BAND JAGPAD_LEFT AND doge_x=>(15<<16)) THEN               ' Move Doge left 16 pixels if he's not already at the left edge.
        sprite[doge].x = doge_x-(2<<16)
        sprite[doge].flip = R_is_flipped                   ' Point Doge left by setting his sprite flipped)
        framecounter=0
    ENDIF
    
    IF (pad1 BAND JAGPAD_RIGHT AND doge_x=<(335-32<<16)) THEN          ' Move Doge right 16 pixels if he's not already at the right edge.
        sprite[doge].x = doge_x+(2<<16)
        sprite[doge].flip = R_is_normal                     ' Point Doge right by setting his sprite normally (not flipped).
        framecounter=0
    ENDIF
ENDIF   
END SUB

' ****************************************************

SUB dogekennels                                                     ' We arrive here if the player is pushing UP while on the top Poulpe raft.

    IF doge_x=>(41<<16) AND doge_x<=(50<<16) AND doge1flag=0 THEN   ' The Doge is smaller than its 32-wide image, therefore we can allow a little leeway for entry.
        sprite[doge].xadd = 0                               ' Kill the Doge drift, he won't be sitting on the raft now.
        sprite[dogeover1].x = (48<<16)                      ' Position the Doge-a-like copy graphics sprite in kennel #1.
        sprite[dogeover1].y = (26<<16)
        doge1flag=1                                                 ' Flag that the Doge has entered this kennel
        CALL highpitchedbark
        jsfDelay(30)                                                   ' Wait 1/2 a second to avoid insta-killing ourselves when we reset to the bottom of the screen.
        CALL resetdoge
    ENDIF
    
    IF doge_x=>((41+64)<<16) AND doge_x<=((50+64)<<16) AND doge2flag=0 THEN             ' Same process as above, but for next gap along and 2nd Doge copy gfx.
        sprite[doge].xadd = 0
        sprite[dogeover2].x = ((48+64)<<16)
        sprite[dogeover2].y = (26<<16)
        doge2flag=1
        CALL highpitchedbark
        jsfDelay(30)                                                   ' Wait 1/2 a second to avoid insta-killing ourselves when we reset to the bottom of the screen.
        CALL resetdoge
    ENDIF   
    
    IF doge_x=>((41+64+64)<<16) AND doge_x<=((50+64+64)<<16) AND doge3flag=0 THEN       ' Same process as above, but for next gap along and 3rd Doge copy gfx
        sprite[doge].xadd = 0                                                   '   and flip the sprite so he faces the centre.
        sprite[dogeover3].x = ((48+64+64)<<16)
        sprite[dogeover3].y = (26<<16)
        sprite[dogeover3].flip = R_is_flipped
        doge3flag=1
        CALL highpitchedbark
        jsfDelay(30)                                                   ' Wait 1/2 a second to avoid insta-killing ourselves when we reset to the bottom of the screen.
        CALL resetdoge
    ENDIF
    
    IF doge_x=>((41+64+64+64)<<16) AND doge_x<=((50+64+64+64)<<16) AND doge4flag=0 THEN ' Same process as above, but for next gap along and 4th Doge copy gfx
        sprite[doge].xadd = 0                                                   '   and flip the sprite so he faces the centre.
        sprite[dogeover4].x = ((48+64+64+64)<<16)
        sprite[dogeover4].y = (26<<16)
        sprite[dogeover4].flip = R_is_flipped
        doge4flag=1
        CALL highpitchedbark
        jsfDelay(30)                                                   ' Wait 1/2 a second to avoid insta-killing ourselves when we reset to the bottom of the screen.
        CALL resetdoge
    ENDIF   
END SUB

' ****************************************************

SUB poulpeslide                                                     ' We make the Doge slide over the screen matching the speed of the Poulpes he's sat on.
    poulpemovement=0                                                ' Reset poulpemovement variable.
    doge_y=sprite[doge].y                                 ' Grab the current y position of Doge.
    
    IF doge_y=(44<<16) THEN                                         ' If Doge is on the top row of poulpes, grab the x-drift value of it.
            poulpemovement=sprite[poulpe1].xadd
    ENDIF
    IF doge_y=(60<<16) THEN                                         ' If Doge is on the 2nd row of poulpes, grab the x-drift value of it.
            poulpemovement=sprite[poulpe3].xadd
    ENDIF
    IF doge_y=(76<<16) THEN                                         ' If Doge is on the 3rd row of poulpes, grab the x-drift value of it.
            poulpemovement=sprite[poulpe4].xadd
    ENDIF
    IF doge_y=(92<<16) THEN                                         ' If Doge is on the 4th row of poulpes, grab the x-drift value of it.
            poulpemovement=sprite[poulpe5].xadd
    ENDIF
    IF doge_y=(108<<16) THEN                                        ' If Doge is on the bottom row of poulpes, grab the x-drift value of it.
            poulpemovement=sprite[poulpe6].xadd
    ENDIF
    
    sprite[doge].xadd = poulpemovement                      ' Set the Doge to drift in whichever way above matches his y-value. Either drifting
END SUB                                                             '   with the raft or zero if no longer on one.

' ****************************************************

SUB checkpoulpecollide                                              ' This is where we check for Doge being on the Poulpe rafts.
    doge_y=sprite[doge].y 			                                ' First we need to check something and put the Doge's current y position in our y-tracker.
    
    IF doge_y>(116<<16) THEN                                        ' We need to see if that cheeky Doge moved back down the screen from the 1st poulperaft.
        sprite[doge].xadd = 0                               '   If he did, he's fine, so we can exit this subroutine and go
        EXIT SUB                                                    '   back to the normal game loop after resetting his x-drift value.
    ENDIF                               
    
    IF rapCollide(poulpe1,poulpe7,doge,doge)<>1 THEN                      ' Check poulpe vs doge for collisions. This =1 when the sprites collide. Doge is set to
                                                                    '   "0 hits to death" which sounds a bit drastic(!), but we're using the CD in reverse
                                                                    '   here (i.e., Doge will die if he's NOT colliding) and we're not checking for any specifics
                                                                    '   (not interested in which poulperaft he's on, only that he's on one). We just use the returned
                                                                    '   value to check that anything at all in our range hit the Doge.
                                                                    '   If Doge lands on a raft, the value given back by the CD routine RHIT will be "1".
                                                                    '   If he misses, gets pulled off screen, or jumps off into the water for a swim, we get back 
        Call resetdoge                                              '   "-1" and have to deal with poor Doge's death :0(
        CALL showangrydoge
    ELSE
        CALL poulpeslide                                            ' He must be on the raft, so we need to match the speed of it or he'd have to keep running!
    ENDIF
END SUB

' ****************************************************

SUB resetdoge                                                       ' Put Doge back at start, reset his values and check to see if all 4 Doges are home safely.
    pad1=0
    sprite[doge].x = (doge_x_init<<16)
    sprite[doge].y = (doge_y_init<<16)
    sprite[doge].xadd = (0<<16)
    doge_x=doge_x_init
    doge_y=doge_y_init
    sprite[doge].was_hit = -1
    
    IF doge1flag=1 AND doge2flag=1 AND doge3flag=1 AND doge4flag=1 THEN ' If all flags are sat, all Doges are home, so game is won!
        DO
            rapLocate int(RND*260),156                                        ' Use RNG to give us a random pixel for x and print some text to the screen using it.
            rapPrint "WELL DOGE!"                                             ' RNG gives back a number between 0 and 1, so if we multiply this by our maximum, we get 0-max.
                                                                            ' int(number) converts a floating point number to a whole number.
            
            u235PlaySample(5,1)                                        ' Play sound 1 on channel 5
            VSYNC
            u235PlaySample(6,1)                                        ' Play sound 1 on channel 6
            
            jsfDelay(180)
        LOOP
    ENDIF
END SUB

' ****************************************************

SUB checknyancollide                                                ' This is where we check for Doge being attacked by nyancats.
    IF rapCollide(doge,doge,nyan1,nyan15)<>-1 THEN                        ' If there's a collision (-1 is returned by the RHIT command to signify that *something* was hit
        CALL resetdoge                                              ' Knowing there was some kind of collision is good enough for this game, we don't need to go
        CALL showangrydoge                                          '   and check which particular one was hit, it's of no use. So we simply call to reset the Doge
    ENDIF                                                           '   and call to display the annoying death screen.
END SUB
    
' ****************************************************

SUB showangrydoge                                                   ' This is where the full screen Doge sprite is moved into view momentarily. It could well be
    sprite[dead].y = (0<<16)                                '   the first part of this game you wish to modify.
    
    u235PlaySample(5,0)                                                    ' Play sound 0 on channel 5
    VSYNC
    u235PlaySample(6,0)                                                   ' Play sound 0 on channel 6
    
    jsfDelay(60)                                                       ' jsfDelay(60) simply waits for 60 vertical blanks - effectively performs 60 VSYNCs before allowing
                                                                    '   flow of the game to continue.
    sprite[dead].y = (255<<16)                             ' And the full screen Doge is moved back off screen.
END SUB

' ****************************************************

SUB highpitchedbark
        u235PlaySample(5,0)                                                    ' Play sound 0 on channel 5
        VSYNC
        u235PlaySample(6,0)                                                     ' Play sound 0 on channel 6
        jsfDelay(30)
        u235PlaySample(5,0)                                                     ' Play sound 0 on channel 5
        VSYNC
        u235PlaySample(6,0)                                                   ' Play sound 0 on channel 6
END SUB

' ****************************************************

' END OF FILE                                                       ' Actually, this comment is the End of the file. Goodbye!
