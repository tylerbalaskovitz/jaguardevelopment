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
#define FINT(a)floor(a)
// *************************************************
//               Standard Prototypes
// *************************************************

// *************************************************
//            User Global Variables
// *************************************************

static int     stars;
static int     ship;
static int     enemy1;
static int     enemy2;
static int     enemy3;
static int     enemy4;
static int     enemy5;
static int     framecounter;
static int     pad1;
static int     ship_pos;
static int     stars_gfx_loc;
static int     ship_gfx_loc;
static int     stars_gfx_size;
static int     ship_gfx_size;
static int     xunt;
static int     enemy_x;
static int     ticker;
static int     tocker;
static int     tucker;
static int     check_enemy_active;
static int     check_for_hit_enemy;
static int     bulletctr;
static int     bullettime;
static int     bulletdelay;
static int     maxbullets;
static int     randy;
static int     exp_max;
static int     exp_multiplier;
static int     cd_flag;
static int     i;
static int     j;
static float   pie;
static float   rads;
static int     bullets[11];
static int     explosions[6];
static int     bigsplosions[6];
static int     sins[720];

float   rnd (void);

// *************************************************
//               User Prototypes
// *************************************************

void    check_collision (void);
void    move_enemies (void);
void    check_pad (void);
void    choose_stars_frame (void);


// *************************************************
//            User Global Initialized Arrays
// *************************************************


// *************************************************
//                  Main Program
// *************************************************

void basicmain()
{
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 18] DIM stars%
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 18] stars=1
stars=1;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 19] DIM ship%
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 19] ship=2
ship=2;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 20] DIM enemy1%
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 20] enemy1=3
enemy1=3;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 21] DIM enemy2%
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 21] enemy2=4
enemy2=4;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 22] DIM enemy3%
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 22] enemy3=5
enemy3=5;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 23] DIM enemy4%
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 23] enemy4=6
enemy4=6;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 24] DIM enemy5%
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 24] enemy5=7
enemy5=7;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 25] DIM bullets%[11]
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 26] bullets[0]=0
bullets[0]=0;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 27] bullets[1]=8
bullets[1]=8;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 28] bullets[2]=9
bullets[2]=9;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 29] bullets[3]=10
bullets[3]=10;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 30] bullets[4]=11
bullets[4]=11;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 31] bullets[5]=12
bullets[5]=12;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 32] bullets[6]=13
bullets[6]=13;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 33] bullets[7]=14
bullets[7]=14;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 34] bullets[8]=15
bullets[8]=15;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 35] bullets[9]=16
bullets[9]=16;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 36] bullets[10]=17
bullets[10]=17;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 37] DIM explosions%[6]
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 38] explosions[0]=0
explosions[0]=0;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 39] explosions[1]=18
explosions[1]=18;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 40] explosions[2]=19
explosions[2]=19;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 41] explosions[3]=20
explosions[3]=20;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 42] explosions[4]=21
explosions[4]=21;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 43] explosions[5]=22
explosions[5]=22;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 44] DIM bigsplosions%[6]
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 45] bigsplosions[0]=0
bigsplosions[0]=0;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 46] bigsplosions[1]=23
bigsplosions[1]=23;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 47] bigsplosions[2]=24
bigsplosions[2]=24;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 48] bigsplosions[3]=25
bigsplosions[3]=25;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 49] bigsplosions[4]=26
bigsplosions[4]=26;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 50] bigsplosions[5]=27
bigsplosions[5]=27;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 56] DIM     framecounter%
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 56] framecounter=0
framecounter=0;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 57] DIM     pad1%
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 57] pad1=0
pad1=0;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 58] DIM     ship_pos%
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 58] ship_pos=0
ship_pos=0;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 59] DIM     stars_gfx_loc%
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 59] stars_gfx_loc=0
stars_gfx_loc=0;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 60] DIM     ship_gfx_loc%
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 60] ship_gfx_loc=0
ship_gfx_loc=0;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 61] DIM     stars_gfx_size%
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 61] stars_gfx_size=0
stars_gfx_size=0;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 62] DIM     ship_gfx_size%
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 62] ship_gfx_size=0
ship_gfx_size=0;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 63] DIM     xunt%
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 63] xunt=0
xunt=0;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 64] DIM     enemy_x%
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 64] enemy_x=160
enemy_x=160;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 65] DIM     ticker%
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 65] ticker=0
ticker=0;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 66] DIM     tocker%
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 66] tocker=0
tocker=0;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 67] DIM     tucker%
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 67] tucker=0
tucker=0;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 68] DIM     check_enemy_active%
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 68] check_enemy_active=0
check_enemy_active=0;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 69] DIM     check_for_hit_enemy%
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 69] check_for_hit_enemy=0
check_for_hit_enemy=0;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 70] DIM     bulletctr%
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 70] bulletctr=1
bulletctr=1;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 71] DIM     bullettime%
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 71] bullettime=0
bullettime=0;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 72] DIM     bulletdelay%
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 72] bulletdelay=3
bulletdelay=3;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 73] DIM     maxbullets%
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 73] maxbullets=10
maxbullets=10;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 74] DIM     randy%
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 74] randy=0
randy=0;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 75] DIM     exp_max%
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 75] exp_max=0
exp_max=0;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 76] DIM     exp_multiplier%
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 76] exp_multiplier=0
exp_multiplier=0;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 77] DIM     cd_flag%
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 77] cd_flag=0
cd_flag=0;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 78] DIM     i%
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 78] i=0
i=0;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 79] DIM     j%
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 79] j=0
j=0;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 80] DIM     pie!
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 80] pie=3.1415926535897932384626433832795
pie=3.1415926535897932384626433832795;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 81] DIM     rads!
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 81] rads=(pie/180)
rads=(pie/180);
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 83] DIM sins%[720]
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 84] FOR i=0 to 359
for(i=0; i<=359; i+=1)
  {
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 85] sins[i]=(int)INT((sin(i*rads))*64)
    sins[i]=(int)FINT((sin(i*rads))*64);
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 86] sins[i+360]=sins[i]
    sins[i+360]=sins[i];
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 87] NEXT
  }
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 94] stars_gfx_loc=sprite[stars].gfxbase
stars_gfx_loc=sprite[stars].gfxbase;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 106] stars_gfx_size=sprite[stars].framesz
stars_gfx_size=sprite[stars].framesz;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 111] ship_gfx_loc=sprite[ship].gfxbase
ship_gfx_loc=sprite[ship].gfxbase;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 112] ship_gfx_size=sprite[ship].framesz
ship_gfx_size=sprite[ship].framesz;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 118] jsfLoadClut(strptr(STARS_clut),10,16)
jsfLoadClut((unsigned short *)STRPTR(STARS_clut),10,16);
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 119] jsfLoadClut(strptr(SHIP_clut),14,16)
jsfLoadClut((unsigned short *)STRPTR(SHIP_clut),14,16);
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 120] jsfLoadClut(strptr(ENEMY_clut),13,16)
jsfLoadClut((unsigned short *)STRPTR(ENEMY_clut),13,16);
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 121] jsfLoadClut(strptr(BULLET_clut),12,16)
jsfLoadClut((unsigned short *)STRPTR(BULLET_clut),12,16);
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 122] jsfLoadClut(strptr(BOOM_clut),11,16)
jsfLoadClut((unsigned short *)STRPTR(BOOM_clut),11,16);
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 128] sprite[stars].gfxbase = stars_gfx_loc+(stars_gfx_size*5)
sprite[stars].gfxbase=stars_gfx_loc+(stars_gfx_size*5);
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 130] exp_max=sprite[explosions[1]].maxframe
exp_max=sprite[explosions[1]].maxframe;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 137] DO
for(;;)
  {
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 139] CALL move_enemies
    move_enemies();
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 141] ship_pos = sprite[ship].x
    ship_pos=sprite[ship].x;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 143] pad1=jsfGetPad(1)
    pad1=jsfGetPad(1);
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 145] CALL check_pad
    check_pad();
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 147] CALL choose_stars_frame
    choose_stars_frame();
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 149] VSYNC
    jsfVsync(0);
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 151] CALL check_collision
    check_collision();
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 153] framecounter++
    framecounter++;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 154] IF framecounter=60 THEN
    if(framecounter==60)
      {
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 155] framecounter=0
        framecounter=0;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 156] ENDIF
      }
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 157] ticker=ticker+2
    ticker+=2;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 158] IF ticker=360 THEN
    if(ticker==360)
      {
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 159] ticker=0
        ticker=0;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 160] ENDIF
      }
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 161] tocker=tocker+1
    tocker+=1;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 162] IF tocker=1080 THEN
    if(tocker==1080)
      {
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 163] tocker=0
        tocker=0;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 164] ENDIF
      }
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 165] bullettime++
    bullettime++;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 166] LOOP
  }
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 172] SUB check_collision
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 204] SUB move_enemies
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 217] SUB check_pad
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 249] SUB choose_stars_frame
  while(1) {};   //  End of main program
}

// *************************************************
//                 Runtime Functions
// *************************************************

float rnd (void)
{
  return (float)rand()/RAND_MAX;
}



// ************************************
//       User Subs and Functions
// ************************************


void check_collision (void)
{
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 173] cd_flag=rapCollide(bullets[1],bullets[10],enemy1,enemy5)
  cd_flag=rapCollide(bullets[1],bullets[10],enemy1,enemy5);
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 175] IF cd_flag>-1 THEN
  if(cd_flag>-1)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 177] FOR i=0 TO 4
      for(i=0; i<=4; i+=1)
        {
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 178] check_for_hit_enemy=sprite[enemy1+i].was_hit
          check_for_hit_enemy=sprite[enemy1+i].was_hit;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 179] IF check_for_hit_enemy<>-1 THEN
          if(check_for_hit_enemy!=-1)
            {
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 180] sprite[enemy1+i].was_hit = -1
              sprite[enemy1+i].was_hit=-1;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 181] xunt=sprite[enemy1+i].x
              xunt=sprite[enemy1+i].x;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 182] sprite[i+1[explosions]].x = xunt
              sprite[i+1[explosions]].x=xunt;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 183] sprite[i+1[bigsplosions]].x = xunt-(16<<16)
              sprite[i+1[bigsplosions]].x=xunt-(16<<16);
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 184] xunt=sprite[enemy1+i].y
              xunt=sprite[enemy1+i].y;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 185] sprite[i+1[explosions]].y = xunt+(10<<16)
              sprite[i+1[explosions]].y=xunt+(10<<16);
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 186] randy=int(INT(RND*8))
              randy=FINT(FINT(rnd()*8));
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 187] sprite[i+1[bigsplosions]].y = xunt-(randy<<16)
              sprite[i+1[bigsplosions]].y=xunt-(randy<<16);
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 188] sprite[i+1[explosions]].curframe = exp_max
              sprite[i+1[explosions]].curframe=exp_max;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 189] sprite[i+1[bigsplosions]].curframe = exp_max
              sprite[i+1[bigsplosions]].curframe=exp_max;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 190] sprite[i+1[explosions]].active = R_is_active
              sprite[i+1[explosions]].active=R_is_active;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 191] sprite[i+1[bigsplosions]].active = R_is_active
              sprite[i+1[bigsplosions]].active=R_is_active;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 193] sprite[enemy1+i].scaled = R_spr_scale
              sprite[enemy1+i].scaled=R_spr_scale;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 194] sprite[enemy1+i].scale_x = 48
              sprite[enemy1+i].scale_x=48;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 195] sprite[enemy1+i].scale_y = 48
              sprite[enemy1+i].scale_y=48;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 197] ENDIF
            }
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 198] NEXT i
        }
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 199] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 200] ENDSUB
}


void move_enemies (void)
{
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 205] tucker=tocker/3
  tucker=tocker/3;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 207] FOR i=0 TO 4
  for(i=0; i<=4; i+=1)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 208] xunt=i*72
      xunt=i*72;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 209] sprite[enemy1+i].x = ((160+(ticker+xunt)[sins])<<16)
      sprite[enemy1+i].x=((160+(ticker+xunt)[sins])<<16);
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 210] sprite[enemy1+i].y = (60<<16)+((tucker+xunt)[sins]<<14)
      sprite[enemy1+i].y=(60<<16)+((tucker+xunt)[sins]<<14);
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 211] NEXT i
    }
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 213] END SUB
}


void check_pad (void)
{
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 218] IF pad1 BAND JAGPAD_LEFT AND ship_pos>(86<<16) THEN
  if(pad1 BAND JAGPAD_LEFT&&ship_pos>(86<<16))
    {
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 219] sprite[ship].x = ship_pos-(2<<16)
      sprite[ship].x=ship_pos-(2<<16);
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 220] sprite[ship].gfxbase = ship_gfx_loc+ship_gfx_size
      sprite[ship].gfxbase=ship_gfx_loc+ship_gfx_size;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 221] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 223] IF pad1 BAND JAGPAD_RIGHT AND ship_pos<(208<<16) THEN
  if(pad1 BAND JAGPAD_RIGHT&&ship_pos<(208<<16))
    {
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 224] sprite[ship].x = ship_pos+(2<<16)
      sprite[ship].x=ship_pos+(2<<16);
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 225] sprite[ship].gfxbase = ship_gfx_loc+(ship_gfx_size*2)
      sprite[ship].gfxbase=ship_gfx_loc+(ship_gfx_size*2);
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 226] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 228] IF pad1=0 OR pad1= JAGPAD_B THEN
  if(pad1==0||pad1==JAGPAD_B)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 229] sprite[ship].gfxbase = ship_gfx_loc
      sprite[ship].gfxbase=ship_gfx_loc;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 230] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 232] IF pad1 BAND JAGPAD_B AND bullettime>=bulletdelay THEN
  if(pad1 BAND JAGPAD_B&&bullettime>=bulletdelay)
    {
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 233] bullettime=0
      bullettime=0;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 234] sprite[bulletctr[bullets]].x = ship_pos+(9<<16)
      sprite[bulletctr[bullets]].x=ship_pos+(9<<16);
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 235] sprite[bulletctr[bullets]].y = (166<<16)
      sprite[bulletctr[bullets]].y=(166<<16);
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 236] sprite[bulletctr[bullets]].colchk = R_can_hit
      sprite[bulletctr[bullets]].colchk=R_can_hit;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 237] sprite[bulletctr[bullets]].was_hit = -1
      sprite[bulletctr[bullets]].was_hit=-1;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 238] sprite[bulletctr[bullets]].hitpoint = 10
      sprite[bulletctr[bullets]].hitpoint=10;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 239] sprite[bulletctr[bullets]].active = R_is_active
      sprite[bulletctr[bullets]].active=R_is_active;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 240] bulletctr++
      bulletctr++;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 241] IF bulletctr=maxbullets+1 THEN
      if(bulletctr==maxbullets+1)
        {
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 242] bulletctr=1
          bulletctr=1;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 243] ENDIF
        }
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 244] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 245] END SUB
}


void choose_stars_frame (void)
{
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 250] ship_pos=sprite[ship].x
  ship_pos=sprite[ship].x;
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 252] IF ship_pos<=(100<<16) THEN
  if(ship_pos<=(100<<16))
    {
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 253] sprite[stars].gfxbase = stars_gfx_loc+(stars_gfx_size*0)
      sprite[stars].gfxbase=stars_gfx_loc+(stars_gfx_size*0);
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 254] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 255] IF ship_pos>(100<<16)  AND ship_pos <=(110<<16)  THEN
  if(ship_pos>(100<<16)&&ship_pos<=(110<<16))
    {
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 256] sprite[stars].gfxbase = stars_gfx_loc+(stars_gfx_size*1)
      sprite[stars].gfxbase=stars_gfx_loc+(stars_gfx_size*1);
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 257] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 258] IF ship_pos>(110<<16)  AND ship_pos <=(120<<16)  THEN
  if(ship_pos>(110<<16)&&ship_pos<=(120<<16))
    {
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 259] sprite[stars].gfxbase = stars_gfx_loc+(stars_gfx_size*2)
      sprite[stars].gfxbase=stars_gfx_loc+(stars_gfx_size*2);
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 260] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 261] IF ship_pos>(120<<16)  AND ship_pos <=(130<<16)  THEN
  if(ship_pos>(120<<16)&&ship_pos<=(130<<16))
    {
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 262] sprite[stars].gfxbase = stars_gfx_loc+(stars_gfx_size*3)
      sprite[stars].gfxbase=stars_gfx_loc+(stars_gfx_size*3);
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 263] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 264] IF ship_pos>(130<<16)  AND ship_pos <=(140<<16)  THEN
  if(ship_pos>(130<<16)&&ship_pos<=(140<<16))
    {
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 265] sprite[stars].gfxbase = stars_gfx_loc+(stars_gfx_size*4)
      sprite[stars].gfxbase=stars_gfx_loc+(stars_gfx_size*4);
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 266] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 267] IF ship_pos>(140<<16)  AND ship_pos <=(150<<16)  THEN
  if(ship_pos>(140<<16)&&ship_pos<=(150<<16))
    {
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 268] sprite[stars].gfxbase = stars_gfx_loc+(stars_gfx_size*5)
      sprite[stars].gfxbase=stars_gfx_loc+(stars_gfx_size*5);
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 269] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 270] IF ship_pos>(150<<16)  AND ship_pos <=(160<<16)  THEN
  if(ship_pos>(150<<16)&&ship_pos<=(160<<16))
    {
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 271] sprite[stars].gfxbase = stars_gfx_loc+(stars_gfx_size*6)
      sprite[stars].gfxbase=stars_gfx_loc+(stars_gfx_size*6);
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 272] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 273] IF ship_pos>(160<<16)  AND ship_pos <=(170<<16)  THEN
  if(ship_pos>(160<<16)&&ship_pos<=(170<<16))
    {
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 274] sprite[stars].gfxbase = stars_gfx_loc+(stars_gfx_size*7)
      sprite[stars].gfxbase=stars_gfx_loc+(stars_gfx_size*7);
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 275] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 276] IF ship_pos>(170<<16)  AND ship_pos <=(180<<16)  THEN
  if(ship_pos>(170<<16)&&ship_pos<=(180<<16))
    {
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 277] sprite[stars].gfxbase = stars_gfx_loc+(stars_gfx_size*8)
      sprite[stars].gfxbase=stars_gfx_loc+(stars_gfx_size*8);
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 278] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 279] IF ship_pos>(180<<16)  AND ship_pos <=(190<<16)  THEN
  if(ship_pos>(180<<16)&&ship_pos<=(190<<16))
    {
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 280] sprite[stars].gfxbase = stars_gfx_loc+(stars_gfx_size*9)
      sprite[stars].gfxbase=stars_gfx_loc+(stars_gfx_size*9);
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 281] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 282] IF ship_pos>(190<<16)  AND ship_pos <=(200<<16)  THEN
  if(ship_pos>(190<<16)&&ship_pos<=(200<<16))
    {
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 283] sprite[stars].gfxbase = stars_gfx_loc+(stars_gfx_size*10)
      sprite[stars].gfxbase=stars_gfx_loc+(stars_gfx_size*10);
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 284] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 285] IF ship_pos>(200<<16)  THEN
  if(ship_pos>(200<<16))
    {
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 286] sprite[stars].gfxbase = stars_gfx_loc+(stars_gfx_size*11)
      sprite[stars].gfxbase=stars_gfx_loc+(stars_gfx_size*11);
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 287] ENDIF
    }
// [/home/tbone/Programming/jagstudio/projects/basic/shootbang/shootbang.bas - 288] END SUB
}


