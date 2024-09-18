' -----------------------------------------------------------------------
'
' simple raptor particle effect demonstration
' sh3-rg 2015
'
' -----------------------------------------------------------------------

DIM x%          :       x=64
DIM y%          :       y=32
DIM x2%         :       x2=0
DIM y2%         :       y2=0
DIM parts%      :       parts=16
DIM trigger%    :       trigger=0
DIM counter%    :       counter=0
DIM pad1%       :       pad1=0
DIM speed%      :   speed=3
DIM curve%		:   curve=10
DIM initial%	:   initial=15
DIM decay%		:   decay=4
DIM life%		:   life=64
DIM sinks%		:   sinks=10

DIM pie!        :       pie=3.1415926535897932384626433832795
DIM rads!       :       rads=(pie/180)

'Show a loading message
jsfSetFontIndx(1)
jsfSetFontSize(1)
rapLocate 16,18
rapPrint "Please Wait..."

DIM i%          :       i=0
DIM sinz![360]
DIM sins%[360]
FOR i=0 to 360
    sinz[i]=(sin(i*rads))*32            ' 64!!111
    sins[i]=INT(sinz[i])
NEXT

DIM particles%[17,6]
particles[0,5]=parts

FOR i=1 TO 8
    particles[i,0]=(i)*64                   ' angle
    particles[i+8,0]=(i-1)*64+32            ' remaining angles
NEXT i

FOR i=1 TO 16
    particles[i,1]=speed                    ' speed
    particles[i,2]=curve                    ' angular speed
    particles[i,3]=initial                  ' initial colour
    particles[i,4]=decay                    ' colour decay (per frame)
    particles[i,5]=life                     ' pixel life (in frames)
NEXT i

CLS

DPOKE BG,34523								' Set background colour

'Load palettes
jsfLoadClut(strptr(SHADOWS_clut),14,16)
jsfLoadClut(strptr(SHADOWS2_clut),13,16)
jsfLoadClut(strptr(LOGO_clut),12,16)
   
   
DO

	' Get Pad input and apply any variable changes
    pad1=jsfGetPad(1)

    IF pad1 BAND JAGPAD_UP AND speed<10 THEN
        speed=speed+1
    ELSEIF pad1 BAND JAGPAD_DOWN AND speed>1 THEN
        speed=speed-1
    ENDIF
    
    IF pad1 BAND JAGPAD_LEFT AND curve>-10 THEN
        curve=curve-1
    ELSEIF pad1 BAND JAGPAD_RIGHT AND curve<10 THEN
        curve=curve+1
    ENDIF

    IF pad1 BAND JAGPAD_1 AND initial<15 THEN
        initial=initial+1
    ELSEIF pad1 BAND JAGPAD_4 AND initial>1 THEN
        initial=initial-1
    ENDIF

    IF pad1 BAND JAGPAD_3 AND life<240 THEN
        life=life+16
    ELSEIF pad1 BAND JAGPAD_6 AND life>32 THEN
        life=life-16
    ENDIF

    IF pad1 BAND JAGPAD_2 AND sinks<60 THEN
        sinks=sinks+1
    ELSEIF pad1 BAND JAGPAD_5 AND sinks>1 THEN
        sinks=sinks-1
    ENDIF
    
	'Iterate to next sine values
    counter=counter+16
	IF counter=>360 THEN
        counter=0
    ENDIF
    x2=sins[counter]
    y2=sins[counter/2]
    
	'Set up new particles in array
	FOR i=1 TO 16
		particles[i,1]=speed                    ' speed
		particles[i,2]=curve                    ' angular speed
		particles[i,3]=initial                  ' initial colour
		particles[i,4]=decay                    ' colour decay (per frame)
		particles[i,5]=life                     ' pixel life (in frames)
	NEXT i

	'Set particles base position
    particles[0,3]=(x+x2)<<16
    particles[0,4]=(y+y2)<<16
    rapParticleInject(strptr(particles))	' Send the particles for processing

    jsfDelay(sinks)							'add a delay
    
LOOP
