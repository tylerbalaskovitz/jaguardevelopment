// -----------------------------------------------------------------------
//
// Blitter Example
// Uses the Raptor Blitterlist command to draw directly onto a sprite.
// Sporadic 2020
//
// -----------------------------------------------------------------------
//
// How it works:		The Blitter list array is set up with default values.
//					The first item in the array is set to clear the 'canvas'
//					Inside the main loop the blitter list array is passed to Raptor for processing.
//					Then the list is updated with new values
//				
// Note: 			Sprite and blitter commands are all 16bit graphics.
//					BlitList contains the majority of the blitter registers.
// -----------------------------------------------------------------------

// -----------------------------------------------------------------------
// Define your sprite names in common.h
// -----------------------------------------------------------------------
#include "common.h"								// This should be included in all source files

// -----------------------------------------------------------------------
//            User Global Variables
// -----------------------------------------------------------------------
static int     particles;
static int     canvasSpr;
static int     gfxcanvas;
static int     x;
static int     xmod;
static int     y;
static int     linecolour;
static int     width;
static float   pie;
static float   rads;
static float   sinz;
static int     sineloop;
static int     blitlist[131][16];
static int     sins[360];



void basicmain()
{
	// Set up some default values.
	particles=0;
	canvasSpr=1;
	gfxcanvas=sprite[canvasSpr].gfxbase;
	x=110;
	xmod=2;
	y=0;
	linecolour=200;
	width=100;
	pie=3.1415926535897932384626433832795;
	rads=(pie/180);
	sineloop=0;
	
	// Print some text notifying the user we are building some values
	jsfSetFontIndx(1);
	jsfSetFontSize(1);
	rapLocate(16,18);
	js_r_textbuffer=(char *)"Please Wait: Calculating Sine values";
	rapPrint();
	
	// Loop over 360 and calc all sine values.
	for(y=0; y<=359; y+=1)
	{
		sinz=(sin(y*rads)*64);
		sins[y]=floor(sinz);
	}

	cls();																		// Clear the text screen
	
	jsfSetFontIndx(1);															// Print some text
	jsfSetFontSize(1);
	rapLocate(122,170);
	js_r_textbuffer=(char *)"Blitlist C";
	rapPrint();
	
	//Set all Blitlist array entries to default values.
	for(y=0; y<=130; y+=1)
	{
		blitlist[y][0] = gfxcanvas;
		blitlist[y][1] = PIXEL16|XADDPIX|WID320|PITCH1;
		blitlist[y][2] = 0;
		blitlist[y][3] = (y<<16)+x;
		blitlist[y][4] = 0;
		blitlist[y][5] = 0;
		blitlist[y][6] = 0;
		blitlist[y][7] = 0;
		blitlist[y][8] = 0;
		blitlist[y][9] = 0;
		blitlist[y][10] = 0;
		blitlist[y][11] = linecolour+y;
		blitlist[y][12] = 0;
		blitlist[y][13] = 0;
		blitlist[y][14] = (1<<16)+width;
		blitlist[y][15] = PATDSEL;
	}

	// Make sure the list has a terminator at the end
	blitlist[130][0] = -1;
	
	//Set the first blitter command to always clear the 'screen' (canvas)
	blitlist[0][0] = gfxcanvas;
	blitlist[0][1] = PIXEL16|XADDPHR|WID320|PITCH1;
	blitlist[0][2] = 0;
	blitlist[0][3] = 0;
	blitlist[0][4] = 0;
	blitlist[0][5] = 0;
	blitlist[0][6] = 0;
	blitlist[0][7] = 0;
	blitlist[0][8] = 0;
	blitlist[0][9] = 0;
	blitlist[0][10] = 0;
	blitlist[0][11] = 0;
	blitlist[0][12] = 0;
	blitlist[0][13] = 0;
	blitlist[0][14] = (130<<16)+320;
	blitlist[0][15] = LFU_CLEAR;

	// Main game loop
	while(1)
	{
		jsfVsync(0);

		rapBlitlist(STRPTR(blitlist));							// Pass the blitlist array to Raptor for processing

		linecolour+=12;											// Increment through all the colours.

		for(y=1; y<=130; y+=1)									// Draw 130 lines each with their own colour
		{
			blitlist[y][0]=gfxcanvas;
			blitlist[y][3]=(y<<16)+(x+sins[sineloop>>4]);		// X position is based from base x coord + the current sineloop value (scaled down)
			blitlist[y][14]=(1<<16)+width;
			blitlist[y][11]=linecolour+y*3;
			sineloop+=1;										// Inc the sine loop

			if(sineloop > (360<<4)-1)							// If we have done a full iteration, loop back round
			{
				sineloop = 0;
			}
		}
		blitlist[130][0] = -1;									// Terminate the current (last) blitlist entry after our previous one.
	}
}
