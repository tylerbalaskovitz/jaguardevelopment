REM SIMPLE DODGE GAME
dim FRCOUNT, CURRENT
dim PY
dim STICK%
dim col
dim countr

FRCOUNT=0: CURRENT=0
PY=100
jsfSetFontIndx(0)
jsfSetFontSize(0)
rapFadeDelay=1
countr=0
dim sfxcount as short

rapLocate 10,10

jsfLoadClut(strptr(BMP_ENEMY_clut),2,16)
u235PlayModule((int)strptr(Module1),MOD_STEREO)

dim counter as int
counter=20

REM MAIN LOOP
do

    FRCOUNT=FRCOUNT+1
    IF FRCOUNT=10 THEN 
        call newenemy 'REM ADD NEW ENEMY
    ENDIF
    STICK=jsfGetPad(1)
    IF (STICK BAND JAGPAD_UP AND PY>20) THEN
        PY=PY-2
    ENDIF
    IF (STICK BAND JAGPAD_DOWN AND PY<200) THEN
        PY=PY+2
    endif

    ' Every 200 frames, change music played
    counter=counter+1
    if counter=200 then
        u235StopModule()
		u235Silence()
    elseif counter=201 then
        'Play module 2
        u235PlayModule((int)strptr(Module2),MOD_STEREO)
    elseif counter=400 then
        counter=0
        u235StopModule()
		u235Silence()
    elseif counter=1 then
        'Play module 1
        u235PlayModule((int)strptr(Module1),MOD_STEREO)
    endif

    sprite[1].y_=PY
	
    IF rapCollide(1,1,2,22)<>-1 THEN
        sfxcount=sfxcount+1
        if sfxcount=10 then    
			u235PlaySample(4,0)
            sfxcount=0
        endif
        col=PY<<10
        dpoke BG,col
    ELSE
        dpoke BG,PY
    endif
	
    vsync

    rapFadeClut(1,15,(int *)strptr(BMP_PLAYER_clut))
	
    if countr<32 then
        rapFadeClut(2,15,(int *)strptr(BMP_ENEMY_clut))
    elseif countr<64 then
        rapFadeSingle(32,0x00ff)
        rapFadeSingle(33,0x00ff)
        rapFadeSingle(34,0x00ff)
        rapFadeSingle(35,0x00ff)
        rapFadeSingle(36,0x00ff)
        rapFadeSingle(37,0x00ff)
        rapFadeSingle(38,0x00ff)
        rapFadeSingle(39,0x00ff)
        rapFadeSingle(40,0x00ff)
        rapFadeSingle(41,0x00ff)
    else
        countr=0
    endif
    countr=countr+1
loop

REM NEW ENEMY
sub newenemy
    sprite[2+CURRENT].x_=352
    sprite[2+CURRENT].y_=INT((integer)(RND*200))
    sprite[2+CURRENT].was_hit=R_cant_hit
    sprite[2+CURRENT].hitpoint=1
    sprite[2+CURRENT].xadd_=-2
    sprite[2+CURRENT].active=R_is_active
	
    CURRENT=CURRENT+1
    IF CURRENT=19 THEN
        CURRENT=0
    ENDIF
    FRCOUNT=0
end sub

