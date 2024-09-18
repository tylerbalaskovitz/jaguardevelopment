' -----------------------------------------------------------------------
'
' Draw grid of sprites and show position of player character on that grid.
' ggn
'
' -----------------------------------------------------------------------
' Uses graphics from https://opengameart.org/content/lots-of-free-2d-tiles-and-sprites-by-hyptosis
' -----------------------------------------------------------------------

jsfSetFontIndx(1)
jsfSetFontSize(1)
rapLocate 0,202
rapPrint "  Map draw and sprite position example  "

jsfSetFontIndx(0)
jsfSetFontSize(0)
rapLocate 0,218
rapPrint "Uses graphics from Hyptosis"

' Load our palette
jsfLoadClut(strptr(tiles_clut),0,256)

' The screen to draw the map's width in bytes.
' Think of this as <width in pixels>*<bits per pixel>/8
const dest_screen_width_in_bytes=288
' Our tile's height
const tile_height=16
' Our tile's width in bytes.
' Think of this as <width in pixels>*<bits per pixel>/8
const tile_width_in_bytes=16
' The screen to read the tile's width in bytes.
' Think of this as <width in pixels>*<bits per pixel>/8
const src_screen_width_in_bytes=960
' Map width inside the map array
const map_width=18
' Map height inside the map array
const map_height=10

DIM pad1 as integer               :   pad1=0
dim x as short
dim y as short
dim c as short
dim tilex as short
dim tiley as short

dim map[map_height][map_width] as short

' Fill map with some tiles
for y=0 to map_height-1
    for x=0 to map_width-1
        map[y][x]=60*y+x
    next x
next y

' Draw map
for y=0 to map_height-1
    for x=0 to map_width-1
        c=map[y][x]
        tilex=(c % (src_screen_width_in_bytes/tile_width_in_bytes))
        tiley=(c/(src_screen_width_in_bytes/tile_width_in_bytes))
        drawtile(x,y)
    next x
next y

' Draw some gird lines for emphasis
for x=0 to map_width-1
    for c=0 to 160-1
        poke strptr(scrbuf)+16*x+c*288,128
    next c
next x
for y=0 to map_height-1
    for c=0 to 288-1
        poke strptr(scrbuf)+c+y*16*288,128
    next c
next y

' Determine screen frequency
dim ticks_per_second as short
ticks_per_second=50     ' assume pal
if rapNTSCFlag <> 0 then
    ticks_per_second = 60 ' nope, it's ntsc
endif

' Our sprite's coordinates
dim sprite_x as WORD
dim sprite_y as WORD
sprite_x=100
sprite_y=80

' Initialise our random values
' The trick here is to keep re-runninf randomize with a running counter
' and wait till the user presses something. So in essence the user is generating
' the randomness
rapLocate 0,180
rapPrint "Press A to begin countdown"
do
    randomize(c)
    c+=539
    pad1=jsfGetPad(1) 
loop until pad1 BAND JAGPAD_A

' Initialise our countdown timer (say 5+random seconds)
dim countdown_ticks as short
countdown_ticks=int((5.0+10.0*rnd)*ticks_per_second)

' Main loop
do
    vsync
    pad1=jsfGetPad(1) 
    if (pad1 band JAGPAD_UP) and sprite_y>0 then
        sprite_y--
    endif
    if (pad1 band JAGPAD_DOWN) and sprite_y<160-16 then
        sprite_y++
    endif
    if (pad1 band JAGPAD_LEFT) and sprite_x>0 then
        sprite_x--
    endif
    if (pad1 band JAGPAD_RIGHT) and sprite_x<288-16 then
        sprite_x++
    endif
    sprite[2].x=(16+sprite_x)<<16
    sprite[2].y=(16+sprite_y)<<16
    rapLocate 0,192
    print "x=";sprite_x;", y=";sprite_y;", map x=";int((sprite_x+8)/16);", map y=";int((sprite_y+8)/16)
    rapLocate 0,180
    if countdown_ticks>0 then
        print "Seconds left: ";(float)countdown_ticks/(float)ticks_per_second
        countdown_ticks--
    else
        rapPrint "It's over!!!!!!!!!!!!!!!!!!!!!!!!!!"
    endif
loop

' Draws a 16 x map_height tile on screen.
' x is multiplied by map_width and y is multiplied by map_height

sub drawtile(x as SHORT, y as SHORT)
    local i as short
    local screen_y_offset as LONG
    local screen_x_offset as LONG
    local screen_address as LONG

    local tile_y_offset as LONG
    local tile_x_offset as LONG
    local tile_address as LONG

    tile_y_offset=tiley*(src_screen_width_in_bytes*tile_height)
    tile_x_offset=tilex*tile_width_in_bytes
    tile_address=(LONG)strptr(tiles)+tile_x_offset+tile_y_offset

    screen_y_offset=y*(dest_screen_width_in_bytes*tile_height)
    screen_x_offset=x*tile_width_in_bytes
    screen_address=(LONG)strptr(scrbuf)+screen_x_offset+screen_y_offset

    for i=0 to tile_height-1
        ' Our tiles are 16 pixels wide in 8bpp mode, which means they are 16 bytes wide in RAM. Hence we need 4 LPOKEs per line.
        lpoke screen_address,lpeek(tile_address)
        lpoke screen_address+4,lpeek(tile_address+4)
        lpoke screen_address+8,lpeek(tile_address+8)
        lpoke screen_address+12,lpeek(tile_address+12)
        screen_address+=dest_screen_width_in_bytes
        tile_address+=src_screen_width_in_bytes
    next i
end sub
