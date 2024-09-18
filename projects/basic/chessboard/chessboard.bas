' -----------------------------------------------------------------------
'
' superlame chessboard
' sh3-rg 2015
'
' -----------------------------------------------------------------------

DIM i%          :   i=0
DIM j%          :   j=0
DIM ticker%     :   ticker=0
DIM jagpad_1%   :   jagpad_1=0
jsfLoadClut(strptr(BMP_PRESS_A_clut),1,16)
jsfLoadClut(strptr(BMP_WIN_clut),2,16)

DO

    CALL manage_vbl
    
    jagpad_1=jsfGetPad(1) 

LOOP UNTIL jagpad_1 BAND JAGPAD_A


sprite[1].active = R_is_inactive
    
CALL tons_of_updates
sprite[2].y = 252<<16

CALL tons_of_updates
sprite[2].y = 0<<16

CALL tons_of_updates
sprite[2].y = 252<<16

CALL tons_of_updates
sprite[2].y = 0<<16

CALL tons_of_updates
sprite[2].y = 252<<16

CALL tons_of_updates
CALL tons_of_updates
CALL tons_of_updates
CALL tons_of_updates

DO

    CALL manage_vbl
    
LOOP


SUB manage_vbl
    ticker++

    IF ticker=32 THEN
        ticker=0
        sprite[0].x = -32<<16
        sprite[0].y = 0
    ENDIF
    
    VSYNC

END SUB


SUB tons_of_updates

    FOR j=1 TO 36
        CALL manage_vbl
    NEXT j
END SUB



