// -----------------------------------------------------------------------
//
// Example program showing U235SE functions.
// Sporadic 2020
//
// -----------------------------------------------------------------------

// -----------------------------------------------------------------------
// Define your sprite names in common.h
// -----------------------------------------------------------------------
#include "common.h"								// This should be included in all source files


// -----------------------------------------------------------------------
//            User Defined Constants
// -----------------------------------------------------------------------
#define FREQ_MAX 24000
#define FREQ_MIN 1000

// -----------------------------------------------------------------------
//            User Global Variables
// -----------------------------------------------------------------------
static int     pad1;
static int     frequency;



void basicmain()
{
	jsfSetFontSize(1);
	jsfSetFontIndx(1);

	rapLocate(80,200);
	js_r_textbuffer=(char *)"JagStudio";
	rapPrint();

	jsfSetFontIndx(0);
	js_r_textbuffer=(char *)" U235 ";
	rapPrintCont();

	jsfSetFontIndx(1);
	js_r_textbuffer=(char *)"C Test";
	rapPrintCont();

	jsfSetFontIndx(0);
	jsfSetFontSize(0);

	pad1=0;

	frequency=8000;

	rapLocate(20,10);
	js_r_textbuffer=(char *)"B        : Play SFX at Fixed Freq";
	rapPrint();

	rapLocate(20,40);
	js_r_textbuffer=(char *)"C        : Play SFX at variable Freq";
	rapPrint();

	rapLocate(20,50);
	js_r_textbuffer=(char *)"Left     : Lower Frequency";
	rapPrint();

	rapLocate(20,60);
	js_r_textbuffer=(char *)"Right    : Higher Frequency";
	rapPrint();

	jsfSetFontIndx(1);
	rapLocate(20,76);
	js_r_textbuffer=(char *)ee_printf("%s% d\n","Frequency:",(int)frequency);
	rapPrint();

	jsfSetFontIndx(0);
	rapLocate(20,100);
	js_r_textbuffer=(char *)"1        : Play ABS Mono Module";
	rapPrint();

	rapLocate(20,120);
	js_r_textbuffer=(char *)"2        : Play ABS Stereo Module";
	rapPrint();

	rapLocate(20,140);
	js_r_textbuffer=(char *)"3        : Play ROM Module";
	rapPrint();

	rapLocate(20,160);
	js_r_textbuffer=(char *)"4        : Stop Module";
	rapPrint();

	while(1)
	{
		jsfVsync(0);

		pad1=jsfGetPadPressed(LEFT_PAD);

		if(pad1 & JAGPAD_B)
		{
			u235PlaySampleFreq(4,0,8000);
			u235PlaySampleFreq(5,0,8000);
		}
		else if(pad1 & JAGPAD_C)
		{
			u235PlaySample(6,0);
			u235PlaySample(7,0);
			u235ChannelFreq(6,frequency);
			u235ChannelFreq(7,frequency);
		}
		else if(pad1 & JAGPAD_1)
		{
			u235StopModule();
			u235Silence();
			jsfVsync(0);
			u235PlayModule((int)STRPTR(Module1),MOD_MONO);
		}
		else if(pad1 & JAGPAD_2)
		{
			u235StopModule();
			u235Silence();
			jsfVsync(0);
			u235PlayModule((int)STRPTR(Module1),MOD_STEREO);
		}
		else if(pad1 & JAGPAD_3)
		{
			u235StopModule();
			u235Silence();
			jsfVsync(0);
			u235PlayModule(MOD_MENU,MOD_STEREO);
		}
		else if(pad1 & JAGPAD_4)
		{
			u235StopModule();
			u235Silence();
		}

		pad1=jsfGetPad(LEFT_PAD);

		if(pad1 & JAGPAD_LEFT)
		{
			frequency-=30;

			if(frequency<FREQ_MIN)
			{
				frequency=FREQ_MIN;
			}

			jsfSetFontIndx(1);

			rapLocate(20,76);
			js_r_textbuffer=(char *)ee_printf("%s% d\n","Frequency:",(int)frequency);
			rapPrint();
		}
		else if(pad1 & JAGPAD_RIGHT)
		{
			frequency+=30;

			if(frequency>FREQ_MAX)
			{
				frequency=FREQ_MAX;
			}

			jsfSetFontIndx(1);

			rapLocate(20,76);
			js_r_textbuffer=(char *)ee_printf("%s% d\n","Frequency:",(int)frequency);
			rapPrint();
		}
	}
}




