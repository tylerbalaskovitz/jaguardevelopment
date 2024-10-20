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

static int     scrolling;
static int     screenNumber;
static int     pad1;
static int     tx;
static int     ty;
static int     spaces;
static char    winner[2048];
static char    players[6][2048];


// *************************************************
//               User Prototypes
// *************************************************

int     selectWinnerKeypad (int);
int     changeScreenKeypad (int);
int     AssignWinner (int, char *, char *);
int     ScrollString (int, int, int, int, char *);
int     AssignWinner (char *);
int     writeName (void);


// *************************************************
//            User Global Initialized Arrays
// *************************************************


// *************************************************
//                  Main Program
// *************************************************

void basicmain()
{
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 11] $include "controllerTypes.bas"
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/controllerTypes.bas - 1] FUNCTION selectWinnerKeypad(pad1 as INTEGER)
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/controllerTypes.bas - 34] FUNCTION changeScreenKeypad(pad1 as INTEGER)
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 12] $include "MainMenu.bas"
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/MainMenu.bas - 1] DIM scrolling AS INTEGER
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/MainMenu.bas - 2] scrolling = 0
scrolling=0;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/MainMenu.bas - 3] FUNCTION AssignWinner(scrolling AS INTEGER, winner AS STRING, inputString AS STRING)
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/MainMenu.bas - 8] FUNCTION ScrollString(scrolling AS INTEGER, tx AS INTEGER, ty as INTEGER, spaces AS INTEGER, inputString AS STRING)
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 13] const sprParticleLayer% = 0
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 14] const sprBug1% = 1
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 15] DIM screenNumber as INTEGER
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 16] DIM pad1 AS INTEGER
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 17] DIM tx AS INTEGER
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 18] DIM ty AS INTEGER
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 19] DIM winner AS STRING
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 20] DIM players$[6]
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 21] DIM spaces as INTEGER
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 22] winner = ""
*winner=0;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 23] tx = 38
tx=38;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 24] ty = 182
ty=182;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 25] players$[0]="Tyler"
strcpy(players[0],"Tyler");
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 26] players$[1] = "Loving"
strcpy(players[1],"Loving");
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 27] players$[2] = "John"
strcpy(players[2],"John");
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 28] players$[3] = "Navraj"
strcpy(players[3],"Navraj");
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 29] players$[4] = "Matt"
strcpy(players[4],"Matt");
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 30] players$[5] = "Christian"
strcpy(players[5],"Christian");
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 31] scrolling = 0
scrolling=0;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 32] screenNumber = 0
screenNumber=0;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 33] jsfSetFontIndx(0)
jsfSetFontIndx(0);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 34] jsfSetFontSize(1)
jsfSetFontSize(1);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 35] FUNCTION AssignWinner(inputString AS STRING)
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 41] FUNCTION writeName()
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 46] Do
for(;;)
  {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 47] pad1 = jsfGetPad(LEFT_PAD)
    pad1=jsfGetPad(LEFT_PAD);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 48] IF screenNumber = 0 THEN
    if(screenNumber==0)
      {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 49] ScrollString(scrolling, tx, ty, spaces, winner)
        ScrollString(scrolling,tx,ty,spaces,winner);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 50] if scrolling = 1 THEN
        if(scrolling==1)
          {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 51] tx-=2
            tx-=2;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 52] ENDIF
          }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 53] selectWinnerKeypad(pad1)
        selectWinnerKeypad(pad1);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 54] ENDIF
      }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 55] IF screenNumber = 1 THEN
    if(screenNumber==1)
      {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 57] ENDIF
      }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 58] changeScreenKeypad(pad1)
    changeScreenKeypad(pad1);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 64] VSYNC
    jsfVsync(0);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 66] LOOP
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


int selectWinnerKeypad (int pad1)
{
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/controllerTypes.bas - 2] IF pad1 BAND JAGPAD_1 THEN
  if(pad1 BAND JAGPAD_1)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/controllerTypes.bas - 3] AssignWinner(players$[0])
      AssignWinner(players[0]);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/controllerTypes.bas - 4] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/controllerTypes.bas - 6] IF pad1 BAND JAGPAD_2 THEN
  if(pad1 BAND JAGPAD_2)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/controllerTypes.bas - 7] AssignWinner(players$[1])
      AssignWinner(players[1]);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/controllerTypes.bas - 8] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/controllerTypes.bas - 10] IF pad1 BAND JAGPAD_3 THEN
  if(pad1 BAND JAGPAD_3)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/controllerTypes.bas - 11] AssignWinner(players$[2])
      AssignWinner(players[2]);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/controllerTypes.bas - 12] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/controllerTypes.bas - 14] IF pad1 BAND JAGPAD_4 THEN
  if(pad1 BAND JAGPAD_4)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/controllerTypes.bas - 15] AssignWinner(players$[3])
      AssignWinner(players[3]);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/controllerTypes.bas - 16] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/controllerTypes.bas - 18] IF pad1 BAND JAGPAD_5 THEN
  if(pad1 BAND JAGPAD_5)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/controllerTypes.bas - 19] AssignWinner(players$[4])
      AssignWinner(players[4]);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/controllerTypes.bas - 20] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/controllerTypes.bas - 22] IF pad1 BAND JAGPAD_6 THEN
  if(pad1 BAND JAGPAD_6)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/controllerTypes.bas - 23] AssignWinner(players$[5])
      AssignWinner(players[5]);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/controllerTypes.bas - 24] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/controllerTypes.bas - 26] IF pad1 BAND JAGPAD_7 THEN
  if(pad1 BAND JAGPAD_7)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/controllerTypes.bas - 27] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/controllerTypes.bas - 29] IF pad1 BAND JAGPAD_8 THEN
  if(pad1 BAND JAGPAD_8)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/controllerTypes.bas - 30] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/controllerTypes.bas - 32] END FUNCTION
}


int changeScreenKeypad (int pad1)
{
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/controllerTypes.bas - 35] IF pad1 BAND JAGPAD_HASH THEN
  if(pad1 BAND JAGPAD_HASH)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/controllerTypes.bas - 36] cls
      cls();
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/controllerTypes.bas - 37] screenNumber = 0
      screenNumber=0;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/controllerTypes.bas - 38] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/controllerTypes.bas - 40] IF pad1 BAND JAGPAD_STAR THEN
  if(pad1 BAND JAGPAD_STAR)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/controllerTypes.bas - 41] cls
      cls();
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/controllerTypes.bas - 42] writeName()
      writeName();
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/controllerTypes.bas - 43] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/controllerTypes.bas - 44] IF pad1 BAND JAGPAD_B THEN
  if(pad1 BAND JAGPAD_B)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/controllerTypes.bas - 46] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/controllerTypes.bas - 47] END FUNCTION
}


int AssignWinner (int scrolling, char *winner, char *inputString)
{
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/MainMenu.bas - 4] winner = inputString
  winner=inputString;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/MainMenu.bas - 5] scrolling = 1
  scrolling=1;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/MainMenu.bas - 6] END FUNCTION
}


int ScrollString (int scrolling, int tx, int ty, int spaces, char *inputString)
{
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/MainMenu.bas - 9] IF scrolling = 1 THEN
  if(scrolling==1)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/MainMenu.bas - 10] rapLocate tx,ty
      rapLocate(tx,ty);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/MainMenu.bas - 11] if LEN(inputString) >= 9 then
      if(strlen(inputString)>=9)
        {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/MainMenu.bas - 12] spaces =0
          spaces=0;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/MainMenu.bas - 13] else
        }
      else
        {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/MainMenu.bas - 14] spaces = 2
          spaces=2;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/MainMenu.bas - 15] endif
        }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/MainMenu.bas - 16] print "Congratulations!",inputString," is the winner!",SPACE$(spaces)
      js_r_textbuffer=ee_printf("%s%s%s%s","Congratulations!",inputString," is the winner!",space(spaces));
      rapPrint();
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/MainMenu.bas - 17] VSYNC
      jsfVsync(0);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/MainMenu.bas - 18] ELSE
    }
  else
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/MainMenu.bas - 19] rapLocate tx,ty
      rapLocate(tx,ty);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/MainMenu.bas - 20] rapPrint "Who will be today's winner?"
      js_r_textbuffer=(char *)"Who will be today's winner?";
      rapPrint();
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/MainMenu.bas - 21] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/MainMenu.bas - 22] END FUNCTION
}


int AssignWinner (char *inputString)
{
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 36] winner = inputString
  strcpy(winner,inputString);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 37] scrolling = 1
  scrolling=1;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 38] END FUNCTION
}


int writeName (void)
{
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 42] screenNumber = 1
  screenNumber=1;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 43] END FUNCTION
}


