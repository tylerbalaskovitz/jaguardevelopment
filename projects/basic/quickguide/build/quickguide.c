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

#include once <include.bas>
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
//               Standard Prototypes
// *************************************************
char*   BCX_TmpStr(size_t);
char*   space (int a);

// *************************************************
//            User Defined Constants
// *************************************************

#define sprParticleLayer 0
#define sprBug1 1

// *************************************************
//                System Variables
// *************************************************


// *************************************************
//            User Global Variables
// *************************************************

static int     screenNumber;
static int     pad1;
static int     scrolling;
static int     tx;
static int     ty;
static int     spaces;
static char    winner[2048];
static char    players[6][2048];
static char    p1[2048];
static char    p2[2048];
static char    p3[2048];
static char    p4[2048];
static char    p5[2048];
static char    p6[2048];


// *************************************************
//               User Prototypes
// *************************************************

int     AssignWinner (char *);
int     ScrollString (char *);
int     writeName (void);
int     selectWinnerKeypad (void);


// *************************************************
//            User Global Initialized Arrays
// *************************************************


// *************************************************
//                  Main Program
// *************************************************

void basicmain()
{
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 11] #INCLUDE ONCE <INCLUDE.bas>
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 12] const sprParticleLayer% = 0
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 13] const sprBug1% = 1
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 14] DIM screenNumber as INTEGER
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 15] DIM pad1 AS INTEGER
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 16] DIM scrolling AS INTEGER
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 17] DIM tx AS INTEGER
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 18] DIM ty AS INTEGER
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 19] DIM winner AS STRING
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 20] DIM players$[6]
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 21] DIM p1 AS STRING
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 22] DIM p2 AS STRING
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 23] DIM p3 AS STRING
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 24] DIM p4 AS STRING
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 25] DIM p5 AS STRING
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 26] DIM p6 AS STRING
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 27] DIM spaces as INTEGER
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 28] winner = ""
*winner=0;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 29] tx = 38
tx=38;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 30] ty = 182
ty=182;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 31] players$[0]="Tyler"
strcpy(players[0],"Tyler");
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 32] players$[1] = "Loving"
strcpy(players[1],"Loving");
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 33] players$[2] = "John"
strcpy(players[2],"John");
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 34] players$[3] = "Navraj"
strcpy(players[3],"Navraj");
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 35] players$[4] = "Matt"
strcpy(players[4],"Matt");
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 36] players$[5] = "Christian"
strcpy(players[5],"Christian");
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 37] scrolling = 0
scrolling=0;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 38] screenNumber = 0
screenNumber=0;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 39] jsfSetFontIndx(0)
jsfSetFontIndx(0);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 40] jsfSetFontSize(1)
jsfSetFontSize(1);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 41] FUNCTION AssignWinner(inputString AS STRING)
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 46] FUNCTION ScrollString(inputString AS STRING)
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 64] FUNCTION writeName()
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 68] FUNCTION selectWinnerKeypad()
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 101] Do
for(;;)
  {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 102] pad1 = jsfGetPad(LEFT_PAD)
    pad1=jsfGetPad(LEFT_PAD);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 103] IF screenNumber = 0 THEN
    if(screenNumber==0)
      {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 104] ScrollString(winner)
        ScrollString(winner);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 105] selectWinnerKeypad()
        selectWinnerKeypad();
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 106] ENDIF
      }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 108] IF pad1 BAND JAGPAD_HASH THEN
    if(pad1 BAND JAGPAD_HASH)
      {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 109] cls
        cls();
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 110] screenNumber = 0
        screenNumber=0;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 111] ENDIF
      }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 113] IF pad1 BAND JAGPAD_STAR THEN
    if(pad1 BAND JAGPAD_STAR)
      {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 114] cls
        cls();
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 115] writeName()
        writeName();
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 116] ENDIF
      }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 117] IF pad1 BAND JAGPAD_B THEN
    if(pad1 BAND JAGPAD_B)
      {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 119] ENDIF
      }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 125] VSYNC
    jsfVsync(0);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 127] LOOP
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


char *space (int count)
{
  if(count<1) return BCX_TmpStr(1);
  register char *strtmp = BCX_TmpStr(count);
  return (char*)memset(strtmp,32,count);
}



// ************************************
//       User Subs and Functions
// ************************************


int AssignWinner (char *inputString)
{
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 42] winner = inputString
  strcpy(winner,inputString);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 43] scrolling = 1
  scrolling=1;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 44] END FUNCTION
}


int ScrollString (char *inputString)
{
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 47] IF scrolling = 1 THEN
  if(scrolling==1)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 48] tx -=2
      tx-=2;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 49] rapLocate tx,ty
      rapLocate(tx,ty);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 50] if LEN(inputString) >= 9 then
      if(strlen(inputString)>=9)
        {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 51] spaces = 0
          spaces=0;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 52] else
        }
      else
        {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 53] spaces = 2
          spaces=2;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 54] endif
        }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 55] print "Congratulations!",inputString," is the winner!",SPACE$(spaces)
      js_r_textbuffer=ee_printf("%s%s%s%s","Congratulations!",inputString," is the winner!",space(spaces));
      rapPrint();
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 56] VSYNC
      jsfVsync(0);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 57] ELSE
    }
  else
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 58] rapLocate tx,ty
      rapLocate(tx,ty);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 59] rapPrint "Who will be today's winner?"
      js_r_textbuffer=(char *)"Who will be today's winner?";
      rapPrint();
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 60] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 62] END FUNCTION
}


int writeName (void)
{
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 65] screenNumber = 1
  screenNumber=1;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 66] END FUNCTION
}


int selectWinnerKeypad (void)
{
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 69] IF pad1 BAND JAGPAD_1 THEN
  if(pad1 BAND JAGPAD_1)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 70] AssignWinner(players$[0])
      AssignWinner(players[0]);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 71] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 73] IF pad1 BAND JAGPAD_2 THEN
  if(pad1 BAND JAGPAD_2)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 74] AssignWinner(players$[1])
      AssignWinner(players[1]);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 75] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 77] IF pad1 BAND JAGPAD_3 THEN
  if(pad1 BAND JAGPAD_3)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 78] AssignWinner(players$[2])
      AssignWinner(players[2]);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 79] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 81] IF pad1 BAND JAGPAD_4 THEN
  if(pad1 BAND JAGPAD_4)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 82] AssignWinner(players$[3])
      AssignWinner(players[3]);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 83] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 85] IF pad1 BAND JAGPAD_5 THEN
  if(pad1 BAND JAGPAD_5)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 86] AssignWinner(players$[4])
      AssignWinner(players[4]);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 87] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 89] IF pad1 BAND JAGPAD_6 THEN
  if(pad1 BAND JAGPAD_6)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 90] AssignWinner(players$[5])
      AssignWinner(players[5]);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 91] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 93] IF pad1 BAND JAGPAD_7 THEN
  if(pad1 BAND JAGPAD_7)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 94] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 96] IF pad1 BAND JAGPAD_8 THEN
  if(pad1 BAND JAGPAD_8)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 97] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 99] END FUNCTION
}


