' -----------------------------------------------------------------------
'
' Font / Particle Palette switching.
'
' -----------------------------------------------------------------------


' -----------------------------------------------------------------------
' Define your sprite names here.  In the order of objects in rapinit.s
' -----------------------------------------------------------------------
const sprParticleLayer% = 0

DIM pad1 AS INTEGER

DIM particles%[17,6]
DIM i%


'Set up some basic particles
particles[0,3]=(64)<<16
particles[0,4]=(128)<<16
particles[0,5]=16
FOR i=1 TO 8
    particles[i,0]=(i)*64				' angle
    particles[i+8,0]=(i-1)*64+32		' remaining angles
NEXT i
FOR i=1 TO 16
    particles[i,1]=3					' speed
    particles[i,2]=10					' angular speed
    particles[i,3]=15					' initial colour
    particles[i,4]=4					' colour decay (per frame)
    particles[i,5]=64					' pixel life (in frames)
NEXT i



jsfSetFontIndx(1)			' Set font style
jsfSetFontSize(1)			' Set font size
rapLocate 116,182			' Position the text cursor
rapPrint "JagStudio"		' Print some text on the screen


jsfSetFontIndx(0)			' Set font style
jsfSetFontSize(0)			' Set font size
rapLocate 32,32			' Position the text cursor
rapPrint "Separate Font/Particle Palettes"		' Print some text on the screen

rapLocate 32,60
rapPrint "1 = 8x8 Font Palette"
rapLocate 32,70
rapPrint "2 = 8x16 Font Palette"
rapLocate 32,80
rapPrint "3 = 16x16 Font Palette"
rapLocate 32,90
rapPrint "4 = Particle Palette"
rapLocate 32,90
rapPrint "B = Fire some Particles"


' Main Loop
Do

	pad1 = jsfGetPadPressed(1)					' Get singular debounced button presses

	IF pad1 BAND JAGPAD_4 THEN
	
		rapUseParticlePalette(15)				'load the assets/partipal.bmp palette into CLUT 15

	ELSEIF pad1 BAND JAGPAD_1 THEN
	
		rapUse8x8fontPalette(15)				'load the assets/fonts/f_8x8.bmp palette into CLUT 15

	ELSEIF pad1 BAND JAGPAD_2 THEN
	
		rapUse8x16fontPalette(15)				'load the assets/fonts/f_8x16.bmp palette into CLUT 15

	ELSEIF pad1 BAND JAGPAD_3 THEN
	
		rapUse16x16fontPalette(15)				'load the assets/fonts/f_16x16.bmp palette into CLUT 15

	ELSEIF pad1 BAND JAGPAD_B THEN
		
		rapParticleInject(strptr(particles))	' Send the particles for processing
		
	ENDIF


	VSYNC					' Screen Update
	
LOOP