@rem ee_printf WILL crash without -O2, so take care!
@PATH=%PATH%;..\bin
m68k-atari-mint-gcc jstudio_functions.c -c -Ofast -I. -I..\include -fcall-saved-a1 -fcall-saved-d1
m68k-atari-mint-gcc jstudio_functions.c -S -Ofast -I. -I..\include -fcall-saved-a1 -fcall-saved-d1
m68k-atari-mint-gcc ee_printf.c -c -Ofast -I. -I..\include
m68k-atari-mint-gcc ee_printf.c -S -Ofast -I. -I..\include

rmac -fb EEPROM.S

pause