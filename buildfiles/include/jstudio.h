
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

#define STRPTR(A)((char*)&(A))


//Variables (remember, we compile with size of int = 32 bits)


//AUDIOPLAYER - So we know which player is in use.
extern short AUDIOPLAYER asm ("AUDIOPLAYER");

//Possible values of AUDIOPLAYER
enum
{
    AUD_ZERO = 0,
    AUD_U235   = 1
};

//Values to pass to u235PlayModule stereo param
enum
{
    MOD_MONO = 0,
    MOD_STEREO = 1
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

enum
{
    DEBUG_HIDE = 0,
    DEBUG_SHOW = 1
};

//Possible values of ZSort Direction
enum
{
    SPRSORT_HIGH = -1,			// Highest Value at back
    SPRSORT_LOW   = 1			// Lowest value at back
};

//Flash Types
enum
{
    FLASH_NONE = 0,
    FLASH_SKUNK = 1,
	FLASH_JAGGD = 2
};


// -----------------------------------------------------------------------------
// JagStudio
// -----------------------------------------------------------------------------
//JagStudio JoyPad values - Set in jagstudio_pad_zero.inc or jagstudio_pad_u235.inc
extern int JAGPAD_UP asm ("JAGPAD_UP");
extern int JAGPAD_DOWN asm ("JAGPAD_DOWN");
extern int JAGPAD_LEFT asm ("JAGPAD_LEFT");
extern int JAGPAD_RIGHT asm ("JAGPAD_RIGHT");
extern int JAGPAD_HASH asm ("JAGPAD_HASH");
extern int JAGPAD_9 asm ("JAGPAD_9");
extern int JAGPAD_6 asm ("JAGPAD_6");
extern int JAGPAD_3 asm ("JAGPAD_3");
extern int JAGPAD_PAUSE asm ("JAGPAD_PAUSE");
extern int JAGPAD_A asm ("JAGPAD_A");
extern int JAGPAD_OPTION asm ("JAGPAD_OPTION");
extern int JAGPAD_STAR asm ("JAGPAD_STAR");
extern int JAGPAD_7 asm ("JAGPAD_7");
extern int JAGPAD_4 asm ("JAGPAD_4");
extern int JAGPAD_1 asm ("JAGPAD_1");
extern int JAGPAD_0 asm ("JAGPAD_0");
extern int JAGPAD_8 asm ("JAGPAD_8");
extern int JAGPAD_5 asm ("JAGPAD_5");
extern int JAGPAD_2 asm ("JAGPAD_2");
extern int JAGPAD_B asm ("JAGPAD_B");
extern int JAGPAD_C asm ("JAGPAD_C");
// Pro controller mappings
extern int JAGPAD_TL asm ("JAGPAD_TL");
extern int JAGPAD_TR asm ("JAGPAD_TR");
extern int JAGPAD_Z asm ("JAGPAD_Z");
extern int JAGPAD_Y asm ("JAGPAD_Y");
extern int JAGPAD_X asm ("JAGPAD_X");



extern int jsfVsyncFlag asm ("_jsfVsyncFlag");
extern void jsfSort(void *base,size_t nmemb) asm("jsfSort");
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
// -----------------------------------------------------------------------------




// -----------------------------------------------------------------------------
// Raptor
// -----------------------------------------------------------------------------
extern int rapAngle_xAdd asm("rapAngle_xAdd");
extern int rapAngle_yAdd asm("rapAngle_yAdd");
extern void rapInitCalcAngle(void *array_of_64k) asm("rapInitCalcAngle");
extern int rapCalcAngle(int x1, int y1, int x2, int y2) asm("rapCalcAngle");
extern void rapAngleVector(int calcAngle) asm("rapAngleVector");
extern void *RAPTOR_sprite_table asm ("RAPTOR_sprite_table");
extern void *pixel_list asm ("pixel_list");
extern void *raptor_part_inject_addr asm ("raptor_part_inject_addr");
extern int raptor_map_position_x asm ("raptor_map_position_x");
extern int raptor_map_position_y asm ("raptor_map_position_y");
extern int raptor_maptop_obj asm ("raptor_maptop_obj");
extern int raptor_gmap_startx asm ("raptor_gmap_startx");
extern int raptor_gmap_starty asm ("raptor_gmap_starty");
extern int raptor_mapindex asm ("raptor_mapindex");
extern int raptor_map_bitdepth asm ("raptor_map_bitdepth");
extern void RAPTOR_GPU_COLLISION() asm ("RAPTOR_GPU_COLLISION");
volatile extern int raptor_result asm ("raptor_result");
extern void *raptor_collisionlist asm ("raptor_collisionlist");
extern int raptor_sourcel asm ("raptor_sourcel");
extern int raptor_sourceh asm ("raptor_sourceh");
extern int raptor_targetl asm ("raptor_targetl");
extern int raptor_targeth asm ("raptor_targeth");
extern void *RAPTOR_ERROR() asm ("RAPTOR_ERROR");
extern void rapWaitFrame() asm ("RAPTOR_wait_frame");
extern void *raptor_liststart asm ("raptor_liststart");
extern int raptor_used_particles asm("raptor_used_particles");
extern int raptor_free_particles asm("raptor_free_particles");
extern void *RAPTOR_particle_gfx asm("RAPTOR_particle_gfx");
extern int rapMTPresent asm("raptor_mt_present");
extern int rapHighscores1Score[10] asm("raptor_highscores1_hex");
extern char rapHighscores1Name[10][8] asm("raptor_highscores1_nam");
extern int rapHighscores2Score[10] asm("raptor_highscores2_hex");
extern char rapHighscores2Name[10][8] asm("raptor_highscores2_nam");
extern int rapHighscores3Score[10] asm("raptor_highscores3_hex");
extern char rapHighscores3Name[10][8] asm("raptor_highscores3_nam");
extern int rapHighscores4Score[10] asm("raptor_highscores4_hex");
extern char rapHighscores4Name[10][8] asm("raptor_highscores4_nam");
extern int rapHighscores5Score[10] asm("raptor_highscores5_hex");
extern char rapHighscores5Name[10][8] asm("raptor_highscores5_nam");
extern short rapNTSCFlag asm("raptor_ntsc_flag");
extern long rapVBLTimeRemain asm("raptor_vbl_time_remain");
extern int rapUserSaveData[128] asm("raptor_user_savedata");
extern int raptor_blitter_use(int command) asm("raptor_blitter_use");
extern short rapTicks asm("raptor_ticks");
extern int raptor_console_x asm("raptor_console_x");
extern int raptor_console_y asm("raptor_console_y");
extern int raptor_console_visible asm("raptor_console_visible");
extern short rapClockMode asm("raptor_clock_mode");
extern short rapClockHex asm("raptor_clock_hex");
extern char rapClockValue[4] asm("raptor_clock_val");
extern int rapSpriteTableStarts[16] asm("raptor_table_starts");

// Teamtap functions and variables
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
extern int rapGDSERIAL asm ("raptor_GD_SERIAL");
extern char rapGDASERIAL[26] asm ("raptor_GD_ASERIAL");
extern int rapGDSDSERIAL asm ("raptor_SD_SERIAL");
extern short rapGDLEDState asm ("raptor_GD_LEDstate");
extern short rapGDCardState asm ("raptor_GD_cardstat");
extern int rapGDfsize asm ("raptor_fsize");
extern short rapGDfdate asm ("raptor_fdate");
extern short rapGDftime asm ("raptor_ftime");
extern char rapGDfattr asm ("raptor_fattr");
extern char rapGDfshort asm ("raptor_fshort");
extern char rapGDflong asm ("raptor_flong");
extern short rapGDDetect asm ("raptor_GD_detect");

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
extern void *RAPTOR_module_list asm ("RAPTOR_module_list");
extern void *RAPTOR_U235setmodule() asm ("RAPTOR_U235setmodule");
extern void *RAPTOR_U235gomodule_stereo() asm ("RAPTOR_U235gomodule_stereo");
extern void *RAPTOR_U235gomodule_mono() asm ("RAPTOR_U235gomodule_mono");
extern void *RAPTOR_U235playsample() asm ("RAPTOR_U235playsample");
extern void *RAPTOR_U235stopmodule() asm ("RAPTOR_U235stopmodule");
extern void *RAPTOR_U235SilenceChannels() asm ("RAPTOR_U235SilenceChannels");
extern int U235SE_modposition asm ("U235SE_modposition");
extern int U235SE_maxposition_dsp asm ("U235SE_maxposition_dsp");
extern int u235Rnd asm ("U235SE_rng");
extern int U235SE_pad1 asm ("U235SE_pad1");
extern int U235SE_pad2 asm ("U235SE_pad2");
extern int U235SE_music_vol asm ("U235SE_music_vol");
extern int U235SE_sfx_vol asm ("U235SE_sfx_vol");
extern void u235StopModule();
extern void u235Silence();
extern void u235ChangeReplayFrq(int freq, int period) asm ("u235ChangeReplayFrq");
extern int U235SE_modregdump[4] asm("U235SE_modregdump");
extern int rotary_mode1 asm("rotary_mode1");
extern int rotary_mode2 asm("rotary_mode2");
extern int turn_direction1 asm("turn_direction1");
extern int turn_direction2 asm("turn_direction2");
extern int rotary_interval1 asm("rotary_interval1");
extern int rotary_interval2 asm("rotary_interval2");
extern int spin_delta1 asm("spin_delta1");
extern int spin_delta2 asm("spin_delta2");
extern void u235Init(int rate,int period) asm("u235Init");
extern void u235StopDSP() asm("u235StopDSP");
extern void u235Restart(int rate,int period) asm("u235Restart");
// -----------------------------------------------------------------------------




// -----------------------------------------------------------------------------
// Zero Player
// -----------------------------------------------------------------------------
extern unsigned long zero_left_pad asm("zero_left_pad");
extern unsigned long zero_right_pad asm("zero_right_pad");
extern long zero_mousex_delta asm("zero_mousex_delta");
extern long zero_mousey_delta asm("zero_mousey_delta");
extern long zero_rotary_delta asm("zero_rotary_delta");

//Zerosquare player equates
#define Zero_Chan_Format_Shift      30
#define Zero_Chan_Looping_Shift     29
#define Zero_Chan_Enabled_Shift     28
#define Zero_Audio_8bit_Signed      (0 << Zero_Chan_Format_Shift)
#define Zero_Audio_8bit_Unsigned    (1 << Zero_Chan_Format_Shift)
#define Zero_Audio_8bit_muLaw       (2 << Zero_Chan_Format_Shift)
#define Zero_Audio_Looping          (1 << Zero_Chan_Looping_Shift)
// Bit numbers for pad buttons
#define Input_Pad_Pause             ( 1 << 0 )
#define Input_Pad_A                 ( 1 << 1 )
#define Input_Pad_Up                ( 1 << 2 )
#define Input_Pad_Down              ( 1 << 3 )
#define Input_Pad_Left              ( 1 << 4 )
#define Input_Pad_Right             ( 1 << 5 )
#define Input_Pad_C1                ( 1 << 6 )
#define Input_Pad_B                 ( 1 << 7 )
#define Input_Pad_Star              ( 1 << 8 )
#define Input_Pad_7                 ( 1 << 9 )
#define Input_Pad_4                 ( 1 << 10 )
#define Input_Pad_1                 ( 1 << 11 )
#define Input_Pad_C2                ( 1 << 12 )
#define Input_Pad_C                 ( 1 << 13 )
#define Input_Pad_0                 ( 1 << 14 )
#define Input_Pad_8                 ( 1 << 15 )
#define Input_Pad_5                 ( 1 << 16 )
#define Input_Pad_2                 ( 1 << 17 )
#define Input_Pad_C3                ( 1 << 18 )
#define Input_Pad_Option            ( 1 << 19 )
#define Input_Pad_Sharp             ( 1 << 20 )
#define Input_Pad_9                 ( 1 << 21 )
#define Input_Pad_6                 ( 1 << 22 )
#define Input_Pad_3                 ( 1 << 23 )
// Bit numbers for mouse buttons
#define Input_Mouse_Left            ( 1 << 1 )
#define Input_Mouse_Right           ( 1 << 0 )



// -----------------------------------------------------------------------------
// LSP SE
// -----------------------------------------------------------------------------
extern int DSP_pad1 asm ("DSP_pad1");
extern int DSP_pad2 asm ("DSP_pad2");
extern short silence asm ("silence");
extern int fin_silence asm ("fin_silence");
//extern int LSP_DSP_flag asm ("LSP_DSP_flag");


// Raptor font consts
#define raptor_t_quit			-1
#define raptor_t_lf				-2
#define raptor_t_font_idx		-3
#define raptor_t_font_siz		-4
#define raptor_t_pos_xy			-5
#define raptor_t_home			-6
#define raptor_t_right			-7



#define U235SE_8KHZ				0x00300042	// Set playback rate  (8.1kHz)
#define U235SE_12KHZ			0x0030002C	// Set playback rate  (12.060kHz)
#define U235SE_16KHZ			0x00300020  // Set playback rate  (16.446kHz)
#define U235SE_24KHZ			0x00300015	// Set playback rate  (24.67kHz)
#define U235SE_32KHZ			0x00300010	// Set playback rate  (31.925kHz)
  
#define U235SE_8KHZ_PERIOD		1234		// 8kHz period
#define U235SE_12KHZ_PERIOD		829			// 12kHz period
#define U235SE_16KHZ_PERIOD		608			// 16kHz period
#define U235SE_24KHZ_PERIOD 	405			// 24kHz period
#define U235SE_32KHZ_PERIOD		313			// 32kHz period



//Functions


// -----------------------------------------------------------------------------
// JagStudio
// -----------------------------------------------------------------------------
void basicmain(); //main function declaration
extern unsigned char plot_colour asm ("_plot_colour");
int jsfGetPad(int pad) asm ("jsfGetPad");
int jsfGetPadPressed(int pad) asm("jsfGetPadPressed");
extern void jsfVsync(volatile int update) asm ("_jsfVsync");
extern void jsfColour() asm ("_jsfColour");
extern int js_r_xpos asm ("_js_r_xpos");
extern int js_r_ypos asm ("_js_r_ypos");
extern int jsfFontIndx asm ("_jsfFontIndx");
extern int jsfFontSize asm ("_jsfFontSize");
extern char *js_r_textbuffer asm ("_js_r_textbuffer");
extern void jsfPlot(short plot_px, short plot_py) asm ("_jsfPlot");
extern void cls(void) asm ("_cls");
char *ee_printf(const char *fmt, ...) asm ("ee_printf");
void jsfDelay(int x) asm("jsfDelay");
void jsfLoadClut(unsigned short *paladdress, short target_clut, short no_of_indices) asm("jsfLoadClut");
extern void jsfSprlistFieldSet(int spr_index, int offset, int no_of_times, void *array_of_values) asm("jsfSprlistFieldSet");
extern void jsfSprlistFieldMod(int spr_index, int offset, int no_of_times, void *array_of_values) asm("jsfSprlistFieldMod");
extern void jsfSprlistFieldSetval(int spr_index, int offset, int no_of_times, int value) asm("jsfSprlistFieldSetval");
extern void jsfSprlistFieldSetOffset(int spr_index, int offset, int no_of_times, void *array_of_values, int skip_offset) asm("jsfSprlistFieldSetOffset");
extern void jsfSprlistFieldModOffset(int spr_index, int offset, int no_of_times, void *array_of_values, int skip_offset) asm("jsfSprlistFieldModOffset");
extern void jsfSprlistFieldSetvalOffset(int spr_index, int offset, int no_of_times, int value, int skip_offset) asm("jsfSprlistFieldSetvalOffset");
extern void jsfUnpack68k(int source, int destination) asm("jsfUnpack68k");
extern void jsfDebugMessageHalt() asm("_jsfDebugMessageHalt");
extern void jsfDebugMessage() asm("_jsfDebugMessage");
extern void jsfClearBuffer(int sizeInBytes, char *bufferAddress) asm ("jsfClearBuffer");
// -----------------------------------------------------------------------------




// -----------------------------------------------------------------------------
// Raptor
// -----------------------------------------------------------------------------
extern int rapCollide(int r_sl, int r_sh, int r_tl, int r_th) asm ("rapCollide");
extern void rapParticleInject(int *fx) asm ("rapParticleInject");
extern void rapSetActiveList(int list_index) asm ("rapSetActiveList");
extern void rapSetMapLoc(int x,int y) asm ("rapSetMapLoc");
extern void rapPrint() asm ("_rapPrint");
extern void rapPrintCont() asm("_rapPrintCont");
extern void rapLocate(int x, int y) asm ("rapLocate");
extern void rapUpdateAll() asm ("RAPTOR_UPDATE_ALL");
extern void rapWaitFrameUpdateAll() asm ("RAPTOR_wait_frame_UPDATE_ALL");
extern void rapUpdateOffscreenList(int list_index) asm ("rapUpdateOffscreenList");
extern void rapUpdateSprites() asm ("RAPTOR_UPDATE_SPRITES");
extern void rapUpdateParticles() asm ("RAPTOR_UPDATE_PARTICLES");
extern void rapUpdateParticlesErase() asm ("RAPTOR_UPDATE_RAPTICLES_ERASE");
extern void rapUpdateParticlesPlot() asm ("RAPTOR_UPDATE_PARTICLES_PLOT");
extern void RAPTOR_particles_GPU_erase() asm ("RAPTOR_particles_GPU_erase");
extern void RAPTOR_particles_GPU_plot() asm ("RAPTOR_particles_GPU_plot");
extern void RAPTOR_fade_clut() asm ("RAPTOR_fade_clut");
extern void RAPTOR_fade_clutindex() asm ("RAPTOR_fade_clutindex");
extern int rapFadeSingle(short clut_index,short target_col) asm("rapFadeSingle");
int rapFadeClut(int clut_no,int fade_cols,int *palette) asm("rapFadeClut");
extern short rapFadeDelay asm("raptor_fade_delay");
extern void RBRA(long object_number, long branch_type, long ypos, long object_to_branch_if_taken) asm("RBRA");
extern void rapNumToStr(long number, long no_digits, char *string) asm("rapNumToStr");
extern void rapHexToStr(long bytesToConvert, char *source, char *dest) asm("rapHexToStr");
extern void rapBlitlist(void *blitlist) asm("rapBlitlist");
extern void rapFullblitlist(void *blitlist) asm("rapFullblitlist");
extern void rapParticleClear() asm ("RAPTOR_particle_clear");
extern int position_in_highscore asm("position_in_highscore");
extern void rapHiscoreSort(int table_to_sort, char *name) asm("rapHiscoreSort");
extern short rapHiscoreCheck(int score, char *name, int table) asm("rapHiscoreCheck");
extern void RAPTOR_resort_score_table() asm("RAPTOR_resort_score_table");
extern void rapMTSave() asm("RAPTOR_mt_save");
extern void rapMTInit() asm("RAPTOR_mt_init");
extern void rapUnpack(int source, int destination) asm("rapUnpack");
extern void rapDebugUpdate() asm("rapDebugUpdate");
extern void rapDebugSetXY(int x, int y) asm("rapDebugSetXY");
extern void rapDebugSetVisible(int visible) asm("rapDebugSetVisible");
extern void rapDebugPrint() asm ("_rapDebugPrint");
extern void rapDebugUpdRegisters() asm("RAPTOR_console_update_registers");
extern void rapDebugUpdMonitors() asm("RAPTOR_console_update_usermonitors");
extern void rapDebugUpdText() asm("RAPTOR_console_update_textline");
extern void rapDebugInverse() asm("RAPTOR_console_inverse");
extern void rapDebugSetMonitor(int monitorNumber, void *var_address) asm("rapDebugSetMonitor");
extern int rapRND() asm("RAPTOR_random");
extern void rapSpriteShift(int x, int y, int spr_index, int no_of_objects) asm("rapSpriteShift");
extern void rapSetClock(int value) asm("rapSetClock");
extern void rapAddClock(int value) asm("rapAddClock");
extern void rapSubClock(int value) asm("rapSubClock");
extern void rapSortSprites(int spr_index, int offset, int no_of_objects, int sortdir) asm("rapSortSprites");
int rapFlashCheck() asm("rapFlashCheck");


#define rapHighscoresScore rapHighscores1Score
#define rapHighscoresName rapHighscores1Name

#define jsfEEPROMInitVersion 496

// -----------------------------------------------------------------------------




// -----------------------------------------------------------------------------
// U235
// -----------------------------------------------------------------------------
void u235KillChannel(int v) asm("u235KillChannel");
void u235ChannelVol(int v,int x) asm("u235ChannelVol");
void u235ChannelFreq(int channel,int freq) asm("u235ChannelFreq");
extern void u235SampleVol(int volume) asm("_u235SampleVol");
extern void u235ModuleVol(int volume) asm("_u235ModuleVol");
//void SNDFREQ(int v,int y) asm("SNDFREQ");
//void SNDVOLRESET(int v) asm("SNDVOLRESET");
void u235PlaySample(int channel,int sfxnum) asm("u235PlaySample");
void u235PlaySampleFreq(int channel,int sfxnum,int freq) asm("u235PlaySampleFreq");
int u235GetPad(int pad) asm("_u235GetPad");
extern void u235PlayModule(int module,short stereo);
// -----------------------------------------------------------------------------




// -----------------------------------------------------------------------------
// Zero Player
// -----------------------------------------------------------------------------
void zeroPlaySample(int channel, void *sound_address, int sample_size, int sample_divider, int play_command) asm("zeroPlaySample");
void zeroPlay(int channel, void *sound_address, void *sound_endaddress, int sample_divider, int play_command) asm("zeroPlay");
void zeroClearChannel(int channel) asm("zeroClearChannel");
extern int zeroGetPad(int pad) asm("zeroGetPad");
volatile extern void zeroSetJoyPort1() asm("Input_SetJoyPort1");
volatile extern void zeroSetJoyPort2() asm("Input_SetJoyPort2");
volatile extern void zeroSetNormalPadMode() asm("Input_SetNormalPadMode");
volatile extern void zeroSetRotaryMode() asm("Input_SetRotaryMode");
volatile extern void zeroSetAtariMouseMode() asm("Input_SetAtariMouseMode");
volatile extern void zeroSetAmigaMouseMode() asm("Input_SetAmigaMouseMode");




// -----------------------------------------------------------------------------
// LSP SE
// -----------------------------------------------------------------------------
int LSPGetPad(int pad) asm("LSPGetPad");
void LSPPlayModule(int MODULE_lsmusic,int MODULE_lsbank) asm("LSPPlayModule");
void LSPStartMusic() asm("LSPStartMusic");
void LSPStopMusic() asm("LSPStopMusic");
void LSPMusicToggle() asm("LSPMusicToggle");
void LSPStartDSP() asm("LSPStartDSP");
void LSPPlaySampleLoop(void *sound_address, void *sound_endaddress, void *sound_loopaddress, void *sound_loopendaddress, int frequency, int volume, int channel) asm("LSPPlaySampleLoop");
void LSPPlaySample(void *sound_address, void *sound_endaddress, int frequency, int volume, int channel) asm("LSPPlaySample");


//Helper macros
#define jsfSetFontIndx(n) jsfFontIndx=n
#define jsfSetFontSize(n) jsfFontSize=n

#define jsfGetSpriteIndex(address) *((int *) (R_sprite_indexnumber + address))

/* Construct binary constants at compile time
   Code by Tom Torfs */

/* Helper macros */
#define HEX__(n) 0x##n##LU
#define B8__(x) ((x&0x0000000FLU)?1:0) \
+((x&0x000000F0LU)?2:0) \
+((x&0x00000F00LU)?4:0) \
+((x&0x0000F000LU)?8:0) \
+((x&0x000F0000LU)?16:0) \
+((x&0x00F00000LU)?32:0) \
+((x&0x0F000000LU)?64:0) \
+((x&0xF0000000LU)?128:0)

/* User macros */
#define B8(d) ((unsigned char)B8__(HEX__(d)))
#define B16(dmsb,dlsb) (((unsigned short)B8(dmsb)<<8) \
+ B8(dlsb))
#define B32(dmsb,db2,db3,dlsb) (((unsigned long)B8(dmsb)<<24) \
+ ((unsigned long)B8(db2)<<16) \
+ ((unsigned long)B8(db3)<<8) \
+ B8(dlsb))

static __attribute__((always_inline)) short xdivs(int divid, short divis)
{
 __asm__("divs.w %1,%0;" : "+d"(divid) : "dQJIKLMU"(divis) : "cc" );
 return (short)divid;
}

static __attribute__((always_inline)) unsigned short xdivu(unsigned int divid, unsigned short divis)
{
 __asm__("divu.w %1,%0;" : "+d"(divid) : "dQJIKLMU"(divis) : "cc" );
 return (unsigned short)divid;
}

static __attribute__((always_inline)) int xmuls(int multid, short mults)
{
  __asm__("muls.w %1,%0;" : "+d"(multid) : "dQJIKLMU"(mults) : "cc" );
  return multid;
}

static __attribute__((always_inline)) unsigned int xmulu(unsigned int multid, unsigned short mults)
{
  __asm__("mulu.w %1,%0;" : "+d"(multid) : "dQJIKLMU"(mults) : "cc" );
  return multid;
}
