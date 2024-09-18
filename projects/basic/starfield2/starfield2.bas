' -----------------------------------------------------------------------
'
' Particle based starfield
' Sporadic 2015
'
' -----------------------------------------------------------------------
'
' How it works:		A default particle array is created and fired every few frames. 
'					Every 16th iteration new angles are set in the array to keep the random look
' -----------------------------------------------------------------------


CONST parts%	=		16
DIM i%			:		i=0
DIM particles%[16,6]
DIM counter%	:		counter=0

particles[0,3]=64<<16
particles[0,4]=64<<16
particles[0,5]=parts%

'Set Random Seed
RANDOMIZE(4)

'Create particles
FOR i=1 TO parts%
	particles[i,0]=RND*511							' angle
	particles[i,1]=RNDRANGE(0.5,4)					' speed
	particles[i,2]=0								' angular speed
	particles[i,3]=15								' initial colour
	particles[i,5]=RNDRANGE(100,150)				' pixel life (in frames)
	particles[i,4]=particles[i,5]/RNDRANGE(10,16)	' colour decay (per frame) - Based as a portion of the life	
NEXT i

DO
	counter++
	
	VSYNC
	
	IF counter=2 OR counter=4 THEN
		rapParticleInject(strptr(particles))		' Fire off the particles
	ENDIF
	
	IF counter=16 THEN
		FOR i=1 TO parts%
			particles[i,0] = RND*511				' angle (random between 0-511
		NEXT i
		rapParticleInject(strptr(particles))		' Fire off the new particles
		counter=0
	ENDIF
LOOP


' Function to return a random ranged number
FUNCTION RNDRANGE!(low!, high!)
	DIM t! 
	IF (low! > high!) THEN 
		t! = low!
		low! = high!
		high! = t!
	ENDIF 
   
	FUNCTION = (high! - low! + 1.0) * RND + low!
END FUNCTION
