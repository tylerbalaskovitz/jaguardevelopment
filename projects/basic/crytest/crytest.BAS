' -----------------------------------------------------------------------
'
' 60fps 16-bit animated read/modify/write lolvalamp aka "metablols"
' sh3-rg 2015
'
' -----------------------------------------------------------------------

'Display a loading message
jsfSetFontIndx(0)
jsfSetFontSize(1)
rapLocate 16,18
rapPrint "Please Wait: Calculating Sine values"


'Create some nice sine values
DIM pie!: pie=3.1415926535897932384626433832795
DIM rads!: rads=(pie/180)
DIM i%          : i=0
DIM sinz![360]
DIM sins%[1080]
FOR i=0 to 359
    sinz[i]=(sin(i*rads))*40
    sins[i]=(int)INT(sinz[i])
    sins[i+360]=sins[i]
    sins[i+720]=sins[i]
NEXT

sprite[0].y = 241<<16		'Move the text layer out of the screen
cls							'clear the text
vsync						'update the screen now

DIM eckz%                       : eckz=0
DIM eckz2%                      : eckz2=0
DIM eckz3%                      : eckz3=0
DIM eckz4%                      : eckz4=0
DIM why%                        : why=0
DIM why2%                       : why2=0
DIM why3%                       : why3=0
DIM why4%                       : why4=0
DIM shifter%                    : shifter=0
DIM shifty%                     : shifty=90
DIM changer%                    : changer=1
DIM offset%                     : offset=1

'Turn off RGB vid mode
DPOKE VMODE,1735

'set background colour
DPOKE BG,800

REM MAIN LOOP
DO
	CALL circs
	shifter++
	shifty++    

	CALL spiral
	
	IF shifter=360 THEN
		shifter=0
		shifty=90
	ENDIF
    VSYNC
LOOP

SUB circs

	eckz=sins[shifter+offset]
	eckz2=sins[shifty+offset]
	eckz3=sins[shifter]
	eckz4=sins[shifty]
	why=sins[360+shifter-offset]
	why2=sins[360+shifty-offset]
	why3=sins[180+shifter]
	why4=sins[180+shifty]

	sprite[1].x = 120+eckz<<16
	sprite[1].y = 64+eckz2<<16             
	sprite[2].x = 120+eckz3<<16
	sprite[2].y = 64+eckz4<<16             
	sprite[3].x = 120+why<<16
	sprite[3].y = 64+why2<<16                
	sprite[4].scale_x = offset
	sprite[4].scale_y = offset
	sprite[4].x = 182-(offset*2)<<16
	sprite[4].y = 124-(offset*2)<<16                  
	sprite[5].x = 120+why3<<16
	sprite[5].y = 64+why4<<16
	sprite[6].x = 120+(why3)<<16
	sprite[6].y = 64+(why4)<<16

END SUB

SUB spiral
	IF shifter % 2= 0 THEN
		offset=offset+changer
		IF offset=60 or offset=0 THEN
			changer=changer*-1
		ENDIF
	ENDIF
END SUB

