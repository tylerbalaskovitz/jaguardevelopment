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
//               Standard Prototypes
// *************************************************
char*   BCX_TmpStr(size_t);

// *************************************************
//            User Defined Constants
// *************************************************

#define sprBackground 0
#define sprParticleLayer 1

// *************************************************
//                System Variables
// *************************************************


// *************************************************
//            User Global Variables
// *************************************************

static int     pad1;
static short   cardInserted;
static int     success;
static char    fullpath[2048];
static char    ledState;
static int     counter;
static char    serialString[2048];
static char    gfxBuffer[352*240*2];

char*   join (int, ... );


// *************************************************
//            User Global Initialized Arrays
// *************************************************


// *************************************************
//                  Main Program
// *************************************************

void basicmain()
{
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 11] const sprBackground% = 0
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 12] const sprParticleLayer% = 1
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 15] DIM pad1 AS INTEGER
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 15] pad1 = 0
pad1=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 16] DIM cardInserted AS SHORT
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 17] DIM gfxBuffer[352*240*2] AS CHAR
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 18] DIM success AS INTEGER
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 19] DIM fullpath$
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 20] DIM ledState AS CHAR
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 20] ledState = 0
ledState=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 21] DIM counter AS INTEGER
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 21] counter = 0
counter=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 22] DIM serialString$
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 25] jsfSetFontIndx(1)
jsfSetFontIndx(1);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 26] jsfSetFontSize(1)
jsfSetFontSize(1);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 27] rapLocate 120,182
rapLocate(120,182);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 28] rapPrint "Jaguar GD"
js_r_textbuffer=(char *)"Jaguar GD";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 32] jsfSetFontSize(0)
jsfSetFontSize(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 33] jsfSetFontIndx(0)
jsfSetFontIndx(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 34] rapLocate 20,20
rapLocate(20,20);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 35] if rapGDDetect = 1 THEN
if(rapGDDetect==1)
  {
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 36] rapPrint "GD Cart Detected"
    js_r_textbuffer=(char *)"GD Cart Detected";
    rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 37] else
  }
else
  {
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 38] rapPrint "GD Cart NOT Detected"
    js_r_textbuffer=(char *)"GD Cart NOT Detected";
    rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 39] endif
  }
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 43] rapGDGetCartSerial()
rapGDGetCartSerial();
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 47] rapLocate 20,30
rapLocate(20,30);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 48] jsfSetFontIndx(0)
jsfSetFontIndx(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 49] print "GD $:"
js_r_textbuffer=ee_printf("%s","GD $:");
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 50] rapLocate 60,30
rapLocate(60,30);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 51] jsfSetFontIndx(1)
jsfSetFontIndx(1);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 52] print rapGDASERIAL$
js_r_textbuffer=ee_printf("%s",rapGDASERIAL);
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 56] jsfSetFontIndx(0)
jsfSetFontIndx(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 57] rapLocate 20,40
rapLocate(20,40);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 58] jsfSetFontIndx(0)
jsfSetFontIndx(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 59] rapPrint "GD #:"
js_r_textbuffer=(char *)"GD #:";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 60] rapLocate 60,40
rapLocate(60,40);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 61] jsfSetFontIndx(1)
jsfSetFontIndx(1);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 62] rapHexToStr(16,strptr(rapGDSERIAL),serialString$)
rapHexToStr(16,STRPTR(rapGDSERIAL),serialString);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 63] print serialString$
js_r_textbuffer=ee_printf("%s",serialString);
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 69] jsfSetFontIndx(0)
jsfSetFontIndx(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 70] rapLocate 20,50
rapLocate(20,50);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 71] rapPrint "SD Card Inserted: "
js_r_textbuffer=(char *)"SD Card Inserted: ";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 72] rapLocate 170,50
rapLocate(170,50);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 73] jsfSetFontIndx(1)
jsfSetFontIndx(1);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 74] cardInserted = rapGDCardInserted()
cardInserted=rapGDCardInserted();
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 75] if cardInserted = 1 THEN
if(cardInserted==1)
  {
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 76] rapPrint "YES"
    js_r_textbuffer=(char *)"YES";
    rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 77] elseif cardInserted = 0 THEN
  }
else if(cardInserted==0)
  {
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 78] rapPrint "NO"
    js_r_textbuffer=(char *)"NO";
    rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 79] else
  }
else
  {
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 80] rapPrint "ERR"
    js_r_textbuffer=(char *)"ERR";
    rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 81] endif
  }
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 85] rapLocate 20,60
rapLocate(20,60);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 86] jsfSetFontIndx(0)
jsfSetFontIndx(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 87] print "SD #:"
js_r_textbuffer=ee_printf("%s","SD #:");
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 88] jsfSetFontIndx(1)
jsfSetFontIndx(1);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 89] rapLocate 60,60
rapLocate(60,60);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 90] if cardInserted = 1 THEN
if(cardInserted==1)
  {
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 91] rapGDGetCardSerial()
    rapGDGetCardSerial();
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 92] rapHexToStr(16,strptr(rapGDSDSERIAL),serialString$)
    rapHexToStr(16,STRPTR(rapGDSDSERIAL),serialString);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 93] print serialString$
    js_r_textbuffer=ee_printf("%s",serialString);
    rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 94] Else
  }
else
  {
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 95] print "N/A"
    js_r_textbuffer=ee_printf("%s","N/A");
    rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 96] endif
  }
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 100] rapLocate 20,110
rapLocate(20,110);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 101] jsfSetFontIndx(0)
jsfSetFontIndx(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 102] rapPrint "A to Toggle LED"
js_r_textbuffer=(char *)"A to Toggle LED";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 104] rapLocate 20,120
rapLocate(20,120);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 105] jsfSetFontIndx(0)
jsfSetFontIndx(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 106] rapPrint "C to Reset GD"
js_r_textbuffer=(char *)"C to Reset GD";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 108] rapLocate 20,130
rapLocate(20,130);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 109] jsfSetFontIndx(0)
jsfSetFontIndx(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 110] rapPrint "1 to Send Debug message to COM Port"
js_r_textbuffer=(char *)"1 to Send Debug message to COM Port";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 112] rapLocate 20,140
rapLocate(20,140);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 113] jsfSetFontIndx(0)
jsfSetFontIndx(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 114] rapPrint "4 to Load a File"
js_r_textbuffer=(char *)"4 to Load a File";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 116] rapLocate 20,150
rapLocate(20,150);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 117] jsfSetFontIndx(0)
jsfSetFontIndx(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 118] rapPrint "5 to Save a File"
js_r_textbuffer=(char *)"5 to Save a File";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 120] jsfSetFontIndx(0)
jsfSetFontIndx(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 121] rapLocate 20,70
rapLocate(20,70);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 122] print "Load Success: N/A"
js_r_textbuffer=ee_printf("%s","Load Success: N/A");
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 123] rapLocate 20,80
rapLocate(20,80);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 124] print "Save Success: N/A"
js_r_textbuffer=ee_printf("%s","Save Success: N/A");
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 130] Do
for(;;)
  {
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 133] counter++
    counter++;
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 135] VSYNC
    jsfVsync(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 137] pad1 = jsfGetPadPressed(LEFT_PAD)
    pad1=jsfGetPadPressed(LEFT_PAD);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 138] IF pad1 BAND JAGPAD_A THEN
    if(pad1 BAND JAGPAD_A)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 140] ledState = (ledState+1) & 1
        ledState=(ledState+1)&1;
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 142] if ledState = 1 then
        if(ledState==1)
          {
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 143] rapGDSetLEDOn()
            rapGDSetLEDOn();
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 144] else
          }
        else
          {
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 145] rapGDSetLEDOff()
            rapGDSetLEDOff();
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 146] endif
          }
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 148] ELSEIF pad1 BAND JAGPAD_C THEN
      }
    else if(pad1 BAND JAGPAD_C)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 150] rapGDReset(GD_RESET_MENU)
        rapGDReset(GD_RESET_MENU);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 152] ELSEIF pad1 BAND JAGPAD_1 THEN
      }
    else if(pad1 BAND JAGPAD_1)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 154] rapGDDebugPrint "JagStudio GD Debug Print. Count: ";counter
        js_r_textbuffer=ee_printf("%s% d\r","JagStudio GD Debug Print. Count: ",(int)counter);
        rapGDDebugPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 156] ELSEIF pad1 BAND JAGPAD_4 THEN
      }
    else if(pad1 BAND JAGPAD_4)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 158] fullpath$ = "\!LOGO.JAG"
        strcpy(fullpath,"\\!LOGO.JAG");
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 159] success = rapGDLoadFile(strptr(fullpath$),strptr(gfxBuffer))
        success=rapGDLoadFile(STRPTR(fullpath),STRPTR(gfxBuffer));
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 160] sprite[sprBackground].gfxbase = (int)gfxBuffer
        sprite[sprBackground].gfxbase=(int)gfxBuffer;
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 161] sprite[sprBackground].y_ = 0
        sprite[sprBackground].y_=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 162] rapLocate 20,70
        rapLocate(20,70);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 163] jsfSetFontIndx(0)
        jsfSetFontIndx(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 164] print "Load Success:";success;"  "
        js_r_textbuffer=ee_printf("%s% d%s","Load Success:",(int)success,"  ");
        rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 166] ELSEIF pad1 BAND JAGPAD_5 THEN
      }
    else if(pad1 BAND JAGPAD_5)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 168] fullpath$ = "\!LOGO.SAV"
        strcpy(fullpath,"\\!LOGO.SAV");
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 169] success = rapGDSaveFile(strptr(fullpath$),strptr(gfxBuffer),352*240*2)
        success=rapGDSaveFile(STRPTR(fullpath),STRPTR(gfxBuffer),352*240*2);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 171] rapLocate 20,80
        rapLocate(20,80);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 172] jsfSetFontIndx(0)
        jsfSetFontIndx(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 173] print "Save Success:";success;"  "
        js_r_textbuffer=ee_printf("%s% d%s","Save Success:",(int)success,"  ");
        rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 175] ELSEIF pad1 BAND JAGPAD_0 THEN
      }
    else if(pad1 BAND JAGPAD_0)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 177] jsfClearBuffer(352*240*2, strptr(gfxBuffer))
        jsfClearBuffer(352*240*2,STRPTR(gfxBuffer));
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 179] rapLocate 20,90
        rapLocate(20,90);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 180] jsfSetFontIndx(0)
        jsfSetFontIndx(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 181] print "CLEARED"
        js_r_textbuffer=ee_printf("%s","CLEARED");
        rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 183] endif
      }
// [F:\Jaguar\Tools\JagStudio\projects\basic\jaguargd\jaguargd.bas - 188] LOOP
  }
  while(1) {};   //  End of main program
}

// *************************************************
//                 Runtime Functions
// *************************************************

char BCX_TmpStr_buffer[256];
char *BCX_TmpStr (size_t Bites)
{
  BCX_TmpStr_buffer[Bites]=0;
  return &BCX_TmpStr_buffer[0]; //that's all you're gonna get ;)
//  static int   StrCnt;
//  static char *StrFunc[2048];
//  StrCnt=(StrCnt + 1) & 2047;
//  if(StrFunc[StrCnt]) free (StrFunc[StrCnt]);
//  return StrFunc[StrCnt]=(char*)calloc(Bites+128,sizeof(char));
}


char * join(int n, ...)
{
  register int i = n, tmplen = 0;
  register char *s_;
  register char *strtmp;
  va_list marker;
  va_start(marker, n); // Initialize variable arguments
  while(i-- > 0)
  {
    s_ = va_arg(marker, char *);
    if(s_) tmplen += strlen(s_);
  }
  strtmp = BCX_TmpStr(tmplen);
  va_end(marker); // Reset variable arguments
  i = n;
  va_start(marker, n); // Initialize variable arguments
  while(i-- > 0)
  {
    s_ = va_arg(marker, char *);
    if(s_) strcat(strtmp, s_);
  }
  va_end(marker); // Reset variable arguments
  return strtmp;
}

