// -----------------------------------------------------------------------
//
// Example program showing Zerosquare player functions.
// Sporadic 2021
//
// -----------------------------------------------------------------------

// -----------------------------------------------------------------------
// Define your sprite names in common.h
// -----------------------------------------------------------------------
#include "common.h"								// This should be included in all source files



// -----------------------------------------------------------------------
//            User Global Variables
// -----------------------------------------------------------------------
static int     pad1;
static char    musicPlaying;


//Main program
void basicmain()
{
	jsfSetFontIndx(1);
	jsfSetFontSize(1);
	rapLocate(0,182);
	js_r_textbuffer=(char *)"          JagStudio - Zero Test         ";
	rapPrint();
	jsfSetFontIndx(0);
	jsfSetFontSize(0);
	pad1=0;
	rapLocate(20,10);
	js_r_textbuffer=(char *)"1        : Play SFX in channel 1";
	rapPrint();
	rapLocate(20,40);
	js_r_textbuffer=(char *)"2        : Play SFX in channel 2";
	rapPrint();
	rapLocate(20,70);
	js_r_textbuffer=(char *)"3        : Start / Stop MuLaw Music";
	rapPrint();
	musicPlaying=0;

	
	//Main game loop
	while(1)
	{
		pad1=jsfGetPadPressed(1);
		if(pad1 & JAGPAD_1)
		{
			zeroPlaySample(1,STRPTR(explode_sam),(STRPTR(explode_sam_end)-STRPTR(explode_sam)+3) & 0xfffffffc,(46168/8000),Zero_Audio_8bit_Signed);
		}
		
		if(pad1 & JAGPAD_2)
		{
			zeroPlaySample(2,STRPTR(explode_sam),(STRPTR(explode_sam_end)-STRPTR(explode_sam)+3) & 0xfffffffc,(46168/16000),Zero_Audio_8bit_Signed);
		}
		
		if(pad1 & JAGPAD_3)
		{
			musicPlaying=(musicPlaying+1)&1;
			if(musicPlaying==0)
			{
				zeroPlaySample(3,(void*)0,0,(46168/8000),0);
			}
			else
			{
				zeroPlaySample(3,(void*)(gamemusic0),((gamemusic0_end)-(gamemusic0)+3) & 0xfffffffc,(46168/22050),Zero_Audio_Looping|Zero_Audio_8bit_muLaw);
			}
		}
		jsfVsync(0);
	}
}



