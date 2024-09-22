// *********************************************************************
// Generated by JagStudio
// Based on BCX32 - BASIC To C/C++ Translator (V) 6.00 (2009/06/02)
//                 BCX (c) 1999 - 2009 by Kevin Diggins
//              Translated for compiling with a C Compiler
// *********************************************************************
// *********************************************************************

// ***************************************************
// Compiler Defines
// ***************************************************

// C++
#if defined( __cplusplus )
  #define overloaded
  #define C_EXPORT EXTERN_C __declspec(dllexport)
  #define C_IMPORT EXTERN_C __declspec(dllimport)
#else
  #define C_EXPORT __declspec(dllexport)
  #define C_IMPORT __declspec(dllimport)
#endif

#include "jstudio.h"
#include "romassets.h"
#define UINT unsigned int
#define WORD short
#define BYTE char
#define UWORD unsigned short
#define UBYTE unsigned char
//Lines inserted deliberately because of some bcx brokeness - fix at some point!
//Lines inserted deliberately because of some bcx brokeness - fix at some point!
//Lines inserted deliberately because of some bcx brokeness - fix at some point!
#define peek(x) (*(volatile char *)(x))
#define dpeek(x) (*(volatile short *)(x))
#define lpeek(x) (*(volatile int *)(x))
// *************************************************
//               Standard Macros
// *************************************************
#define BAND &
// *************************************************
//            User Global Initialized Arrays
// *************************************************

// *************************************************
//            User Defined Constants
// *************************************************

#define sprParticleLayer 0

// *************************************************
//            User Global Variables
// *************************************************

static int     pad1;

// *************************************************
//                  Main Program
// *************************************************

void basicmain()
{
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 12] const sprParticleLayer% = 0
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 15] jsfSetFontIndx(1)
jsfSetFontIndx(1);
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 16] jsfSetFontSize(1)
jsfSetFontSize(1);
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 19] DIM pad1 AS INTEGER
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 19] pad1=0
pad1=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 22] rapLocate 70,182
rapLocate(70,182);
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 23] rapPrint "JagStudio Clock Example"
js_r_textbuffer=(char *)"JagStudio Clock Example";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 25] jsfSetFontIndx(0)
jsfSetFontIndx(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 26] jsfSetFontSize(0)
jsfSetFontSize(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 28] rapLocate 20,10
rapLocate(20,10);
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 29] rapPrint "A   : Start Counting Up"
js_r_textbuffer=(char *)"A   : Start Counting Up";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 31] rapLocate 20,30
rapLocate(20,30);
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 32] rapPrint "B   : Stop Counting"
js_r_textbuffer=(char *)"B   : Stop Counting";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 34] rapLocate 20,50
rapLocate(20,50);
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 35] rapPrint "C   : Start Counting Down"
js_r_textbuffer=(char *)"C   : Start Counting Down";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 37] rapLocate 20,70
rapLocate(20,70);
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 38] rapPrint "1   : Add 10 Seconds"
js_r_textbuffer=(char *)"1   : Add 10 Seconds";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 40] rapLocate 20,90
rapLocate(20,90);
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 41] rapPrint "2   : subtract 10 Seconds"
js_r_textbuffer=(char *)"2   : subtract 10 Seconds";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 43] rapSetClock(0)
rapSetClock(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 44] rapClockMode = Clock_Freeze
rapClockMode=Clock_Freeze;
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 46] jsfSetFontIndx(1)
jsfSetFontIndx(1);
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 49] Do
for(;;)
  {
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 51] rapLocate 50,130
    rapLocate(50,130);
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 52] rapPrint "ASCII Value: "
    js_r_textbuffer=(char *)"ASCII Value: ";
    rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 53] rapPrintCont rapClockValue
    js_r_textbuffer=(char *)rapClockValue;
    rapPrintCont();
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 56] rapLocate 50,150
    rapLocate(50,150);
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 57] rapPrint "Raw Value:      "
    js_r_textbuffer=(char *)"Raw Value:      ";
    rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 58] rapLocate 138,150
    rapLocate(138,150);
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 59] jsfPrintInt rapClockHex
    js_r_textbuffer=ee_printf("%d",rapClockHex);
    rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 62] pad1 = jsfGetPadPressed(LEFT_PAD)
    pad1=jsfGetPadPressed(LEFT_PAD);
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 64] IF pad1 BAND JAGPAD_A THEN
    if(pad1 BAND JAGPAD_A)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 66] rapClockMode = Clock_Countup
        rapClockMode=Clock_Countup;
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 68] ELSEIF pad1 BAND JAGPAD_B THEN
      }
    else if(pad1 BAND JAGPAD_B)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 70] rapClockMode = Clock_Freeze
        rapClockMode=Clock_Freeze;
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 72] ELSEIF pad1 BAND JAGPAD_C THEN
      }
    else if(pad1 BAND JAGPAD_C)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 74] rapClockMode = Clock_Countdown
        rapClockMode=Clock_Countdown;
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 76] ELSEIF pad1 BAND JAGPAD_1 THEN
      }
    else if(pad1 BAND JAGPAD_1)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 78] rapAddClock(10)
        rapAddClock(10);
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 80] ELSEIF pad1 BAND JAGPAD_2 THEN
      }
    else if(pad1 BAND JAGPAD_2)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 82] rapSubClock(10)
        rapSubClock(10);
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 84] ENDIF
      }
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 87] VSYNC
    jsfVsync(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\clocktest\clocktest.bas - 89] LOOP
  }
  while(1) {};   //  End of main program
}

// *************************************************
//                 Runtime Functions
// *************************************************
