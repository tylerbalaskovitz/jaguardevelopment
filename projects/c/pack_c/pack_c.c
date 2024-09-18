// -----------------------------------------------------------------------
//
// Example of how to unpack an asset that has been packed at build time.
//
// -----------------------------------------------------------------------
//
// How it works: A buffer is created in memory to store the asset once it is unpacked.
//				The graphic address of the large object on which we will be displaying the graphic is swapped over to the buffer where the unpacked image lives.
//
// -----------------------------------------------------------------------

// -----------------------------------------------------------------------
// Define your sprite names in common.h
// -----------------------------------------------------------------------
#include "common.h"								// This should be included in all source files

// -----------------------------------------------------------------------
//            User Global Variables
// -----------------------------------------------------------------------
static int     buffer[352*250*2/4];							//define enough space to store the decompressed image
															//how 352*250*2/4 is decided uppon is as follows: the original image is 352 pixels wide and 250 pixels high, 16 bit image uses 2 bytes per pixel
															//the integer datatype uses 4 bytes within RB+ and we do not need all 4 bytes of it, so we need to devide this by 4 so we dont waste space.


															
//Note: There are two unpack commands.  One uses the GPU and is faster, the other uses the 68000 and is slower.
// If you have trouble unpacking an image using the normal function then use the 68k version.
//
// GPU Version;
//  rapUnpack(source_address, destination_address) 			Unpacks data from source_address to destination_address.
//                                                 				NOTE: that it's your responsibility to reserve enough RAM 
//                                                 				for unpacking. Also, no checking to see if a packed asset
//                                                 				exists at the source address - again it's your responsibility!
//
//
// 68k Version
//  jsfUnpack68k(source_address, destination_address) 		Unpacks data from source_address to destination_address.
//															



void basicmain()
{
	rapUnpack((int)STRPTR(source_image),(int)(int*)buffer);	//decompress the packed image defined in the assets.txt 'source_image' which gives the start address of the data.
															//as with loadclut, some conversion needs to be done to convert it into an integer value suitable for use
															//so we use (int) to convert the strptr(source_image) return value into integer.
	
	sprite[sprImage].gfxbase=(int)buffer;					//change the object list graphic start address to the newly decompressed image (now stored in our buffer variable). 
															//we just need the start address of the variable so we just use the variable name
	sprite[sprImage].active=R_is_active;
	
	//Main game loop
	while(1)
	{
		jsfVsync(0);
	}
}
