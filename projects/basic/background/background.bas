' -----------------------------------------------------------------------
'
' Example showing different backgrounds overlayed with text.
'
' -----------------------------------------------------------------------

jsfSetFontIndx(1)
jsfSetFontSize(2)

rapLocate 0,50
rapPrint "Text overlay example"
rapLocate 0,80
rapPrint "4 different pictures"
rapLocate 0,110
rapPrint " text still visible"
rapLocate 0,140
rapPrint "  Look at rapinit.s"
rapLocate 0,170
rapPrint " and background.bas"

jsfLoadClut(strptr(back1_clut),0,16)

sprite[0].y=16<<16

' Initially all pictures except the first are off screen.
' After waiting for about 1 second we move the current picture
' off screen and then move the next one into screen view.
' The text object is last in our rapinit.s list.
do
    jsfDelay(60)

    jsfLoadClut(strptr(back2_clut),0,16)
    sprite[1].y=16<<16
    sprite[0].y=700<<16

    jsfDelay(60)

    jsfLoadClut(strptr(back3_clut),0,16)
    sprite[2].y=16<<16
    sprite[1].y=700<<16
    
    jsfDelay(60)

    jsfLoadClut(strptr(back4_clut),0,16)
    sprite[3].y=16<<16
    sprite[2].y=700<<16

    jsfDelay(60)

    jsfLoadClut(strptr(back1_clut),0,16)
    sprite[0].y=16<<16
    sprite[3].y=700<<16

loop

