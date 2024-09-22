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
//               User Prototypes
// *************************************************
void    printPadState (int, int, int);

// *************************************************
//            User Defined Constants
// *************************************************

#define sprParticleLayer 0

// *************************************************
//            User Global Variables
// *************************************************

static int     ttLeftExists;
static int     ttRightExists;
static int     pad1;
static int     ttPadLeft1;
static int     ttPadLeft2;
static int     ttPadLeft3;
static int     ttPadLeft4;
static int     ttPadRight1;
static int     ttPadRight2;
static int     ttPadRight3;
static int     ttPadRight4;


// *************************************************
//            User Global Initialized Arrays
// *************************************************


// *************************************************
//                  Main Program
// *************************************************

void basicmain()
{
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 14] const sprParticleLayer% = 0
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 17] jsfSetFontIndx(1)
jsfSetFontIndx(1);
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 18] jsfSetFontSize(0)
jsfSetFontSize(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 21] rapLocate 16,16
rapLocate(16,16);
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 22] rapPrint "TeamTap Test"
js_r_textbuffer=(char *)"TeamTap Test";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 24] DIM ttLeftExists AS INTEGER
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 25] DIM ttRightExists AS INTEGER
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 27] DIM pad1 AS INTEGER
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 27] pad1=0
pad1=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 28] DIM ttPadLeft1 AS INTEGER
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 28] ttPadLeft1 = 0
ttPadLeft1=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 29] DIM ttPadLeft2 AS INTEGER
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 29] ttPadLeft2 = 0
ttPadLeft2=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 30] DIM ttPadLeft3 AS INTEGER
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 30] ttPadLeft3 = 0
ttPadLeft3=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 31] DIM ttPadLeft4 AS INTEGER
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 31] ttPadLeft4 = 0
ttPadLeft4=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 32] DIM ttPadRight1 AS INTEGER
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 32] ttPadRight1 = 0
ttPadRight1=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 33] DIM ttPadRight2 AS INTEGER
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 33] ttPadRight2 = 0
ttPadRight2=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 34] DIM ttPadRight3 AS INTEGER
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 34] ttPadRight3 = 0
ttPadRight3=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 35] DIM ttPadRight4 AS INTEGER
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 35] ttPadRight4 = 0
ttPadRight4=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 39] ttLeftExists = rapCheckTTExists(TT_LEFT)
ttLeftExists=rapCheckTTExists(TT_LEFT);
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 40] ttRightExists = rapCheckTTExists(TT_RIGHT)
ttRightExists=rapCheckTTExists(TT_RIGHT);
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 42] jsfSetFontIndx(0)
jsfSetFontIndx(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 43] rapLocate 16,40
rapLocate(16,40);
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 44] rapPrint "TeamTap Left:"
js_r_textbuffer=(char *)"TeamTap Left:";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 45] rapLocate 128,40
rapLocate(128,40);
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 46] rapPrint "NONE"
js_r_textbuffer=(char *)"NONE";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 49] rapLocate 16,50
rapLocate(16,50);
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 50] rapPrint "TeamTap Right:"
js_r_textbuffer=(char *)"TeamTap Right:";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 51] rapLocate 136,50
rapLocate(136,50);
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 52] rapPrint "NONE"
js_r_textbuffer=(char *)"NONE";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 57] Do
for(;;)
  {
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 60] IF ttLeftExists = 1 THEN
    if(ttLeftExists==1)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 62] rapLocate 128,40
        rapLocate(128,40);
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 63] rapPrint "YES!"
        js_r_textbuffer=(char *)"YES!";
        rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 65] rapGetTTState(TT_LEFT)
        rapGetTTState(TT_LEFT);
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 67] ttPadLeft1 = rapGetTTPad(TT_LEFT, TT_PAD_1)
        ttPadLeft1=rapGetTTPad(TT_LEFT,TT_PAD_1);
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 68] ttPadLeft2 = rapGetTTPad(TT_LEFT, TT_PAD_2)
        ttPadLeft2=rapGetTTPad(TT_LEFT,TT_PAD_2);
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 69] ttPadLeft3 = rapGetTTPad(TT_LEFT, TT_PAD_3)
        ttPadLeft3=rapGetTTPad(TT_LEFT,TT_PAD_3);
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 70] ttPadLeft4 = rapGetTTPad(TT_LEFT, TT_PAD_4)
        ttPadLeft4=rapGetTTPad(TT_LEFT,TT_PAD_4);
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 72] ENDIF
      }
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 76] IF ttRightExists = 1 THEN
    if(ttRightExists==1)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 78] rapLocate 136,50
        rapLocate(136,50);
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 79] rapPrint "YES!"
        js_r_textbuffer=(char *)"YES!";
        rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 81] rapGetTTState(TT_RIGHT)
        rapGetTTState(TT_RIGHT);
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 83] ttPadRight1 = rapGetTTPad(TT_RIGHT, TT_PAD_1)
        ttPadRight1=rapGetTTPad(TT_RIGHT,TT_PAD_1);
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 84] ttPadRight2 = rapGetTTPad(TT_RIGHT, TT_PAD_2)
        ttPadRight2=rapGetTTPad(TT_RIGHT,TT_PAD_2);
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 85] ttPadRight3 = rapGetTTPad(TT_RIGHT, TT_PAD_3)
        ttPadRight3=rapGetTTPad(TT_RIGHT,TT_PAD_3);
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 86] ttPadRight4 = rapGetTTPad(TT_RIGHT, TT_PAD_4)
        ttPadRight4=rapGetTTPad(TT_RIGHT,TT_PAD_4);
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 88] ENDIF
      }
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 91] rapLocate 20,150
    rapLocate(20,150);
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 92] rapPrint "LEFT TT Pad 1"
    js_r_textbuffer=(char *)"LEFT TT Pad 1";
    rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 93] printPadState(ttPadLeft1, 20, 160)
    printPadState(ttPadLeft1,20,160);
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 96] rapLocate 180,150
    rapLocate(180,150);
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 97] rapPrint "RIGHT TT Pad 4"
    js_r_textbuffer=(char *)"RIGHT TT Pad 4";
    rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 98] printPadState(ttPadRight4, 180, 160)
    printPadState(ttPadRight4,180,160);
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 102] IF ttLeftExists = 0 THEN
    if(ttLeftExists==0)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 103] rapLocate 20,100
        rapLocate(20,100);
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 104] rapPrint "LEFT Jag Pad (no TT)"
        js_r_textbuffer=(char *)"LEFT Jag Pad (no TT)";
        rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 105] pad1 = jsfGetPad(LEFT_PAD)
        pad1=jsfGetPad(LEFT_PAD);
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 106] printPadState(pad1, 20, 110)
        printPadState(pad1,20,110);
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 107] ENDIF
      }
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 110] VSYNC
    jsfVsync(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 112] LOOP
  }
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 116] SUB printPadState(padstate AS INTEGER, printx AS INTEGER, printy AS INTEGER)
  while(1) {};   //  End of main program
}

// *************************************************
//                 Runtime Functions
// *************************************************


// ************************************
//       User Subs and Functions
// ************************************


void printPadState (int padstate, int printx, int printy)
{
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 118] rapLocate printx,printy
  rapLocate(printx,printy);
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 119] jsfPrintInt padstate
  js_r_textbuffer=ee_printf("%d",padstate);
  rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 121] rapLocate printx,printy+20
  rapLocate(printx,printy+20);
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 128] IF padstate BAND PAD_A THEN
  if(padstate BAND PAD_A)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 129] rapPrint "A Pressed"
      js_r_textbuffer=(char *)"A Pressed";
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 130] ELSEIF padstate BAND PAD_B THEN
    }
  else if(padstate BAND PAD_B)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 131] rapPrint "B Pressed"
      js_r_textbuffer=(char *)"B Pressed";
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 132] ELSEIF padstate BAND PAD_C THEN
    }
  else if(padstate BAND PAD_C)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 133] rapPrint "C Pressed"
      js_r_textbuffer=(char *)"C Pressed";
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 134] ELSEIF padstate BAND PAD_0 THEN
    }
  else if(padstate BAND PAD_0)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 135] rapPrint "0 Pressed"
      js_r_textbuffer=(char *)"0 Pressed";
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 136] ELSEIF padstate BAND PAD_1 THEN
    }
  else if(padstate BAND PAD_1)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 137] rapPrint "1 Pressed"
      js_r_textbuffer=(char *)"1 Pressed";
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 138] ELSEIF padstate BAND PAD_2 THEN
    }
  else if(padstate BAND PAD_2)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 139] rapPrint "2 Pressed"
      js_r_textbuffer=(char *)"2 Pressed";
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 140] ELSEIF padstate BAND PAD_3 THEN
    }
  else if(padstate BAND PAD_3)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 141] rapPrint "3 Pressed"
      js_r_textbuffer=(char *)"3 Pressed";
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 142] ELSEIF padstate BAND PAD_4 THEN
    }
  else if(padstate BAND PAD_4)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 143] rapPrint "4 Pressed"
      js_r_textbuffer=(char *)"4 Pressed";
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 144] ELSEIF padstate BAND PAD_5 THEN
    }
  else if(padstate BAND PAD_5)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 145] rapPrint "5 Pressed"
      js_r_textbuffer=(char *)"5 Pressed";
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 146] ELSEIF padstate BAND PAD_6 THEN
    }
  else if(padstate BAND PAD_6)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 147] rapPrint "6 Pressed"
      js_r_textbuffer=(char *)"6 Pressed";
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 148] ELSEIF padstate BAND PAD_7 THEN
    }
  else if(padstate BAND PAD_7)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 149] rapPrint "7 Pressed"
      js_r_textbuffer=(char *)"7 Pressed";
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 150] ELSEIF padstate BAND PAD_8 THEN
    }
  else if(padstate BAND PAD_8)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 151] rapPrint "8 Pressed"
      js_r_textbuffer=(char *)"8 Pressed";
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 152] ELSEIF padstate BAND PAD_9 THEN
    }
  else if(padstate BAND PAD_9)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 153] rapPrint "9 Pressed"
      js_r_textbuffer=(char *)"9 Pressed";
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 154] ELSEIF padstate BAND PAD_STAR THEN
    }
  else if(padstate BAND PAD_STAR)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 155] rapPrint "* Pressed"
      js_r_textbuffer=(char *)"* Pressed";
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 156] ELSEIF padstate BAND PAD_HASH THEN
    }
  else if(padstate BAND PAD_HASH)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 157] rapPrint "# Pressed"
      js_r_textbuffer=(char *)"# Pressed";
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 158] ELSEIF padstate BAND PAD_OPTION THEN
    }
  else if(padstate BAND PAD_OPTION)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 159] rapPrint "Option Pressed"
      js_r_textbuffer=(char *)"Option Pressed";
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 160] ELSEIF padstate BAND PAD_PAUSE THEN
    }
  else if(padstate BAND PAD_PAUSE)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 161] rapPrint "Pause Pressed"
      js_r_textbuffer=(char *)"Pause Pressed";
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 162] ELSEIF padstate BAND PAD_UP THEN
    }
  else if(padstate BAND PAD_UP)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 163] rapPrint "Up Pressed"
      js_r_textbuffer=(char *)"Up Pressed";
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 164] ELSEIF padstate BAND PAD_DOWN THEN
    }
  else if(padstate BAND PAD_DOWN)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 165] rapPrint "Down Pressed"
      js_r_textbuffer=(char *)"Down Pressed";
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 166] ELSEIF padstate BAND PAD_LEFT THEN
    }
  else if(padstate BAND PAD_LEFT)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 167] rapPrint "Left Pressed"
      js_r_textbuffer=(char *)"Left Pressed";
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 168] ELSEIF padstate BAND PAD_RIGHT THEN
    }
  else if(padstate BAND PAD_RIGHT)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 169] rapPrint "Right Pressed"
      js_r_textbuffer=(char *)"Right Pressed";
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 170] ELSE
    }
  else
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 171] rapPrint "              "
      js_r_textbuffer=(char *)"              ";
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 172] ENDIF
    }
// [F:\Jaguar\Tools\JagStudio\projects\basic\teamtap\teamtap.bas - 175] END SUB
}

