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
void    midstr (char*, int, int, char *);
// *************************************************
//               User Prototypes
// *************************************************

// *************************************************
//            User Global Variables
// *************************************************

static short   i;
static short   j;
static char    name[2048];
static int     srcname;
static int     dstname;
static int     tableCounter;
static int     tickcounter;
static int     pad1;
static int     *highscoreBoard;
static int     highscoreNames;
static int     highscoreBoardNumber;
static int     eeprom_present=0;

void    createDefaultScores (void);
void    setScoreboard (int);
void    displayScoreboard (int);
void    saveScore (char *, int, int);


// *************************************************
//            User Global Initialized Arrays
// *************************************************


// *************************************************
//                  Main Program
// *************************************************

void basicmain()
{
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 9] jsfSetFontSize(0)
jsfSetFontSize(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 10] jsfSetFontIndx(1)
jsfSetFontIndx(1);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 12] dim i as short
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 13] dim j as short
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 14] dim name$
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 15] dim srcname%,dstname%
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 16] dim eeprom_present%=0
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 17] DIM tableCounter AS INTEGER
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 18] DIM tickcounter AS INTEGER
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 19] DIM pad1%
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 19] pad1=0
pad1=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 22] dim highscoreBoard as integer ptr
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 23] dim highscoreNames as integer
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 24] dim highscoreBoardNumber as integer
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 26] call setScoreboard(0)
setScoreboard(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 28] rapLocate 16,16
rapLocate(16,16);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 29] rapPrint "Checking for existing scores"
js_r_textbuffer=(char *)"Checking for existing scores";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 30] vsync
jsfVsync(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 34] eeprom_present=jsfEEPROM(1,rapHighscores1Score)
eeprom_present=jsfEEPROM(1,rapHighscores1Score);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 35] if eeprom_present=1 then
if(eeprom_present==1)
  {
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 37] rapLocate 16,32
    rapLocate(16,32);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 38] rapPrint "Creating Default Scores.."
    js_r_textbuffer=(char *)"Creating Default Scores..";
    rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 39] vsync
    jsfVsync(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 42] call createDefaultScores
    createDefaultScores();
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 44] jsfEEPROM(0,rapHighscores1Score)
    jsfEEPROM(0,rapHighscores1Score);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 46] eeprom_present=jsfEEPROM(1,rapHighscores1Score)
    eeprom_present=jsfEEPROM(1,rapHighscores1Score);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 47] else
  }
else
  {
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 48] rapLocate 16,32
    rapLocate(16,32);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 49] rapPrint "Scores Found"
    js_r_textbuffer=(char *)"Scores Found";
    rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 50] vsync
    jsfVsync(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 51] endif
  }
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 55] if eeprom_present<>0 then
if(eeprom_present!=0)
  {
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 58] rapLocate 16,48
    rapLocate(16,48);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 59] rapPrint "No EE detected!"
    js_r_textbuffer=(char *)"No EE detected!";
    rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 61] call createDefaultScores
    createDefaultScores();
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 63] else
  }
else
  {
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 66] rapLocate 16,48
    rapLocate(16,48);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 67] rapPrint "EEPROM detected!"
    js_r_textbuffer=(char *)"EEPROM detected!";
    rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 69] endif
  }
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 74] saveScore("Player 1", 111, 0)
saveScore("Player 1",111,0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 80] tickcounter = 0
tickcounter=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 81] tableCounter = 0
tableCounter=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 83] rapLocate 0,210
rapLocate(0,210);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 84] PRINT "SCOREBOARD ";tableCounter;" -DPAD LEFT/RIGHT TO VIEW"
js_r_textbuffer=ee_printf("%s% d%s","SCOREBOARD ",(int)tableCounter," -DPAD LEFT/RIGHT TO VIEW");
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 87] do
for(;;)
  {
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 89] vsync
    jsfVsync(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 92] pad1=jsfGetPad(1)
    pad1=jsfGetPad(1);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 93] IF (pad1 BAND JAGPAD_RIGHT) Then
    if((pad1 BAND JAGPAD_RIGHT))
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 94] tableCounter++
        tableCounter++;
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 96] IF tableCounter > 4 Then
        if(tableCounter>4)
          {
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 97] tableCounter = 0
            tableCounter=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 98] ENDIF
          }
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 100] jsfDelay(20)
        jsfDelay(20);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 101] CLS
        cls();
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 103] rapLocate 0,210
        rapLocate(0,210);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 104] PRINT "SCOREBOARD ";tableCounter;" -DPAD LEFT/RIGHT TO VIEW"
        js_r_textbuffer=ee_printf("%s% d%s","SCOREBOARD ",(int)tableCounter," -DPAD LEFT/RIGHT TO VIEW");
        rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 106] ELSEIF (pad1 BAND JAGPAD_LEFT) Then
      }
    else if((pad1 BAND JAGPAD_LEFT))
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 107] tableCounter--
        tableCounter--;
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 109] IF tableCounter < 0 Then
        if(tableCounter<0)
          {
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 110] tableCounter = 4
            tableCounter=4;
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 111] ENDIF
          }
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 113] jsfDelay(20)
        jsfDelay(20);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 114] CLS
        cls();
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 116] rapLocate 0,210
        rapLocate(0,210);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 117] PRINT "SCOREBOARD ";tableCounter;" -DPAD LEFT/RIGHT TO VIEW"
        js_r_textbuffer=ee_printf("%s% d%s","SCOREBOARD ",(int)tableCounter," -DPAD LEFT/RIGHT TO VIEW");
        rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 119] ENDIF
      }
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 122] displayScoreboard(tableCounter)
    displayScoreboard(tableCounter);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 124] loop
  }
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 128] sub createDefaultScores
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 148] sub setScoreboard(scoreboardToUse%)
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 192] sub saveScore(playername$, playerscore%, scoreboardToUse%)
  while(1) {};   //  End of main program
}

// *************************************************
//                 Runtime Functions
// *************************************************

void midstr (char *src, int st, int length, char *rep)
{
  int srclen = strlen(src);
  if(st>srclen++ || st<1) return;
  int replen = strlen(rep);
  if(replen < length || length==-1) length=replen;
  if((st+length) > srclen) length=srclen-st;
  memcpy(&src[st-1],rep,length);
}



// ************************************
//       User Subs and Functions
// ************************************


void createDefaultScores (void)
{
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 130] for tableCounter = 0 TO 4
  for(tableCounter=0; tableCounter<=4; tableCounter+=1)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 131] call setScoreboard(tableCounter)
      setScoreboard(tableCounter);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 133] for i=0 to 9
      for(i=0; i<=9; i+=1)
        {
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 134] highscoreBoard[i]=(9-i)*100
          highscoreBoard[i]=(9-i)*100;
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 136] poke (highscoreNames + (8*i)),ASC("J")
          *(volatile unsigned char*)((highscoreNames+(8*i)))=(volatile unsigned char)          74;
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 137] poke (highscoreNames + (8*i) + 1),ASC("A")
          *(volatile unsigned char*)((highscoreNames+(8*i)+1))=(volatile unsigned char)          65;
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 138] poke (highscoreNames + (8*i) + 2),ASC("G")
          *(volatile unsigned char*)((highscoreNames+(8*i)+2))=(volatile unsigned char)          71;
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 139] poke (highscoreNames + (8*i) + 3),0
          *(volatile unsigned char*)((highscoreNames+(8*i)+3))=(volatile unsigned char)          0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 140] next i
        }
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 142] next tableCounter
    }
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 144] end sub
}


void setScoreboard (int scoreboardToUse)
{
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 149] if scoreboardToUse = 0 then
  if(scoreboardToUse==0)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 150] highscoreBoard = rapHighscores1Score
      highscoreBoard=rapHighscores1Score;
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 151] highscoreNames = (int)strptr(rapHighscores1Name[0])
      highscoreNames=(int)STRPTR(rapHighscores1Name[0]);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 152] highscoreBoardNumber = 0
      highscoreBoardNumber=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 153] elseif scoreboardToUse = 1 then
    }
  else if(scoreboardToUse==1)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 154] highscoreBoard = rapHighscores2Score
      highscoreBoard=rapHighscores2Score;
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 155] highscoreNames = (int)strptr(rapHighscores2Name[0])
      highscoreNames=(int)STRPTR(rapHighscores2Name[0]);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 156] highscoreBoardNumber = 1
      highscoreBoardNumber=1;
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 157] elseif scoreboardToUse = 2 then
    }
  else if(scoreboardToUse==2)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 158] highscoreBoard = rapHighscores3Score
      highscoreBoard=rapHighscores3Score;
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 159] highscoreNames = (int)strptr(rapHighscores3Name[0])
      highscoreNames=(int)STRPTR(rapHighscores3Name[0]);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 160] highscoreBoardNumber = 2
      highscoreBoardNumber=2;
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 161] elseif scoreboardToUse = 3 then
    }
  else if(scoreboardToUse==3)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 162] highscoreBoard = rapHighscores4Score
      highscoreBoard=rapHighscores4Score;
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 163] highscoreNames = (int)strptr(rapHighscores4Name[0])
      highscoreNames=(int)STRPTR(rapHighscores4Name[0]);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 164] highscoreBoardNumber = 3
      highscoreBoardNumber=3;
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 165] elseif scoreboardToUse = 4 then
    }
  else if(scoreboardToUse==4)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 166] highscoreBoard = rapHighscores5Score
      highscoreBoard=rapHighscores5Score;
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 167] highscoreNames = (int)strptr(rapHighscores5Name[0])
      highscoreNames=(int)STRPTR(rapHighscores5Name[0]);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 168] highscoreBoardNumber = 4
      highscoreBoardNumber=4;
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 169] endif
    }
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 170] endif
}
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 173] sub displayScoreboard(scoreboardToUse%)
void displayScoreboard (int scoreboardToUse)
{
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 175] call setScoreboard(scoreboardToUse)
  setScoreboard(scoreboardToUse);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 177] dstname=(int)strptr(name$)
  dstname=(int)STRPTR(name);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 178] mid$(name$,9,1)=""
  midstr(name,9,1,"");
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 180] for i=0 to 9
  for(i=0; i<=9; i+=1)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 181] rapLocate 0,8*10+8+8+8+i*8
      rapLocate(0,8*10+8+8+8+i*8);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 183] srcname = highscoreNames + (8*i)
      srcname=highscoreNames+(8*i);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 184] lpoke dstname,lpeek(srcname)
      *(volatile unsigned int*)(dstname)=(volatile unsigned int)      lpeek(srcname);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 185] lpoke dstname+4,lpeek(srcname+4)
      *(volatile unsigned int*)(dstname+4)=(volatile unsigned int)      lpeek(srcname+4);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 186] PRINT "#";i;" - ";name$;" -";highscoreBoard[i]
      js_r_textbuffer=ee_printf("%s% d%s%s%s% d","#",(int)i," - ",name," -",(int)highscoreBoard[i]);
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 187] next i
    }
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 189] end sub
}


void saveScore (char *playername, int playerscore, int scoreboardToUse)
{
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 194] call setScoreboard(scoreboardToUse)
  setScoreboard(scoreboardToUse);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 196] name$ = playername$
  strcpy(name,playername);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 197] if rapHiscoreCheck(playerscore%,name$,highscoreBoardNumber) > 0 then
  if(rapHiscoreCheck(playerscore,name,highscoreBoardNumber)>0)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 198] call rapHiscoreSort(highscoreBoardNumber)
      rapHiscoreSort(highscoreBoardNumber);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 199] endif
    }
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 201] rapLocate 0,8*10+8+8+8+10*8+8
  rapLocate(0,8*10+8+8+8+10*8+8);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 202] if eeprom_present<>0 then
  if(eeprom_present!=0)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 203] rapPrint "No EE detected, so no scores saved!"
      js_r_textbuffer=(char *)"No EE detected, so no scores saved!";
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 204] else
    }
  else
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 205] eeprom_present=jsfEEPROM(0,rapHighscores1Score)
      eeprom_present=jsfEEPROM(0,rapHighscores1Score);
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 206] if eeprom_present=0 then
      if(eeprom_present==0)
        {
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 207] Print "EEPROM detected, scores saved - ";scoreboardToUse
          js_r_textbuffer=ee_printf("%s% d","EEPROM detected, scores saved - ",(int)scoreboardToUse);
          rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 208] else
        }
      else
        {
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 209] rapPrint "EEPROM detected, save fail!"
          js_r_textbuffer=(char *)"EEPROM detected, save fail!";
          rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 210] endif
        }
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 211] endif
    }
// [F:\Jaguar\Tools\JagStudio\projects\basic\scoresadvanced\scoresadvanced.bas - 213] end sub
}


