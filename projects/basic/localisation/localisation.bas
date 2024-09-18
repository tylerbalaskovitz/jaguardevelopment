' -----------------------------------------------------------------------
'
' Localisation Example
' ggn
'
' -----------------------------------------------------------------------

jsfSetFontIndx(0)
jsfSetFontSize(0)

' This syntax enables the variables to be visible from anywhere in the source. Using something like "enum English,French,Italian" will not be global
enum
    English
    French
    Italian
end enum

' Global variable which will hold the language
dim language%

' By default, use English
language=English

' Localising one string
dim message_pressfire$[3,40] as char
message_pressfire$[English]="Press fire to start              "
message_pressfire$[French] ="Appuyez sur le feu pour commencer"
message_pressfire$[Italian]="Premi il fuoco per iniziare      "

' Localising multiple strings
enum                ' define some constants for our numbers instead of using 0,1,2,3,4
    msg_hi=0
    msg_bye
    msg_win
    msg_lose
    msg_ready
    num_messages    ' This must be at the end!
end enum

dim messages$[3,5,48] as char       ' dimension our array. It is 3 dimension, because we need languages * messages * 48 characters per message
messages$[English][msg_hi]="Hi   "  ' Fill in our messages. Notice that due to the enums we don't need to use numbers. Also we must make sure that our messages are less than 48 characters each!
messages$[French] [msg_hi]="Salut"
messages$[Italian][msg_hi]="Ciao "
messages$[English][msg_bye]="Bye      "
messages$[French] [msg_bye]="Au revoir"
messages$[Italian][msg_bye]="Addio    "
messages$[English][msg_win]="You win    "
messages$[French] [msg_win]="Vous gagnez"
messages$[Italian][msg_win]="Hai vinto  "
messages$[English][msg_lose]="You lose   "
messages$[French] [msg_lose]="Tu as perdu"
messages$[Italian][msg_lose]="Hai presso "
messages$[English][msg_ready]="Get ready"
messages$[French] [msg_ready]="Sois pret"
messages$[Italian][msg_ready]="Preparati"

rapLocate 0,0
rapPrint "Press A,B,C to switch languages"

rapLocate 0,190
rapPrint convert_utf8("Special characters can work... êâîôûù")

DIM pad1 AS INTEGER               :   pad1=0


do
    local i as short
    local j as short

    vsync
    pad1=jsfGetPad(1)
    if pad1 band JAGPAD_C then
        language=English
    elseif pad1 band JAGPAD_B then
        language=French
    elseif pad1 band JAGPAD_A then
        language=Italian
    endif

    ' Print our "one string" example
    rapLocate 0,16
    rapPrint message_pressfire$[language]
    
    ' Print all our "multiple strings" example. Notice that num_messages will adjust itself if we add or remove messages.
    for i=0 to num_messages
        rapLocate 0,32+8*i
        rapPrint convert_utf8(messages$[language][i])
    next i
loop


function convert_utf8$(string$)
    local c as UBYTE
    local d as UBYTE
    local i as short
    local j as short
    local converted$
    j=0
    
    for i=0 to len(string$)
        c=peek(((int)string$)+i)
        if c=0xc3 then
            d=peek(((int)string$)+i+1)
            select case d
                case 0xaa 'ê
                    c=41
                case 0xa2 'â
                    c=36
                case 0xae 'î
                    c=60
                case 0xb4 'ô
                    c=43
                case 0xbb 'û
                    c=125
                case 0xb9 'ù
                    c=126
                case else
                    'We don't know this character. Just turn it into A?
                    c=65
            end select
            i++     'move past $c3
        endif
        poke strptr(converted$)+j,c
        j++
    next i
    poke (strptr(converted$)+j),0
    function=converted$
end function