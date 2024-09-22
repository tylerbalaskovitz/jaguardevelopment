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
//                System Variables
// *************************************************


// *************************************************
//            User Global Variables
// *************************************************

static int     pad1;
static char    musicPlaying;

char*   join (int, ... );


// *************************************************
//            User Global Initialized Arrays
// *************************************************


// *************************************************
//                  Main Program
// *************************************************

void basicmain()
{
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 8] jsfSetFontIndx(1)
jsfSetFontIndx(1);
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 9] jsfSetFontSize(1)
jsfSetFontSize(1);
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 10] rapLocate 0,182
rapLocate(0,182);
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 11] rapPrint "          JagStudio - Zero Test         "
js_r_textbuffer=(char *)"          JagStudio - Zero Test         ";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 13] jsfSetFontIndx(0)
jsfSetFontIndx(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 14] jsfSetFontSize(0)
jsfSetFontSize(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 16] DIM pad1 AS INTEGER
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 16] pad1=0
pad1=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 18] rapLocate 20,10
rapLocate(20,10);
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 19] rapPrint "1   : Play SFX on channel 1"
js_r_textbuffer=(char *)"1   : Play SFX on channel 1";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 21] rapLocate 20,40
rapLocate(20,40);
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 22] rapPrint "2   : Play Looping SFX on channel 2"
js_r_textbuffer=(char *)"2   : Play Looping SFX on channel 2";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 24] rapLocate 20,70
rapLocate(20,70);
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 25] rapPrint "3   : Start / Stop MuLaw Music"
js_r_textbuffer=(char *)"3   : Start / Stop MuLaw Music";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 27] rapLocate 20,100
rapLocate(20,100);
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 28] rapPrint "4   : Start / Stop MuLaw Music"
js_r_textbuffer=(char *)"4   : Start / Stop MuLaw Music";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 30] rapLocate 20,130
rapLocate(20,130);
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 31] rapPrint "0   : Stop all sound"
js_r_textbuffer=(char *)"0   : Stop all sound";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 34] DIM musicPlaying AS CHAR
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 35] musicPlaying = 0
musicPlaying=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 37] DO
for(;;)
  {
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 39] pad1 = jsfGetPadPressed(1)
    pad1=jsfGetPadPressed(1);
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 41] IF pad1 BAND JAGPAD_1 THEN
    if(pad1 BAND JAGPAD_1)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 43] zeroClearChannel(2)
        zeroClearChannel(2);
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 44] zeroPlay(1, strptr(explode_sam), strptr(explode_sam_end), (46168/8000), Zero_Audio_8bit_Signed)
        zeroPlay(1,STRPTR(explode_sam),STRPTR(explode_sam_end),(46168/8000),Zero_Audio_8bit_Signed);
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 47] ENDIF
      }
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 49] IF pad1 BAND JAGPAD_2 THEN
    if(pad1 BAND JAGPAD_2)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 51] zeroClearChannel(1)
        zeroClearChannel(1);
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 52] zeroPlay(2, strptr(explode_sam), strptr(explode_sam_end), (46168/16000), Zero_Audio_Looping|Zero_Audio_8bit_Signed)
        zeroPlay(2,STRPTR(explode_sam),STRPTR(explode_sam_end),(46168/16000),Zero_Audio_Looping|Zero_Audio_8bit_Signed);
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 54] ENDIF
      }
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 56] IF pad1 BAND JAGPAD_3 THEN
    if(pad1 BAND JAGPAD_3)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 58] zeroClearChannel(4)
        zeroClearChannel(4);
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 60] musicPlaying = (musicPlaying + 1) & 1
        musicPlaying=(musicPlaying+1)&1;
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 62] IF musicPlaying = 0 THEN
        if(musicPlaying==0)
          {
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 63] zeroClearChannel(3)
            zeroClearChannel(3);
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 64] ELSE
          }
        else
          {
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 65] zeroPlaySample(3, (void *)(gamemusic0), ((gamemusic0_end)-(gamemusic0)+3) and 0xfffffffc, (46168/22050), Zero_Audio_Looping|Zero_Audio_8bit_muLaw)
            zeroPlaySample(3,(void*)(gamemusic0),((gamemusic0_end)-(gamemusic0)+3) BAND 0xfffffffc,(46168/22050),Zero_Audio_Looping|Zero_Audio_8bit_muLaw);
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 68] ENDIF
          }
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 70] ENDIF
      }
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 72] IF pad1 BAND JAGPAD_4 THEN
    if(pad1 BAND JAGPAD_4)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 74] zeroClearChannel(3)
        zeroClearChannel(3);
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 76] musicPlaying = (musicPlaying + 1) & 1
        musicPlaying=(musicPlaying+1)&1;
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 78] IF musicPlaying = 0 THEN
        if(musicPlaying==0)
          {
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 79] zeroClearChannel(4)
            zeroClearChannel(4);
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 80] ELSE
          }
        else
          {
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 81] zeroPlay(4, (void *)(gamemusic0), (void *)(gamemusic0_end), (46168/23084), Zero_Audio_Looping|Zero_Audio_8bit_muLaw)
            zeroPlay(4,(void*)(gamemusic0),(void*)(gamemusic0_end),(46168/23084),Zero_Audio_Looping|Zero_Audio_8bit_muLaw);
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 82] ENDIF
          }
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 84] ENDIF
      }
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 86] IF pad1 BAND JAGPAD_0 THEN
    if(pad1 BAND JAGPAD_0)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 87] zeroClearChannel(1)
        zeroClearChannel(1);
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 88] zeroClearChannel(2)
        zeroClearChannel(2);
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 89] zeroClearChannel(3)
        zeroClearChannel(3);
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 90] zeroClearChannel(4)
        zeroClearChannel(4);
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 91] musicPlaying = 0
        musicPlaying=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 92] ENDIF
      }
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 94] VSYNC
    jsfVsync(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\zero_test\zero_test.bas - 96] LOOP
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

