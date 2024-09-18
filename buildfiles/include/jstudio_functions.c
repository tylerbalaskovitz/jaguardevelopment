// C++
#if defined( __cplusplus )
  #define overloaded
  #define C_EXPORT EXTERN_C __declspec(dllexport)
  #define C_IMPORT EXTERN_C __declspec(dllimport)
#else
  #define C_EXPORT __declspec(dllexport)
  #define C_IMPORT __declspec(dllimport)
#endif

#include <ctype.h>
#include <math.h>
#include <stdio.h>
#include <string.h>
#include <stddef.h>
#include <stdlib.h>
#include <setjmp.h>
#include <time.h>
#include <stdarg.h>
#include <process.h>
#include "raptor.h"

// If sprite_tabwidth is changed from 192 - search this file for 'sprite_tabwidth' and update all references


// -----------------------------------------------------------------------------
// JagStudio
// -----------------------------------------------------------------------------
volatile int js_r_xpos=0;
volatile int js_r_ypos=0;
int jsfFontSize=0;
int jsfFontIndx=0;
unsigned char plot_colour=0;
extern void jsfPlot(short plot_px, short plot_py) asm ("_jsfPlot");
extern void cls(void) asm ("_cls");
extern short AUDIOPLAYER asm ("AUDIOPLAYER");
void basicmain() asm ("__Z9basicmainv"); //main function declaration
void jsfColour();
void jsfDelay(int x) asm("jsfDelay");
extern void jsfSprlistFieldSet(int spr_index, int offset, int no_of_times, void *array_of_values) asm("jsfSprlistFieldSet");
extern void jsfSprlistFieldMod(int spr_index, int offset, int no_of_times, void *array_of_values) asm("jsfSprlistFieldMod");
extern void jsfSprlistFieldSetval(int spr_index, int offset, int no_of_times, int value) asm("jsfSprlistFieldSetval");
extern void jsfSprlistFieldSetOffset(int spr_index, int offset, int no_of_times, void *array_of_values, int skip_offset) asm("jsfSprlistFieldSetOffset");
extern void jsfSprlistFieldModOffset(int spr_index, int offset, int no_of_times, void *array_of_values, int skip_offset) asm("jsfSprlistFieldModOffset");
extern void jsfSprlistFieldSetvalOffset(int spr_index, int offset, int no_of_times, int value, int skip_offset) asm("jsfSprlistFieldSetvalOffset");
extern void jsfUnpack68k(int source, int destination) asm("jsfUnpack68k");
extern void jsfSort(void *base,size_t nmemb) asm("jsfSort");
void jsfVsync(volatile int update) asm("_jsfVsync");
extern int jsfVsyncFlag asm ("jsfVsyncFlag");
//void RSETOBJ(int spr_index, int offset, int value) asm ("_RSETOBJ");
//int RGETOBJ(int spr_index, int offset);
int jsfGetPad(int pad) asm("jsfGetPad");
int jsfGetPadPressed(int pad) asm("jsfGetPadPressed");
int jsfGetPadPressed1();
int jsfGetPadPressed2();
extern int jsfEEPROMFullRead() asm ("jsfEEPROMFullRead");
extern short jsfEEPROMWordRead(short addr) asm ("jsfEEPROMWordRead");
extern int jsfEEPROMBoardRead(int boardnumber) asm ("jsfEEPROMBoardRead");
extern int jsfEEPROMFullWrite() asm ("jsfEEPROMFullWrite");
extern short jsfEEPROMWordWrite(short addr, short value) asm ("jsfEEPROMWordWrite");
extern int jsfEEPROMBoardWrite(int boardnumber) asm ("jsfEEPROMBoardWrite");
extern int jsfEEPROMUserDataRead() asm ("jsfEEPROMUserDataRead");
extern int jsfEEPROMUserDataWrite() asm ("jsfEEPROMUserDataWrite");
extern int jsfEEPROM(int readwrite, void *buffer) asm ("jsfEEPROM");
extern short jsfEEPROMWord(short readwrite, short addr, short value) asm ("jsfEEPROMWord");
extern int jsfEEPROMBoard(int readwrite, void *buffer, int boardnumber) asm ("jsfEEPROMBoard");
void jsfLoadClut(unsigned short *paladdress, short target_clut, short no_of_indices) asm("jsfLoadClut");
void jsfDebugMessageHalt() asm("_jsfDebugMessageHalt");
void jsfDebugMessage() asm("_jsfDebugMessage");
extern void jsfClearBuffer(int sizeInBytes, char *bufferAddress) asm ("jsfClearBuffer");


// -----------------------------------------------------------------------------




// -----------------------------------------------------------------------------
// Raptor
// -----------------------------------------------------------------------------
void rapInitCalcAngle(void *array_of_64k) asm("rapInitCalcAngle");
int rapCalcAngle(int x1, int y1, int x2, int y2) asm("rapCalcAngle");
void rapAngleVector(int calcAngle) asm("rapAngleVector");
extern int raptor_console_x asm("raptor_console_x");
extern int raptor_console_y asm("raptor_console_y");
extern int raptor_console_visible asm("raptor_console_visible");
void rapDebugSetXY(int x, int y) asm("rapDebugSetXY");
void rapDebugUpdate() asm("rapDebugUpdate");
void rapDebugSetVisible(int visible) asm("rapDebugSetVisible");
void rapDebugPrint() asm ("_rapDebugPrint");
void rapDebugSetMonitor(int monitorNumber, void *var_address) asm("rapDebugSetMonitor");
extern void rapDebugUpdRegisters() asm("RAPTOR_console_update_registers");
extern void rapDebugUpdMonitors() asm("RAPTOR_console_update_usermonitors");
extern void rapDebugUpdText() asm("RAPTOR_console_update_textline");
extern void rapUpdateAll() asm ("RAPTOR_UPDATE_ALL");
extern void rapWaitFrameUpdateAll() asm ("RAPTOR_wait_frame_UPDATE_ALL");
extern void rapUpdateOffscreenList(int list_index) asm ("rapUpdateOffscreenList");
extern void rapUpdateSprites() asm ("RAPTOR_UPDATE_SPRITES");
extern void rapUpdateParticles() asm ("RAPTOR_UPDATE_PARTICLES");
extern void rapUpdateParticlesErase() asm ("RAPTOR_UPDATE_RAPTICLES_ERASE");
extern void rapUpdateParticlesPlot() asm ("RAPTOR_UPDATE_PARTICLES_PLOT");
extern void rapParticleClear() asm ("RAPTOR_particle_clear");
void rapPrint() asm("_rapPrint");
void rapPrintCont() asm("_rapPrintCont");
void rapLocate(int x,int y) asm("rapLocate");
void rapSetActiveList(int list_index) asm("rapSetActiveList");
int rapCollide(int r_sl, int r_sh, int r_tl, int r_th) asm("rapCollide");
void rapParticleInject(int *fx) asm ("rapParticleInject");
void rapSetMapLoc(int x,int y) asm ("rapSetMapLoc");
int rapFadeClut(int clut_no,int fade_cols,int *palette) asm("rapFadeClut");
int rapFadeSingle(short clut_index,short target_col) asm("rapFadeSingle");
extern void rapBlitlist(void *blitlist) asm("rapBlitlist");
void rapHiscoreSort(int table_to_sort, char *name) asm("rapHiscoreSort");
short rapHiscoreCheck(int score, char *name, int table) asm("rapHiscoreCheck");
extern void rapNumToStr(long number, long no_digits, char *string) asm("rapNumToStr");
extern void rapHexToStr(long bytesToConvert, char *source, char *dest) asm("rapHexToStr");
extern void *RAPTOR_sprite_table asm ("RAPTOR_sprite_table");
extern void *raptor_liststart asm ("raptor_liststart");
extern void *pixel_list asm ("pixel_list");
extern void *raptor_part_inject_addr asm ("raptor_part_inject_addr");
extern int raptor_map_position_x asm ("raptor_map_position_x");
extern int raptor_map_position_y asm ("raptor_map_position_y");
extern void RAPTOR_GPU_COLLISION() asm ("RAPTOR_GPU_COLLISION");
volatile extern int raptor_result asm ("raptor_result");
extern void *raptor_collisionlist asm ("raptor_collisionlist");
extern int raptor_sourcel asm ("raptor_sourcel");
extern int raptor_sourceh asm ("raptor_sourceh");
extern int raptor_targetl asm ("raptor_targetl");
extern int raptor_targeth asm ("raptor_targeth");
extern void RAPTOR_wait_frame() asm ("RAPTOR_wait_frame");
extern void RAPTOR_blitter() asm("RAPTOR_blitter");
extern void eeReadBank();
extern void eeWriteBank();
extern long raptor_partbuf_x asm("raptor_partbuf_x");
extern long raptor_partbuf_y asm("raptor_partbuf_y");
extern void RBRA(long object_number, long branch_type, long ypos, long object_to_branch_if_taken) asm("RBRA");
extern void *RAPTOR_ERROR() asm ("RAPTOR_ERROR");
extern int raptor_nrv2e_source asm ("raptor_nrv2e_source");
extern int raptor_nrv2e_destination asm ("raptor_nrv2e_destination");
extern void rapUnpack(int source, int destination) asm("rapUnpack");
extern int rapRND() asm("RAPTOR_random");
extern void rapSpriteShift(int x, int y, int spr_index, int no_of_objects) asm("rapSpriteShift");
extern void rapSetClock(int value) asm("rapSetClock");
extern void rapAddClock(int value) asm("rapAddClock");
extern void rapSubClock(int value) asm("rapSubClock");
extern void rapSortSprites(int spr_index, int offset, int no_of_objects, int sortdir) asm("rapSortSprites");
int rapFlashCheck() asm("rapFlashCheck");
extern int raptor_left_teamtap asm("raptor_left_teamtap");					// connection status of left teamtap
extern int raptor_left_teamtap_pad0 asm("raptor_left_teamtap_pad0");		// U235 compatible long for Left Pad 0
extern int raptor_left_teamtap_pad1	asm("raptor_left_teamtap_pad1");	// U235 compatible long for Left Pad 1
extern int raptor_left_teamtap_pad2	asm("raptor_left_teamtap_pad2");	// U235 compatible long for Left Pad 2
extern int raptor_left_teamtap_pad3	asm("raptor_left_teamtap_pad3");	// U235 compatible long for Left Pad 3
extern int raptor_right_teamtap	asm("raptor_right_teamtap");			// connection status of Right teamtap
extern int raptor_right_teamtap_pad0 asm("raptor_right_teamtap_pad0");		// U235 compatible long for Right Pad 0
extern int raptor_right_teamtap_pad1 asm("raptor_right_teamtap_pad1");		// U235 compatible long for Right Pad 1
extern int raptor_right_teamtap_pad2 asm("raptor_right_teamtap_pad2");		// U235 compatible long for Right Pad 2
extern int raptor_right_teamtap_pad3 asm("raptor_right_teamtap_pad3");		// U235 compatible long for Right Pad 3
int rapCheckTTExists(int teamtapport) asm("rapCheckTTExists");
void rapGetTTState(int teamtapport) asm("rapGetTTState");
int rapGetTTPad(int teamtapport, int padnum) asm("rapGetTTPad");


// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Raptor GD
// -----------------------------------------------------------------------------
extern int rapGDGetCartSerial() asm ("rapGDGetCartSerial");
extern short rapGDCardInserted() asm ("rapGDCardInserted");
extern void rapGDSetLEDOn() asm ("rapGDSetLEDOn");
extern void rapGDSetLEDOff() asm ("rapGDSetLEDOff");
extern void rapGDReset(int resetType) asm ("rapGDReset");
extern int rapGDGetCardSerial() asm ("rapGDGetCardSerial");
extern void rapGDDebugPrint() asm ("rapGDDebugPrint");
extern int rapGDLoadFile(void *fullPathAddr, void *buffer) asm ("rapGDLoadFile");
extern int rapGDSaveFile(void *fullPathAddr, void *buffer, int size) asm ("rapGDSaveFile");
extern int rapGDBIOSVersion() asm ("rapGDBIOSVersion");	//D0=nn.nn BCD format, high word FIRMWARE, low word ASIC
extern int rapGDROMWriteEnable(int enableFlag) asm ("rapGDROMWriteEnable"); //;; D0=GD_ROMWRITE_ENABLE / GD_ROMWRITE_DISABLE
extern int rapGDDirOpen(void *fullPathAddr) asm ("rapGDDirOpen");
extern int rapGDDirRead(int handle) asm ("rapGDDirRead");
extern int rapGDDirClose(int handle) asm ("rapGDDirClose");
extern int rapGDFileOpen(int mode, void *fullPathAddr) asm ("rapGDFileOpen");
extern int rapGDFileRead(int handle, int bytesToRead, int flags, void *buffer) asm ("rapGDFileRead");
extern int rapGDFileWrite(int handle, int bytesToWrite, void *buffer) asm ("rapGDFileWrite");
extern int rapGDFileClose(int handle) asm ("rapGDFileClose");
extern int rapGDFileSeek(int handle, int offset, int flags) asm ("rapGDFileSeek");
extern int rapGDFileTell(int handle) asm ("rapGDFileTell");
extern int rapGDFileSize(int handle) asm ("rapGDFileSize");
extern int rapGDFileInfo(int flags, void *fullPathAddr, void *buffer) asm ("rapGDFileInfo");
extern int rapGDFTimeToASCII(short ftime, void *outputBuffer) asm ("rapGDFTimeToASCII");	//a0=output buffer (8 bytes HH:MM:SS)
extern int rapGDFDateToASCII(short fdate, void *outputBuffer) asm ("rapGDFDateToASCII");	//a0=output buffer (10 bytes YYYY:MM:DD)
extern void rapUseParticlePalette(short clutToPopulate) asm ("rapUseParticlePalette");
extern void rapUse8x8fontPalette(short clutToPopulate) asm ("rapUse8x8fontPalette");
extern void rapUse8x16fontPalette(short clutToPopulate) asm ("rapUse8x16fontPalette");
extern void rapUse16x16fontPalette(short clutToPopulate) asm ("rapUse16x16fontPalette");
// -----------------------------------------------------------------------------




// -----------------------------------------------------------------------------
// U235
// -----------------------------------------------------------------------------
extern int U235SE_pad1 asm ("U235SE_pad1");
extern int U235SE_pad2 asm ("U235SE_pad2");
extern int U235SE_music_vol asm ("U235SE_music_vol");
extern int U235SE_sfx_vol asm ("U235SE_sfx_vol");
void u235PlaySample(int channel,int sfxnum) asm("u235PlaySample");
void u235PlaySampleFreq(int channel,int sfxnum,int freq) asm("u235PlaySampleFreq");		//RAPTOR_U235queuesample 
int u235GetPad(int pad) asm("_u235GetPad");
void u235PlayModule(int module,short stereo);
void u235StopModule();
void u235Silence();
void u235KillChannel(int v) asm("u235KillChannel");
void u235ChannelVol(int v,int x) asm("u235ChannelVol");
void u235ChannelFreq(int channel,int freq) asm("u235ChannelFreq");
void u235SampleVol(int volume) asm("_u235SampleVol");
void u235ModuleVol(int volume) asm("_u235ModuleVol");
extern void *RAPTOR_U235setmodule() asm ("RAPTOR_U235setmodule");
extern void *RAPTOR_U235gomodule_stereo() asm ("RAPTOR_U235gomodule_stereo");
extern void *RAPTOR_U235gomodule_mono() asm ("RAPTOR_U235gomodule_mono");
extern void *RAPTOR_U235stopmodule() asm ("RAPTOR_U235stopmodule");
extern void *RAPTOR_U235SilenceChannels() asm ("RAPTOR_U235SilenceChannels");
extern void u235ChangeReplayFrq(int freq, int period) asm ("u235ChangeReplayFrq");
void u235Init(int rate,int period) asm("u235Init");
void u235StopDSP() asm("u235StopDSP");
void u235Restart(int rate,int period) asm("u235Restart");
//RAPTOR_U235resetmodule
// -----------------------------------------------------------------------------




// -----------------------------------------------------------------------------
// Zero Player
// -----------------------------------------------------------------------------
extern void Audio_Play() asm ("Audio_Play");
void zeroPlaySample(int channel, void *sound_address, int sample_size, int sample_divider, int play_command) asm("zeroPlaySample");
void zeroPlay(int channel, void *sound_address, void *sound_endaddress, int sample_divider, int play_command) asm("zeroPlay");
void zeroClearChannel(int channel) asm("zeroClearChannel");
extern int zeroGetPad(int pad) asm("zeroGetPad");
extern void Input_Read() asm("Input_Read");
//Warning: do NOT change the order of these 5 variables!
//(when compiling with -O0, variables start at zero_left_pad and go downwards, with -O2 the opposite. GO FIGURE)
long zero_rotary_delta asm("zero_rotary_delta")=0;
long zero_mousey_delta asm("zero_mousey_delta")=0;
long zero_mousex_delta asm("zero_mousex_delta")=0;
unsigned long zero_right_pad asm("zero_right_pad")=0;
unsigned long zero_left_pad asm("zero_left_pad")=0;
// -----------------------------------------------------------------------------



// -----------------------------------------------------------------------------
// LSP SE
// -----------------------------------------------------------------------------
extern int DSP_pad1 asm ("DSP_pad1");
extern int DSP_pad2 asm ("DSP_pad2");
extern short silence asm ("silence");
extern int fin_silence asm ("fin_silence");
int LSPGetPad(int pad) asm("LSPGetPad");
void LSPPlayModule(int MODULE_lsmusic,int MODULE_lsbank) asm("LSPPlayModule");
void LSPStartMusic() asm("LSPStartMusic");
void LSPStopMusic() asm("LSPStopMusic");
void LSPMusicToggle() asm("LSPMusicToggle");
void LSPStartDSP() asm("LSPStartDSP");
void LSPPlaySampleLoop(void *sound_address, void *sound_endaddress, void *sound_loopaddress, void *sound_loopendaddress, int frequency, int volume, int channel) asm("LSPPlaySampleLoop");
void LSPPlaySample(void *sound_address, void *sound_endaddress, int frequency, int volume, int channel) asm("LSPPlaySample");
//extern int LSP_DSP_flag asm ("LSP_DSP_flag");

// -----------------------------------------------------------------------------






// -----------------------------------------------------------------------------
// MISC
// -----------------------------------------------------------------------------
int errno=0; //needed by some libc/libm functions
double y=0; //needed by some libc/libm functions
double yt2=0; //needed by some libc/libm functions
char *js_r_textbuffer=(char *)0;

struct exception
{
	exception_type	type;	/* exception type */
	const char	*name;	/* function in which it occured */
	double		arg1;	/* an arg */
	double		arg2;	/* another arg */
	double		retval; /* val to return */
};

struct exception xcpt={DOMAIN,0,0,0,0}; //needed by some libc/libm functions

//Possible values of AUDIOPLAYER - So we know which player is in use.
enum
{
    AUD_ZERO = 0,
    AUD_U235 = 1,
	AUD_LSP = 2
};

//Values to pass to all the GetPad functions such as jsfGetPadPressed and jsfGetPad
enum
{
    LEFT_PAD = 1,
    RIGHT_PAD = 2
};


//Teamtap Pad selectors
enum
{
    TT_PAD_1 = 0,
    TT_PAD_2 = 1,
    TT_PAD_3 = 2,
    TT_PAD_4 = 3
};
//Teamtap Port selectors
enum
{
    TT_LEFT = 0,
    TT_RIGHT = 1
};




// -----------------------------------------------------------------------------








// -----------------------------------------------------------------------------
// CODE
// -----------------------------------------------------------------------------





// -----------------------------------------------------------------------------
// JagStudio
// -----------------------------------------------------------------------------
void jsfDebugMessage()
{
  	__asm__ ("movem.l	d0-d7/a0-a6,-(a7)			\n\t"
		  "move.l	_js_r_textbuffer,a0				\n\t"
		  "jsr		RAPTOR_console_update_textline	\n\t"
		  "movem.l	(a7)+,d0-d7/a0-a6				\n\t");
	
	rapDebugUpdate();
	rapDebugSetVisible(1);
}
// -----------------------------------------------------------------------------
void jsfDebugMessageHalt()
{
  	jsfDebugMessage();
	RAPTOR_ERROR();
}
// -----------------------------------------------------------------------------
int jsfGetPad(int pad)
{	
	if(AUDIOPLAYER==AUD_ZERO)
	{		
		return zeroGetPad(pad);
	}
	else if(AUDIOPLAYER==AUD_LSP)
	{
		return LSPGetPad(pad);
	}
	
	return u235GetPad(pad);
}
// -----------------------------------------------------------------------------
int pad1 = 0;
int pad2 = 0;
int pad1Last = 0;
int pad2Last = 0;
int pad1Prev = 0;
int pad2Prev = 0;

int jsfGetPadPressed(int pad)
{	
	if(pad==LEFT_PAD)
		return jsfGetPadPressed1();
	
	if(pad==RIGHT_PAD)
		return jsfGetPadPressed2();
}
int jsfGetPadPressed1()
{	
	pad1Last = pad1;
	
	pad1=jsfGetPad(LEFT_PAD);
	
	pad1Prev = ~pad1Last;
	
	return pad1 & pad1Prev;
}
int jsfGetPadPressed2()
{	
	pad2Last = pad2;
	
	pad2=jsfGetPad(RIGHT_PAD);
	
	pad2Prev = ~pad2Last;
	
	return pad2 & pad2Prev;
}
// -----------------------------------------------------------------------------
void rapUnpack(int source, int destination)
{
	raptor_nrv2e_source=source;
	raptor_nrv2e_destination=destination;
	__asm__ ("  movem.l a0,-(sp)");
	__asm__ ("  lea		RAPTOR_NRV2E_GPU_depack,a0");
	__asm__ ("	jsr 	RAPTOR_call_GPU_code");
	__asm__ ("  movem.l (sp)+,a0");
}
// -----------------------------------------------------------------------------
void jsfUnpack68k(int source, int destination)
{
	__asm__ ("\tmovem.l d0-d7/a0-a6,-(sp)                                             \n\t"
	"move.l 8(a6),a0                                                                  \n\t"
	"move.l 12(a6),a1                                                                  \n\t"
	"|------------------------------------------------------------------------------- \n\t"
	"|  n2e_d.ash -- NRV2E decompression in 68000 assembly                            \n\t"
	"|                                                                                \n\t"
	"|  This file is part of the UCL data compression library.                        \n\t"
	"|                                                                                \n\t"
	"|  Copyright (C) 1996-2004 Markus Franz Xaver Johannes Oberhumer                 \n\t"
	"|  All Rights Reserved.                                                          \n\t"
	"|                                                                                \n\t"
	"|  The UCL library is free software; you can redistribute it and/or              \n\t"
	"|  modify it under the terms of the GNU General Public License as                \n\t"
	"|  published by the Free Software Foundation; either version 2 of                \n\t"
	"|  the License, or (at your option) any later version.                           \n\t"
	"|                                                                                \n\t"
	"|  The UCL library is distributed in the hope that it will be useful,            \n\t"
	"|  but WITHOUT ANY WARRANTY; without even the implied warranty of                \n\t"
	"|  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                 \n\t"
	"|  GNU General Public License for more details.                                  \n\t"
	"|                                                                                \n\t"
	"|  You should have received a copy of the GNU General Public License             \n\t"
	"|  along with the UCL library; see the file COPYING.                             \n\t"
	"|  If not, write to the Free Software Foundation, Inc.,                          \n\t"
	"|  59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.                      \n\t"
	"|                                                                                \n\t"
	"|  Markus F.X.J. Oberhumer                                                       \n\t"
	"|  <markus@oberhumer.com>                                                        \n\t"
	"|  http://www.oberhumer.com/opensource/ucl/                                      \n\t"
	"|                                                                                \n\t"
	"|------------------------------------------------------------------------------- \n\t"
	"                                                                                 \n\t"
	"| ------------- DECOMPRESSION -------------                                      \n\t"
	"                                                                                 \n\t"
	"| decompress from a0 to a1                                                       \n\t"
	"|   note: must preserve d4 and a5-a7                                             \n\t"
	"                                                                                 \n\t"
	"|                                                                                \n\t"
	"| On entry:                                                                      \n\t"
	"|   a0  src pointer                                                              \n\t"
	"|   a1  dest pointer                                                             \n\t"
	"|                                                                                \n\t"
	"| On exit:                                                                       \n\t"
	"|   d1.l = 0x00008000                                                            \n\t"
	"|   d2.l = 0                                                                     \n\t"
	"|                                                                                \n\t"
	"| Register usage:                                                                \n\t"
	"|   a3  m_pos                                                                    \n\t"
	"|                                                                                \n\t"
	"|   d0  bit buffer                                                               \n\t"
	"|   d1  m_off                                                                    \n\t"
	"|   d2  m_len                                                                    \n\t"
	"|   d5  last_m_off                                                               \n\t"
	"|                                                                                \n\t"
	"|   d6  constant: -$500                                                          \n\t"
	"|   d7  constant: 0                                                              \n\t"
	"|                                                                                \n\t"
	"|                                                                                \n\t"
	"| Notes:                                                                         \n\t"
	"|   we have max_match = 65535, so we can use word arithmetics on d2              \n\t"
	"|   we have max_offset < 2**23, so we can use partial word arithmetics on d1     \n\t"
	"|                                                                                \n\t"
	"                                                                                 \n\t"
	"| ------------- constants & macros -------------                                 \n\t"
	"depack2e:                                                                        \n\t"
	"                moveq   #-0x50,D6       |   0xffffffb0                           \n\t"
	"                lsl.w   #4,D6           |   << 4                                 \n\t"
	"                                                                                 \n\t"
	"                moveq   #0,D7                                                    \n\t"
	"                moveq   #-1,D5          | last_off = -1                          \n\t"
	"                                                                                 \n\t"
	"| init d0 with high bit set                                                      \n\t"
	"||move.b  #$80,d0               | init d0.b for FILLBYTES                        \n\t"
	"                moveq   #-128,D0        | d0.b = $80                             \n\t"
	"                bra.s   decompr_start                                            \n\t"
	"                                                                                 \n\t"
	"                                                                                 \n\t"
	"| ------------- DECOMPRESSION -------------                                      \n\t"
	"                                                                                 \n\t"
	"decompr_literal:                                                                 \n\t"
	"                move.b  (A0)+,(A1)+                                              \n\t"
	"                                                                                 \n\t"
	"decompr_start:                                                                   \n\t"
	"decompr_loop:                                                                    \n\t"
	"| optimization: carry is clear -> we know that bits are available                \n\t"
	"|   cost literal:   4 +  8 + 10                                                  \n\t"
	"|   cost match:     4 + 10                                                       \n\t"
	"|   cost fillbits:  4 +  8 +  8                                                  \n\t"
	"                add.b   D0,D0                                                    \n\t"
	"                bcc.s   decompr_match                                            \n\t"
	"                bne.s   decompr_literal                                          \n\t"
	"                move.b  (A0)+,D0                                                 \n\t"
	"                addx.b  D0,D0                                                    \n\t"
	"                bcs.s   decompr_literal                                          \n\t"
	"                                                                                 \n\t"
	"                                                                                 \n\t"
	"decompr_match:                                                                   \n\t"
	"                moveq   #1,D1                                                    \n\t"
	"                moveq   #0,D2                                                    \n\t"
	"decompr_l1:                                                                      \n\t"
	"                add.b   D0,D0                                                    \n\t"
	"                bne.s   _l00                                                     \n\t"
	"                move.b  (A0)+,D0                                                 \n\t"
	"                addx.b  D0,D0                                                    \n\t"
	"_l00:                                                                            \n\t"
	"                addx.w  D1,D1                                                    \n\t"
	"| optimization: carry is clear -> we know that bits are available                \n\t"
	"|   cost loop continue:  4 + 10                                                  \n\t"
	"|   cost loop break:    4 +  8 + 10                                              \n\t"
	"|   cost fillbits:      4 +  8 +  8                                              \n\t"
	"                add.b   D0,D0                                                    \n\t"
	"                bcc.s   Lcon0                                                    \n\t"
	"                bne.s   decompr_break1                                           \n\t"
	"                move.b  (A0)+,D0                                                 \n\t"
	"                addx.b  D0,D0                                                    \n\t"
	"                bcs.s   decompr_break1                                           \n\t"
	"Lcon0:                                                                           \n\t"
	"                subq.w  #1,D1                                                    \n\t"
	"                add.b   D0,D0                                                    \n\t"
	"                bne.s   _l01                                                     \n\t"
	"                move.b  (A0)+,D0                                                 \n\t"
	"                addx.b  D0,D0                                                    \n\t"
	"_l01:                                                                            \n\t"
	"                addx.w  D1,D1                                                    \n\t"
	"                bpl.s   decompr_l1                                               \n\t"
	"                bra.s   decompr_end                                              \n\t"
	"decompr_break1:                                                                  \n\t"
	"                subq.w  #3,D1                                                    \n\t"
	"                bcs.s   decompr_prev_dist | last m_off                           \n\t"
	"                lsl.l   #8,D1                                                    \n\t"
	"                move.b  (A0)+,D1                                                 \n\t"
	"                not.l   D1                                                       \n\t"
	"                asr.l   #1,D1                                                    \n\t"
	"                bcc.s   decompr_get_mlen2                                        \n\t"
	"                                                                                 \n\t"
	"decompr_get_mlen1:                                                               \n\t"
	"                add.b   D0,D0                                                    \n\t"
	"                bne.s   _l02                                                     \n\t"
	"                move.b  (A0)+,D0                                                 \n\t"
	"                addx.b  D0,D0                                                    \n\t"
	"_l02:                                                                            \n\t"
	"                addx.w  D2,D2                                                    \n\t"
	"                bra.s   decompr_got_mlen                                         \n\t"
	"decompr_prev_dist:                                                               \n\t"
	"                move.l  D5,D1                                                    \n\t"
	"                add.b   D0,D0                                                    \n\t"
	"                bne.s   _l03                                                     \n\t"
	"                move.b  (A0)+,D0                                                 \n\t"
	"                addx.b  D0,D0                                                    \n\t"
	"_l03:                                                                            \n\t"
	"                bcs.s   decompr_get_mlen1                                        \n\t"
	"decompr_get_mlen2:                                                               \n\t"
	"                addq.w  #1,D2                                                    \n\t"
	"                add.b   D0,D0                                                    \n\t"
	"                bne.s   _l04                                                     \n\t"
	"                move.b  (A0)+,D0                                                 \n\t"
	"                addx.b  D0,D0                                                    \n\t"
	"_l04:                                                                            \n\t"
	"                bcs.s   decompr_get_mlen1                                        \n\t"
	"                                                                                 \n\t"
	"decompr_l2:                                                                      \n\t"
	"                add.b   D0,D0                                                    \n\t"
	"                bne.s   _l05                                                     \n\t"
	"                move.b  (A0)+,D0                                                 \n\t"
	"                addx.b  D0,D0                                                    \n\t"
	"_l05:                                                                            \n\t"
	"                addx.w  D2,D2                                                    \n\t"
	"| optimization: carry is clear -> we know that bits are available                \n\t"
	"|   cost loop continue:  4 + 10                                                  \n\t"
	"|   cost loop break:    4 +  8 + 10                                              \n\t"
	"|   cost fillbits:      4 +  8 +  8                                              \n\t"
	"                add.b   D0,D0                                                    \n\t"
	"                bcc.s   decompr_l2                                               \n\t"
	"                bne.s   Lbreak0                                                  \n\t"
	"                move.b  (A0)+,D0                                                 \n\t"
	"                addx.b  D0,D0                                                    \n\t"
	"                bcc.s   decompr_l2                                               \n\t"
	"Lbreak0:                                                                         \n\t"
	"                addq.w  #2,D2                                                    \n\t"
	"                                                                                 \n\t"
	"                                                                                 \n\t"
	"                                                                                 \n\t"
	"decompr_got_mlen:                                                                \n\t"
	"                move.l  D1,D5                                                    \n\t"
	"                lea     0(A1,D1.l),A3                                            \n\t"
	"                                                                                 \n\t"
	"| must use sub as cmp doesn't affect the X flag                                  \n\t"
	"                sub.l   D6,D1                                                    \n\t"
	"                addx.w  D7,D2                                                    \n\t"
	"                                                                                 \n\t"
	"| TODO: partly unroll this loop; could use some magic with d7 for address        \n\t"
	"|       computations, then compute a nice `jmp yyy(pc,dx.w)'                     \n\t"
	"                                                                                 \n\t"
	"|   cost for any m_len:   12 + 22 * (m_len - 1) + 4                              \n\t"
	"|     38, 60, 82, 104, 126, 148, 170, 192, 214, 236                              \n\t"
	"                move.b  (A3)+,(A1)+     | 12                                     \n\t"
	"Lcopy0:         move.b  (A3)+,(A1)+     | 12                                     \n\t"
	"                dbra    D2,Lcopy0       | 10 / 14                                \n\t"
	"                                                                                 \n\t"
	"                bra     decompr_loop                                             \n\t"
	"decompr_end:                                                                     \n\t"
	"                |rts                                                             \n\t"
	"                movem.l (sp)+,d0-d7/a0-a6                                        \n\t"
	"| vi:ts=8:et                                                                     \n\t");
	
}

// -----------------------------------------------------------------------------
void jsfSprlistFieldSetvalOffset(int spr_index, int offset, int no_of_times, int value, int skip_offset)	// MUST Update 192 and double shifts (sprite_tabwidth)
{
	__asm__ ("\tmovem.l d0/d1/d2/a0,-(sp)\n\t"	
			"move.l 	8(%fp),d0			\n\t"
			"move.l 	d0,d1				\n\t"
			"lsl 		#7,d0				\n\t"				// This line and below are *192 for sprite_tabwidth
			"lsl 		#6,d1				\n\t"
			"add.l 		d1,d0				\n\t"
			"add.l 		12(%fp),%d0			\n\t"
			"move.l 	raptor_liststart,%a0\n\t"			
			"lea 		(a0,d0.l),a0		\n\t"			
			"move.l 	24(a6),d2			\n\t"
			"move.l 	d2,d1				\n\t"
			"lsl 		#7,d2				\n\t"				// This line and below are *192 for sprite_tabwidth
			"lsl 		#6,d1				\n\t"
			"add.l 		d1,d2				\n\t"			
			"move.l 	20(a6),d0			\n\t"
			"move.l 	16(a6),d1			\n\t"
			"subq.w 	#1,d1				\n\t"
			"sprlistloop6:					\n\t"
			"move.l 	d0,(a0)				\n\t"
			"add.l 		d2,a0				\n\t"
			"dbra 		d1,sprlistloop6		\n\t"
            "movem.l 	(sp)+,d0/d1/d2/a0	\n\t");
}
// -----------------------------------------------------------------------------
void jsfSprlistFieldModOffset(int spr_index, int offset, int no_of_times, void *array_of_values, int skip_offset)	// MUST Update 192 and double shifts (sprite_tabwidth)
{
	__asm__ ("\tmovem.l d0/d1/d2/a0/a1,-(sp)\n\t"
			"move.l 	8(%fp),d0			\n\t"
			"move.l 	d0,d1				\n\t"
			"lsl 		#7,d0				\n\t"				// This line and below are *192 for sprite_tabwidth
			"lsl 		#6,d1				\n\t"
			"add.l 		d1,d0				\n\t"
			"add.l 		12(%fp),%d0			\n\t"
			"move.l 	raptor_liststart,%a0\n\t"
			"lea 		(a0,d0.l),a0		\n\t"	
			"move.l 	24(a6),d0			\n\t"
			"move.l 	d0,d1				\n\t"
			"lsl 		#7,d0				\n\t"				// This line and below are *192 for sprite_tabwidth
			"lsl 		#6,d1				\n\t"
			"add.l 		d1,d0				\n\t"
			"move.l 	20(a6),a1			\n\t"
			"move.l 	16(a6),d1			\n\t"
			"subq.w 	#1,d1				\n\t"
			"sprlistloop5:\tmove.l (a1)+,d2	\n\t"
			"add.l 		d2,(a0)				\n\t"
			"add.l 		d0,a0				\n\t"
			"dbra 		d1,sprlistloop5		\n\t"
            "movem.l 	(sp)+,d0/d1/d2/a0/a1\n\t");
}
// -----------------------------------------------------------------------------
void jsfSprlistFieldSetOffset(int spr_index, int offset, int no_of_times, void *array_of_values, int skip_offset)	// MUST Update 192 and double shifts (sprite_tabwidth)
{
	__asm__ ("\tmovem.l d0/d1/a0/a1,-(sp)\n\t"	
			"move.l 	8(%fp),d0			\n\t"
			"move.l 	d0,d1				\n\t"
			"lsl 		#7,d0				\n\t"				// This line and below are *192 for sprite_tabwidth
			"lsl 		#6,d1				\n\t"
			"add.l 		d1,d0				\n\t"
			"add.l 		12(%fp),%d0			\n\t"
			"move.l 	raptor_liststart,%a0\n\t"
			"lea 		(a0,d0.l),a0		\n\t"			
			"move.l 	24(a6),d0			\n\t"
			"move.l 	d0,d1				\n\t"
			"lsl 		#7,d0				\n\t"				// This line and below are *192 for sprite_tabwidth
			"lsl 		#6,d1				\n\t"
			"add.l 		d1,d0				\n\t"			
			"move.l 	20(a6),a1			\n\t"
			"move.l 	16(a6),d1			\n\t"
			"subq.w 	#1,d1				\n\t"			
			"sprlistloop4:\tmove.l (a1)+,(a0)\n\t"
			"add.l 		d0,a0				\n\t"
			"dbra 		d1,sprlistloop4		\n\t"
            "movem.l (sp)+,d0/d1/a0/a1\n\t");
}
// -----------------------------------------------------------------------------
void jsfSprlistFieldSetval(int spr_index, int offset, int no_of_times, int value)	// MUST Update 192 and double shifts (sprite_tabwidth)
{
	__asm__ ("\tmovem.l d0/d1/a0,-(sp)		\n\t"
			"move.l 	8(%fp),d0			\n\t"
			"move.l 	d0,d1				\n\t"
			"lsl 		#7,d0				\n\t"				// This line and below are *192 for sprite_tabwidth
			"lsl 		#6,d1				\n\t"
			"add.l 		d1,d0				\n\t"
			"add.l 		12(%fp),%d0			\n\t"
			"move.l 	raptor_liststart,%a0\n\t"
			"lea 		(a0,d0.l),a0		\n\t"
			"move.l 	20(a6),d0			\n\t"
			"move.l 	16(a6),d1			\n\t"
			"subq.w 	#1,d1				\n\t"
			"sprlistloop3:					\n\t"
			"move.l 	d0,(a0)				\n\t"
			"lea 		192(a0),a0			\n\t"
			"dbra 		d1,sprlistloop3		\n\t"
            "movem.l 	(sp)+,d0/d1/a0		\n\t");
}
// -----------------------------------------------------------------------------
void jsfSprlistFieldMod(int spr_index, int offset, int no_of_times, void *array_of_values)	// MUST Update 192 and double shifts (sprite_tabwidth)
{
	__asm__ ("\tmovem.l d0/d1/d3/a0/a1,-(sp)\n\t"	
			"move.l 	8(%fp),d0			\n\t"
			"move.l 	d0,d1				\n\t"
			"lsl 		#7,d0				\n\t"				// This line and below are *192 for sprite_tabwidth
			"lsl 		#6,d1				\n\t"
			"add.l 		d1,d0				\n\t"
			"add.l 		12(%fp),%d0			\n\t"
			"move.l 	raptor_liststart,%a0\n\t"
			"lea 		(a0,d0.l),a0		\n\t"	
			"move.l 	20(a6),a1			\n\t"
			"move.l 	16(a6),d1			\n\t"
			"subq.w 	#1,d1				\n\t"
			"sprlistloop2:\tmove.l (a1)+,d3	\n\t"
			"add.l 		d3,(a0)				\n\t"
			"lea 		192(a0),a0			\n\t"
			"dbra 		d1,sprlistloop2		\n\t"
            "movem.l 	(sp)+,d0/d1/d3/a0/a1\n\t");
}
// -----------------------------------------------------------------------------
void jsfSprlistFieldSet(int spr_index, int offset, int no_of_times, void *array_of_values)	// MUST Update 192 and double shifts (sprite_tabwidth)
{
	__asm__ ("\tmovem.l d0/d1/a0/a1,-(sp)	\n\t"
			"move.l 	8(%fp),d0			\n\t"
			"move.l 	d0,d1				\n\t"
			"lsl 		#7,d0				\n\t"				// This line and below are *192 for sprite_tabwidth
			"lsl 		#6,d1				\n\t"
			"add.l 		d1,d0				\n\t"
			"add.l 		12(%fp),%d0			\n\t"
			"move.l 	raptor_liststart,%a0\n\t"
			"lea 		(a0,d0.l),a0		\n\t"
			"move.l 	20(a6),a1			\n\t"
			"move.l 	16(a6),d1			\n\t"
			"subq.w 	#1,d1				\n\t"
			"sprlistloop:\tmove.l (a1)+,(a0)\n\t"
			"lea 		192(a0),a0			\n\t"
			"dbra 		d1,sprlistloop		\n\t"
            "movem.l 	(sp)+,d0/d1/a0/a1	\n\t");
}
// -----------------------------------------------------------------------------
void cls(void)
{
	rapParticleClear();
	
//    __asm__ ("movem.l d0/d1/a0,-(a7)\n\t"
//"              lea RAPTOR_particle_gfx,a0\n\t"
//"              move.l raptor_partbuf_x,d0\n\t"
//"              move.l raptor_partbuf_y,d1\n\t"
//"              mulu d1,d0\n\t"
//"              lsr.l #3,d0\n\t"
//"              subq.w #1,d0\n\t"
//"              |used to be: move.w #(320*240)/2/4-1,d0\n\t"
//"              moveq #0,d1\n\t"
//"clr_loop:     move.l d1,(a0)+\n\t"
//"              dbra d0,clr_loop\n\t"
//"              movem.l (a7)+,d0/d1/a0\n\t");
}
// -----------------------------------------------------------------------------
void jsfPlot(short plot_px, short plot_py)
{
__asm__ ("movem.l	d0-d4/a0,-(a6)\n\t"
"			move.l	8(a7),d0\n\t"
"			move.l	12(a7),d1\n\t"
"			move.b	_plot_colour,d2\n\t"
"			moveq	#15,d4\n\t"
"			btst	#0,d0\n\t"
"			beq.s	plot_even\n\t"
"			lsr.b	#4,d2\n\t"
"			moveq	#-16,d4\n\t"
"plot_even:	asr.w	#1,d0\n\t"
"			lea		RAPTOR_particle_gfx,a0\n\t"
"			add.w	d0,a0\n\t"
"			move.w	d1,d3\n\t"
"			asl.w	#5,d3\n\t"
"			asl.w	#7,d1\n\t"
"			add.w	d1,a0\n\t"
"			add.w	d3,a0\n\t"
"			and.b	d4,(a0)\n\t"
"			or.b	d2,(a0)\n\t"
"			movem.l	(a6)+,d0-d4/a0");
}
// -----------------------------------------------------------------------------
void jsfVsync(volatile int update)
{
	if (update==0) //NOW
	{
		if (jsfVsyncFlag!=4)
		{
		__asm__ ("\tjsr		RAPTOR_wait_frame_UPDATE_ALL\n\t");
		}
		else
		{
			RAPTOR_wait_frame();
			jsfVsyncFlag=0;
		}
	}
	else if (update==1) //VBL
	{
		jsfVsyncFlag=4;
	}
	else if (update==2) //Remove VBL
	{
		jsfVsyncFlag=0;
	}
}
// -----------------------------------------------------------------------------
void jsfDelay(int x)
{
	int delayloopcounter;
	for (delayloopcounter=0;delayloopcounter<x;delayloopcounter++) 
		jsfVsync(0);
}



int jsfEEPROMFullRead()
{
	__asm(	"\tmovem.l d1-a5,-(sp)              \n\t"
			"lea raptor_highscores1_hex,a0   	\n\t"
			"jsr eeReadBank                     \n\t"
			"ext.l d0 |sign extend d0           \n\t"
			"movem.l (sp)+,d1-a5");
}

short jsfEEPROMWordRead(short addr)
{
	__asm(	"\tmovem.l d1-a5,-(sp)              \n\t"
			"move.l 8(a6),d1                    \n\t"				
			"jsr eeReadWord                     \n\t"				
			"movem.l (sp)+,d1-a5");
}

int jsfEEPROMBoardRead(int boardnumber)
{
	__asm(	"\tmovem.l d1-a5,-(sp)					\n\t");	
	
	switch (boardnumber)
	{
		case 0:
		  __asm("lea raptor_highscores1_hex,a0		\n\t");
		  break;
		case 1:
		  __asm("lea raptor_highscores2_hex,a0		\n\t");
		  break;
		case 2:
		  __asm("lea raptor_highscores3_hex,a0		\n\t");
		  break;
		case 3:
		  __asm("lea raptor_highscores4_hex,a0		\n\t");
		  break;
		case 4:
		  __asm("lea raptor_highscores5_hex,a0		\n\t");
		  break;
		default:
		  __asm("lea raptor_highscores1_hex,a0		\n\t");
	}
	
	__asm(	"move.l 8(a6),d4                        \n\t"
			"jsr eeReadSingleBank               	\n\t"				
			"ext.l d0 |sign extend d0           	\n\t"
			"movem.l (sp)+,d1-a5");
}

int jsfEEPROMFullWrite()
{
	__asm(	"\tmovem.l d1-a5,-(sp)              \n\t"
			"lea raptor_highscores1_hex,a0   	\n\t"
			"jsr eeWriteBank                    \n\t"
			"ext.l d0 |sign extend d0           \n\t"
			"movem.l (sp)+,d1-a5");
}

short jsfEEPROMWordWrite(short addr, short value)
{
	__asm(	"\tmovem.l d1-a5,-(sp)              \n\t"
			"move.l 12(a6),d0                   \n\t"
			"move.l 8(a6),d1                    \n\t"				
			"jsr eeWriteWord                    \n\t"				
			"movem.l (sp)+,d1-a5");
}

int jsfEEPROMBoardWrite(int boardnumber)
{
	__asm(	"\tmovem.l d1-a5,-(sp)					\n\t");	
	
	switch (boardnumber)
	{
		case 0:
		  __asm("lea raptor_highscores1_hex,a0		\n\t");
		  break;
		case 1:
		  __asm("lea raptor_highscores2_hex,a0		\n\t");
		  break;
		case 2:
		  __asm("lea raptor_highscores3_hex,a0		\n\t");
		  break;
		case 3:
		  __asm("lea raptor_highscores4_hex,a0		\n\t");
		  break;
		case 4:
		  __asm("lea raptor_highscores5_hex,a0		\n\t");
		  break;
		default:
		  __asm("lea raptor_highscores1_hex,a0		\n\t");
	}
	
    __asm(	"move.l 8(a6),d4                        \n\t"
			"jsr eeWriteSingleBank                   \n\t"			
			"ext.l d0 |sign extend d0                \n\t"
			"movem.l (sp)+,d1-a5");
}



int jsfEEPROMUserDataRead() 
{
	__asm(	"\tmovem.l d1-a5,-(sp)              					\n\t"
			"lea raptor_user_savedata,a0							\n\t"
			"move.w	#256,d2				| Number of iterations		\n\t"
			"move.l #511,d1                   						\n\t"
			"loopreaduserdata:										\n\t"
			"	jsr eeReadWord                     					\n\t"
			"	move.w	d0,(a0)+	| Store data in buffer			\n\t"
			"	addq	#1,d1										\n\t"
			"	dbra	d2,loopreaduserdata							\n\t"			
			"movem.l (sp)+,d1-a5");
}


int jsfEEPROMUserDataWrite()
{
	__asm(	"\tmovem.l d1-a5,-(sp)              					\n\t"
			"lea raptor_user_savedata,a0							\n\t"
			"move.w	#256,d2				| Number of iterations		\n\t"
			"move.l #511,d1                   						\n\t"
			"loopwriteuserdata:										\n\t"
			"	move.w	(a0)+,d0									\n\t"
			"	jsr eeWriteWord										\n\t"
			"	addq	#1,d1										\n\t"
			"	dbra	d2,loopwriteuserdata						\n\t"
			"movem.l (sp)+,d1-a5");
}









// -----------------------------------------------------------------------------
int jsfEEPROM(int readwrite, void *buffer)
{
    __asm("\tmovem.l d1-a5,-(sp)                                                   \n\t"
"move.l 12(a6),a0                                                                  \n\t"
"tst.l 8(a6)                                                                       \n\t"
"beq.s savestuff                                                                   \n\t"
"jsr eeReadBank                                                                    \n\t"
"bra getout                                                                        \n\t"
"                                                                                  \n\t"
"savestuff:                                                                        \n\t"
"jsr eeWriteBank                                                                   \n\t"
"|move.w #0x134,0xF00058\n\t"
"                                                                                  \n\t"
"                                                                                  \n\t"
"getout: ext.l d0 |sign extend d0                                                  \n\t"
"movem.l (sp)+,d1-a5");
}
// -----------------------------------------------------------------------------
short jsfEEPROMWord(short readwrite, short addr, short value)
{
    __asm("\tmovem.l d1-a5,-(sp)                                                   \n\t"
"move.l 16(a6),d0                                                                  \n\t"
"move.l 12(a6),d1                                                                  \n\t"
"tst.l 8(a6)                                                                       \n\t"
"beq.s savestuffword                                                                   \n\t"
"jsr eeReadWord                                                                    \n\t"
"bra getoutword                                                                        \n\t"
"                                                                                  \n\t"
"savestuffword:                                                                        \n\t"
"jsr eeWriteWord                                                                   \n\t"
"|move.w #0x134,0xF00058\n\t"
"                                                                                  \n\t"
"                                                                                  \n\t"
"getoutword:                                                   \n\t"
"movem.l (sp)+,d1-a5");
}
// -----------------------------------------------------------------------------
int jsfEEPROMBoard(int readwrite, void *buffer, int boardnumber)
{
    __asm("\tmovem.l d1-a5,-(sp)                                                   \n\t"
"move.l 16(a6),d4                                                                  \n\t"
"move.l 12(a6),a0                                                                  \n\t"
"tst.l 8(a6)                                                                       \n\t"
"beq.s savestuffboard                                                                   \n\t"
"jsr eeReadSingleBank                                                                    \n\t"
"bra getoutboard                                                                        \n\t"
"                                                                                  \n\t"
"savestuffboard:                                                                        \n\t"
"jsr eeWriteSingleBank                                                                   \n\t"
"|move.w #0x134,0xF00058\n\t"
"                                                                                  \n\t"
"                                                                                  \n\t"
"getoutboard: ext.l d0 |sign extend d0                                                  \n\t"
"movem.l (sp)+,d1-a5");
}
// -----------------------------------------------------------------------------
void jsfLoadClut(unsigned short *paladdress, short target_clut, short no_of_indices)
{
	short i;
	unsigned short *src=(unsigned short *)paladdress;
	unsigned short *dest=(unsigned short *)(0xf00400+target_clut*(16*2));
	for (i=0;i<no_of_indices;i++)
		*dest++=*src++;
}
// -----------------------------------------------------------------------------
void jsfClearBuffer(int sizeInBytes, char *bufferAddress)
{
	__asm__("	movem.l		d7/a0,-(a7)                  	\n\t"
			"	move.l 		8(a6),d7                       	\n\t"
			"	move.l 		12(a6),a0                       \n\t"
			"	asr.l 		#2,d7                       	\n\t"
			"	.jsferase:	clr.l	(a0)+                   \n\t"
			"	subq.l		#1,d7                           \n\t"
			"	bne.s		.jsferase                       \n\t"
			"	movem.l		(a7)+,d7/a0                     \n\t");
}
// -----------------------------------------------------------------------------
// Code obtained from https://code.google.com/p/propgcc/source/browse/lib/stdlib/qsort.c
// Butchered by ggn as usual

/*
 * from the libnix library for the Amiga, written by
 * Matthias Fleischer and Gunther Nikl and placed in the public
 * domain
 */
#include <stdio.h>
#include <stdlib.h>

/* sample compare function: int cmp(void *a,void *b){ return *(int *)a-*(int *)b; } */
//ggn: Well, don't mind if I do then, hehe
static inline int cmp(void *a,void *b){ return *(int *)a-*(int *)b; }


/* This qsort function does a little trick:
 * To reduce stackspace it iterates the larger interval instead of doing
 * the recursion on both intervals. 
 * So stackspace is limited to 32*stack_for_1_iteration = 
 * 32*4*(4 arguments+1 returnaddress+11 stored registers) = 2048 Bytes,
 * which is small enough for everybodys use.
 * (And this is the worst case if you own 4GB and sort an array of chars.)
 * Sparing the function calling overhead does improve performance, too.
 */


void jsfSort(void *base,size_t nmemb)
{ static short size=4; //will sort longwords only
  char *base2=(char *)base;
  size_t i,a,b,c;
  while(nmemb>1)
  { a=0;
    b=nmemb-1;
    c=(a+b)/2; /* Middle element */
    for(;;)
    { while(cmp(&base2[size*c],&base2[size*a])>0) 
        a++; /* Look for one >= middle */
      while(cmp(&base2[size*c],&base2[size*b])<0) 
        b--; /* Look for one <= middle */
      if(a>=b)
        break; /* We found no pair */
      for(i=0;i<size;i++) /* swap them */
      { char tmp=base2[size*a+i];
        base2[size*a+i]=base2[size*b+i];
        base2[size*b+i]=tmp; }
      if(c==a) /* Keep track of middle element */
        c=b;
      else if(c==b)
        c=a;
      a++; /* These two are already sorted */
      b--;
    } /* a points to first element of right intervall now (b to last of left) */
    b++;
    if(b<nmemb-b) /* do recursion on smaller intervall and iteration on larger one */
    { jsfSort(base2,b);
      base2=&base2[size*b];
      nmemb=nmemb-b; }
    else
    { jsfSort(&base2[size*b],nmemb-b);
      nmemb=b; }
  }
}

//Original function for posterity:

//void qsort
//(void *base,size_t nmemb,size_t size,int (*compar)(const void *,const void *))
//{ char *base2=(char *)base;
//  size_t i,a,b,c;
//  while(nmemb>1)
//  { a=0;
//    b=nmemb-1;
//    c=(a+b)/2; /* Middle element */
//    for(;;)
//    { while((*compar)(&base2[size*c],&base2[size*a])>0) 
//        a++; /* Look for one >= middle */
//      while((*compar)(&base2[size*c],&base2[size*b])<0) 
//        b--; /* Look for one <= middle */
//      if(a>=b)
//        break; /* We found no pair */
//      for(i=0;i<size;i++) /* swap them */
//      { char tmp=base2[size*a+i];
//        base2[size*a+i]=base2[size*b+i];
//        base2[size*b+i]=tmp; }
//      if(c==a) /* Keep track of middle element */
//        c=b;
//      else if(c==b)
//        c=a;
//      a++; /* These two are already sorted */
//      b--;
//    } /* a points to first element of right intervall now (b to last of left) */
//    b++;
//    if(b<nmemb-b) /* do recursion on smaller intervall and iteration on larger one */
//    { qsort(base2,b,size,compar);
//      base2=&base2[size*b];
//      nmemb=nmemb-b; }
//    else
//    { qsort(&base2[size*b],nmemb-b,size,compar);
//      nmemb=b; }
//  }
//}







// -----------------------------------------------------------------------------
// Raptor
// -----------------------------------------------------------------------------
void rapInitCalcAngle(void *array_of_64k)
{
	__asm__ ("\tmovem.l d0,-(sp)				\n\t"
			"move.l 	8(a6),d0				\n\t"
			"jsr		RAPTOR_init_calc_angle	\n\t"
            "movem.l 	(sp)+,d0				\n\t");
}
// -----------------------------------------------------------------------------
int rapCalcAngle(int x1, int y1, int x2, int y2)
{
	__asm__ ("\tmovem.l d1-d3,-(sp)				\n\t"
			"move.l 	8(a6),d0				\n\t"
			"move.l 	12(a6),d1				\n\t"
			"move.l 	16(a6),d2				\n\t"
			"move.l 	20(a6),d3				\n\t"
			"jsr		RAPTOR_calc_angle		\n\t"
            "movem.l 	(sp)+,d1-d3				\n\t");
}
// -----------------------------------------------------------------------------

int rapAngle_xAdd asm("rapAngle_xAdd")=0;
int rapAngle_yAdd asm("rapAngle_yAdd")=0;

void rapAngleVector(int calcAngle)
{
	__asm__ ("\tmovem.l d0/a0,-(sp)						\n\t"
			"move.l 	8(a6),d0						\n\t"
			"lsl.l 		#3,d0							\n\t"
			"lea		RAPTOR_particle_trigtable,a0	\n\t"
			"add.l		d0,a0							\n\t"
			"move.l 	(a0)+,rapAngle_xAdd				\n\t"
			"move.l 	(a0),rapAngle_yAdd				\n\t"
            "movem.l 	(sp)+,d0/a0						\n\t");
}
// -----------------------------------------------------------------------------
void rapDebugSetMonitor(int monitorNumber, void *var_address)
{	
	__asm(""
			"movem.l d0/a0,-(a7)				\n\t"			
			"move.l	8(a6),d0					\n\t"		
			"lea 	raptor_console_monitors,a0	\n\t"				
			"lsl.l	#2,d0						\n\t"			
			"add.l	d0,a0						\n\t"			
			"move.l 12(a6),(a0)					\n\t"			
			"movem.l (sp)+,d0/a0");
}
// -----------------------------------------------------------------------------
void rapDebugPrint()
{
  	__asm__ ("movem.l	d0-d7/a0-a6,-(a7)			\n\t"
		  "move.l	_js_r_textbuffer,a0				\n\t"
		  "jsr		RAPTOR_console_update_textline	\n\t"
		  "movem.l	(a7)+,d0-d7/a0-a6				\n\t");
	
}
// -----------------------------------------------------------------------------
void rapDebugUpdate()
{
	__asm__ (""
	  "jsr		RAPTOR_console_update_registers		\n\t"
	  "jsr		RAPTOR_console_update_usermonitors	\n\t");
}
// -----------------------------------------------------------------------------
void rapDebugSetXY(int x, int y)
{
	raptor_console_x=x;
	raptor_console_y=y;
}
// -----------------------------------------------------------------------------
void rapDebugSetVisible(int visible)
{
	raptor_console_visible = -1;
	
	if(visible==1)
		raptor_console_visible = 1;	
}
// -----------------------------------------------------------------------------
void rapHiscoreSort(int table_to_sort, char *name)
{
	__asm__ (	"\tmovem.l d1/a0,-(a7)									\n\t"
				"move.l 8(a6),d1										\n\t"
				"move.l 12(a6),a0										\n\t"
				"jsr RAPTOR_resort_score_table							\n\t"
				"movem.l (a7)+,d1/a0");	
}
// -----------------------------------------------------------------------------
void rapBlitlist(void *blitlist)
{
	__asm(""
	"movem.l a0,-(sp)                               \n\t"
	"move.l 8(a6),a0                                   \n\t"
	"move.l jsfVsyncFlag,-(sp)	|save update flag      \n\t"
	"move.l #0,jsfVsyncFlag		|disable auto update   \n\t"
	"jsr RAPTOR_blitter		                           \n\t"
	"move.l (sp)+,jsfVsyncFlag	|restore update flag   \n\t"
	"movem.l (sp)+,a0                               \n\t");
}
// -----------------------------------------------------------------------------
void rapNumToStr(long number, long no_digits, char *string)
{
	__asm__ ("\tmovem.l d1/d4/a0,-(sp)\n\t"
            "movem.l 8(a6),d1/d4/a0\n\t"
            "jsr RAPTOR_HEXtoDEC\n\t"
			"clr.b 1(a0,d4.w)    |hex2dec expects digits-1 in d4 and we want to zero out the byte after the last digit\n\t"
            "movem.l (sp)+,d1/d4/a0\n\t");
}
// -----------------------------------------------------------------------------
void rapHexToStr(long bytesToConvert, char *source, char *dest)
{
	__asm__ ("\tmovem.l d0/a0/a1,-(sp)				\n\t"
            "movem.l 8(a6),d0/a0/a1					\n\t"
			"move.l d0,d1							\n\t"
			"lsl #1,d1								\n\t"
			"sub.l #1,d0							\n\t"
            "jsr RAPTOR_HEXtoASCII					\n\t"
            "clr.b 1(a1,d1.w)    |hex2dec expects digits-1 in d4 and we want to zero out the byte after the last digit\n\t"
			"movem.l (sp)+,d0/a0/a1					\n\t");
}
// -----------------------------------------------------------------------------
void RBRA(long object_number, long branch_type, long ypos, long object_to_branch_if_taken)
{
	__asm__ ("\tmovem.l d0-d3/a6,-(sp) |lolol\n\t"
            "movem.l 8(a6),d0-d3\n\t"    
            "jsr RAPTOR_setup_object_bra\n\t"
            "movem.l (sp)+,d0-d3/a6    |lolol\n\t");
}
// -----------------------------------------------------------------------------
short rapHiscoreCheck(int score, char *name, int table)
{
	__asm__ (	"\tmovem.l d1-d7/a0-a5,-(sp)							\n\t"
				"move.l 8(a6),d0										\n\t"
				"move.l 12(a6),a0										\n\t"
				"move.l 16(a6),d1										\n\t"
				"jsr RAPTOR_chk_highscores								\n\t"
				"movem.l (sp)+,d1-d7/a0-a5								\n\t");
}
// -----------------------------------------------------------------------------
int rapFadeSingle(short clut_index,short target_col)
{
	__asm__ ("\tmove.l d1,-(a7)\n\t"
	"move.w 10(a6),d1\n\t"
	"move.w 8(a6),d0\n\t"
	"jsr RAPTOR_fade_clutindex\n\t"
	"move.l (a7)+,d1");	
}
// -----------------------------------------------------------------------------
int rapFadeClut(int clut_no,int fade_cols,int *palette)
{
	__asm__ ("\tmovem.l d7/a1,-(a7)\n\t"
	"move.l 16(a6),a1\n\t"
	"move.l 12(a6),d7\n\t"
	"move.l 8(a6),d0\n\t"
	"jsr RAPTOR_fade_clut\n\t"
	"movem.l (a7)+,d7/a1");
}
// -----------------------------------------------------------------------------
void rapSetActiveList(int list_index)
{
	//static int d0 asm ("d0")=list_index;
__asm__ ("movem.l	d0-d7/a0-a6,-(a7)\n\t"
"			move.l 8+60(sp),d0\n\t"
"    		jsr		RAPTOR_setlist\n\t"
"			movem.l	(a7)+,d0-d7/a0-a6");
}
// -----------------------------------------------------------------------------
int rapCollide(int r_sl, int r_sh, int r_tl, int r_th)
{
	__asm__ ("	movem.l	d1-d7/a0-a6,-(a7)");
	raptor_result=0;
	raptor_sourcel=r_sl;
	raptor_sourceh=r_sh;
	raptor_targetl=r_tl;
	raptor_targeth=r_th;
	__asm__ ("	lea		RAPTOR_GPU_COLLISION,a0");
	__asm__ ("	jsr 	RAPTOR_call_GPU_code");
	__asm__ ("	movem.l	(a7)+,d1-d7/a0-a6");
	return raptor_result;
}
// -----------------------------------------------------------------------------
void rapParticleInject(int *fx)
{
	//fx is an array of longs - 6 rows and
	//as many columns as the user wants
	//first column should be:
	//zzz,zzz,zzz,no_particles,x,y (zzz=don't care)
	*(int *)&raptor_part_inject_addr=(int)&fx[3];
	__asm__ ("movem.l	d0-a6,-(a7)\n\t"
"lea		RAPTOR_particle_injection_GPU,a0\n\t"
"jsr 	RAPTOR_call_GPU_code\n\t"
"movem.l	(a7)+,d0-a6");
}
// -----------------------------------------------------------------------------
void rapSetMapLoc(int x,int y)
{
	raptor_map_position_x=x;
	raptor_map_position_y=y;
	__asm__ ("	movem.l	d0-d7/a0-a6,-(a7)\n\t"
"jsr		RAPTOR_map_set_position\n\t"
"movem.l	(a7)+,d0-d7/a0-a6");
}
// -----------------------------------------------------------------------------
void rapPrint()
{
	//volatile char *rprint_buffer __asm__ ("a0")=string;
  	__asm__ ("movem.l	d0-d7/a0-a6,-(a7)	\n\t"
		  "move.l	_js_r_xpos,d0		\n\t"
		  "move.l	_js_r_ypos,d1		\n\t"
		  "move.l	_jsfFontSize,d2			\n\t"
		  "move.l	_jsfFontIndx,d3			\n\t"
		  "move.l	_js_r_textbuffer,a0		\n\t"
		  "jsr		RAPTOR_print			\n\t"
		  "movem.l	(a7)+,d0-d7/a0-a6		\n\t");
	
}
void rapPrintCont()
{
  	__asm__ ("movem.l	d0-d7/a0-a6,-(a7)		\n\t"
		  "move.l	_jsfFontSize,d2		\n\t"
		  "move.l	_jsfFontIndx,d3		\n\t"
		  "move.l	_js_r_textbuffer,a0	\n\t"
		  "jsr		RAPTOR_printr		\n\t"
		  "movem.l	(a7)+,d0-d7/a0-a6			\n\t");
	
}
// -----------------------------------------------------------------------------
void rapLocate(int x, int y)
{
	js_r_xpos=x;
	js_r_ypos=y;
}
// -----------------------------------------------------------------------------
void rapUpdateOffscreenList(int list_index)
{
__asm__ ("movem.l	d0-d7/a0-a6,-(a7)\n\t"
"			move.l 8(a6),d0\n\t"
"    		jsr		RAPTOR_update_offscreenlist\n\t"
"			movem.l	(a7)+,d0-d7/a0-a6");
}
// -----------------------------------------------------------------------------
void rapSpriteShift(int x, int y, int spr_index, int no_of_objects)
{
	__asm__ ("movem.l	d0-d2/a0,-(a7)		\n\t"	
			"move.l 	16(%fp),d0			\n\t"
			"move.l 	d0,d1				\n\t"
			"lsl 		#7,d0				\n\t"
			"lsl 		#6,d1				\n\t"
			"add.l 		d1,d0				\n\t"
			"move.l 	raptor_liststart,%a0\n\t"
			"lea 		(a0,d0.l),a0		\n\t"
			"move.l 	8(a6),d0			\n\t"
			"move.l 	12(a6),d1			\n\t"
			"move.l 	20(a6),d2			\n\t"
			"jsr 		RAPTOR_obj_shift	\n\t"
			"movem.l	(a7)+,d0-d2/a0");
}
// -----------------------------------------------------------------------------
void rapSetClock(int value)
{
__asm__ ("	move.l	d0,-(a7)		\n\t"
"			move.l 	8(a6),d0		\n\t"
"    		jsr		RAPTOR_setclock	\n\t"
"			move.l	(a7)+,d0");
}
// -----------------------------------------------------------------------------
void rapAddClock(int value)
{
__asm__ ("	movem.l	d0,-(a7)		\n\t"
"			move.l 	8(a6),d0		\n\t"
"    		jsr		RAPTOR_addclock	\n\t"
"			movem.l	(a7)+,d0");
}
// -----------------------------------------------------------------------------
void rapSubClock(int value)
{
__asm__ ("	movem.l	d0,-(a7)		\n\t"
"			move.l 	8(a6),d0		\n\t"
"    		jsr		RAPTOR_subclock	\n\t"
"			movem.l	(a7)+,d0");
}
// -----------------------------------------------------------------------------
void rapSortSprites(int spr_index, int offset, int no_of_objects, int sortdir)	// MUST Update 192 and double shifts (sprite_tabwidth)
{
	__asm__ ("movem.l	d0-d2/a0,-(a7)		\n\t"
			"move.l 	8(%fp),d0			\n\t"
			"move.l 	d0,d1				\n\t"
			"lsl 		#7,d0				\n\t"				// This line and below are *192 for sprite_tabwidth
			"lsl 		#6,d1				\n\t"
			"add.l 		d1,d0				\n\t"
			"move.l 	raptor_liststart,%a0\n\t"
			"lea 		(a0,d0.l),a0		\n\t"			
			"move.l 	12(a6),d0			\n\t"
			"move.l 	16(a6),d1			\n\t"
			"move.l 	20(a6),d2			\n\t"
			"jsr 		RAPTOR_objsort		\n\t"
			"movem.l	(a7)+,d0-d2/a0");
}
// -----------------------------------------------------------------------------
int rapFlashCheck()
{
	__asm__ (	"\t	jsr		RAPTOR_flashcheck								\n\t");
}




// -----------------------------------------------------------------------------
// Raptor GD
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
int rapGDGetCartSerial()
{
	__asm__ ("jsr 	RAPTOR_GD_GetCartSerial");
}
// -----------------------------------------------------------------------------
short rapGDCardInserted()
{
	__asm__ ("	jsr 			RAPTOR_GD_CardIn		\n\t"
			"	cmp.b			#1,d0					\n\t"
			"	bne				.rapGDCartSerial_no		\n\t"
			"	moveq			#1,d0					\n\t"
			"	jmp				.rapGDCartSerial_end	\n\t"
			".rapGDCartSerial_no:						\n\t"
			"	moveq			#0,d0					\n\t"
			".rapGDCartSerial_end:						\n\t");
}
// -----------------------------------------------------------------------------
void rapGDSetLEDOn()
{
	__asm__ ("	movem.l	d0,-(a7)			\n\t"
			"	moveq	#1,d0				\n\t"
			"	jsr		RAPTOR_GD_SetLED	\n\t"
			"	movem.l	(a7)+,d0			\n\t");
}
// -----------------------------------------------------------------------------
void rapGDSetLEDOff()
{
	__asm__ ("	movem.l	d0,-(a7)			\n\t"
			"	moveq	#0,d0				\n\t"
			"	jsr		RAPTOR_GD_SetLED	\n\t"
			"	movem.l	(a7)+,d0			\n\t");
}
// -----------------------------------------------------------------------------
void rapGDReset(int resetType)
{
	__asm__ ("	movem.l	d0,-(a7)			\n\t"
			"	move.l 	8(a6),d0			\n\t"
			"	jmp		RAPTOR_GD_Reset		\n\t"
			"	movem.l	(a7)+,d0			\n\t");
}
// -----------------------------------------------------------------------------
int rapGDGetCardSerial()
{
	__asm__ ("jsr 	RAPTOR_GD_GetCardSerial");
}
// -----------------------------------------------------------------------------
void rapGDDebugPrint()
{
  	__asm__ ("	movem.l	d0-d7/a0-a6,-(a7)				\n\t"
			"	move.l	_js_r_textbuffer,a0				\n\t"
			"	jsr		RAPTOR_GD_DebugString			\n\t"
			"	movem.l	(a7)+,d0-d7/a0-a6				\n\t");	
}
// -----------------------------------------------------------------------------
int rapGDLoadFile(void *fullPathAddr, void *buffer)
{
  	__asm__ ("	movem.l	a0-a1,-(a7)				\n\t"	
			"	move.l 	8(a6),a0				\n\t"
			"	move.l 	12(a6),a1				\n\t"
			"	jsr		RAPTOR_GD_LoadFile		\n\t"			
			"	movem.l	(a7)+,a0-a1				\n\t");	
}
// -----------------------------------------------------------------------------
int rapGDSaveFile(void *fullPathAddr, void *buffer, int size)
{
  	__asm__ ("	movem.l	a0-a1,-(a7)				\n\t"	
			"	move.l 	8(a6),a0				\n\t"
			"	move.l 	12(a6),a1				\n\t"
			"	move.l 	16(a6),d0				\n\t"
			"	jsr		RAPTOR_GD_SaveFile		\n\t"			
			"	movem.l	(a7)+,a0-a1				\n\t");	
}
// -----------------------------------------------------------------------------
int rapGDBIOSVersion()	//D0=nn.nn BCD format, high word FIRMWARE, low word ASIC
{
  	__asm__ ("	jsr		RAPTOR_GD_BIOSVersion		\n\t");
}
// -----------------------------------------------------------------------------
int rapGDROMWriteEnable(int enableFlag) //;; D0=GD_ROMWRITE_ENABLE / GD_ROMWRITE_DISABLE
{
  	__asm__ ("	move.l 	8(a6),d0					\n\t"
			 "	jsr		RAPTOR_GD_ROMWriteEnable	\n\t");
}
// -----------------------------------------------------------------------------
int rapGDDirOpen(void *fullPathAddr)
{
  	__asm__ ("	movem.l	a0,-(a7)			\n\t"
			 "	move.l 	8(a6),a0			\n\t"
			 "	jsr		RAPTOR_GD_DirOpen	\n\t"		
			 "	movem.l	(a7)+,a0			\n\t");	
}
// -----------------------------------------------------------------------------
int rapGDDirRead(int handle)
{
  	__asm__ ("	move.l 	8(a6),d0			\n\t"
			 "	jsr		RAPTOR_GD_DirRead	\n\t");	
}
// -----------------------------------------------------------------------------
int rapGDDirClose(int handle)
{
  	__asm__ ("	move.l 	8(a6),d0			\n\t"
			 "	jsr		RAPTOR_GD_DirClose	\n\t");	
}
// -----------------------------------------------------------------------------
int rapGDFileOpen(int mode, void *fullPathAddr)
{
  	__asm__ ("	movem.l	a0,-(a7)			\n\t"
			 "	move.l 	8(a6),d0			\n\t"
			 "	move.l 	12(a6),a0			\n\t"
			 "	jsr		RAPTOR_GD_FileOpen	\n\t"		
			 "	movem.l	(a7)+,a0			\n\t");	
}
// -----------------------------------------------------------------------------
int rapGDFileRead(int handle, int bytesToRead, int flags, void *buffer)
{
  	__asm__ ("	movem.l	d1-d2/a0,-(a7)			\n\t"
			 "	move.l 	8(a6),d0				\n\t"
			 "	move.l 	12(a6),d1				\n\t"
			 "	move.l 	16(a6),d2				\n\t"
			 "	move.l 	20(a6),a0				\n\t"
			 "	jsr		RAPTOR_GD_FileRead		\n\t"		
			 "	movem.l	(a7)+,d1-d2/a0			\n\t");	
}
// -----------------------------------------------------------------------------
int rapGDFileWrite(int handle, int bytesToWrite, void *buffer)
{
  	__asm__ ("	movem.l	d1/a0,-(a7)				\n\t"
			 "	move.l 	8(a6),d0				\n\t"
			 "	move.l 	12(a6),d1				\n\t"
			 "	move.l 	16(a6),a0				\n\t"
			 "	jsr		RAPTOR_GD_FileWrite		\n\t"		
			 "	movem.l	(a7)+,d1/a0				\n\t");	
}
// -----------------------------------------------------------------------------
int rapGDFileClose(int handle)
{
  	__asm__ ("	move.l 	8(a6),d0			\n\t"
			 "	jsr		RAPTOR_GD_FileClose	\n\t");	
}
// -----------------------------------------------------------------------------
int rapGDFileSeek(int handle, int offset, int flags)
{
  	__asm__ ("	movem.l	d1-d2/a0,-(a7)			\n\t"
			 "	move.l 	8(a6),d0				\n\t"
			 "	move.l 	12(a6),d1				\n\t"
			 "	move.l 	16(a6),d2				\n\t"
			 "	jsr		RAPTOR_GD_FileSeek		\n\t"		
			 "	movem.l	(a7)+,d1-d2/a0			\n\t");	
}
// -----------------------------------------------------------------------------
int rapGDFileTell(int handle)
{
  	__asm__ ("	move.l 	8(a6),d0			\n\t"
			 "	jsr		RAPTOR_GD_FileTell	\n\t");	
}
// -----------------------------------------------------------------------------
int rapGDFileSize(int handle)
{
  	__asm__ ("	move.l 	8(a6),d0			\n\t"
			 "	jsr		RAPTOR_GD_FileSize	\n\t");	
}
// -----------------------------------------------------------------------------
int rapGDFileInfo(int flags, void *fullPathAddr, void *buffer)
{
  	__asm__ ("	movem.l	a0-a1,-(a7)				\n\t"
			 "	move.l 	8(a6),d0				\n\t"
			 "	move.l 	12(a6),a0				\n\t"
			 "	move.l 	16(a6),a1				\n\t"
			 "	jsr		RAPTOR_GD_FileInfo		\n\t"		
			 "	movem.l	(a7)+,a0-a1				\n\t");	
}
// -----------------------------------------------------------------------------
int rapGDFTimeToASCII(short ftime, void *outputBuffer)	//a0=output buffer (8 bytes HH:MM:SS)
{
  	__asm__ ("	move.w 	8(a6),d0				\n\t"
			 "	move.l 	12(a6),a0				\n\t"
			 "	jsr		RAPTOR_ftime_to_ascii	\n\t");	
}
// -----------------------------------------------------------------------------
int rapGDFDateToASCII(short fdate, void *outputBuffer)	//a0=output buffer (10 bytes YYYY:MM:DD)
{
  	__asm__ ("	move.w 	8(a6),d0				\n\t"
			 "	move.l 	12(a6),a0				\n\t"
			 "	jsr		RAPTOR_fdate_to_ascii	\n\t");	
}
// -----------------------------------------------------------------------------
void rapUseParticlePalette(short clutToPopulate)
{
	__asm__ ("\tmove.l 	8(a6),d0						\n\t"
			"jsr		RAPTOR_usepartipal				\n\t");
}
// -----------------------------------------------------------------------------
void rapUse8x8fontPalette(short clutToPopulate)
{
	__asm__ ("\tmove.l 	8(a6),d0						\n\t"
			"jsr		RAPTOR_use8x8fontpal			\n\t");
}
// -----------------------------------------------------------------------------
void rapUse8x16fontPalette(short clutToPopulate)
{
	__asm__ ("\tmove.l 	8(a6),d0						\n\t"
			"jsr		RAPTOR_use8x16fontpal			\n\t");
}
// -----------------------------------------------------------------------------
void rapUse16x16fontPalette(short clutToPopulate)
{
	__asm__ ("\tmove.l 	8(a6),d0						\n\t"
			"jsr		RAPTOR_use16x16fontpal			\n\t");
}
// -----------------------------------------------------------------------------



// -----------------------------------------------------------------------------
// U235 SE
// -----------------------------------------------------------------------------
void u235PlaySample(int channel,int sfxnum)
{
	if(AUDIOPLAYER==AUD_ZERO)
		RAPTOR_ERROR();

	__asm__ ("\t"
	"movem.l d0-d1,-(a7)			\n\t"
	"move.l 12(a6),d1				\n\t"
	"move.l 8(a6),d0				\n\t"
	"lsl.w	#8,d1					\n\t"
	"lsl.w	#4,d0					\n\t"
	"or.w	d0,d1					\n\t"
	"addq.w	#2,d1					\n\t"
	"jsr RAPTOR_U235queuesample		\n\t"
	"movem.l (a7)+,d0-d1			\n\t");		//d1=(sfxnum<<8)+(channel<<4)+2;
}
void u235PlaySampleFreq(int channel,int sfxnum,int freq)
{	
	if(AUDIOPLAYER==AUD_ZERO)
		RAPTOR_ERROR();

	__asm__ ("\t"
	"movem.l d0-d2,-(a7)			\n\t"
	"move.l 16(a6),d1				\n\t"
	"move.l 12(a6),d2				\n\t"
	"move.l 8(a6),d0				\n\t"
	"lsr.l	#1,d1					\n\t"
	"swap.w	d1						\n\t"
	"lsl.w	#8,d2					\n\t"
	"lsl.w	#4,d0					\n\t"
	"or.w	d2,d1					\n\t"
	"or.w	d0,d1					\n\t"
	"addq.w	#4,d1					\n\t"
	"jsr RAPTOR_U235queuesample		\n\t"
	"movem.l (a7)+,d0-d2			\n\t");		//d1=((freq>>1)<<16)+(sfxnum<<8)+(channel<<4)+4;
}
// -----------------------------------------------------------------------------//Change frequency of channel
void u235ChannelFreq(int channel,int freq)
{	
	if(AUDIOPLAYER==AUD_ZERO)
		RAPTOR_ERROR();

	__asm__ ("\t						"
	"movem.l d0-d1,-(a7)			\n\t"
	"move.l 12(a6),d1				\n\t"
	"move.l 8(a6),d0				\n\t"
	"lsr.w	#1,d1					\n\t"
	"swap.w	d1						\n\t"	
	"lsl.w	#4,d0					\n\t"
	"or.w	d0,d1					\n\t"
	"addq.w	#7,d1					\n\t"
	"jsr RAPTOR_U235queuesample		\n\t"
	"movem.l (a7)+,d0-d1			\n\t");		//d1=((freq>>1)<<16)+(channel<<4)+7;			
}
// -----------------------------------------------------------------------------
void u235KillChannel(int channel)
{
	if(AUDIOPLAYER==AUD_ZERO)
		RAPTOR_ERROR();

	__asm__ ("\tmovem.l d1,-(a7)	\n\t"
	"move.l 8(a6),d1				\n\t"
	"lsl.w	#4,d1					\n\t"
	"addq.w	#1,d1					\n\t"
	"jsr RAPTOR_U235queuesample		\n\t"
	"movem.l (a7)+,d1				\n\t");		//d1=channel<<4|1;	
}
// -----------------------------------------------------------------------------   
void u235ChannelVol(int channel,int volume)
{
	if(AUDIOPLAYER==AUD_ZERO)
		RAPTOR_ERROR();

	__asm__ ("\tmovem.l d0-d1,-(a7)	\n\t"
	"move.l 12(a6),d1				\n\t"
	"move.l 8(a6),d0				\n\t"
	"lsl.w	#8,d1					\n\t"
	"lsl.w	#4,d0					\n\t"
	"or.w	d0,d1					\n\t"
	"addq.w	#3,d1					\n\t"
	"jsr RAPTOR_U235queuesample		\n\t"
	"movem.l (a7)+,d0-d1			\n\t");		//d1=volume<<8|channel<<4|3;
}
// -----------------------------------------------------------------------------
int u235GetPad(int pad)
{
	if (pad==LEFT_PAD)
		return U235SE_pad1;
	
	if (pad==RIGHT_PAD)
		return U235SE_pad2;
	
	return 0;
}
// -----------------------------------------------------------------------------
void u235PlayModule(int module,short stereo)
{
	if(AUDIOPLAYER==AUD_ZERO)
		RAPTOR_ERROR();
	
	if (module>0)
	{
		__asm__("move.l 8(a6),a0\n\t"
				"jsr RAPTOR_U235setmodule\n\t");

		if(stereo==1)
		{
			__asm__("jsr RAPTOR_U235gomodule_stereo");
		}
		else			
		{
			__asm__("jsr RAPTOR_U235gomodule_mono");
		}
	}
	else
	{
		RAPTOR_U235stopmodule();
	}
}
// -----------------------------------------------------------------------------
void u235StopModule()
{
	if(AUDIOPLAYER==AUD_ZERO)
		RAPTOR_ERROR();
	
	RAPTOR_U235stopmodule();
}
// -----------------------------------------------------------------------------
void u235Silence()
{
	if(AUDIOPLAYER==AUD_ZERO)
		RAPTOR_ERROR();
	
	RAPTOR_U235SilenceChannels();
}
// -----------------------------------------------------------------------------
void u235ChangeReplayFrq(int freq, int period)
{
	if(AUDIOPLAYER==AUD_ZERO)
		RAPTOR_ERROR();
	
	__asm__("\tmovem.l d0-d1,-(a7)\n\t"
			"move.l 8(a6),d0\n\t"
			"move.l 12(a6),d1\n\t"
			"jsr RAPTOR_U235ChangeReplayFrq\n\t"
			"movem.l (a7)+,d0-d1\n\t");
}
// -----------------------------------------------------------------------------
void u235ModuleVol(int volume)
{
    U235SE_music_vol=volume;
}
// -----------------------------------------------------------------------------
void u235SampleVol(int volume)
{
    U235SE_sfx_vol=volume;
}
// -----------------------------------------------------------------------------
void u235StopDSP()
{
	if(AUDIOPLAYER==AUD_ZERO)
		RAPTOR_ERROR();
	
	__asm__("jsr RAPTOR_U235stopDSP");
}
// -----------------------------------------------------------------------------
void u235Init(int rate,int period)
{
	if(AUDIOPLAYER==AUD_ZERO)
		RAPTOR_ERROR();
	
	__asm__ ("\tmovem.l 	d0-d1,-(sp)			\n\t"
            "move.l    		8(a6),d0			\n\t"  
            "move.l    		12(a6),d1			\n\t"  
            "jsr			RAPTOR_U235init		\n\t"    
            "movem.l 		(sp)+,d0-d1			\n\t");	
}
// -----------------------------------------------------------------------------
void u235Restart(int rate,int period)
{
	if(AUDIOPLAYER==AUD_ZERO)
		RAPTOR_ERROR();
	
	__asm__("jsr RAPTOR_U235stopDSP");
	
	jsfVsync(0);										// Allow change to happen
	jsfVsync(0);
	
	__asm__ ("\tmovem.l d0-d1,-(sp)				\n\t"
            "move.l    	8(a6),d0				\n\t"  
            "move.l    	12(a6),d1				\n\t"  
            "jsr		RAPTOR_U235init			\n\t"    
            "movem.l 	(sp)+,d0-d1				\n\t");

	jsfVsync(0);										// Allow change to happen
	jsfVsync(0);			
}
// -----------------------------------------------------------------------------






// -----------------------------------------------------------------------------
// Zero Player
// -----------------------------------------------------------------------------
int zeroGetPad(int pad)
{	
	if (pad==LEFT_PAD)
	{
		__asm__ ("\tmovem.l d0-d4,-(sp)\n\t"
                "jsr Input_Read\n\t"
            "movem.l d0-d4,zero_left_pad\n\t"    
            "movem.l (sp)+,d0-d4\n\t");	
		return zero_left_pad;
	}
	
	if (pad==RIGHT_PAD)
	{
		__asm__ ("\tmovem.l d0-d4,-(sp)\n\t"
                "jsr Input_Read\n\t"
            "movem.l d0-d4,zero_left_pad\n\t"    
            "movem.l (sp)+,d0-d4\n\t");
		return zero_right_pad;
	}
}
// -----------------------------------------------------------------------------
//zeroPlaySample(3, (void *)(gamemusic0), ((gamemusic0_end)-(gamemusic0)+3) and 0xfffffffc, (46168/22050), Zero_Audio_8bit_muLaw)
void zeroPlaySample(int channel, void *sound_address, int sample_size, int sample_divider, int play_command)
{
	if(AUDIOPLAYER==AUD_U235)
		RAPTOR_ERROR();
	
__asm(""
	"movem.l d0/a0/d1/d2/d3,-(a7)\n\t"
	"move.l	8(a6),d0\n\t"
	"move.l	12(a6),a0\n\t"
	"move.l	16(a6),d1\n\t"
	"move.l	20(a6),d2\n\t"
	"move.l	24(a6),d3\n\t"
	"jsr		Audio_Play\n\t"
	"movem.l (sp)+,d0/a0/d1/d2/d3");
}
// -----------------------------------------------------------------------------
//zeroPlay(3, (void *)(gamemusic0), (void *)(gamemusic0_end), (46168/22050), Zero_Audio_8bit_muLaw)
void zeroPlay(int channel, void *sound_address, void *sound_endaddress, int sample_divider, int play_command)
{
	if(AUDIOPLAYER==AUD_U235)
		RAPTOR_ERROR();
	
__asm(""
	"movem.l d0/a0/a1/d1/d2/d3,-(a7)\n\t"
	
	"move.l	12(a6),a0			\n\t"		// start address
	"move.l	16(a6),d1			\n\t"		// end address
	
	// start address should be aligned to 4 bytes.  length should be multiple of 4
	// length = ((sound_endaddress)-(sound_address)+3) and 0xfffffffc	
	"sub.l a0,d1				\n\t" 		// subract start address from end address
	"addq.l #3,d1				\n\t"		// add 3 to the result
	"and.w #0xfffc,d1			\n\t"		// round
	
	"move.l	8(a6),d0			\n\t"		// channel
	"move.l	20(a6),d2			\n\t"		// frequency (sample_divider)
	"move.l	24(a6),d3			\n\t"		// play_command
	"jsr	Audio_Play			\n\t"
	
	"movem.l (sp)+,d0/a0/a1/d1/d2/d3");
}
// -----------------------------------------------------------------------------
void zeroClearChannel(int channel)
{
	if(AUDIOPLAYER==AUD_U235)
		RAPTOR_ERROR();
	
	__asm(""
		"movem.l d0/a0/d1/d2/d3,-(a7)\n\t"
		"move.l	8(a6),d0		\n\t"
		"move.l	#0,a0			\n\t"
		"move.l	#0,d1			\n\t"
		"move.l	#0,d2			\n\t"
		"move.l	#0,d3			\n\t"
		"jsr		Audio_Play	\n\t"
		"movem.l (sp)+,d0/a0/d1/d2/d3");
}
// -----------------------------------------------------------------------------



// -----------------------------------------------------------------------------
//	LSP SE
// -----------------------------------------------------------------------------

int LSPGetPad(int pad)
{
	if (pad==LEFT_PAD)
		return DSP_pad1;
	
	if (pad==RIGHT_PAD)
		return DSP_pad2;
	
	return 0;
}


void LSPPlayModule(int MODULE_lsmusic,int MODULE_lsbank)
{
	if(AUDIOPLAYER != AUD_LSP)
		RAPTOR_ERROR();

	__asm__("\tmovem.l 	d0-d7/a0-a6,-(a7)		\n\t"
			"move.l 	8(a6),a0				\n\t"
			"move.l 	12(a6),a1				\n\t"
			//"move.l		#1,LSP_DSP_flag			\n\t"
			"jsr 		RAPTOR_LSP_playmodule	\n\t"
			"movem.l 	(a7)+,d0-d7/a0-a6		\n\t");	
}

void LSPStartMusic()
{
	if(AUDIOPLAYER != AUD_LSP)
		RAPTOR_ERROR();
	
	__asm__("jsr RAPTOR_LSP_startmusic");	
}
void LSPStopMusic()
{
	if(AUDIOPLAYER != AUD_LSP)
		RAPTOR_ERROR();
	
	__asm__("jsr RAPTOR_LSP_stopmusic");	
}
void LSPMusicToggle()
{
	if(AUDIOPLAYER != AUD_LSP)
		RAPTOR_ERROR();
	
	__asm__("jsr RAPTOR_LSP_onoff");	
}

void LSPStartDSP()
{
	if(AUDIOPLAYER != AUD_LSP)
		RAPTOR_ERROR();
	
	__asm__("jsr RAPTOR_LSP_StartDSP");	
}


void LSPPlaySampleLoop(void *sound_address, void *sound_endaddress, void *sound_loopaddress, void *sound_loopendaddress, int frequency, int volume, int channel)
{
	if(AUDIOPLAYER != AUD_LSP)
		RAPTOR_ERROR();
	
__asm(""
	"movem.l d0-d7/a0-a6,-(a7)\n\t"
	
	"move.l	8(a6),d0			\n\t"		// start address of sample
	"move.l	12(a6),d1			\n\t"		// end address of sample
	"move.l	16(a6),d2			\n\t"		// start address of loop position (or #silence)
	"move.l	20(a6),d3			\n\t"		// end address of loop position (or #fin_silence)
	"move.l	24(a6),d4			\n\t"		// freq (music divide SCLK correctly, eg 7389, 15389)
	"lsl.l 	#8,d4				\n\t"		// freq shift
	"move.l	28(a6),d5			\n\t"		// volume (0-63)
	"move.l	32(a6),d6			\n\t"		// channel (0-3)

	"jsr	RAPTOR_LSP_Sample	\n\t"
	
	"movem.l (a7)+,d0-d7/a0-a6");
}


void LSPPlaySample(void *sound_address, void *sound_endaddress, int frequency, int volume, int channel)
{
	if(AUDIOPLAYER != AUD_LSP)
		RAPTOR_ERROR();
	
__asm(""
	"movem.l d0-d7/a0-a6,-(a7)\n\t"
	
	"move.l	8(a6),d0			\n\t"		// start address of sample
	"move.l	12(a6),d1			\n\t"		// end address of sample
	"move.l	#silence,d2			\n\t"		// start address of loop position (or #silence)
	"move.l	#fin_silence,d3		\n\t"		// end address of loop position (or #fin_silence)
	"move.l	16(a6),d4			\n\t"		// freq (music divide SCLK correctly, eg 7389, 15389)
	"lsl.l 	#8,d4				\n\t"		// freq shift
	"move.l	20(a6),d5			\n\t"		// volume (0-63)
	"move.l	24(a6),d6			\n\t"		// channel (0-3)

	"jsr	RAPTOR_LSP_Sample	\n\t"
	
	"movem.l (a7)+,d0-d7/a0-a6");
}



// -----------------------------------------------------------------------------
int rapCheckTTExists(int teamtapport)
{
	if (teamtapport==TT_LEFT)
	{
		__asm__ (	"\t	moveq	#0,d0										\n\t"
					"	jsr		RAPTOR_check_left_teamptap					\n\t"
					"	tst.l	raptor_left_teamtap							\n\t"
					"	bmi		endlefttt									\n\t"
					"	moveq	#1,d0										\n\t"
					"endlefttt:       										\n\t"
					"	ext.l d0 							|sign extend d0 \n\t"
		);	
	}
	else if (teamtapport==TT_RIGHT)
	{
		__asm__ (	"\t	moveq	#0,d0										\n\t"
					"	jsr		RAPTOR_check_right_teamptap					\n\t"
					"	tst.l	raptor_right_teamtap						\n\t"
					"	bmi		endrighttt									\n\t"
					"	moveq	#1,d0										\n\t"
					"endrighttt:       										\n\t"
					"	ext.l d0 							|sign extend d0 \n\t"
		);	
	}
}


void rapGetTTState(int teamtapport)
{
	if (teamtapport==TT_LEFT)
	{
		__asm__ (	"\t	movem.l d0,-(sp)						\n\t"
					"	jsr		RAPTOR_read_left_teamtap_state	\n\t"
					"	moveq	#0,d0							\n\t"
					"	jsr		RAPTOR_read_left_teamtap_pad	\n\t" 
					"	moveq	#1,d0							\n\t"
					"	jsr		RAPTOR_read_left_teamtap_pad	\n\t" 
					"	moveq	#2,d0							\n\t"
					"	jsr		RAPTOR_read_left_teamtap_pad	\n\t" 
					"	moveq	#3,d0							\n\t"
					"	jsr		RAPTOR_read_left_teamtap_pad	\n\t" 
					"	movem.l (sp)+,d0						\n\t"
		);	
	}
	else if (teamtapport==TT_RIGHT)
	{
		__asm__ (	"\t	movem.l d0,-(sp)						\n\t"
					"	jsr		RAPTOR_read_right_teamtap_state	\n\t"
					"	moveq	#0,d0							\n\t"
					"	jsr		RAPTOR_read_right_teamtap_pad	\n\t" 
					"	moveq	#1,d0							\n\t"
					"	jsr		RAPTOR_read_right_teamtap_pad	\n\t" 
					"	moveq	#2,d0							\n\t"
					"	jsr		RAPTOR_read_right_teamtap_pad	\n\t" 
					"	moveq	#3,d0							\n\t"
					"	jsr		RAPTOR_read_right_teamtap_pad	\n\t" 
					"	movem.l (sp)+,d0						\n\t"
		);	
	}
}

int rapGetTTPad(int teamtapport, int padnum)
{
	if (teamtapport==TT_LEFT)
	{
		switch(padnum)
		{
			case TT_PAD_1:
				return raptor_left_teamtap_pad0;
			case TT_PAD_2:
				return raptor_left_teamtap_pad1;
			case TT_PAD_3:
				return raptor_left_teamtap_pad2;
			case TT_PAD_4:
				return raptor_left_teamtap_pad3;
			default:
				return 0;
		}
	}
	else if (teamtapport==TT_RIGHT)
	{
		switch(padnum)
		{
			case TT_PAD_1:
				return raptor_right_teamtap_pad0;
			case TT_PAD_2:
				return raptor_right_teamtap_pad1;
			case TT_PAD_3:
				return raptor_right_teamtap_pad2;
			case TT_PAD_4:
				return raptor_right_teamtap_pad3;
			default:
				return 0;
		}
	}
	
	return 0;
}


