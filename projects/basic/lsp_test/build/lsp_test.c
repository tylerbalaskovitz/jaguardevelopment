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
//            User Global Variables
// *************************************************

static int     pad1;
static BYTE    modBankBuffer[100000];
static BYTE    modMusicBuffer[100000];


// *************************************************
//                  Main Program
// *************************************************

void basicmain()
{
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 8] jsfSetFontSize(1)
jsfSetFontSize(1);
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 11] jsfSetFontIndx(1)
jsfSetFontIndx(1);
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 12] rapLocate 80,200
rapLocate(80,200);
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 13] rapPrint "JagStudio"
js_r_textbuffer=(char *)"JagStudio";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 14] jsfSetFontIndx(0)
jsfSetFontIndx(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 15] rapPrintCont " LSP "
js_r_textbuffer=(char *)" LSP ";
rapPrintCont();
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 16] jsfSetFontIndx(1)
jsfSetFontIndx(1);
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 17] rapPrintCont "Test"
js_r_textbuffer=(char *)"Test";
rapPrintCont();
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 21] jsfSetFontIndx(0)
jsfSetFontIndx(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 22] jsfSetFontSize(0)
jsfSetFontSize(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 25] DIM pad1 AS INTEGER
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 25] pad1=0
pad1=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 29] dim modBankBuffer[100000] as byte
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 30] dim modMusicBuffer[100000] as byte
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 33] rapLocate 20,60
rapLocate(20,60);
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 34] rapPrint "B        : Play SFX"
js_r_textbuffer=(char *)"B        : Play SFX";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 35] rapLocate 20,80
rapLocate(20,80);
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 36] rapPrint "C        : Loop SFX"
js_r_textbuffer=(char *)"C        : Loop SFX";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 37] rapLocate 20,100
rapLocate(20,100);
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 38] rapPrint "2        : Restart Module"
js_r_textbuffer=(char *)"2        : Restart Module";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 39] rapLocate 20,120
rapLocate(20,120);
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 40] rapPrint "3        : Toggle Module On/Off"
js_r_textbuffer=(char *)"3        : Toggle Module On/Off";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 41] rapLocate 20,140
rapLocate(20,140);
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 42] rapPrint "4        : Stop Module"
js_r_textbuffer=(char *)"4        : Stop Module";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 43] rapLocate 20,160
rapLocate(20,160);
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 44] rapPrint "5        : Start Module"
js_r_textbuffer=(char *)"5        : Start Module";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 46] jsfSetFontIndx(1)
jsfSetFontIndx(1);
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 50] rapUnpack(Module1Bank,(int)(int *)modBankBuffer)
rapUnpack(Module1Bank,(int)(int*)modBankBuffer);
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 51] rapUnpack(Module1Music,(int)(int *)modMusicBuffer)
rapUnpack(Module1Music,(int)(int*)modMusicBuffer);
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 54] LSPPlayModule((int)strptr(modMusicBuffer),(int)strptr(modBankBuffer))
LSPPlayModule((int)STRPTR(modMusicBuffer),(int)STRPTR(modBankBuffer));
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 57] DO
for(;;)
  {
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 59] VSYNC
    jsfVsync(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 62] pad1 = jsfGetPadPressed(LEFT_PAD)
    pad1=jsfGetPadPressed(LEFT_PAD);
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 63] IF pad1 BAND JAGPAD_B THEN
    if(pad1 BAND JAGPAD_B)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 66] LSPPlaySample(strptr(explode_sam), strptr(explode_sam_end), 7389, 63, 0)
        LSPPlaySample(STRPTR(explode_sam),STRPTR(explode_sam_end),7389,63,0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 68] ELSEIF pad1 BAND JAGPAD_C THEN
      }
    else if(pad1 BAND JAGPAD_C)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 71] LSPPlaySampleLoop(strptr(explode_sam), strptr(explode_sam_end),strptr(explode_sam), strptr(explode_sam_end), 7389, 63, 1)
        LSPPlaySampleLoop(STRPTR(explode_sam),STRPTR(explode_sam_end),STRPTR(explode_sam),STRPTR(explode_sam_end),7389,63,1);
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 73] ELSEIF pad1 BAND JAGPAD_2 THEN
      }
    else if(pad1 BAND JAGPAD_2)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 76] LSPStopMusic()
        LSPStopMusic();
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 77] rapUnpack(Module1Bank,(int)(int *)modBankBuffer)
        rapUnpack(Module1Bank,(int)(int*)modBankBuffer);
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 78] rapUnpack(Module1Music,(int)(int *)modMusicBuffer)
        rapUnpack(Module1Music,(int)(int*)modMusicBuffer);
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 79] LSPPlayModule((int)strptr(modMusicBuffer),(int)strptr(modBankBuffer))
        LSPPlayModule((int)STRPTR(modMusicBuffer),(int)STRPTR(modBankBuffer));
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 80] ELSEIF pad1 BAND JAGPAD_3 THEN
      }
    else if(pad1 BAND JAGPAD_3)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 81] LSPMusicToggle()
        LSPMusicToggle();
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 82] ELSEIF pad1 BAND JAGPAD_4 THEN
      }
    else if(pad1 BAND JAGPAD_4)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 83] LSPStopMusic()
        LSPStopMusic();
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 84] ELSEIF pad1 BAND JAGPAD_5 THEN
      }
    else if(pad1 BAND JAGPAD_5)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 85] LSPStartMusic()
        LSPStartMusic();
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 86] ENDIF
      }
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 91] pad1 = jsfGetPad(LEFT_PAD)
    pad1=jsfGetPad(LEFT_PAD);
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 93] rapLocate 20,180
    rapLocate(20,180);
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 94] IF pad1 BAND JAGPAD_A THEN
    if(pad1 BAND JAGPAD_A)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 95] rapPrint "A Pressed"
        js_r_textbuffer=(char *)"A Pressed";
        rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 96] ELSEIF pad1 BAND JAGPAD_B THEN
      }
    else if(pad1 BAND JAGPAD_B)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 97] rapPrint "B Pressed"
        js_r_textbuffer=(char *)"B Pressed";
        rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 98] ELSEIF pad1 BAND JAGPAD_C THEN
      }
    else if(pad1 BAND JAGPAD_C)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 99] rapPrint "C Pressed"
        js_r_textbuffer=(char *)"C Pressed";
        rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 100] ELSEIF pad1 BAND JAGPAD_0 THEN
      }
    else if(pad1 BAND JAGPAD_0)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 101] rapPrint "0 Pressed"
        js_r_textbuffer=(char *)"0 Pressed";
        rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 102] ELSEIF pad1 BAND JAGPAD_1 THEN
      }
    else if(pad1 BAND JAGPAD_1)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 103] rapPrint "1 Pressed"
        js_r_textbuffer=(char *)"1 Pressed";
        rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 104] ELSEIF pad1 BAND JAGPAD_2 THEN
      }
    else if(pad1 BAND JAGPAD_2)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 105] rapPrint "2 Pressed"
        js_r_textbuffer=(char *)"2 Pressed";
        rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 106] ELSEIF pad1 BAND JAGPAD_3 THEN
      }
    else if(pad1 BAND JAGPAD_3)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 107] rapPrint "3 Pressed"
        js_r_textbuffer=(char *)"3 Pressed";
        rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 108] ELSEIF pad1 BAND JAGPAD_4 THEN
      }
    else if(pad1 BAND JAGPAD_4)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 109] rapPrint "4 Pressed"
        js_r_textbuffer=(char *)"4 Pressed";
        rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 110] ELSEIF pad1 BAND JAGPAD_5 THEN
      }
    else if(pad1 BAND JAGPAD_5)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 111] rapPrint "5 Pressed"
        js_r_textbuffer=(char *)"5 Pressed";
        rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 112] ELSEIF pad1 BAND JAGPAD_6 THEN
      }
    else if(pad1 BAND JAGPAD_6)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 113] rapPrint "6 Pressed"
        js_r_textbuffer=(char *)"6 Pressed";
        rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 114] ELSEIF pad1 BAND JAGPAD_7 THEN
      }
    else if(pad1 BAND JAGPAD_7)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 115] rapPrint "7 Pressed"
        js_r_textbuffer=(char *)"7 Pressed";
        rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 116] ELSEIF pad1 BAND JAGPAD_8 THEN
      }
    else if(pad1 BAND JAGPAD_8)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 117] rapPrint "8 Pressed"
        js_r_textbuffer=(char *)"8 Pressed";
        rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 118] ELSEIF pad1 BAND JAGPAD_9 THEN
      }
    else if(pad1 BAND JAGPAD_9)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 119] rapPrint "9 Pressed"
        js_r_textbuffer=(char *)"9 Pressed";
        rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 120] ELSEIF pad1 BAND JAGPAD_STAR THEN
      }
    else if(pad1 BAND JAGPAD_STAR)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 121] rapPrint "* Pressed"
        js_r_textbuffer=(char *)"* Pressed";
        rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 122] ELSEIF pad1 BAND JAGPAD_HASH THEN
      }
    else if(pad1 BAND JAGPAD_HASH)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 123] rapPrint "# Pressed"
        js_r_textbuffer=(char *)"# Pressed";
        rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 124] ELSEIF pad1 BAND JAGPAD_OPTION THEN
      }
    else if(pad1 BAND JAGPAD_OPTION)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 125] rapPrint "Option Pressed"
        js_r_textbuffer=(char *)"Option Pressed";
        rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 126] ELSEIF pad1 BAND JAGPAD_PAUSE THEN
      }
    else if(pad1 BAND JAGPAD_PAUSE)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 127] rapPrint "Pause Pressed"
        js_r_textbuffer=(char *)"Pause Pressed";
        rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 128] ELSEIF pad1 BAND JAGPAD_UP THEN
      }
    else if(pad1 BAND JAGPAD_UP)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 129] rapPrint "Up Pressed"
        js_r_textbuffer=(char *)"Up Pressed";
        rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 130] ELSEIF pad1 BAND JAGPAD_DOWN THEN
      }
    else if(pad1 BAND JAGPAD_DOWN)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 131] rapPrint "Down Pressed"
        js_r_textbuffer=(char *)"Down Pressed";
        rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 132] ELSEIF pad1 BAND JAGPAD_LEFT THEN
      }
    else if(pad1 BAND JAGPAD_LEFT)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 133] rapPrint "Left Pressed"
        js_r_textbuffer=(char *)"Left Pressed";
        rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 134] ELSEIF pad1 BAND JAGPAD_RIGHT THEN
      }
    else if(pad1 BAND JAGPAD_RIGHT)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 135] rapPrint "Right Pressed"
        js_r_textbuffer=(char *)"Right Pressed";
        rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 136] ELSE
      }
    else
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 137] rapPrint "              "
        js_r_textbuffer=(char *)"              ";
        rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 138] ENDIF
      }
// [F:\Jaguar\Tools\JagStudio\projects\basic\lsp_test\lsp_test.bas - 140] LOOP
  }
  while(1) {};   //  End of main program
}

// *************************************************
//                 Runtime Functions
// *************************************************

