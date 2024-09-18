' -----------------------------------------------------------------------
'
' Highscore example code. Uses Raptor's internal highscore routines
' Remember: Raptor saves scores internally from highest to lowest!
'
' SEE THE OTHER EXAMPLE 'eeprom' for a more in depth example.
' -----------------------------------------------------------------------

dim i as short
dim j as short
dim name$
dim srcname%,dstname%
jsfSetFontSize(0)
dim eeprom_present%=0

' Check for EEPROM and if that fails
' populate the table with default values
jsfSetFontIndx(1)

CALL rapMTInit


' Check for EEPROM 
if rapMTPresent<0 then     'no MT?

	'
	' Check for EEPROM 
	' 
	eeprom_present=jsfEEPROM(1,rapHighscoresScore)
	if eeprom_present=1 then
		'Checksum error, let's write some default values to EEPROM
    	for i=0 to 9
        	rapHighscoresScore[i]=(9-i)*100
    	next i
		'write them
		jsfEEPROM(0,rapHighscoresScore)
		'read them back
		eeprom_present=jsfEEPROM(1,rapHighscoresScore)
	endif

	if eeprom_present<>0 then
		'
		' Read error, use default values
		'
		rapLocate 160,0
   		rapPrint "No MT/EE detected!"
    	for i=0 to 9
        	rapHighscoresScore[i]=(9-i)*100
    	next i
	else
		'
		' Read ok, print saved
		'
	    rapLocate 160,0
	    rapPrint "EEPROM detected!"
	
		rapLocate 0,25*8
		jsfSetFontIndx(1)

	endif
else
    rapLocate 160,0
    rapPrint "MT detected!"

	'
	' rapHighscoresScore indices 31 to 127 inclusive can be used to store user data.
	'
	rapLocate 0,25*8
	jsfSetFontIndx(1)
	print "Saved value:",rapHighscoresScore[31]

	'
	' Set a user value to be read next time (provided scores will be saved to MT)
	'
	rapHighscoresScore[31]=123456789

endif


' Print initial scores
rapLocate 0,0
rapPrint "Initial table:"
jsfSetFontIndx(0)

dstname=(int)strptr(name$)  								'address of name$
mid$(name$,9,1)=""          								'name is 8 characters, so make the 9nth a zero (for print)

for i=0 to 9
    rapLocate 0,8+i*8

    srcname=(int)strptr(rapHighscoresName[9-i]);    	'address of highscore name
    lpoke dstname,lpeek(srcname)                        	'copy first 4 characters to name$
    lpoke dstname+4,lpeek(srcname+4)                    	'copy last 4 characters to name$
    PRINT "#";i;" - ";name$;" -";rapHighscoresScore[9-i]
next i

'
' Introduce a score of 432 and resort the table
'
jsfSetFontIndx(1)
rapLocate 0,8*10+8+8
rapPrint "After a highscore of 432 points:"
jsfSetFontIndx(0)
name$="I WON!!!"                                        	'the name we're going to inject to the table
if rapHiscoreCheck(432,name$,0)>0 then                    	'check for highscore and inject score + name
    call rapHiscoreSort(0)                                	'if we have a highscore, then sort the table
endif
for i=0 to 9                                            	'now, display the modified table
    rapLocate 0,8*10+8+8+8+i*8

    srcname=(int)strptr(rapHighscoresName[9-i]);    	'address of highscore name
    lpoke dstname,lpeek(srcname)                        	'copy first 4 characters to name$
    lpoke dstname+4,lpeek(srcname+4)                    	'copy last 4 characters to name$
    PRINT "#";i;" - ";name$;" -";rapHighscoresScore[9-i]
next i


' Save scores
jsfSetFontIndx(1)
rapLocate 0,8*10+8+8+8+10*8+8

if rapMTPresent<0 then     'no MT?
	if eeprom_present<>0 then
    	rapPrint "No MT/EE detected, so no scores saved!"
	else
		eeprom_present=jsfEEPROM(0,rapHighscoresScore)
		if eeprom_present=0 then
			rapPrint "EEPROM detected, scores saved!"
		else
			rapPrint "EEPROM detected, save fail!"
		endif
	endif
else
    call rapMTSave
    rapPrint "Memory Track detected, scores saved!"
endif

do

vsync
loop

