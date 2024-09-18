' -----------------------------------------------------------------------
'
' Print Example
' Show different types of print commands
'
' -----------------------------------------------------------------------

dim pad1 as LONG
pad1=32

jsfSetFontIndx(0)
jsfSetFontSize(0)
rapLocate 10,0
rapPrint "helloooooooooooooooo!"				'print a static string

rapLocate 10,20
print "hiya! ",pad1," hello ",123.237462376		'combine variables or numbers with a string to print  (Must be be the 'print' command)

dim a$
a$="zzzzzzzz"									' set up a string to hold numerical values
rapNumToStr(567,3,a$)							'convert the number 567 into a 4 digit string. rapNumToStr(number,stringlen-1,a$)
												'if you request a string length longer than the number then it will add leading zeros
jsfSetFontIndx(1)
jsfSetFontSize(1)
rapLocate 10,40
rapPrint a$										'print the string version of the number


jsfSetFontIndx(0)
jsfSetFontSize(0)
rapLocate 10,70
jsfPrintInt 3433								'print a number


' The rapPrintCont command must follow an initial rapPrint command.
' It lets you adjust the font style/size on the same line without requiring a new rapLocate for each string.
jsfSetFontIndx(0)
jsfSetFontSize(0)
rapLocate 10,100
rapPrint "Continued"

jsfSetFontIndx(1)
rapPrintCont " string "

jsfSetFontSize(1)
jsfSetFontIndx(0)
rapPrintCont " from "

jsfSetFontSize(1)
jsfSetFontIndx(1)
rapPrintCont " last "

jsfSetFontSize(0)
jsfSetFontIndx(1)
rapPrintCont " position "


jsfSetFontIndx(0)
jsfSetFontSize(0)
rapLocate 10,150
rapPrint "Press joypad buttons"


'Plot a pixel on the screen
jsfColour 6
jsfPlot(100,11)


rapLocate 10,170

do
	pad1=jsfGetPad(1)						'get pad input
	a$=""

	if pad1 band JAGPAD_PAUSE then
		a$=a$+"Pause "
	endif
	if pad1 band JAGPAD_A then
		a$=a$+"A "
	endif
	if pad1 band JAGPAD_UP then
		a$=a$+"Up "
	endif
	if pad1 band JAGPAD_DOWN then
		a$=a$+"Down "
	endif
	if pad1 band JAGPAD_LEFT then
		a$=a$+"Left "
	endif
	if pad1 band JAGPAD_RIGHT then
		a$=a$+"Right "
	endif
	if pad1 band JAGPAD_B then
		a$=a$+"B "
	endif
	if pad1 band JAGPAD_STAR then
		a$=a$+"Star "
	endif
	if pad1 band JAGPAD_7 then
		a$=a$+"7 "
	endif
	if pad1 band JAGPAD_4 then
		a$=a$+"4 "
	endif
	if pad1 band JAGPAD_1 then
		a$=a$+"1 "
	endif
	if pad1 band JAGPAD_C then
		a$=a$+"C "
	endif
	if pad1 band JAGPAD_0 then
		a$=a$+"0 "
	endif
	if pad1 band JAGPAD_8 then
		a$=a$+"8 "
	endif
	if pad1 band JAGPAD_5 then
		a$=a$+"5 "
	endif
	if pad1 band JAGPAD_2 then
		a$=a$+"2 "
	endif
	if pad1 band JAGPAD_OPTION then
		a$=a$+"Option "
	endif
	if pad1 band JAGPAD_HASH then
		a$=a$+"# "
	endif
	if pad1 band JAGPAD_9 then
		a$=a$+"9 "
	endif
	if pad1 band JAGPAD_6 then
		a$=a$+"6 "
	endif
	if pad1 band JAGPAD_3 then
		a$=a$+"3 "
	endif
	
	a$=a$+space$(39-len(a$))			' add some spaces at the end of the line to clear previous text
	
    PRINT a$
	
    vsync
	
loop

