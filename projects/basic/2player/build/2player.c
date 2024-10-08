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
#define STRPTR(A)((char*)&(A))
// *************************************************
//            User Global Initialized Arrays
// *************************************************

// *************************************************
//            User Defined Constants
// *************************************************

#define sprParticleLayer 0
#define sprBug1 1
#define sprBug2 2

// *************************************************
//            User Global Variables
// *************************************************

static int     pad1;
static int     pad2;


// *************************************************
//                  Main Program
// *************************************************

void basicmain()
{
// [F:\Jaguar\Tools\JagStudio\projects\basic\2player\2player.bas - 11] const sprParticleLayer% = 0
// [F:\Jaguar\Tools\JagStudio\projects\basic\2player\2player.bas - 12] const sprBug1% = 1
// [F:\Jaguar\Tools\JagStudio\projects\basic\2player\2player.bas - 13] const sprBug2% = 2
// [F:\Jaguar\Tools\JagStudio\projects\basic\2player\2player.bas - 15] DIM pad1 AS INTEGER
// [F:\Jaguar\Tools\JagStudio\projects\basic\2player\2player.bas - 16] DIM pad2 AS INTEGER
// [F:\Jaguar\Tools\JagStudio\projects\basic\2player\2player.bas - 19] jsfSetFontIndx(1)
jsfSetFontIndx(1);
// [F:\Jaguar\Tools\JagStudio\projects\basic\2player\2player.bas - 20] jsfSetFontSize(1)
jsfSetFontSize(1);
// [F:\Jaguar\Tools\JagStudio\projects\basic\2player\2player.bas - 23] rapLocate 130,182
rapLocate(130,182);
// [F:\Jaguar\Tools\JagStudio\projects\basic\2player\2player.bas - 24] rapPrint "JagStudio"
js_r_textbuffer=(char *)"JagStudio";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\2player\2player.bas - 28] Do
for(;;)
  {
// [F:\Jaguar\Tools\JagStudio\projects\basic\2player\2player.bas - 30] pad1 = jsfGetPad(LEFT_PAD)
    pad1=jsfGetPad(LEFT_PAD);
// [F:\Jaguar\Tools\JagStudio\projects\basic\2player\2player.bas - 32] IF pad1 BAND JAGPAD_UP THEN
    if(pad1 BAND JAGPAD_UP)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\2player\2player.bas - 33] sprite[sprBug1].y_ -= 2
        sprite[sprBug1].y_-=2;
// [F:\Jaguar\Tools\JagStudio\projects\basic\2player\2player.bas - 34] ELSEIF pad1 BAND JAGPAD_DOWN THEN
      }
    else if(pad1 BAND JAGPAD_DOWN)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\2player\2player.bas - 35] sprite[sprBug1].y_ += 2
        sprite[sprBug1].y_+=2;
// [F:\Jaguar\Tools\JagStudio\projects\basic\2player\2player.bas - 36] ENDIF
      }
// [F:\Jaguar\Tools\JagStudio\projects\basic\2player\2player.bas - 38] IF pad1 BAND JAGPAD_LEFT THEN
    if(pad1 BAND JAGPAD_LEFT)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\2player\2player.bas - 39] sprite[sprBug1].x_ -= 2
        sprite[sprBug1].x_-=2;
// [F:\Jaguar\Tools\JagStudio\projects\basic\2player\2player.bas - 40] ELSEIF pad1 BAND JAGPAD_RIGHT THEN
      }
    else if(pad1 BAND JAGPAD_RIGHT)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\2player\2player.bas - 41] sprite[sprBug1].x_ += 2
        sprite[sprBug1].x_+=2;
// [F:\Jaguar\Tools\JagStudio\projects\basic\2player\2player.bas - 42] ENDIF
      }
// [F:\Jaguar\Tools\JagStudio\projects\basic\2player\2player.bas - 45] pad2 = jsfGetPad(RIGHT_PAD)
    pad2=jsfGetPad(RIGHT_PAD);
// [F:\Jaguar\Tools\JagStudio\projects\basic\2player\2player.bas - 47] IF pad2 BAND JAGPAD_UP THEN
    if(pad2 BAND JAGPAD_UP)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\2player\2player.bas - 48] sprite[sprBug2].y_ -= 2
        sprite[sprBug2].y_-=2;
// [F:\Jaguar\Tools\JagStudio\projects\basic\2player\2player.bas - 49] ELSEIF pad2 BAND JAGPAD_DOWN THEN
      }
    else if(pad2 BAND JAGPAD_DOWN)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\2player\2player.bas - 50] sprite[sprBug2].y_ += 2
        sprite[sprBug2].y_+=2;
// [F:\Jaguar\Tools\JagStudio\projects\basic\2player\2player.bas - 51] ENDIF
      }
// [F:\Jaguar\Tools\JagStudio\projects\basic\2player\2player.bas - 53] IF pad2 BAND JAGPAD_LEFT THEN
    if(pad2 BAND JAGPAD_LEFT)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\2player\2player.bas - 54] sprite[sprBug2].x_ -= 2
        sprite[sprBug2].x_-=2;
// [F:\Jaguar\Tools\JagStudio\projects\basic\2player\2player.bas - 55] ELSEIF pad2 BAND JAGPAD_RIGHT THEN
      }
    else if(pad2 BAND JAGPAD_RIGHT)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\2player\2player.bas - 56] sprite[sprBug2].x_ += 2
        sprite[sprBug2].x_+=2;
// [F:\Jaguar\Tools\JagStudio\projects\basic\2player\2player.bas - 57] ENDIF
      }
// [F:\Jaguar\Tools\JagStudio\projects\basic\2player\2player.bas - 61] IF pad1 BAND JAGPAD_B THEN
    if(pad1 BAND JAGPAD_B)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\2player\2player.bas - 65] zeroPlaySample(1, strptr(explode_sam), (strptr(explode_sam_end)-strptr(explode_sam)+3) and 0xfffffffc, (46168/8000), Zero_Audio_8bit_Signed)
        zeroPlaySample(1,STRPTR(explode_sam),(STRPTR(explode_sam_end)-STRPTR(explode_sam)+3) BAND 0xfffffffc,(46168/8000),Zero_Audio_8bit_Signed);
// [F:\Jaguar\Tools\JagStudio\projects\basic\2player\2player.bas - 67] ENDIF
      }
// [F:\Jaguar\Tools\JagStudio\projects\basic\2player\2player.bas - 70] VSYNC
    jsfVsync(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\2player\2player.bas - 72] LOOP
  }
  while(1) {};   //  End of main program
}

// *************************************************
//                 Runtime Functions
// *************************************************

