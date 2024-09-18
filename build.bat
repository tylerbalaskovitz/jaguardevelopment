@echo off
set JSVERSION=1.11
cls
echo -------------------------------------------------------------
echo    ___             _____ _             _ _        
echo   ^|_  ^|           /  ___^| ^|           ^| (_)      
echo     ^| ^| __ _  __ _\ `--.^| ^|_ _   _  __^| ^|_  ___  
echo     ^| ^|/ _` ^|/ _` ^|`--. \ __^| ^| ^| ^|/ _` ^| ^|/ _ \ 
echo /\__/ / (_^| ^| (_^| /\__/ / ^|_^| ^|_^| ^| (_^| ^| ^| (_) ^|
echo \____/ \__,_^|\__, \____/ \__^|\__,_^|\__,_^|_^|\___/ 
echo              __/ ^|                              
echo             ^|___/                                Version %JSVERSION%    
echo                      RAPTOR v2.0.31 2023.10.02  U-235SE v0.24
echo -------------------------------------------------------------

rem -------------------------------------------------------------
set PROJECTNAME=%~n1
set SOURCELANG=BAS
rem -------------------------------------------------------------
rem set build tools path
if "%JSTUTOOLS%" neq "" goto :set_from_environment
rem if not found then assume JSTUTOOLS directory is the current.
rem Dangerous but compatible with old style build system
rem (new versions will have this set from the installer)
if "%JSTUTOOLS%" == "" for %%f in ("%cd%") do set JSTUTOOLS=%%~sf

:set_from_environment
if defined JSTUDIO+ goto :pathset
set PATH=%JSTUTOOLS%;%JSTUTOOLS%\buildfiles\bin;%PATH%
set JSTUDIO+=64

:pathset
rem This gets the current path in 8.3 format, might be useful for JSTUTOOLS too?
set CURRENTPATH_FULL=%cd%
for %%f in ("%cd%") do set CURRENTPATH=%%~sf

rem -------------------------------------------------------------
rem set build path to basic or c project folder depending on where it exists.
if exist %CURRENTPATH%\projects\basic\%PROJECTNAME%\%PROJECTNAME%.bas (
	set BUILDPATH=%CURRENTPATH%\projects\basic\%PROJECTNAME%
	set SOURCELANG=BAS
) else if exist %CURRENTPATH%\projects\c\%PROJECTNAME%\%PROJECTNAME%.c (
	set BUILDPATH=%CURRENTPATH%\projects\c\%PROJECTNAME%
	set SOURCELANG=C
) else (
	set BUILDPATH=%CURRENTPATH%\projects\asm\%PROJECTNAME%
	set SOURCELANG=ASM
)
set TEMPDIR=%BUILDPATH%\build
rem assume no ROM mode
set ROM_MODE=

rem -------------------------------------------------------------
if [%PROJECTNAME%] neq [] goto :dobuild
echo Usage: build.bat projectname
echo        build.bat projectname bigp
echo        build.bat projectname skunk
echo        build.bat projectname skunkabs
echo        build.bat projectname jaggd
echo        build.bat projectname ROM
echo        build.bat projectname ROM skunk
echo        build.bat projectname ROM UNPACKED
echo        build.bat projectname ROM UNPACKED skunk
echo        build.bat projectname ROM jaggd
echo        build.bat projectname skunk bjl
echo        build.bat projectname newbasic
echo        build.bat projectname newc
echo        build.bat projectname mrq Developername PublisherName Year
echo        build.bat projectname ROM split
echo.
echo Folder "projectname" must exist inside folder "projects"
echo and have a file called "projectname.bas" inside.
echo.
echo When building a ROM it is assumed that there will exist
echo a file called assets.txt inside the project folder
echo and will contain all assets to be included in ROM (if any).
echo By default the main program is packed into the ROM
echo and depacked during boot. This can be avoided by passing
echo the UNPACKED switch.
echo.
echo "newbasic" will create a new BASIC project
echo from the "include\template" folder. No project will be
echo created if folder exists.
echo.
echo "newc" will create a new C project
echo from the "include\template" folder. No project will be
echo created if folder exists.
echo.
echo "BOSSMODE" will stop virtualjaguar from running.
echo.
echo "bigp" will send the project to the BigP Jaguar Emulator.
echo.
echo "jaggd" will send the project to a JagGD.
echo.
echo "skunk" will send the project to a Skunkboard (caution - when using ROM, bank
echo #1 will be erased without any warning!)
echo.
echo "skunkabs" will send the updated ABS part of the project to the Skunkboard but will NOT send any ROM assets. 
echo It will reuse what is stored on the Skunk. This is the faster option if your ROM assets haven't changed.
echo.
echo "bjl" will upload the binary to Jaguar via BJL. Note that
echo you might need to edit the command line parameters to the uploader
echo in this file (just search for "lo_inp.exe")
echo.
echo "mrq Developername PublisherName Year" This will create a JagGD MRQ file for your project.  It will use
echo the two images from \yourprojectname\assets\jaggd\ . Put your developer name, publisher name and the year in the params.
echo.
echo "ROM split" will build the ROM and then split it into HI and LO ROM files.
echo.
echo Current BASIC projects:
if exist projects\basic dir /AD /B projects\basic
echo.
echo.
echo Current C projects:
if exist projects\c dir /AD /B projects\c
echo.
echo.
echo Current ASM projects:
if exist projects\asm dir /AD /B projects\asm
goto :veryend
:dobuild
rem -------------------------------------------------------------
if /i "%2" == "mrq" goto :createjaggdmrq
if /i "%2" == "newbasic" goto :newproject
if /i "%2" == "newc" goto :newproject
if /i "%2" == "newasm" goto :newproject
echo.
if %SOURCELANG%==BAS (
	echo Building JagStudio Basic Application: %PROJECTNAME%
) else if %SOURCELANG%==C (
	echo Building JagStudio C Application: %PROJECTNAME%
) else if %SOURCELANG%==ASM (
	echo Building JagStudio ASM Application: %PROJECTNAME%
)
echo.

rem -------------------------------------------------------------
rem Always clean the build folder
if exist %TEMPDIR% (
	call rmdir /s /q %TEMPDIR%
	mkdir %TEMPDIR%
)

rem -------------------------------------------------------------
rem delete residual files from previous builds
if exist %BUILDPATH%\%PROJECTNAME%.abs del %BUILDPATH%\%PROJECTNAME%.abs
if exist %TEMPDIR%\basic.o del %TEMPDIR%\basic.o
if exist %TEMPDIR%\%PROJECTNAME%.c del %TEMPDIR%\%PROJECTNAME%.c
if exist %TEMPDIR%\%PROJECTNAME%.o del %TEMPDIR%\%PROJECTNAME%.o

rem -------------------------------------------------------------
rem abort build if bas file doesn't exist
if not exist %BUILDPATH%\%PROJECTNAME%.bas (
	if not exist %BUILDPATH%\%PROJECTNAME%.c (
		if not exist %BUILDPATH%\%PROJECTNAME%.s (
			echo %BUILDPATH%\%PROJECTNAME%.{bas/c/s} doesn't exist!
			goto :builderror
		)
	)
)

if not exist %TEMPDIR% mkdir %TEMPDIR%
echo Build started on %date% %time% > %TEMPDIR%\build.log
echo JagStudio Version: %JSVERSION% > %TEMPDIR%\build.log

rem -------------------------------------------------------------
rem let's build the linkfile and romassets.inc/.h/ramassets.inc right here
rem does asset conversion too
if exist %BUILDPATH%\%PROJECTNAME%.rom del %BUILDPATH%\%PROJECTNAME%.rom
if exist %TEMPDIR%\%PROJECTNAME%.bin del %TEMPDIR%\%PROJECTNAME%.bin
if exist %BUILDPATH%\romassets.h del %BUILDPATH%\romassets.h
if exist %BUILDPATH%\romassets.inc del %BUILDPATH%\romassets.inc
if exist %BUILDPATH%\ramassets.inc del %BUILDPATH%\ramassets.inc
if exist %TEMPDIR%\linkfile.bin del %TEMPDIR%\linkfile.bin
echo. >> %TEMPDIR%\build.log
buildlink %BUILDPATH%\assets.txt %BUILDPATH%
if %ERRORLEVEL% == "2" goto :builderror
if exist %TEMPDIR%\linkfile.bin set ROM_MODE=1

rem -------------------------------------------------------------
rem assemble raptor skeleton
SET basico=
:assembleraptor
if NOT %SOURCELANG%==ASM (
	echo. >> %TEMPDIR%\build.log
	echo Assembling raptor skeleton... >> %TEMPDIR%\build.log
	cd %BUILDPATH%
	rmac -fb -u -i"%JSTUTOOLS%\buildfiles\include" -o build\basic.o rapapp.s >> %TEMPDIR%\build.log 2>&1
	cd %CURRENTPATH_FULL%
	if NOT EXIST %TEMPDIR%\basic.o goto :builderror
	SET basico="%TEMPDIR%\basic.o "
)

rem -------------------------------------------------------------
rem translate .bas file to C
if %SOURCELANG%==BAS (
	echo. >> %TEMPDIR%\build.log
	echo Translating .bas file to C... >> %TEMPDIR%\build.log
	bc %BUILDPATH%\%PROJECTNAME%.bas  -f:%TEMPDIR%\%PROJECTNAME%.c >> %TEMPDIR%\build.log
	if %ERRORLEVEL% NEQ 0 goto :builderror
)

rem -------------------------------------------------------------
rem Compile code

if %SOURCELANG%==BAS (
	set CSOURCEFILES=%TEMPDIR%
) else (
	set CSOURCEFILES=%BUILDPATH%
)


if %SOURCELANG%==ASM (
	echo. >> %TEMPDIR%\build.log
	echo Compiling asm code to O... >> %TEMPDIR%\build.log	
	cd %BUILDPATH%
	rmac -fb -u -i"%JSTUTOOLS%\buildfiles\include" -o build\%PROJECTNAME%_%PROJECTNAME%.o %PROJECTNAME%.s >> %TEMPDIR%\build.log 2>&1
	cd %CURRENTPATH_FULL%
	if %ERRORLEVEL% neq 0 goto :builderror			
	if not exist %TEMPDIR%\%PROJECTNAME%_%PROJECTNAME%.o goto :builderror
) else (
	echo. >> %TEMPDIR%\build.log
	echo Compiling C code to O... >> %TEMPDIR%\build.log
	for %%f in (%CSOURCEFILES%\*.c) do (
		m68k-atari-mint-gcc -Ofast -I"%JSTUTOOLS%\buildfiles\include" -I%BUILDPATH%\ -I%TEMPDIR%\ -o %TEMPDIR%\%PROJECTNAME%_%%~nf.o -c %CSOURCEFILES%\%%~nf.c >> %TEMPDIR%\build.log 2>&1  
		if %ERRORLEVEL% neq 0 goto :builderror	
	)
	if not exist %TEMPDIR%\%PROJECTNAME%_%PROJECTNAME%.o goto :builderror
	echo Compiling C code to S... >> %TEMPDIR%\build.log
	for %%f in (%CSOURCEFILES%\*.c) do ( 
		m68k-atari-mint-gcc -Ofast -I"%JSTUTOOLS%\buildfiles\include" -I%BUILDPATH%\ -I%TEMPDIR%\ -S -o %TEMPDIR%\%PROJECTNAME%_%%~nf.s -c %CSOURCEFILES%\%%~nf.c >> %TEMPDIR%\build.log 2>&1  
		if %ERRORLEVEL% neq 0 goto :builderror	
	)
)

if /i "%2" neq "ROM" (if "%ROM_MODE%"=="" goto :norom)

rem -------------------------------------------------------------
rem Link binaries
set PACKROM=packed
if /i "%2"=="UNPACKED" goto :unpackedrom
if /i "%3"=="UNPACKED" goto :unpackedrom
goto :packedrom
:unpackedrom
set PACKROM=unpacked
:packedrom
echo Building %PACKROM% ROM file...
echo. >> %TEMPDIR%\build.log
echo Linking things... >> %TEMPDIR%\build.log
rln -z -rq -m -o %TEMPDIR%\%PROJECTNAME%.bin -n -a 4000 x x %basico% "%JSTUTOOLS%\buildfiles\RAPTOR\RAPTOR.O" %TEMPDIR%\%PROJECTNAME%_*.o "%JSTUTOOLS%\buildfiles\RAPTOR\RAPTORMT.O" "%JSTUTOOLS%\buildfiles\RAPTOR\RAPTOR235.O" "%JSTUTOOLS%\buildfiles\RAPTOR\RAPTORLSP.O" "%JSTUTOOLS%\buildfiles\RAPTOR\RAPTORGD.O" "%JSTUTOOLS%\buildfiles\RAPTOR\DSP.OBJ" "%JSTUTOOLS%\buildfiles\include\libm.a" "%JSTUTOOLS%\buildfiles\include\libc.a" "%JSTUTOOLS%\buildfiles\include\libgcc.a" "%JSTUTOOLS%\buildfiles\include\jstudio_functions.o" "%JSTUTOOLS%\buildfiles\include\ee_printf.o" "%JSTUTOOLS%\buildfiles\include\eeprom.o" >> %TEMPDIR%\build.log
if not exist %TEMPDIR%\%PROJECTNAME%.bin goto :builderror
rln -e -z -rq -m -o %BUILDPATH%\%PROJECTNAME%.abs -a 4000 x x %basico% "%JSTUTOOLS%\buildfiles\RAPTOR\RAPTOR.O" %TEMPDIR%\%PROJECTNAME%_*.o "%JSTUTOOLS%\buildfiles\RAPTOR\RAPTORMT.O" "%JSTUTOOLS%\buildfiles\RAPTOR\RAPTOR235.O" "%JSTUTOOLS%\buildfiles\RAPTOR\RAPTORLSP.O" "%JSTUTOOLS%\buildfiles\RAPTOR\RAPTORGD.O" "%JSTUTOOLS%\buildfiles\RAPTOR\DSP.OBJ" "%JSTUTOOLS%\buildfiles\include\libm.a" "%JSTUTOOLS%\buildfiles\include\libc.a" "%JSTUTOOLS%\buildfiles\include\libgcc.a" "%JSTUTOOLS%\buildfiles\include\jstudio_functions.o" "%JSTUTOOLS%\buildfiles\include\ee_printf.o" "%JSTUTOOLS%\buildfiles\include\eeprom.o" >> %TEMPDIR%\build.log

rem -------------------------------------------------------------
rem Let's build a ROM
:buildrom
echo. >> %TEMPDIR%\build.log
echo Making %PACKROM% ROM... >> %TEMPDIR%\build.log
makearom %TEMPDIR%\%PROJECTNAME%.bin %TEMPDIR%\linkfile.bin %BUILDPATH%\%PROJECTNAME%.rom %PACKROM%
if %ERRORLEVEL% NEQ 0 goto :builderror
if not exist %BUILDPATH%\%PROJECTNAME%.rom goto :builderror

rem Check ROM size and send as 6mb if over 4mb
set romfile="%BUILDPATH%\%PROJECTNAME%.rom"
FOR /F "usebackq" %%A IN ('%romfile%') DO set romsize=%%~zA
echo File size=%romsize% bytes


if /i "%3"=="split" goto :splitrom

if /i "%4"=="skunk" goto :sendrom
if /i "%3"=="skunk" goto :sendrom
if /i "%2"=="skunk" goto :sendrom


if /i "%4"=="skunkabs" goto :sendabs
if /i "%3"=="skunkabs" goto :sendabs
if /i "%2"=="skunkabs" goto :sendabs

if /i "%4"=="jaggd" goto :sendjaggd
if /i "%3"=="jaggd" goto :sendjaggd
if /i "%2"=="jaggd" goto :sendjaggd

if /i "%4"=="bigp" goto :sendbigp
if /i "%3"=="bigp" goto :sendbigp
if /i "%2"=="bigp" goto :sendbigp


echo. >> %TEMPDIR%\build.log
if /i "%2"=="BOSSMODE" goto :veryend
if /i "%3"=="BOSSMODE" goto :veryend
if /i "%4"=="BOSSMODE" goto :veryend
if /i "%5"=="BOSSMODE" goto :veryend
echo starting vj >> %TEMPDIR%\build.log
start virtualjaguar %BUILDPATH%\%PROJECTNAME%.rom --alpine
goto :veryend
:sendrom
rem Reset Skunk
jcp -r
ping localhost >NUL

if %romsize% gtr 4194304 (
	echo Sending 6MB ROM
	jcp -6 -f %BUILDPATH%\%PROJECTNAME%.rom
) else (
	jcp -f %BUILDPATH%\%PROJECTNAME%.rom
)

goto :veryend

:sendjaggd
echo Sending to JagGD...
echo. >> %TEMPDIR%\build.log

if exist %BUILDPATH%\%PROJECTNAME%.rom (
	echo Sending ROM to JagGD... >> %TEMPDIR%\build.log
	buildfiles\bin\jaggd\jaggd.exe -rd -ux %BUILDPATH%\%PROJECTNAME%.rom,a:$800000,x:$802000
) else (
	echo Sending ABS to JagGD... >> %TEMPDIR%\build.log
	buildfiles\bin\jaggd\jaggd.exe -rd -ux %BUILDPATH%\%PROJECTNAME%.abs,a:$4000,x:$4000
)
goto :veryend

:sendbigp
echo Sending to BigP...
echo. >> %TEMPDIR%\build.log

tasklist /FI "IMAGENAME eq BigPEmu.exe" 2>NUL | find /I /N "BigPEmu.exe">NUL
if "%ERRORLEVEL%"=="0" taskkill /f /im BigPEmu.exe > nul

if exist %BUILDPATH%\%PROJECTNAME%.rom (
	echo Sending ROM to BigP... >> %TEMPDIR%\build.log
	start buildfiles\bin\bigpemu\BigPEmu.exe "%BUILDPATH%\%PROJECTNAME%.rom" -eeprombits 10 -devmode -setcfgpropcat LocalEEPROM 1 DevMode
) else (
	echo Sending ABS to BigP... >> %TEMPDIR%\build.log
	start buildfiles\bin\bigpemu\BigPEmu.exe "%BUILDPATH%\%PROJECTNAME%.abs" -eeprombits 10 -devmode -setcfgpropcat LocalEEPROM 1 DevMode
)
goto :veryend

:norom
rem -------------------------------------------------------------
rem Link binaries
echo Building ABS...
echo. >> %TEMPDIR%\build.log
echo Linking things... >> %TEMPDIR%\build.log
rln -e -z -rq -m -o %BUILDPATH%\%PROJECTNAME%.abs -a 4000 x x %basico% "%JSTUTOOLS%\buildfiles\RAPTOR\RAPTOR.O" %TEMPDIR%\%PROJECTNAME%_*.o "%JSTUTOOLS%\buildfiles\RAPTOR\RAPTORMT.O" "%JSTUTOOLS%\buildfiles\RAPTOR\RAPTOR235.O" "%JSTUTOOLS%\buildfiles\RAPTOR\RAPTORLSP.O" "%JSTUTOOLS%\buildfiles\RAPTOR\RAPTORGD.O" "%JSTUTOOLS%\buildfiles\RAPTOR\DSP.OBJ" "%JSTUTOOLS%\buildfiles\include\libm.a" "%JSTUTOOLS%\buildfiles\include\libc.a" "%JSTUTOOLS%\buildfiles\include\libgcc.a" "%JSTUTOOLS%\buildfiles\include\jstudio_functions.o" "%JSTUTOOLS%\buildfiles\include\ee_printf.o" "%JSTUTOOLS%\buildfiles\include\eeprom.o" >> %TEMPDIR%\build.log
if not exist %BUILDPATH%\%PROJECTNAME%.abs goto :builderror

rem -------------------------------------------------------------
rem Check file size to see if we passed the 2mb barrier.
rem If yes, abort.
set file="%BUILDPATH%\%PROJECTNAME%.abs"
FOR /F "usebackq" %%A IN ('%file%') DO set size=%%~zA
echo File size=%size% bytes
if %size% lss 1900544 goto :runabs
echo ...which is waaay too big for .abs - aborting!
echo File too big for .abs - aborting build
goto :veryend

rem -------------------------------------------------------------
rem Don't run vj if no .abs file was produced
:runabs
if not exist %BUILDPATH%\%PROJECTNAME%.abs goto :builderror
echo. >> %TEMPDIR%\build.log
echo Build successful! >> %TEMPDIR%\build.log

rem -------------------------------------------------------------
rem Run vj or send binary to skunk
if /i "%2"=="skunk" goto :sendabs
if /i "%4"=="jaggd" goto :sendjaggd
if /i "%3"=="jaggd" goto :sendjaggd
if /i "%2"=="jaggd" goto :sendjaggd
if /i "%4"=="bigp" goto :sendbigp
if /i "%3"=="bigp" goto :sendbigp
if /i "%2"=="bigp" goto :sendbigp

echo. >> %TEMPDIR%\build.log
if /i "%2"=="BOSSMODE" goto :veryend
if /i "%3"=="BOSSMODE" goto :veryend
if /i "%4"=="BOSSMODE" goto :veryend
if /i "%5"=="BOSSMODE" goto :veryend
echo Starting vj
echo starting vj >> %TEMPDIR%\build.log
start virtualjaguar %BUILDPATH%\%PROJECTNAME%.abs --alpine
goto :veryend
:sendabs
if /i "%3"=="bjl" goto :sendbjl
echo Sending to skunkboard...
echo. >> %TEMPDIR%\build.log
echo Sending to skunkboard... >> %TEMPDIR%\build.log
jcp -r
ping localhost >NUL
jcp %BUILDPATH%\%PROJECTNAME%.abs
goto :veryend
:sendbjl
echo Sending to bjl (hopefully)... >> %TEMPDIR%\build.log
lo_inp.exe -8 -b 0x4000 %BUILDPATH%\%PROJECTNAME%.abs
goto :veryend

rem -------------------------------------------------------------
rem Error handler
:builderror
echo Build error!
if exist %TEMPDIR%\build.log echo Build error! >> %TEMPDIR%\build.log
if exist %TEMPDIR%\build.log type %TEMPDIR%\build.log
goto :veryend

rem -------------------------------------------------------------
rem Create a new project
:newproject
if exist projects\basic\%PROJECTNAME%\%PROJECTNAME%.bas goto :newbasicprojectexists
if exist projects\c\%PROJECTNAME%\%PROJECTNAME%.c goto :newcprojectexists
if exist projects\asm\%PROJECTNAME%\%PROJECTNAME%.s goto :newasmprojectexists

if /i "%2" == "newc" (
	xcopy /Q > nul /e "%JSTUTOOLS%\buildfiles\template" projects\c\%PROJECTNAME%\
	rename projects\c\%PROJECTNAME%\template.c %PROJECTNAME%.c
	if exist projects\c\%PROJECTNAME%\template.bas del projects\c\%PROJECTNAME%\template.bas
	if exist projects\c\%PROJECTNAME%\template.s del projects\c\%PROJECTNAME%\template.s
	echo.
	echo C Project %PROJECTNAME% created successfully!
) else if /i "%2" == "newasm" (
	xcopy /Q > nul /e "%JSTUTOOLS%\buildfiles\template" projects\asm\%PROJECTNAME%\
	rename projects\asm\%PROJECTNAME%\template.s %PROJECTNAME%.s
	if exist projects\asm\%PROJECTNAME%\template.bas del projects\asm\%PROJECTNAME%\template.bas
	if exist projects\asm\%PROJECTNAME%\template.c del projects\asm\%PROJECTNAME%\template.c
	if exist projects\asm\%PROJECTNAME%\common.h del projects\asm\%PROJECTNAME%\common.h
	echo.
	echo ASM Project %PROJECTNAME% created successfully!
) else (
	xcopy /Q > nul /e "%JSTUTOOLS%\buildfiles\template" projects\basic\%PROJECTNAME%\
	rename projects\basic\%PROJECTNAME%\template.bas %PROJECTNAME%.bas
	if exist projects\basic\%PROJECTNAME%\template.c del projects\basic\%PROJECTNAME%\template.c
	if exist projects\basic\%PROJECTNAME%\common.h del projects\basic\%PROJECTNAME%\common.h
	if exist projects\basic\%PROJECTNAME%\template.s del projects\basic\%PROJECTNAME%\template.s
	echo.
	echo BASIC Project %PROJECTNAME% created successfully!
)

echo.
echo.
echo Type 'build %PROJECTNAME%' to run it in VJ.
echo Type 'build %PROJECTNAME% skunk' to run it on a Skunkboard.
echo Type 'build %PROJECTNAME% jaggd' to run it on a JagGD.
goto :veryend



:splitrom
echo.
echo Splitting ROM file

romwak_x86 /w "%BUILDPATH%\%PROJECTNAME%.ROM" "%BUILDPATH%\%PROJECTNAME%-HI.BIN" "%BUILDPATH%\%PROJECTNAME%-LO.BIN"
romwak_x86 /f "%BUILDPATH%\%PROJECTNAME%-HI.BIN"
romwak_x86 /f "%BUILDPATH%\%PROJECTNAME%-LO.BIN"

if %romsize% gtr 4194304 (
	padbin 0x400000 "%BUILDPATH%\%PROJECTNAME%-LO.BIN"
	padbin 0x400000 "%BUILDPATH%\%PROJECTNAME%-HI.BIN"	
) else (
	if %romsize% gtr 2097152 (
		padbin 0x200000 "%BUILDPATH%\%PROJECTNAME%-LO.BIN"
		padbin 0x200000 "%BUILDPATH%\%PROJECTNAME%-HI.BIN"	
	) else (
		padbin 0x100000 "%BUILDPATH%\%PROJECTNAME%-LO.BIN"
		padbin 0x100000 "%BUILDPATH%\%PROJECTNAME%-HI.BIN"	
	)
)

goto :veryend


:newasmprojectexists
echo.
echo An ASM project called '%PROJECTNAME%' already exists.
goto :veryend

:newbasicprojectexists
echo.
echo A BASIC project called '%PROJECTNAME%' already exists.
goto :veryend

:newcprojectexists
echo.
echo A C project called '%PROJECTNAME%' already exists.
goto :veryend

:createjaggdmrq
echo.
SET gddev=%3
SET gdpub=%4
SET gdyear=%5
echo Creating JagGD MRQ File for;  Dev: %gddev%   Pub: %gdpub%   Year: %gdyear%

buildfiles\bin\jaggd\png2mrq -box %BUILDPATH%\assets\jaggd\boxart.png -screen %BUILDPATH%\assets\jaggd\screenshot.png -title "%PROJECTNAME%" -dev "%gddev%" -pub "%gdpub%" -year %gdyear% -out "%BUILDPATH%\%PROJECTNAME%.mrq" -eeprom 2

:veryend
rem Unset variables
set CURRENTPATH=
set CURRENTPATHFULL=
set TEMPDIR=
set PROJECTNAME=
set SOURCELANG=
set CSOURCEFILES=

goto :eof

