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
#define sprBug1 1
#define sprBug2 2
#define sprBug3 3

// *************************************************
//            User Global Variables
// *************************************************

static int     pad1;
static int     xshift;
static int     yshift;

// *************************************************
//                  Main Program
// *************************************************

void basicmain()
{
// [F:\Jaguar\Tools\JagStudio\projects\basic\spriteshift\spriteshift.bas - 11] const sprParticleLayer% = 0
// [F:\Jaguar\Tools\JagStudio\projects\basic\spriteshift\spriteshift.bas - 12] const sprBug1% = 1
// [F:\Jaguar\Tools\JagStudio\projects\basic\spriteshift\spriteshift.bas - 13] const sprBug2% = 2
// [F:\Jaguar\Tools\JagStudio\projects\basic\spriteshift\spriteshift.bas - 14] const sprBug3% = 3
// [F:\Jaguar\Tools\JagStudio\projects\basic\spriteshift\spriteshift.bas - 16] DIM pad1 AS INTEGER
// [F:\Jaguar\Tools\JagStudio\projects\basic\spriteshift\spriteshift.bas - 19] jsfSetFontIndx(1)
jsfSetFontIndx(1);
// [F:\Jaguar\Tools\JagStudio\projects\basic\spriteshift\spriteshift.bas - 20] jsfSetFontSize(1)
jsfSetFontSize(1);
// [F:\Jaguar\Tools\JagStudio\projects\basic\spriteshift\spriteshift.bas - 21] rapLocate 80,182
rapLocate(80,182);
// [F:\Jaguar\Tools\JagStudio\projects\basic\spriteshift\spriteshift.bas - 22] rapPrint "JagStudio - SpriteShift"
js_r_textbuffer=(char *)"JagStudio - SpriteShift";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\spriteshift\spriteshift.bas - 24] jsfSetFontIndx(0)
jsfSetFontIndx(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\spriteshift\spriteshift.bas - 25] jsfSetFontSize(0)
jsfSetFontSize(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\spriteshift\spriteshift.bas - 26] rapLocate 30,200
rapLocate(30,200);
// [F:\Jaguar\Tools\JagStudio\projects\basic\spriteshift\spriteshift.bas - 27] rapPrint "Move Left to see offscreen sprite"
js_r_textbuffer=(char *)"Move Left to see offscreen sprite";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\spriteshift\spriteshift.bas - 29] DIM xshift AS INTEGER
// [F:\Jaguar\Tools\JagStudio\projects\basic\spriteshift\spriteshift.bas - 30] DIM yshift AS INTEGER
// [F:\Jaguar\Tools\JagStudio\projects\basic\spriteshift\spriteshift.bas - 34] Do
for(;;)
  {
// [F:\Jaguar\Tools\JagStudio\projects\basic\spriteshift\spriteshift.bas - 36] xshift = 0
    xshift=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\spriteshift\spriteshift.bas - 37] yshift = 0
    yshift=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\spriteshift\spriteshift.bas - 39] pad1 = jsfGetPad(LEFT_PAD)
    pad1=jsfGetPad(LEFT_PAD);
// [F:\Jaguar\Tools\JagStudio\projects\basic\spriteshift\spriteshift.bas - 41] IF pad1 BAND JAGPAD_UP THEN
    if(pad1 BAND JAGPAD_UP)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\spriteshift\spriteshift.bas - 42] yshift = -2<<16
        yshift=-2<<16;
// [F:\Jaguar\Tools\JagStudio\projects\basic\spriteshift\spriteshift.bas - 43] ELSEIF pad1 BAND JAGPAD_DOWN THEN
      }
    else if(pad1 BAND JAGPAD_DOWN)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\spriteshift\spriteshift.bas - 44] yshift = 2<<16
        yshift=2<<16;
// [F:\Jaguar\Tools\JagStudio\projects\basic\spriteshift\spriteshift.bas - 45] ENDIF
      }
// [F:\Jaguar\Tools\JagStudio\projects\basic\spriteshift\spriteshift.bas - 47] IF pad1 BAND JAGPAD_LEFT THEN
    if(pad1 BAND JAGPAD_LEFT)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\spriteshift\spriteshift.bas - 48] xshift = -2<<16
        xshift=-2<<16;
// [F:\Jaguar\Tools\JagStudio\projects\basic\spriteshift\spriteshift.bas - 49] ELSEIF pad1 BAND JAGPAD_RIGHT THEN
      }
    else if(pad1 BAND JAGPAD_RIGHT)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\spriteshift\spriteshift.bas - 50] xshift = 2<<16
        xshift=2<<16;
// [F:\Jaguar\Tools\JagStudio\projects\basic\spriteshift\spriteshift.bas - 51] ENDIF
      }
// [F:\Jaguar\Tools\JagStudio\projects\basic\spriteshift\spriteshift.bas - 53] IF xshift <> 0 OR yshift <> 0 THEN
    if(xshift!=0||yshift!=0)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\spriteshift\spriteshift.bas - 54] rapSpriteShift(xshift, yshift, sprBug1, 3)
        rapSpriteShift(xshift,yshift,sprBug1,3);
// [F:\Jaguar\Tools\JagStudio\projects\basic\spriteshift\spriteshift.bas - 55] ENDIF
      }
// [F:\Jaguar\Tools\JagStudio\projects\basic\spriteshift\spriteshift.bas - 58] VSYNC
    jsfVsync(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\spriteshift\spriteshift.bas - 60] LOOP
  }
  while(1) {};   //  End of main program
}

// *************************************************
//                 Runtime Functions
// *************************************************
