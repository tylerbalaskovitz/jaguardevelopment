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
#define Clear(arg)memset(&arg,0,sizeof(arg))
// *************************************************
//               Standard Prototypes
// *************************************************
char*   BCX_TmpStr(size_t);

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

static int     upperCase;
static int     upperCaseLow;
static int     upperCaseHigh;
static int     lowerCaseLow;
static int     lowerCaseHigh;
static int     speedTemp;
static int     inputSpeed;
static int     temp;
static int     tempY;
static int     tempYStart;
static int     yGrowth;
static int     playerLimit;
static int     selectedPlayer;
static int     scrolling;
static int     spaces;
static int     intName;
static int     tx;
static int     ty;
static int     screenNumber;
static int     pad1;
static char    letterHolder[2048];
static char    tempName[2048];
static char    testPlayerName[2048];
static char    players[6][2048];
static char    winner[2048];

char*   mid (char*, int, int=-1);
char*   space (int a);
char*   chr(int,int=0,int=0,int=0,int=0,int=0,int=0,int=0,int=0,int=0);

// *************************************************
//               User Prototypes
// *************************************************

int     registerPlayer (int, char *);
int     confirmName (int);
int     clearName (void);
int     removeLetter (void);
int     addLetter (char *);
int     changeCase (void);
int     selectWinnerKeypad (int);
int     writePlayerName (int);
int     checkTemps (void);
int     changeScreenKeypad (int);
int     ScrollString (int, int, int, int, char *);
int     writeName (void);
int     AssignWinner (char *);


// *************************************************
//            User Global Initialized Arrays
// *************************************************


// *************************************************
//                  Main Program
// *************************************************

void basicmain()
{
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 8] $include "CreatePlayers.bas"
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 1] DIM upperCase as INTEGER
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 2] DIM upperCaseLow as INTEGER
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 3] DIM upperCaseHigh as INTEGER
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 4] DIM lowerCaseLow as INTEGER
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 5] DIM lowerCaseHigh as INTEGER
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 6] DIM speedTemp as INTEGER
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 7] DIM inputSpeed as INTEGER
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 8] DIM temp as INTEGER
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 9] DIM tempY as INTEGER
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 10] DIM tempYStart as INTEGER
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 11] DIM yGrowth as INTEGER
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 12] DIM letterHolder as String
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 13] DIM tempName as String
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 14] DIM playerLimit as INTEGER
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 15] DIM selectedPlayer as INTEGER
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 16] upperCase = 1
upperCase=1;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 17] upperCaseLow = 65
upperCaseLow=65;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 18] upperCaseHigh = 90
upperCaseHigh=90;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 19] lowerCaseLow = 97
lowerCaseLow=97;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 20] lowerCaseHigh = 122
lowerCaseHigh=122;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 21] inputSpeed = 0
inputSpeed=0;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 22] selectedPlayer = 0
selectedPlayer=0;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 23] playerLimit = 6
playerLimit=6;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 24] tempYStart =60
tempYStart=60;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 25] tempY = 60
tempY=60;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 26] yGrowth = 15
yGrowth=15;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 27] speedTemp = 0
speedTemp=0;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 28] temp = 0
temp=0;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 29] tempName = ""
*tempName=0;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 31] FUNCTION registerPlayer(temp as INTEGER, tempName as STRING)
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 48] FUNCTION confirmName(confirmedName as Integer)
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 54] FUNCTION clearName()
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 58] FUNCTION removeLetter()
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 70] FUNCTION addLetter(tempName as String)
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 79] FUNCTION changeCase()
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 9] $include "ControllerTypes.bas"
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 3] FUNCTION selectWinnerKeypad(pad1 as INTEGER)
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 37] FUNCTION writePlayerName(pad1 as INTEGER)
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 97] FUNCTION checkTemps()
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 124] FUNCTION changeScreenKeypad(pad1 as INTEGER)
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 10] $include "MainMenu.bas"
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/MainMenu.bas - 1] DIM scrolling AS INTEGER
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/MainMenu.bas - 2] DIM spaces as INTEGER
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/MainMenu.bas - 3] scrolling = 0
scrolling=0;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/MainMenu.bas - 6] FUNCTION ScrollString(scrolling AS INTEGER, tx AS INTEGER, ty as INTEGER, spaces AS INTEGER, inputString AS STRING)
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 11] $include "PlayerVariables.bas"
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/PlayerVariables.bas - 1] DIM intName as INTEGER
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/PlayerVariables.bas - 2] DIM testPlayerName as STRING
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/PlayerVariables.bas - 3] DIM players$[6]
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/PlayerVariables.bas - 4] DIM tx AS INTEGER
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/PlayerVariables.bas - 5] DIM ty AS INTEGER
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/PlayerVariables.bas - 6] DIM winner AS STRING
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/PlayerVariables.bas - 7] DIM screenNumber as INTEGER
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/PlayerVariables.bas - 8] DIM pad1 AS INTEGER
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/PlayerVariables.bas - 10] jsfSetFontIndx(0)
jsfSetFontIndx(0);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/PlayerVariables.bas - 11] jsfSetFontSize(1)
jsfSetFontSize(1);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/PlayerVariables.bas - 13] tx = 38
tx=38;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/PlayerVariables.bas - 14] ty = 182
ty=182;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/PlayerVariables.bas - 15] winner = ""
*winner=0;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/PlayerVariables.bas - 17] players$[0]="Tyler"
strcpy(players[0],"Tyler");
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/PlayerVariables.bas - 18] players$[1] = "Loving"
strcpy(players[1],"Loving");
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/PlayerVariables.bas - 19] players$[2] = "John"
strcpy(players[2],"John");
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/PlayerVariables.bas - 20] players$[3] = "Navraj"
strcpy(players[3],"Navraj");
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/PlayerVariables.bas - 21] players$[4] = "Matt"
strcpy(players[4],"Matt");
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/PlayerVariables.bas - 22] players$[5] = "Jarod"
strcpy(players[5],"Jarod");
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/PlayerVariables.bas - 23] intName = 2
intName=2;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/PlayerVariables.bas - 24] screenNumber = 0
screenNumber=0;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/PlayerVariables.bas - 27] FUNCTION writeName()
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/PlayerVariables.bas - 32] FUNCTION AssignWinner(inputString AS STRING)
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 12] const sprParticleLayer% = 0
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 13] const sprBug1% = 1
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 17] Do
for(;;)
  {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 19] pad1 = jsfGetPad(LEFT_PAD)
    pad1=jsfGetPad(LEFT_PAD);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 20] IF screenNumber = 0 THEN
    if(screenNumber==0)
      {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 21] ScrollString(scrolling, tx, ty, spaces, winner)
        ScrollString(scrolling,tx,ty,spaces,winner);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 22] if scrolling = 1 THEN
        if(scrolling==1)
          {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 23] tx-=2
            tx-=2;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 24] ENDIF
          }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 25] selectWinnerKeypad(pad1)
        selectWinnerKeypad(pad1);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 26] ENDIF
      }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 27] IF screenNumber = 1 THEN
    if(screenNumber==1)
      {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 28] writePlayerName(pad1)
        writePlayerName(pad1);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 29] registerPlayer(temp, tempName)
        registerPlayer(temp,tempName);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 30] ENDIF
      }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 31] changeScreenKeypad(pad1)
    changeScreenKeypad(pad1);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 34] VSYNC
    jsfVsync(0);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/quickguide.bas - 35] LOOP
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


char *mid (char *S, int start, int length)
{
  char *strtmp;
  register int tmplen = strlen(S);
  if(start>tmplen||start<1) return BCX_TmpStr(1);
  if (length<0 || length>(tmplen-start)+1)
    length = (tmplen-start)+1;
  strtmp = BCX_TmpStr(length);
  return (char*)memcpy(strtmp,&S[start-1],length);
}


char *space (int count)
{
  if(count<1) return BCX_TmpStr(1);
  register char *strtmp = BCX_TmpStr(count);
  return (char*)memset(strtmp,32,count);
}


char *chr (int a,int b,int c,int d,int e,int f,int g,int h,int i,int j)
{
  register char *strtmp = BCX_TmpStr(11);
  strtmp[0]  = a;
  strtmp[1]  = b;
  strtmp[2]  = c;
  strtmp[3]  = d;
  strtmp[4]  = e;
  strtmp[5]  = f;
  strtmp[6]  = g;
  strtmp[7]  = h;
  strtmp[8]  = i;
  strtmp[9]  = j;
  strtmp[10] = 0;
  return strtmp;
}



// ************************************
//       User Subs and Functions
// ************************************


int registerPlayer (int temp, char *tempName)
{
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 32] rapLocate 10, tempY
  rapLocate(10,tempY);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 33] print "Write player ",selectedPlayer+1,"'s name"
  js_r_textbuffer=ee_printf("%s% d%s","Write player ",(int)selectedPlayer+1,"'s name");
  rapPrint();
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 34] rapLocate 10, tempY+=yGrowth
  rapLocate(10,tempY+=yGrowth);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 35] print SPACE$(23)
  js_r_textbuffer=ee_printf("%s",space(23));
  rapPrint();
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 36] print "Current Name: ",players$[selectedPlayer]
  js_r_textbuffer=ee_printf("%s%s","Current Name: ",players[selectedPlayer]);
  rapPrint();
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 37] rapLocate 10, tempY+=yGrowth
  rapLocate(10,tempY+=yGrowth);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 38] print SPACE$(23)
  js_r_textbuffer=ee_printf("%s",space(23));
  rapPrint();
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 39] print "New name:",tempName
  js_r_textbuffer=ee_printf("%s%s","New name:",tempName);
  rapPrint();
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 40] rapLocate 10, tempY+=yGrowth
  rapLocate(10,tempY+=yGrowth);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 41] print CHR$(temp)
  js_r_textbuffer=ee_printf("%s",chr(temp));
  rapPrint();
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 42] rapLocate 10, tempY+=yGrowth
  rapLocate(10,tempY+=yGrowth);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 43] print "ASCII value as ", temp
  js_r_textbuffer=ee_printf("%s% d","ASCII value as ",(int)temp);
  rapPrint();
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 44] tempY=tempYStart
  tempY=tempYStart;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 45] END FUNCTION
}


int confirmName (int confirmedName)
{
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 49] CLEAR(players$[confirmedName])
  Clear (players[confirmedName]);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 50] players$[confirmedName] = CONCAT(players$[confirmedName], tempName)
  strcpy(players[confirmedName],strcat(players[confirmedName],tempName));
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 51] END FUNCTION
}


int clearName (void)
{
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 55] CLEAR(tempName)
  Clear (tempName);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 56] END FUNCTION
}


int removeLetter (void)
{
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 59] inputSpeed+=1
  inputSpeed+=1;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 60] IF inputSpeed > 5 THEN
  if(inputSpeed>5)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 61] IF LEN(tempName) > 0 THEN
      if(strlen(tempName)>0)
        {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 62] tempName=MID$(tempName, 1, LEN(tempName)-1)
          strcpy(tempName,mid(tempName,1,strlen(tempName)-1));
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 63] ENDIF
        }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 64] inputSpeed = 0
      inputSpeed=0;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 65] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 68] END FUNCTIOn
}


int addLetter (char *tempName)
{
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 71] inputSpeed+=1
  inputSpeed+=1;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 72] if inputSpeed > 5 then
  if(inputSpeed>5)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 73] letterHolder=CHR$(temp)
      strcpy(letterHolder,chr(temp));
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 74] tempName= CONCAT(tempName,letterHolder)
      tempName=strcat(tempName,letterHolder);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 75] inputSpeed = 0
      inputSpeed=0;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 76] endif
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 77] END FUNCTION
}


int changeCase (void)
{
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 80] IF upperCase = 1 THEN
  if(upperCase==1)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 81] temp+=32
      temp+=32;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 82] upperCase = 0
      upperCase=0;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 83] ELSE
    }
  else
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 84] temp-=32
      temp-=32;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 85] upperCase = 1
      upperCase=1;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 86] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/CreatePlayers.bas - 87] END FUNCTION
}


int selectWinnerKeypad (int pad1)
{
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 4] IF pad1 BAND JAGPAD_1 THEN
  if(pad1 BAND JAGPAD_1)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 5] AssignWinner(players$[0])
      AssignWinner(players[0]);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 6] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 8] IF pad1 BAND JAGPAD_2 THEN
  if(pad1 BAND JAGPAD_2)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 9] AssignWinner(players$[1])
      AssignWinner(players[1]);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 10] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 12] IF pad1 BAND JAGPAD_3 THEN
  if(pad1 BAND JAGPAD_3)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 13] AssignWinner(players$[2])
      AssignWinner(players[2]);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 14] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 16] IF pad1 BAND JAGPAD_4 THEN
  if(pad1 BAND JAGPAD_4)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 17] AssignWinner(players$[3])
      AssignWinner(players[3]);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 18] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 20] IF pad1 BAND JAGPAD_5 THEN
  if(pad1 BAND JAGPAD_5)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 21] AssignWinner(players$[4])
      AssignWinner(players[4]);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 22] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 24] IF pad1 BAND JAGPAD_6 THEN
  if(pad1 BAND JAGPAD_6)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 25] AssignWinner(players$[5])
      AssignWinner(players[5]);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 26] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 28] IF pad1 BAND JAGPAD_7 THEN
  if(pad1 BAND JAGPAD_7)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 29] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 31] IF pad1 BAND JAGPAD_8 THEN
  if(pad1 BAND JAGPAD_8)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 32] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 34] END FUNCTION
}


int writePlayerName (int pad1)
{
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 38] IF pad1 BAND JAGPAD_UP THEN
  if(pad1 BAND JAGPAD_UP)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 39] speedTemp+=1
      speedTemp+=1;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 40] checkTemps()
      checkTemps();
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 41] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 43] IF pad1 BAND JAGPAD_DOWN THEN
  if(pad1 BAND JAGPAD_DOWN)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 44] speedTemp-=1
      speedTemp-=1;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 45] checkTemps()
      checkTemps();
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 46] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 48] IF pad1 BAND JAGPAD_A THEN
  if(pad1 BAND JAGPAD_A)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 50] removeLetter()
      removeLetter();
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 51] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 53] IF pad1 BAND JAGPAD_B THEN
  if(pad1 BAND JAGPAD_B)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 54] addLetter(tempName)
      addLetter(tempName);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 55] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 57] IF pad1 BAND JAGPAD_C THEN
  if(pad1 BAND JAGPAD_C)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 58] confirmName(selectedPlayer)
      confirmName(selectedPlayer);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 59] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 61] IF pad1 BAND JAGPAD_1 THEN
  if(pad1 BAND JAGPAD_1)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 62] selectedPlayer = 0
      selectedPlayer=0;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 63] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 65] IF pad1 BAND JAGPAD_2 THEN
  if(pad1 BAND JAGPAD_2)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 66] selectedPlayer = 1
      selectedPlayer=1;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 67] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 69] IF pad1 BAND JAGPAD_3 THEN
  if(pad1 BAND JAGPAD_3)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 70] selectedPlayer = 2
      selectedPlayer=2;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 71] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 72] IF pad1 BAND JAGPAD_4 THEN
  if(pad1 BAND JAGPAD_4)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 73] selectedPlayer = 3
      selectedPlayer=3;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 74] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 76] IF pad1 BAND JAGPAD_5 THEN
  if(pad1 BAND JAGPAD_5)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 77] selectedPlayer = 4
      selectedPlayer=4;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 78] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 80] IF pad1 BAND JAGPAD_6 THEN
  if(pad1 BAND JAGPAD_6)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 81] selectedPlayer = 5
      selectedPlayer=5;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 82] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 83] IF pad1 BAND JAGPAD_7 THEN
  if(pad1 BAND JAGPAD_7)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 84] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 86] IF pad1 BAND JAGPAD_8 THEN
  if(pad1 BAND JAGPAD_8)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 87] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 89] IF pad1 BAND JAGPAD_9 THEN
  if(pad1 BAND JAGPAD_9)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 90] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 92] IF pad1 BAND JAGPAD_0 THEN
  if(pad1 BAND JAGPAD_0)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 93] changeCase()
      changeCase();
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 94] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 95] END FUNCTION
}


int checkTemps (void)
{
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 98] if speedTemp >5 then
  if(speedTemp>5)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 99] speedTemp=0
      speedTemp=0;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 100] temp+=1
      temp+=1;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 101] endif
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 102] if speedTemp < -5 then
  if(speedTemp<-5)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 103] speedTemp=0
      speedTemp=0;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 104] temp-=1
      temp-=1;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 105] endif
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 106] if upperCase = 1 then
  if(upperCase==1)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 107] if temp < upperCaseLow then
      if(temp<upperCaseLow)
        {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 108] temp = upperCaseLow
          temp=upperCaseLow;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 109] endif
        }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 110] if temp > upperCaseHigh then
      if(temp>upperCaseHigh)
        {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 111] temp = upperCaseHigh
          temp=upperCaseHigh;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 112] endif
        }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 113] endif
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 114] if upperCase = 0 then
  if(upperCase==0)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 115] if temp < lowerCaseLow then
      if(temp<lowerCaseLow)
        {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 116] temp = lowerCaseLow
          temp=lowerCaseLow;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 117] endif
        }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 118] if temp > lowerCaseHigh then
      if(temp>lowerCaseHigh)
        {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 119] temp = lowerCaseHigh
          temp=lowerCaseHigh;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 120] endif
        }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 121] endif
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 122] END FUNCTION
}


int changeScreenKeypad (int pad1)
{
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 125] IF pad1 BAND JAGPAD_HASH THEN
  if(pad1 BAND JAGPAD_HASH)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 126] cls
      cls();
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 127] screenNumber = 0
      screenNumber=0;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 128] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 130] IF pad1 BAND JAGPAD_STAR THEN
  if(pad1 BAND JAGPAD_STAR)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 131] cls
      cls();
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 132] writeName()
      writeName();
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 133] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 134] IF pad1 BAND JAGPAD_B THEN
  if(pad1 BAND JAGPAD_B)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 136] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/ControllerTypes.bas - 137] END FUNCTION
}


int ScrollString (int scrolling, int tx, int ty, int spaces, char *inputString)
{
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/MainMenu.bas - 7] IF scrolling = 1 THEN
  if(scrolling==1)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/MainMenu.bas - 8] rapLocate tx,ty
      rapLocate(tx,ty);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/MainMenu.bas - 9] if LEN(inputString) >= 9 then
      if(strlen(inputString)>=9)
        {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/MainMenu.bas - 10] spaces =0
          spaces=0;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/MainMenu.bas - 11] else
        }
      else
        {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/MainMenu.bas - 12] spaces = 2
          spaces=2;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/MainMenu.bas - 13] endif
        }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/MainMenu.bas - 14] print "Congratulations!",inputString," is the winner!",SPACE$(spaces)
      js_r_textbuffer=ee_printf("%s%s%s%s","Congratulations!",inputString," is the winner!",space(spaces));
      rapPrint();
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/MainMenu.bas - 15] VSYNC
      jsfVsync(0);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/MainMenu.bas - 16] ELSE
    }
  else
    {
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/MainMenu.bas - 17] rapLocate tx,ty
      rapLocate(tx,ty);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/MainMenu.bas - 18] rapPrint "Who will be today's winner?"
      js_r_textbuffer=(char *)"Who will be today's winner?";
      rapPrint();
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/MainMenu.bas - 19] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/MainMenu.bas - 20] END FUNCTION
}


int writeName (void)
{
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/PlayerVariables.bas - 28] screenNumber = 1
  screenNumber=1;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/PlayerVariables.bas - 29] END FUNCTION
}


int AssignWinner (char *inputString)
{
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/PlayerVariables.bas - 33] winner = inputString
  strcpy(winner,inputString);
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/PlayerVariables.bas - 34] scrolling = 1
  scrolling=1;
// [/home/tbone/Programming/jagstudio/projects/basic/quickguide/PlayerVariables.bas - 35] END FUNCTION
}


