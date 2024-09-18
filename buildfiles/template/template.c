// -----------------------------------------------------------------------
//
// New Project
//
// -----------------------------------------------------------------------

// -----------------------------------------------------------------------
// Define your sprite names in common.h
// -----------------------------------------------------------------------
#include "common.h"								// This should be included in all source files


// Main Entry Point
void basicmain()
{
	jsfSetFontIndx(1);							// Set font style
	jsfSetFontSize(1);							// Set font size

	rapLocate(130,182);							// Position the text cursor

	js_r_textbuffer=(char *)"JagStudio";		// Set the text we want to print
	rapPrint();									// Print some text on the screen


	// Main Loop
	while(1) 
	{
	  
	  
	  
	  jsfVsync(0);								// Screen Update
	}; 
}

