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
//               User Prototypes
// *************************************************
void    DRAWMAZE (void);

// *************************************************
//            User Defined Constants
// *************************************************

#define Angle360 480
#define Angle270 360
#define Angle180 240
#define Angle90 120
#define Angle60 80
#define Angle45 60
#define Angle30 40
#define Angle6 8
#define cy 120

// *************************************************
//            User Global Variables
// *************************************************

static int     lineb;
static int     linestart;
static int     ray;
static int     angle;
static int     pangle;
static int     wall;
static int     distance;
static int     height;
static float   stepx;
static float   stepy;
static float   playerx;
static float   playery;
static float   rayx;
static float   rayy;
static float   oldplayerx;
static float   oldplayery;
static int     rayxt;
static int     rayyt;
static int     playerxt;
static int     playeryt;
static int     pad1;
static float   getangle;
static int     playeraction;
static int     gfxlineb1;
static int     gfxlineb2;
static float   fixtmp;
static int     linesx[80];
static int     linesy[80];
static int     linesy2[80];
static int     linescol[80];
static float   fiix[80];
static float   TSIN[480];
static float   TCOS[480];

void    INPUT (void);


// *************************************************
//            User Global Initialized Arrays
// *************************************************


// *************************************************
//              User GLOBAL SET Statements
// *************************************************

static int map[][16]=
{
  {1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2},
  {2,0,1,0,0,0,1,0,2,0,0,0,0,0,0,1},
  {1,0,2,0,0,0,2,0,1,0,1,0,2,0,0,2},
  {2,0,1,0,0,0,1,0,2,0,1,2,2,2,2,1},
  {1,0,2,0,0,0,2,0,1,0,0,0,0,0,0,2},
  {2,0,1,1,1,1,1,0,2,2,1,2,1,2,0,1},
  {1,0,0,0,0,0,0,0,0,1,0,0,0,1,0,2},
  {2,0,2,0,1,0,1,0,0,0,0,0,0,2,0,1},
  {1,0,0,0,0,0,0,0,0,1,0,0,0,1,0,2},
  {2,0,1,0,2,0,1,0,0,2,1,2,1,2,0,1},
  {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
  {2,0,2,0,1,0,1,0,0,1,1,1,1,1,0,1},
  {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
  {2,0,1,0,2,0,1,0,0,2,2,2,2,2,0,1},
  {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2},
  {2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1}
};


// *************************************************
//                  Main Program
// *************************************************

void basicmain()
{
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 14] jsfSetFontIndx(1)
jsfSetFontIndx(1);
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 15] jsfSetFontSize(1)
jsfSetFontSize(1);
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 16] rapLocate 32,18
rapLocate(32,18);
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 17] rapPrint "Please Wait: Calculating values!!"
js_r_textbuffer=(char *)"Please Wait: Calculating values!!";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 20] DIM lineb%
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 20] lineb = 1
lineb=1;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 21] DIM linestart%
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 21] linestart = 2
linestart=2;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 25] CONST Angle360% = 480
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 26] CONST Angle270% = 360
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 27] CONST Angle180% = 240
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 28] CONST Angle90% = 120
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 29] CONST Angle6%0% = 80
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 30] CONST Angle45% = 60
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 31] CONST Angle30% = 40
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 32] CONST Angle6% = 8
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 34] DIM ray%
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 34] ray=0
ray=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 35] DIM angle%
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 35] angle = 0
angle=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 36] DIM pangle%
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 36] pangle = 0
pangle=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 37] DIM wall%
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 37] wall = 0
wall=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 38] DIM distance%
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 38] distance=  0
distance=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 39] DIM height%
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 39] height = 0
height=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 41] DIM stepx!
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 41] stepx = 0
stepx=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 42] DIM stepy!
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 42] stepy = 0
stepy=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 43] DIM playerx!
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 43] playerx = 0
playerx=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 44] DIM playery!
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 44] playery = 0
playery=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 45] DIM rayx!
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 45] rayx = 0
rayx=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 46] DIM rayy!
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 46] rayy = 0
rayy=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 47] DIM oldplayerx!
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 47] oldplayerx = 0
oldplayerx=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 48] DIM oldplayery!
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 48] oldplayery = 0
oldplayery=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 51] DIM rayxt%
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 51] rayxt = 0
rayxt=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 52] DIM rayyt%
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 52] rayyt = 0
rayyt=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 53] DIM playerxt%
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 53] playerxt    = 0
playerxt=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 54] DIM playeryt%
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 54] playeryt    = 0
playeryt=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 56] DIM pad1%
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 56] pad1=0
pad1=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 57] DIM getangle!
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 57] getangle = 3.14159265358979323846 / 240.0
getangle=3.14159265358979323846/240.0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 58] CONST cy% = 120
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 59] DIM playeraction%
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 59] playeraction = 0
playeraction=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 60] DIM linesx%[80]
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 60] linesx[80]
linesx[80];
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 61] DIM linesy%[80]
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 61] linesy[80]
linesy[80];
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 62] DIM linesy2%[80]
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 62] linesy2[80]
linesy2[80];
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 63] DIM linescol%[80]
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 63] linescol[80]
linescol[80];
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 67] dim gfxlineb1%
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 68] gfxlineb1=sprite[lineb].gfxbase
gfxlineb1=sprite[lineb].gfxbase;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 69] dim gfxlineb2%
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 70] gfxlineb2=sprite[linestart].gfxbase
gfxlineb2=sprite[linestart].gfxbase;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 73] for int i = 0 to 79
  {register int i;
for(i=0; i<=79; i+=1)
  {
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 74] linesx[i] = (i*4)<<16
    linesx[i]=(i*4)<<16;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 75] linesy[i] = 0<<16
    linesy[i]=0<<16;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 76] linesy2[i] = 50
    linesy2[i]=50;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 77] linescol[i] = gfxlineb1
    linescol[i]=gfxlineb1;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 78] next i
  }
  }
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 80] jsfSprlistFieldSet(linestart,R_sprite_x,80,strptr(linesx))
jsfSprlistFieldSet(linestart,R_sprite_x,80,STRPTR(linesx));
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 84] playerx = 8
playerx=8;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 85] playery = 8
playery=8;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 86] pangle = 0
pangle=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 89] SET map[][16] AS integer
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 110] DIM fiix![80]
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 110] fiix[80]
fiix[80];
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 111] DIM fixtmp!
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 111] fixtmp = 0
fixtmp=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 112] FOR INT i = 0 TO 79
  {register int i;
for(i=0; i<=79; i+=1)
  {
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 113] fiix[i] = (i+1 - Angle30%) % Angle360%
    fiix[i]=(i+1-Angle30) % Angle360;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 114] IF fiix[i] < 0 THEN
    if(fiix[i]<0)
      {
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 115] fiix[i] = Angle360% + fiix[i]
        fiix[i]=Angle360+fiix[i];
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 116] ENDIF
      }
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 117] fiix[i] = ( 1.0 / COS( getangle * fiix[i] ) ) / 8
    fiix[i]=(1.0/cos(getangle*fiix[i]))/8;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 118] NEXT i
  }
  }
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 121] DIM TSIN![480]
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 121] TSIN[480]
TSIN[480];
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 122] DIM TCOS![480]
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 122] TCOS[480]
TCOS[480];
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 123] FOR INT i = 0 TO 479
  {register int i;
for(i=0; i<=479; i+=1)
  {
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 124] TCOS[i] = COS( getangle * i )
    TCOS[i]=cos(getangle*i);
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 125] TSIN[i] = SIN( getangle * i )
    TSIN[i]=sin(getangle*i);
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 126] NEXT i
  }
  }
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 128] CLS
cls();
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 131] CALL DRAWMAZE
DRAWMAZE();
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 133] rapLocate 72,0
rapLocate(72,0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 134] rapPrint "DPAD LEFT/RIGHT/UP/DOWN"
js_r_textbuffer=(char *)"DPAD LEFT/RIGHT/UP/DOWN";
rapPrint();
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 140] DO
for(;;)
  {
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 141] CALL INPUT
    INPUT();
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 142] VSYNC
    jsfVsync(0);
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 143] LOOP
  }
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 150] SUB DRAWMAZE
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 222] SUB INPUT
  while(1) {};   //  End of main program
}

// *************************************************
//                 Runtime Functions
// *************************************************


// ************************************
//       User Subs and Functions
// ************************************


void DRAWMAZE (void)
{
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 153] angle = pangle - Angle30%
  angle=pangle-Angle30;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 156] FOR ray = 0 TO 79
  for(ray=0; ray<=79; ray+=1)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 159] angle = angle % Angle360%
      angle=angle % Angle360;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 160] IF angle < 0 THEN
      if(angle<0)
        {
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 161] angle = Angle360% + angle
          angle=Angle360+angle;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 162] ENDIF
        }
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 165] rayx = playerx
      rayx=playerx;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 166] rayy = playery
      rayy=playery;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 170] fixtmp = fiix[ray]
      fixtmp=fiix[ray];
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 171] stepx = (TCOS[angle] * fixtmp)
      stepx=(TCOS[angle]*fixtmp);
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 172] stepy = (TSIN[angle] * fixtmp)
      stepy=(TSIN[angle]*fixtmp);
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 175] wall = 0
      wall=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 176] distance = 1
      distance=1;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 179] while wall = 0
      while(wall==0)
        {
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 181] rayx += stepx
          rayx+=stepx;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 182] rayy += stepy
          rayy+=stepy;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 184] rayxt = rayx
          rayxt=rayx;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 185] rayyt = rayy
          rayyt=rayy;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 187] wall = map%[rayxt][rayyt]
          wall=map[rayxt][rayyt];
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 189] distance++
          distance++;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 190] WEND
        }
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 193] height = 1024 / distance
      height=1024/distance;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 196] IF wall = 1 THEN
      if(wall==1)
        {
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 197] linescol[ray] = gfxlineb1
          linescol[ray]=gfxlineb1;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 198] ELSEIF wall = 2 THEN
        }
      else if(wall==2)
        {
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 199] linescol[ray] = gfxlineb2
          linescol[ray]=gfxlineb2;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 200] ENDIF
        }
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 202] linesy[ray] = (cy% - height)<<16
      linesy[ray]=(cy-height)<<16;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 203] linesy2[ray] = (cy% + height) - (cy% - height)
      linesy2[ray]=(cy+height)-(cy-height);
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 204] IF linesy2[ray] > 240 THEN
      if(linesy2[ray]>240)
        {
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 205] linesy2[ray] = 240
          linesy2[ray]=240;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 206] ENDIF
        }
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 209] angle++
      angle++;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 211] next ray
    }
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 214] jsfSprlistFieldSet(linestart,R_sprite_y,80,strptr(linesy))
  jsfSprlistFieldSet(linestart,R_sprite_y,80,STRPTR(linesy));
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 215] jsfSprlistFieldSet(linestart,R_sprite_height,80,strptr(linesy2))
  jsfSprlistFieldSet(linestart,R_sprite_height,80,STRPTR(linesy2));
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 216] jsfSprlistFieldSet(linestart,R_sprite_gfxbase,80,strptr(linescol))
  jsfSprlistFieldSet(linestart,R_sprite_gfxbase,80,STRPTR(linescol));
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 218] END SUB
}


void INPUT (void)
{
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 224] pad1=jsfGetPad(1)
  pad1=jsfGetPad(1);
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 226] playeraction = 0
  playeraction=0;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 228] IF (pad1 BAND JAGPAD_LEFT) THEN
  if((pad1 BAND JAGPAD_LEFT))
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 229] playeraction = 1
      playeraction=1;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 230] ELSEIF (pad1 BAND JAGPAD_RIGHT) THEN
    }
  else if((pad1 BAND JAGPAD_RIGHT))
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 231] playeraction = 2
      playeraction=2;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 232] ELSEIF (pad1 BAND JAGPAD_UP)  THEN
    }
  else if((pad1 BAND JAGPAD_UP))
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 233] playeraction = 3
      playeraction=3;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 234] ELSEIF (pad1 BAND JAGPAD_DOWN)  THEN
    }
  else if((pad1 BAND JAGPAD_DOWN))
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 235] playeraction = 4
      playeraction=4;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 236] ENDIF
    }
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 239] IF playeraction = 3 THEN
  if(playeraction==3)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 241] oldplayerx = playerx
      oldplayerx=playerx;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 242] oldplayery = playery
      oldplayery=playery;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 245] playerx += TCOS[pangle] / 4
      playerx+=TCOS[pangle]/4;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 246] playery += TSIN[pangle] / 4
      playery+=TSIN[pangle]/4;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 248] playerxt = playerx
      playerxt=playerx;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 249] playeryt = playery
      playeryt=playery;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 252] IF map%[playerxt][playeryt] > 0 THEN
      if(map[playerxt][playeryt]>0)
        {
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 253] playerx = oldplayerx
          playerx=oldplayerx;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 254] playery = oldplayery
          playery=oldplayery;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 255] ENDIF
        }
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 257] CALL DRAWMAZE
      DRAWMAZE();
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 258] ELSEIF playeraction = 4 THEN
    }
  else if(playeraction==4)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 261] oldplayerx = playerx
      oldplayerx=playerx;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 262] oldplayery = playery
      oldplayery=playery;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 264] playerx -= TCOS[pangle] / 4
      playerx-=TCOS[pangle]/4;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 265] playery -= TSIN[pangle] / 4
      playery-=TSIN[pangle]/4;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 267] playerxt = playerx
      playerxt=playerx;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 268] playeryt = playery
      playeryt=playery;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 270] IF map%[playerxt][playeryt] > 0 THEN
      if(map[playerxt][playeryt]>0)
        {
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 271] playerx = oldplayerx
          playerx=oldplayerx;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 272] playery = oldplayery
          playery=oldplayery;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 273] ENDIF
        }
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 275] CALL DRAWMAZE
      DRAWMAZE();
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 276] ELSEIF playeraction = 1 THEN
    }
  else if(playeraction==1)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 277] pangle -= Angle6%
      pangle-=Angle6;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 278] pangle = pangle % 480
      pangle=pangle % 480;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 279] IF pangle < 0 THEN
      if(pangle<0)
        {
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 280] pangle = 480 + pangle
          pangle=480+pangle;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 281] ENDIF
        }
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 283] CALL DRAWMAZE
      DRAWMAZE();
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 284] ELSEIF playeraction = 2 THEN
    }
  else if(playeraction==2)
    {
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 285] pangle += Angle6%
      pangle+=Angle6;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 286] pangle = pangle % 480
      pangle=pangle % 480;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 287] IF pangle < 0 THEN
      if(pangle<0)
        {
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 288] pangle = 480 + angle
          pangle=480+angle;
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 289] ENDIF
        }
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 291] CALL DRAWMAZE
      DRAWMAZE();
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 292] ENDIF
    }
// [F:\Jaguar\Tools\JagStudio\projects\basic\raycaster\raycaster.bas - 294] END SUB
}


