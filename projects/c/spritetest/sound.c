
#include "common.h"
#include "sound.h"


void sfxShoot (void)
{
	zeroPlaySample(1,STRPTR(explode_sam),(STRPTR(explode_sam_end)-STRPTR(explode_sam)+3) & 0xfffffffc,(46168/16000),Zero_Audio_8bit_Signed);
	zeroPlaySample(2,STRPTR(explode_sam),(STRPTR(explode_sam_end)-STRPTR(explode_sam)+3) & 0xfffffffc,(46168/16000),Zero_Audio_8bit_Signed);
}
