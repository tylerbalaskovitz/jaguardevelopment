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
void    midstr (char*, int, int, char *);

// *************************************************
//            User Defined Constants
// *************************************************

#define EEPROMVERSION 10

// *************************************************
//                System Variables
// *************************************************


// *************************************************
//            User Global Variables
// *************************************************

static int     eepromExists;
static int     tableCounter;
static int     playerScore;
static int     pad1;
static short   i;
static int     *highscoreBoard;
static int     highscoreNames;

char*   BCX_TmpStr(size_t);
char*   join (int, ... );

// *************************************************
//               User Prototypes
// *************************************************

void    createHighscore (void);
int     CheckEEPROMExists (void);
void    createDefaultScores (void);
void    createDefaultScoreEntries (int);
void    setScoreboard (int);
void    displayScoreboard (int);


// *************************************************
//            User Global Initialized Arrays
// *************************************************


// *************************************************
//                  Main Program
// *************************************************

void basicmain()
{
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 11] CONST EEPROMVERSION% = 10
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 16] DIM eepromExists AS INTEGER
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 17] DIM tableCounter AS INTEGER
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 18] dim playerScore as INTEGER
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 19] DIM pad1 AS INTEGER
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 20] DIM i as SHORT
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 24] DIM highscoreBoard as integer ptr
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 25] DIM highscoreNames as integer
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 29] jsfSetFontIndx(0)
jsfSetFontIndx(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 30] jsfSetFontSize(0)
jsfSetFontSize(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 32] rapLocate 0,16
rapLocate(0,16);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 33] rapPrint "OPTION : Change Board"
js_r_textbuffer=(char *)"OPTION : Change Board";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 35] rapLocate 0,24
rapLocate(0,24);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 36] rapPrint "B      : Add a new score to board"
js_r_textbuffer=(char *)"B      : Add a new score to board";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 38] rapLocate 0,32
rapLocate(0,32);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 39] rapPrint "C      : Reset board to defaults"
js_r_textbuffer=(char *)"C      : Reset board to defaults";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 41] rapLocate 0,40
rapLocate(0,40);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 42] rapPrint "0      : Save a user variable"
js_r_textbuffer=(char *)"0      : Save a user variable";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 44] rapLocate 0,56
rapLocate(0,56);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 45] rapPrint "EEPROM Found:"
js_r_textbuffer=(char *)"EEPROM Found:";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 48] eepromExists = CheckEEPROMExists()
eepromExists=CheckEEPROMExists();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 49] IF eepromExists = 0 THEN
if(eepromExists==0)
  {
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 50] jsfEEPROMWordWrite(jsfEEPROMInitVersion,EEPROMVERSION)
    jsfEEPROMWordWrite(jsfEEPROMInitVersion,EEPROMVERSION);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 53] jsfSetFontIndx(0)
    jsfSetFontIndx(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 54] rapLocate 144,56
    rapLocate(144,56);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 55] rapPrint "Initialising EEPROM..."
    js_r_textbuffer=(char *)"Initialising EEPROM...";
    rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 57] call createDefaultScores
    createDefaultScores();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 59] jsfEEPROMFullWrite()
    jsfEEPROMFullWrite();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 61] for i = 0 TO 128
    for(i=0; i<=128; i+=1)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 62] rapUserSaveData[i] = 0
        rapUserSaveData[i]=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 63] next i
      }
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 64] jsfEEPROMUserDataWrite()
    jsfEEPROMUserDataWrite();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 66] jsfSetFontIndx(0)
    jsfSetFontIndx(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 67] rapLocate 144,56
    rapLocate(144,56);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 68] eepromExists = CheckEEPROMExists()
    eepromExists=CheckEEPROMExists();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 69] IF eepromExists = 0 THEN
    if(eepromExists==0)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 70] rapPrint "Could not Initialise    "
        js_r_textbuffer=(char *)"Could not Initialise    ";
        rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 71] ELSE
      }
    else
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 72] rapPrint "EEPROM Initialised      "
        js_r_textbuffer=(char *)"EEPROM Initialised      ";
        rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 73] ENDIF
      }
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 75] ELSE
  }
else
  {
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 77] jsfSetFontIndx(0)
    jsfSetFontIndx(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 78] rapLocate 144,56
    rapLocate(144,56);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 79] rapPrint "EEPROM Loaded"
    js_r_textbuffer=(char *)"EEPROM Loaded";
    rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 81] jsfEEPROMFullRead()
    jsfEEPROMFullRead();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 90] jsfEEPROMUserDataRead()
    jsfEEPROMUserDataRead();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 91] jsfSetFontIndx(1)
    jsfSetFontIndx(1);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 92] rapLocate 256,40
    rapLocate(256,40);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 93] jsfPrintInt rapUserSaveData[0]
    js_r_textbuffer=ee_printf("%d",rapUserSaveData[0]);
    rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 95] ENDIF
  }
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 98] tableCounter = 0
tableCounter=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 99] playerScore = 0
playerScore=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 100] CALL displayScoreboard(tableCounter)
displayScoreboard(tableCounter);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 103] do
for(;;)
  {
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 105] pad1=jsfGetPadPressed(LEFT_PAD)
    pad1=jsfGetPadPressed(LEFT_PAD);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 106] IF (pad1 BAND JAGPAD_OPTION) Then
    if((pad1 BAND JAGPAD_OPTION))
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 107] tableCounter++
        tableCounter++;
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 109] IF tableCounter > 4 Then
        if(tableCounter>4)
          {
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 110] tableCounter = 0
            tableCounter=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 111] ENDIF
          }
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 113] CALL displayScoreboard(tableCounter)
        displayScoreboard(tableCounter);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 115] ELSEIF (pad1 BAND JAGPAD_B) Then
      }
    else if((pad1 BAND JAGPAD_B))
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 117] CALL createHighscore
        createHighscore();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 119] ELSEIF (pad1 BAND JAGPAD_C) Then
      }
    else if((pad1 BAND JAGPAD_C))
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 121] CALL createDefaultScoreEntries(tableCounter)
        createDefaultScoreEntries(tableCounter);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 123] jsfEEPROMBoardWrite(tableCounter)
        jsfEEPROMBoardWrite(tableCounter);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 125] CALL displayScoreboard(tableCounter)
        displayScoreboard(tableCounter);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 127] ELSEIF (pad1 BAND JAGPAD_0) Then
      }
    else if((pad1 BAND JAGPAD_0))
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 129] rapUserSaveData[0] = 1 + (rapRND() & 4095)
        rapUserSaveData[0]=1+(rapRND()&4095);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 132] jsfEEPROMUserDataWrite()
        jsfEEPROMUserDataWrite();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 134] jsfSetFontIndx(1)
        jsfSetFontIndx(1);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 135] rapLocate 256,40
        rapLocate(256,40);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 136] print "        "
        js_r_textbuffer=ee_printf("%s","        ");
        rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 137] rapLocate 256,40
        rapLocate(256,40);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 138] jsfPrintInt rapUserSaveData[0]
        js_r_textbuffer=ee_printf("%d",rapUserSaveData[0]);
        rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 140] ENDIF
      }
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 142] VSYNC
    jsfVsync(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 144] loop
  }
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 149] sub createHighscore
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 267] FUNCTION CheckEEPROMExists%
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 291] sub createDefaultScores
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 303] sub createDefaultScoreEntries(tableCounter%)
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 324] sub setScoreboard(scoreboardToUse%)
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 345] sub displayScoreboard(scoreboardToUse%)
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


void createHighscore (void)
{
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 151] playerScore = rapRND() & 4095
  playerScore=rapRND()&4095;
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 153] call setScoreboard(tableCounter)
  setScoreboard(tableCounter);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 155] LOCAL inscoreboard AS SHORT
  static  short  inscoreboard;
  memset(&inscoreboard,0,sizeof(inscoreboard));
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 156] inscoreboard = 0
  inscoreboard=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 157] for i=0 to 9
  for(i=0; i<=9; i+=1)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 158] IF playerScore > highscoreBoard[i] THEN
      if(playerScore>highscoreBoard[i])
        {
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 159] inscoreboard=1
          inscoreboard=1;
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 160] ENDIF
        }
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 161] next i
    }
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 163] IF inscoreboard = 1 THEN
  if(inscoreboard==1)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 165] jsfSetFontIndx(0)
      jsfSetFontIndx(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 166] rapLocate 0,196
      rapLocate(0,196);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 167] rapPrint "DPAD UP/DOWN: Pick Letter"
      js_r_textbuffer=(char *)"DPAD UP/DOWN: Pick Letter";
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 168] rapLocate 0,204
      rapLocate(0,204);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 169] rapPrint "B=Choose letter.  A=Save Score"
      js_r_textbuffer=(char *)"B=Choose letter.  A=Save Score";
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 171] DIM RAW name[8] AS CHAR
      char  name[8];
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 173] name$ = "A       "
      strcpy(name,"A       ");
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 175] jsfSetFontIndx(1)
      jsfSetFontIndx(1);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 176] rapLocate 0,180
      rapLocate(0,180);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 177] rapPrint name$
      js_r_textbuffer=(char *)name;
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 179] jsfSetFontIndx(0)
      jsfSetFontIndx(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 180] rapLocate 0,188
      rapLocate(0,188);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 181] rapPrint "--------"
      js_r_textbuffer=(char *)"--------";
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 183] jsfSetFontIndx(0)
      jsfSetFontIndx(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 184] rapLocate 148,180
      rapLocate(148,180);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 185] rapPrint "Score:"
      js_r_textbuffer=(char *)"Score:";
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 187] jsfSetFontIndx(1)
      jsfSetFontIndx(1);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 188] rapLocate 200,180
      rapLocate(200,180);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 189] jsfPrintInt playerScore
      js_r_textbuffer=ee_printf("%d",playerScore);
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 191] LOCAL scorechar%
      static int     scorechar;
      memset(&scorechar,0,sizeof(scorechar));
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 191] scorechar=65
      scorechar=65;
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 192] LOCAL scorepos%
      static int     scorepos;
      memset(&scorepos,0,sizeof(scorepos));
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 192] scorepos=0
      scorepos=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 194] LOCAL nameEntered AS SHORT
      static  short  nameEntered;
      memset(&nameEntered,0,sizeof(nameEntered));
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 195] nameEntered = 0
      nameEntered=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 199] DO
      for(;;)
        {
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 201] pad1=jsfGetPadPressed(LEFT_PAD)
          pad1=jsfGetPadPressed(LEFT_PAD);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 203] IF pad1 BAND PAD_UP AND scorechar < 90 THEN
          if(pad1 BAND PAD_UP&&scorechar<90)
            {
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 204] scorechar++
              scorechar++;
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 205] name[scorepos] = scorechar
              name[scorepos]=scorechar;
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 206] rapLocate 0,180
              rapLocate(0,180);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 207] rapPrint name$
              js_r_textbuffer=(char *)name;
              rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 208] ELSEIF pad1 BAND PAD_DOWN AND scorechar > 32 THEN
            }
          else if(pad1 BAND PAD_DOWN&&scorechar>32)
            {
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 209] scorechar--
              scorechar--;
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 210] name[scorepos] = scorechar
              name[scorepos]=scorechar;
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 211] rapLocate 0,180
              rapLocate(0,180);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 212] rapPrint name$
              js_r_textbuffer=(char *)name;
              rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 213] ELSEIF pad1 BAND PAD_B AND scorepos < 7 THEN
            }
          else if(pad1 BAND PAD_B&&scorepos<7)
            {
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 215] scorepos++
              scorepos++;
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 217] name[scorepos] = ASC("A")
              name[scorepos]=65;
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 218] scorechar = name[scorepos]
              scorechar=name[scorepos];
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 220] rapLocate 0,180
              rapLocate(0,180);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 221] rapPrint name$
              js_r_textbuffer=(char *)name;
              rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 223] ELSEIF pad1 BAND PAD_A THEN
            }
          else if(pad1 BAND PAD_A)
            {
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 225] if rapHiscoreCheck(playerScore,name$,tableCounter) > 0 then
              if(rapHiscoreCheck(playerScore,name,tableCounter)>0)
                {
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 226] call rapHiscoreSort(tableCounter,name$)
                  rapHiscoreSort(tableCounter,name);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 228] jsfEEPROMBoardWrite(tableCounter)
                  jsfEEPROMBoardWrite(tableCounter);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 230] CALL displayScoreboard(tableCounter)
                  displayScoreboard(tableCounter);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 232] endif
                }
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 234] nameEntered = 1
              nameEntered=1;
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 236] ENDIF
            }
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 238] VSYNC
          jsfVsync(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 240] LOOP UNTIL nameEntered = 1
          if(nameEntered==1)
            {
              break;
            }
        }
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 244] jsfSetFontIndx(0)
      jsfSetFontIndx(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 245] rapLocate 0,196
      rapLocate(0,196);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 246] rapPrint "                          "
      js_r_textbuffer=(char *)"                          ";
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 247] rapLocate 0,204
      rapLocate(0,204);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 248] rapPrint "                              "
      js_r_textbuffer=(char *)"                              ";
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 249] rapLocate 0,180
      rapLocate(0,180);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 250] rapPrint "         "
      js_r_textbuffer=(char *)"         ";
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 251] rapLocate 0,188
      rapLocate(0,188);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 252] rapPrint "        "
      js_r_textbuffer=(char *)"        ";
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 253] rapLocate 148,180
      rapLocate(148,180);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 254] rapPrint "       "
      js_r_textbuffer=(char *)"       ";
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 255] rapLocate 200,180
      rapLocate(200,180);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 256] rapPrint "                "
      js_r_textbuffer=(char *)"                ";
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 258] ENDIF
    }
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 261] end sub
}


int CheckEEPROMExists (void)
{
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 269] DIM RAW savedVersion AS SHORT
  short  savedVersion;
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 271] savedVersion = jsfEEPROMWordRead(jsfEEPROMInitVersion)
  savedVersion=jsfEEPROMWordRead(jsfEEPROMInitVersion);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 273] jsfSetFontIndx(1)
  jsfSetFontIndx(1);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 274] rapLocate 112,56
  rapLocate(112,56);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 276] IF savedVersion <> EEPROMVERSION THEN
  if(savedVersion!=EEPROMVERSION)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 277] rapPrint "NO "
      js_r_textbuffer=(char *)"NO ";
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 278] jsfSetFontIndx(0)
      jsfSetFontIndx(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 279] FUNCTION = 0
      return 0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 280] ELSE
    }
  else
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 281] rapPrint "YES"
      js_r_textbuffer=(char *)"YES";
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 282] jsfSetFontIndx(0)
      jsfSetFontIndx(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 283] FUNCTION = 1
      return 1;
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 284] ENDIF
    }
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 286] END FUNCTION
}


void createDefaultScores (void)
{
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 293] for tableCounter = 0 TO 4
  for(tableCounter=0; tableCounter<=4; tableCounter+=1)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 295] createDefaultScoreEntries(tableCounter)
      createDefaultScoreEntries(tableCounter);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 297] next tableCounter
    }
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 299] end sub
}


void createDefaultScoreEntries (int tableCounter)
{
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 305] call setScoreboard(tableCounter)
  setScoreboard(tableCounter);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 307] for i=0 to 9
  for(i=0; i<=9; i+=1)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 308] highscoreBoard[i]=((10-i)*100*(tableCounter+1))
      highscoreBoard[i]=((10-i)*100*(tableCounter+1));
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 310] poke (highscoreNames + (8*i)),ASC("J")
      *(volatile unsigned char*)((highscoreNames+(8*i)))=(volatile unsigned char)      74;
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 311] poke (highscoreNames + (8*i) + 1),ASC("S")
      *(volatile unsigned char*)((highscoreNames+(8*i)+1))=(volatile unsigned char)      83;
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 312] poke (highscoreNames + (8*i) + 2),ASC("T")
      *(volatile unsigned char*)((highscoreNames+(8*i)+2))=(volatile unsigned char)      84;
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 313] poke (highscoreNames + (8*i) + 3),ASC("U")
      *(volatile unsigned char*)((highscoreNames+(8*i)+3))=(volatile unsigned char)      85;
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 314] poke (highscoreNames + (8*i) + 4),ASC("D")
      *(volatile unsigned char*)((highscoreNames+(8*i)+4))=(volatile unsigned char)      68;
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 315] poke (highscoreNames + (8*i) + 5),ASC("I")
      *(volatile unsigned char*)((highscoreNames+(8*i)+5))=(volatile unsigned char)      73;
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 316] poke (highscoreNames + (8*i) + 6),ASC("O")
      *(volatile unsigned char*)((highscoreNames+(8*i)+6))=(volatile unsigned char)      79;
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 317] poke (highscoreNames + (8*i) + 7),ASC("!")
      *(volatile unsigned char*)((highscoreNames+(8*i)+7))=(volatile unsigned char)      33;
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 318] next i
    }
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 320] end Sub
}


void setScoreboard (int scoreboardToUse)
{
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 325] if scoreboardToUse = 0 then
  if(scoreboardToUse==0)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 326] highscoreBoard = rapHighscores1Score
      highscoreBoard=rapHighscores1Score;
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 327] highscoreNames = (int)strptr(rapHighscores1Name[0])
      highscoreNames=(int)STRPTR(rapHighscores1Name[0]);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 328] elseif scoreboardToUse = 1 then
    }
  else if(scoreboardToUse==1)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 329] highscoreBoard = rapHighscores2Score
      highscoreBoard=rapHighscores2Score;
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 330] highscoreNames = (int)strptr(rapHighscores2Name[0])
      highscoreNames=(int)STRPTR(rapHighscores2Name[0]);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 331] elseif scoreboardToUse = 2 then
    }
  else if(scoreboardToUse==2)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 332] highscoreBoard = rapHighscores3Score
      highscoreBoard=rapHighscores3Score;
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 333] highscoreNames = (int)strptr(rapHighscores3Name[0])
      highscoreNames=(int)STRPTR(rapHighscores3Name[0]);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 334] elseif scoreboardToUse = 3 then
    }
  else if(scoreboardToUse==3)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 335] highscoreBoard = rapHighscores4Score
      highscoreBoard=rapHighscores4Score;
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 336] highscoreNames = (int)strptr(rapHighscores4Name[0])
      highscoreNames=(int)STRPTR(rapHighscores4Name[0]);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 337] elseif scoreboardToUse = 4 then
    }
  else if(scoreboardToUse==4)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 338] highscoreBoard = rapHighscores5Score
      highscoreBoard=rapHighscores5Score;
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 339] highscoreNames = (int)strptr(rapHighscores5Name[0])
      highscoreNames=(int)STRPTR(rapHighscores5Name[0]);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 340] endif
    }
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 341] end sub
}


void displayScoreboard (int scoreboardToUse)
{
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 347] LOCAL displayName[9] AS CHAR
  static  char  displayName[9];
  memset(&displayName,0,sizeof(displayName));
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 348] LOCAL srcname%,dstname%
  static int     srcname;
  memset(&srcname,0,sizeof(srcname));
  static int     dstname;
  memset(&dstname,0,sizeof(dstname));
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 349] LOCAL placeCounter[3] AS CHAR
  static  char  placeCounter[3];
  memset(&placeCounter,0,sizeof(placeCounter));
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 351] jsfSetFontIndx(1)
  jsfSetFontIndx(1);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 352] rapLocate 0,166
  rapLocate(0,166);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 353] PRINT "SCOREBOARD ";scoreboardToUse+1;" of 5"
  js_r_textbuffer=ee_printf("%s% d%s","SCOREBOARD ",(int)scoreboardToUse+1," of 5");
  rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 355] call setScoreboard(scoreboardToUse)
  setScoreboard(scoreboardToUse);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 357] dstname=(int)strptr(displayName$)
  dstname=(int)STRPTR(displayName);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 358] mid$(displayName$,9,1)=""
  midstr(displayName,9,1,"");
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 361] for i=0 to 9
  for(i=0; i<=9; i+=1)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 362] rapLocate 0,80+i*8
      rapLocate(0,80+i*8);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 363] rapPrint "                               "
      js_r_textbuffer=(char *)"                               ";
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 364] next i
    }
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 367] for i=0 to 9
  for(i=0; i<=9; i+=1)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 368] rapLocate 0,80+i*8
      rapLocate(0,80+i*8);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 370] srcname = highscoreNames + (8*i)
      srcname=highscoreNames+(8*i);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 371] lpoke dstname,lpeek(srcname)
      *(volatile unsigned int*)(dstname)=(volatile unsigned int)      lpeek(srcname);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 372] lpoke dstname+4,lpeek(srcname+4)
      *(volatile unsigned int*)(dstname+4)=(volatile unsigned int)      lpeek(srcname+4);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 374] rapNumToStr(i+1,1,placeCounter$)
      rapNumToStr(i+1,1,placeCounter);
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 375] PRINT placeCounter$;" - ";displayName$;" -";highscoreBoard[i]
      js_r_textbuffer=ee_printf("%s%s%s%s% d",placeCounter," - ",displayName," -",(int)highscoreBoard[i]);
      rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 376] next i
    }
// [F:\Jaguar\Tools\JagStudio\projects\basic\eeprom\eeprom.bas - 378] end sub
}


