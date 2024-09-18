#!/bin/bash
#run this script in a linux terminal with the following command, and without the '#' sign
# bash ./build.sh
# chmod +x buildfiles/bin/jaggd/jaggd-x64 for GameDrive Support
# chmod +x buildfiles/bin/jcp for Skunkboard Support


JSVERSION=1.11
LINUXVERSION='Feb 12, 2023'

echo '-------------------------------------------------'
echo '   ___             _____ _             _ _       '
echo '  |_  |           /  ___| |           | (_)      '
echo '    | | __ _  __ _\ `--.| |_ _   _  __| |_  ___  '
echo '    | |/ _` |/ _` |`--. \ __| | | |/ _` | |/ _ \ '
echo '/\__/ / (_| | (_| /\__/ / |_| |_| | (_| | | (_) |'
echo '\____/ \__,_|\__, \____/ \__|\__,_|\__,_|_|\___/ '
echo '             __/ |                               '
echo "            |___/               Version $JSVERSION"
echo '                    RAPTOR v2.0.31  U-235SE v0.24'
echo '-------------------------------------------------'
echo ""
echo 'Linux bash script ported by William Thorup'
echo "Linux Script Last Updated: $LINUXVERSION"

if [[ $# -eq 0 ]]; then
    echo ""
    echo "Usage: build.bat projectname"
    echo "       build.bat projectname skunk"
    echo "       build.bat projectname skunkabs"
    echo "       build.bat projectname jaggd"
    echo "       build.bat projectname ROM"
    echo "       build.bat projectname ROM skunk"
    echo "       build.bat projectname ROM UNPACKED"
    echo "       build.bat projectname ROM UNPACKED skunk"
    echo "       build.bat projectname ROM jaggd"
    echo "       build.bat projectname skunk bjl"
    echo "       build.bat projectname newbasic"
    echo "       build.bat projectname newc"
    echo "       build.bat projectname mrq Developername PublisherName Year"
    echo "       build.bat projectname ROM split"
    echo ""
    echo "Folder \"projectname\" must exist inside folder \"projects\""
    echo "and have a file called \"projectname.bas\" inside."
    echo ""
    echo "Keep in mind that this script is case sensitive."
    echo "Which means a project folder or file named \"File\" is not"
    echo "the same as \"file\"."
    echo ""
    echo "When building a ROM it is assumed that there will exist"
    echo "a file called assets.txt inside the project folder"
    echo "and will contain all assets to be included in ROM (if any)."
    echo "By default the main program is packed into the ROM"
    echo "and depacked during boot. This can be avoided by passing"
    echo "the UNPACKED switch."
    echo ""
    echo "\"newbasic\" will create a new BASIC project"
    echo "from the \"include\template\" folder. No project will be"
    echo "created if folder exists."
    echo ""
    echo "\"newc\" will create a new C project"
    echo "from the \"include\template\" folder. No project will be"
    echo "created if folder exists."
    echo ""
    echo "\"BOSSMODE\" will stop virtualjaguar from running."
    echo ""
    echo "\"jaggd\" will send the project to a JagGD."
    echo ""
    echo "\"skunk\" will send the project to a Skunkboard (caution - when using ROM, bank"
    echo "1 will be erased without any warning!)"
    echo ""
    echo "\"skunkabs\" will send the updated ABS part of the project to the Skunkboard but will NOT send any ROM assets. "
    echo "It will reuse what is stored on the Skunk. This is the faster option if your ROM assets haven\'t changed."
    echo ""
    echo "\"bjl\" will upload the binary to Jaguar via BJL. Note that"
    echo "you might need to edit the command line parameters to the uploader"
    echo "in this file (just search for \"lo_inp.exe\")"
    echo ""
    echo "\"mrq Developername PublisherName Year\" This will create a JagGD MRQ file for your project.  It will use"
    echo "the two images from \yourprojectname\assets\jaggd\ . Put your developer name, publisher name and the year in the params."
    echo ""
    echo "\"ROM split\" will build the ROM and then split it into HI and LO ROM files."
    echo ""
    echo "Current BASIC projects:"
    for i in $(ls -d ./projects/basic/*/); do basename ${i%%/}; done
    echo ""
    echo ""
    echo "Current C projects:"
    for i in $(ls -d ./projects/c/*/); do basename ${i%%/}; done
    echo ""
    echo ""
    echo "Current ASM projects:"
    for i in $(ls -d ./projects/asm/*/); do basename ${i%%/}; done
    exit
fi

#--------------------------------------------------------------
#Set build tools path
if command -v wine &> /dev/null; then
echo "Wine is installed, continuing..."
else
echo ""
echo "Wine is not installed."
echo "Wine is required to properly build your Jaguar application."
echo ""
echo "If you are in a Linux distribution that uses 'apt' to install"
echo "new applications. Run the following line in a Linux terminal"
echo "to install Wine."
echo ""
echo "sudo apt install -y wine; winepath;"
echo ""
echo ""
echo "If your distribution doesn't use 'apt' as a package manager"
echo "you will need to learn how to install wine for your specific"
echo "Linux distribution."
exit
fi

PROJECTNAME=$1
SOURCELANG=BAS
#--------------------------------------------------------------
#Set build tools path
JSTUTOOLS=$(pwd)
CURRENTPATH=$JSTUTOOLS
WINECMD="wine cmd /c"
JSTUTOOLSFIXEDSLASHES="${JSTUTOOLS//\///}"
export WINEPATH="Z:$JSTUTOOLSFIXEDSLASHES;Z:$JSTUTOOLSFIXEDSLASHES\buildfiles\bin"
CURRENTPATH_FULL=$(pwd)

JCP="$JSTUTOOLS/buildfiles/bin/jcp"

echo "Tools directory is located at $JSTUTOOLS"


#--------------------------------------------------------------
#set our path if a project with the given name exists
if test -e "$CURRENTPATH/projects/basic/$PROJECTNAME/$PROJECTNAME.bas"; then
    BUILDPATH=$CURRENTPATH/projects/basic/$PROJECTNAME
    SOURCELANG=BAS
    echo "The selected project is a $SOURCELANG project"
elif test -e "$CURRENTPATH/projects/c/$PROJECTNAME/$PROJECTNAME.c"; then
    BUILDPATH=$CURRENTPATH/projects/c/$PROJECTNAME
    SOURCELANG=C
    echo "The selected project is a $SOURCELANG project"
elif test -e "$CURRENTPATH/projects/asm/$PROJECTNAME"; then
    BUILDPATH=$CURRENTPATH/projects/asm/$PROJECTNAME
    SOURCELANG=ASM
    echo "The selected project is a $SOURCELANG project"
else
    echo ""
fi

TEMPDIR=$BUILDPATH/build
#assume no ROM mode
ROM_MODE=0


if [[ "$2" == "" ]] || [[ "$2" == "ROM" ]] || [[ "$2" == "skunk" ]] || [[ "$2" == "skunkabs" ]] || [[ "$2" == "jaggd" ]]; then
    #do build
    echo "building..."

    #--------------------------------------------------------------
    #Always clean the build folder
    if test -e "$TEMPDIR"; then
        rm -rvf $TEMPDIR
        mkdir $TEMPDIR
    fi

    #--------------------------------------------------------------
    #delete residual files from previous builds
    if test -e "$BUILDPATH/$PROJECTNAME.abs"; then rm -vf "$BUILDPATH/$PROJECTNAME.abs"; fi
    if test -e "$TEMPDIR/basic.o"; then rm -vf "$TEMPDIR/basic.o"; fi
    if test -e "$TEMPDIR/$PROJECTNAME.c"; then rm -vf "$TEMPDIR/$PROJECTNAME.c"; fi
    if test -e "$TEMPDIR/$PROJECTNAME.o"; then rm -vf "$TEMPDIR/$PROJECTNAME.o"; fi

    #--------------------------------------------------------------
    #abort build if bas file doesn't exist
    if [ ! -f "$BUILDPATH/$PROJECTNAME.bas" ]; then
        if [ ! -f "$BUILDPATH/$PROJECTNAME.c" ]; then
            if [ ! -f "$BUILDPATH/$PROJECTNAME.s" ]; then
                echo "$BUILDPATH/$PROJECTNAME.{bas/c/s} doesn't exist!"
                echo "Error! Cannot build and exiting!"
                exit
            fi
        fi
    fi
    
    if [ ! -d "$TEMPDIR" ]; then mkdir $TEMPDIR; fi
    #logging code - echo Build started on %date% %time% > %TEMPDIR%\build.log
    #logging code - JagStudio Version: %JSVERSION% > %TEMPDIR%\build.log

    #--------------------------------------------------------------
    #let's build the linkfile and romassets.inc/.h/ramassets.inc right here
    #does asset conversion too
    if test -f "$BUILDPATH/$PROJECTNAME.rom"; then rm -vf "$BUILDPATH/$PROJECTNAME.rom"; fi
    if test -f "$TEMPDIR/$PROJECTNAME.bin"; then rm -vf "$TEMPDIR/$PROJECTNAME.bin"; fi
    if test -f "$BUILDPATH/romassets.h"; then rm -vf "$BUILDPATH/romassets.h"; fi
    if test -f "$BUILDPATH/romassets.inc"; then rm -vf "$BUILDPATH/romassets.inc"; fi
    if test -f "$BUILDPATH/ramassets.inc"; then rm -vf "$BUILDPATH/ramassets.inc"; fi
    if test -f "$TEMPDIR/linkfile.bin"; then rm -vf "$TEMPDIR/linkfile.bin"; fi
    #logging code - echo. >> %TEMPDIR%\build.log
    wine cmd /c $JSTUTOOLS/buildfiles/bin/buildlink.exe "$BUILDPATH/assets.txt" "$BUILDPATH"
    #build error code goes here - if %ERRORLEVEL% == "2" goto :builderror
    if test -f "$TEMPDIR/linkfile.bin"; then ROM_MODE=1; fi

    #--------------------------------------------------------------
    #assemble raptor skeleton
    basico=0
    if [[ $SOURCELANG != "ASM" ]]; then
    
        echo "" #>> %TEMPDIR%\build.log
        echo "Assembling raptor skeleton..." # >> %TEMPDIR%\build.log
        
        cd $BUILDPATH
        
        ${WINECMD} rmac -fb -u -i"$JSTUTOOLS/buildfiles/include" -o./build/basic.o rapapp.s
        cd $CURRENTPATH_FULL
        
        if [ ! -f "$TEMPDIR/basic.o" ]; then
        
            echo ""
            echo "rmac failed to create basic.o"
            exit
            
        fi
        
        basico="$TEMPDIR/basic.o "
        
    fi

    #--------------------------------------------------------------
    #translate .bas file to C
    if [[ $SOURCELANG == "BAS" ]]; then
    
        echo "" #>> %TEMPDIR%\build.log
        echo "Translating .bas file to C..." #>> %TEMPDIR%\build.log
        
        ${WINECMD} bc $BUILDPATH/$PROJECTNAME.bas  -f:$TEMPDIR/$PROJECTNAME.c #>> %TEMPDIR%\build.log
        
        if [ ! -f "$TEMPDIR/$PROJECTNAME.c" ]; then
            echo ""
            echo "BCX-32: BASIC to C/C++ Translator failed to create $PROJECTNAME.c"
            exit
        fi
        
    fi

    #--------------------------------------------------------------
    #Compile code
    if [[ $SOURCELANG == "BAS" ]]; then
        CSOURCEFILES=$TEMPDIR
    else
        CSOURCEFILES=$BUILDPATH
    fi
    
    if [[ $SOURCELANG == "ASM" ]]; then
        echo "" #>> %TEMPDIR%\build.log
        echo "Compiling asm code to O..." #>> %TEMPDIR%\build.log	
        
        cd $BUILDPATH
        
        ${WINECMD} rmac -fb -u -i"$JSTUTOOLS\buildfiles\include" -o./build/${PROJECTNAME}_$PROJECTNAME.o $PROJECTNAME.s #>> %TEMPDIR%\build.log 2>&1
        
        cd $CURRENTPATH_FULL
        
        if [ ! -f "$TEMPDIR/${PROJECTNAME}_$PROJECTNAME.o" ]; then
            echo ""
            echo "rmac failed to create ${PROJECTNAME}_$PROJECTNAME.o"
            exit
        fi
        
    else
    
        echo "" #>> %TEMPDIR%\build.log
        echo "Compiling C code to O..." #>> %TEMPDIR%\build.log
        
        for i in $CSOURCEFILES/*.c
        do
            sourcfilename=$(basename ${i%.*})
            ${WINECMD} m68k-atari-mint-gcc -Ofast -I"$JSTUTOOLS/buildfiles/include" -I"$BUILDPATH/" -I"$TEMPDIR/" -o "$TEMPDIR/${PROJECTNAME}_$sourcfilename.o" -c "$CSOURCEFILES/$sourcfilename.c" #>> %TEMPDIR%\build.log 2>&1
        done
        
        if [ ! -f "$TEMPDIR/${PROJECTNAME}_$PROJECTNAME.o" ]; then
            echo ""
            echo "rmac failed to create ${PROJECTNAME}_$PROJECTNAME.o"
            exit
        fi
        
        echo "Compiling C code to S..." #>> %TEMPDIR%\build.log
        
        for i in $CSOURCEFILES/*.c
        do
            sourcfilename=$(basename ${i%.*})
            ${WINECMD} m68k-atari-mint-gcc -Ofast -I"$JSTUTOOLS/buildfiles/include" -I"$BUILDPATH/" -I"$TEMPDIR/" -S -o "$TEMPDIR/${PROJECTNAME}_$sourcfilename.s" -c "$CSOURCEFILES/$sourcfilename.c" #>> %TEMPDIR%\build.log 2>&1
        done
        
    
    fi
    
    if [[ "$2" != "ROM" ]]; then
    
    #:norom
    #-------------------------------------------------------------
    #Link binaries
    
        echo "Building ABS..."
            echo "" #>> %TEMPDIR%\build.log
        echo "Linking things..." #>> %TEMPDIR%\build.log
        
        ${WINECMD} rln -e -z -rq -m -o $BUILDPATH/$PROJECTNAME.abs -a 4000 x x $TEMPDIR/$PROJECTNAME_*.o "$JSTUTOOLS/buildfiles/RAPTOR/RAPTOR.O" "$JSTUTOOLS/buildfiles/RAPTOR/RAPTORMT.O" "$JSTUTOOLS/buildfiles/RAPTOR/RAPTOR235.O" "$JSTUTOOLS/buildfiles/RAPTOR/RAPTORLSP.O" "$JSTUTOOLS/buildfiles/RAPTOR/RAPTORGD.O" "$JSTUTOOLS/buildfiles/RAPTOR/DSP.OBJ" "$JSTUTOOLS/buildfiles/include/libm.a" "$JSTUTOOLS/buildfiles/include/libc.a" "$JSTUTOOLS/buildfiles/include/libgcc.a" "$JSTUTOOLS/buildfiles/include/jstudio_functions.o" "$JSTUTOOLS/buildfiles/include/ee_printf.o" "$JSTUTOOLS/buildfiles/include/eeprom.o" #>> %TEMPDIR%\build.log
        
        if [ ! -f "$BUILDPATH/$PROJECTNAME.abs" ]; then
            echo ""
            echo "rln failed to create $PROJECTNAME.abs"
            exit
        fi

        file="$BUILDPATH/$PROJECTNAME.abs"
        size=$(stat -c%s "$file")
        echo "abs file size is $size"
        if [ $size -lt 1900544 ]; then
            echo "" #>> %TEMPDIR%\build.log
            echo "Build successful!" #>> %TEMPDIR%\build.log
        else
            echo "...which is waaay too big for .abs - aborting!"
            echo "File too big for .abs - aborting build"
            exit
        fi
        
        #Doing something with the abs file
        if [[ "$2" == "skunk" ]]; then
        
            #:sendabs
            if [[ "$3" == "bjl" ]]; then
            
                echo "Sending to bjl (hopefully)..." #>> %TEMPDIR%\build.log
                ${WINECMD} lo_inp.exe -8 -b 0x4000 $BUILDPATH/$PROJECTNAME.abs
                exit
                
            fi
            
            echo "Sending to skunkboard..."
            echo "" #>> %TEMPDIR%\build.log
            #echo "Sending to skunkboard..." >> %TEMPDIR%\build.log
            #Wine currently doesn't have access to the linux USB stack, you will need to install jcp natively in linux
            
            if test -f "$JCP"; then
            
                #reset skunk
                $JCP -r
                sleep 2.5
                $JCP $BUILDPATH/$PROJECTNAME.abs
                
            else
            
                echo "Wine currently doesn't have access to the linux USB stack."
                echo "You will need to install jcp natively in linux in order to use it."
                echo ""
                echo "Failed to send to Skunkboard!"
                
            fi
            exit
            
        elif [[ "$4" == "jaggd" ]] || [[ "$3" == "jaggd" ]] || [[ "$2" == "jaggd" ]]; then
            
 
            echo "" #>> %TEMPDIR%\build.log
            sudo ./buildfiles/bin/jaggd/jaggd-x64 -rd -ux $BUILDPATH/$PROJECTNAME.abs,a:$4000,x:$4000
            exit
            
        elif [[ "$5" == "BOSSMODE" ]] || [[ "$4" == "BOSSMODE" ]] || [[ "$3" == "BOSSMODE" ]] || [[ "$2" == "BOSSMODE" ]]; then
        
            exit
            
        else
        
            #run abs if the file is small enough
            #run BigPEmu
            echo "Starting BigPEmu"

            #if we have virtualjaguar built for linux, prefer that over the BigPEmu windows .exe
            if test -f "$JSTUTOOLS/buildfiles/bin/virtualjaguar"; then
                $JSTUTOOLS/buildfiles/bin/virtualjaguar $BUILDPATH/$PROJECTNAME.abs --alpine
            else
                ${WINECMD} $JSTUTOOLS/buildfiles/bin/bigpemu/BigPEmu.exe $BUILDPATH/$PROJECTNAME.abs -eeprombits 10 -devmode -setcfgpropcat LocalEEPROM 1 DevMode
            fi
            
        fi
        
        exit
        
    else
    
    #:ROM
    #-------------------------------------------------------------
    #Link binaries
    
        PACKROM="packed"
        if [[ "$2" == "UNPACKED" ]] || [[ "$3" == "UNPACKED" ]]; then
            $PACKROM="unpacked"
        else
             
            echo "Building $PACKROM ROM file..."
            echo "" #>> %TEMPDIR%\build.log
            echo "Linking things..." #>> %TEMPDIR%\build.log
            
            ${WINECMD} rln -z -rq -m -o "$TEMPDIR/$PROJECTNAME.bin" -n -a 4000 x x $basico "$TEMPDIR/$PROJECTNAME_"*.o "$JSTUTOOLS/buildfiles/RAPTOR/RAPTOR.O" "$JSTUTOOLS/buildfiles/RAPTOR/RAPTORMT.O" "$JSTUTOOLS/buildfiles/RAPTOR/RAPTOR235.O" "$JSTUTOOLS/buildfiles/RAPTOR/RAPTORLSP.O" "$JSTUTOOLS/buildfiles/RAPTOR/RAPTORGD.O" "$JSTUTOOLS/buildfiles/RAPTOR/DSP.OBJ" "$JSTUTOOLS/buildfiles/include/libm.a" "$JSTUTOOLS/buildfiles/include/libc.a" "$JSTUTOOLS/buildfiles/include/libgcc.a" "$JSTUTOOLS/buildfiles/include/jstudio_functions.o" "$JSTUTOOLS/buildfiles/include/ee_printf.o" "$JSTUTOOLS/buildfiles/include/eeprom.o" #>> %TEMPDIR%\build.log
        
            if [ ! -f "$TEMPDIR/$PROJECTNAME.bin" ]; then
                echo ""
                echo "rln failed to create $PROJECTNAME.bin"
                exit
            fi
            
            ${WINECMD} rln -e -z -rq -m -o $BUILDPATH/$PROJECTNAME.abs -a 4000 x x $basico $TEMPDIR/$PROJECTNAME_*.o "$JSTUTOOLS/buildfiles/RAPTOR/RAPTOR.O" "$JSTUTOOLS/buildfiles/RAPTOR/RAPTORMT.O" "$JSTUTOOLS/buildfiles/RAPTOR/RAPTOR235.O" "$JSTUTOOLS/buildfiles/RAPTOR/RAPTORLSP.O" "$JSTUTOOLS/buildfiles/RAPTOR/RAPTORGD.O" "$JSTUTOOLS/buildfiles/RAPTOR/DSP.OBJ" "$JSTUTOOLS/buildfiles/include/libm.a" "$JSTUTOOLS/buildfiles/include/libc.a" "$JSTUTOOLS/buildfiles/include/libgcc.a" "$JSTUTOOLS/buildfiles/include/jstudio_functions.o" "$JSTUTOOLS/buildfiles/include/ee_printf.o" "$JSTUTOOLS/buildfiles/include/eeprom.o" #>> %TEMPDIR%\build.log
            
            
            #-------------------------------------------------------------
            #Let's build a ROM
            echo "" #>> %TEMPDIR%\build.log
            echo "Making $PACKROM ROM..." #>> %TEMPDIR%\build.log
            ${WINECMD} makearom "$TEMPDIR/$PROJECTNAME.bin" "$TEMPDIR/linkfile.bin" $BUILDPATH/$PROJECTNAME.rom $PACKROM
        
            if [ ! -f "$BUILDPATH/$PROJECTNAME.rom" ]; then
                echo ""
                echo "makearom failed to create $PROJECTNAME.rom"
                exit
            fi
            
            #-------------------------------------------------------------
            #Check ROM size and send as 6mb if over 4mb
            romfile="$BUILDPATH/$PROJECTNAME.rom"
            romsize=$(stat -c%s "$romfile")
            echo "Rom size is $romsize"
            echo ""
            
            if [[ "$3" == "split" ]]; then
            
                echo ""
                echo "Splitting ROM file"
                
                ${WINECMD} romwak_x86 /w "$BUILDPATH/$PROJECTNAME.ROM" "$BUILDPATH/$PROJECTNAME-HI.BIN" "$BUILDPATH/$PROJECTNAME-LO.BIN"
                ${WINECMD} romwak_x86 /f "$BUILDPATH/$PROJECTNAME-HI.BIN"
                ${WINECMD} romwak_x86 /f "$BUILDPATH/$PROJECTNAME-LO.BIN"
                
                if [[ $romsize -gt 4194304 ]]; then
                    ${WINECMD} padbin 0x400000 "$BUILDPATH/$PROJECTNAME-LO.BIN"
                    ${WINECMD} padbin 0x400000 "$BUILDPATH/$PROJECTNAME-HI.BIN"
                else
                    if [[ $romsize -gt 2097152 ]]; then
                        ${WINECMD} padbin 0x200000 "$BUILDPATH/$PROJECTNAME-LO.BIN"
                        ${WINECMD} padbin 0x200000 "$BUILDPATH/$PROJECTNAME-HI.BIN"
                    else
                        ${WINECMD} padbin 0x100000 "$BUILDPATH/$PROJECTNAME-LO.BIN"
                        ${WINECMD} padbin 0x100000 "$BUILDPATH/$PROJECTNAME-HI.BIN"
                    fi
                fi
                exit
                
            elif [[ "$4" == "skunk" ]] || [[ "$3" == "skunk" ]] || [[ "$2" == "skunk" ]]; then
            
                #:sendrom
                #Wine currently doesn't have access to the linux USB stack, you will need to install jcp natively in linux
                 if test -f "$JCP"; then
                    #reset skunk
                    $JCP -r
                    sleep 2.5
                    if [ romsize -gt 4194304 ]; then
                        echo "Sending 6MB rom"
                        $JCP -6 -f $romfile
                    else
                        $JCP -f $romfile
                    fi
                else
                    echo "Wine currently doesn't have access to the linux USB stack."
                    echo "You will need to install jcp natively in linux in order to use it."
                    echo ""
                    echo "Failed to send to Skunkboard!"
                fi
                exit
                
            elif [[ "$4" == "skunkabs" ]] || [[ "$3" == "skunkabs" ]] || [[ "$2" == "skunkabs" ]]; then
        
                #:sendabs
                if [[ "$3" == "bjl" ]]; then
                
                    echo "Sending to bjl (hopefully)..." #>> %TEMPDIR%\build.log
                    ${WINECMD} lo_inp.exe -8 -b 0x4000 $BUILDPATH/$PROJECTNAME.abs
                    exit
                    
                fi
                
                echo "Sending to skunkboard..."
                echo "" #>> %TEMPDIR%\build.log
                #echo "Sending to skunkboard..." >> %TEMPDIR%\build.log
                #Wine currently doesn't have access to the linux USB stack, you will need to install jcp natively in linux
                
                if command -v jcp &> /dev/null; then
                
                    #reset skunk
                    jcp -r
                    sleep 2.5
                    jcp $BUILDPATH/$PROJECTNAME.abs
                    
                else
                
                    echo "Wine currently doesn't have access to the linux USB stack."
                    echo "You will need to install jcp natively in linux in order to use it."
                    echo ""
                    echo "Failed to send to Skunkboard!"
                    
                fi
                exit
                
            elif [[ "$4" == "jaggd" ]] || [[ "$3" == "jaggd" ]] || [[ "$2" == "jaggd" ]]; then
            
                #:sendjaggd

                echo "" #>> %TEMPDIR%\build.log
                sudo ./buildfiles/bin/jaggd/jaggd-x64 -rd -ux $BUILDPATH/$PROJECTNAME.rom
                exit
                
            elif [[ "$4" == "BOSSMODE" ]] || [[ "$3" == "BOSSMODE" ]] || [[ "$2" == "BOSSMODE" ]] || [[ "$2" == "BOSSMODE" ]]; then
            
                exit
                
            else
            
                #run virtualjaguar
                #if we have virtualjaguar built for linux, prefer that over the windows.exe
                if test -f "$JSTUTOOLS/buildfiles/bin/virtualjaguar"; then
                    $JSTUTOOLS/buildfiles/bin/virtualjaguar $BUILDPATH/$PROJECTNAME.abs --alpine
                else
                    ${WINECMD} virtualjaguar $BUILDPATH/$PROJECTNAME.abs --alpine
                fi
                exit
                
            fi
            
            
            
        fi
        
    fi
    
    
else
echo "performing second argument operation"
#do argument 2 options
#new projects
    if [[ "$2" == "newbasic" ]] || [[ "$2" == "newc" ]] || [[ "$2" == "newasm" ]]; then
    
        #check to make sure that a project of the same name does't already exist
        if test -e "$CURRENTPATH/projects/basic/$PROJECTNAME"; then
            echo "A BASIC project called '$PROJECTNAME' already exists."
            exit
        elif test -e "$CURRENTPATH/projects/c/$PROJECTNAME"; then
            echo "A C project called '$PROJECTNAME' already exists."
            exit
        elif test -e "$CURRENTPATH/projects/asm/$PROJECTNAME"; then
            echo "A assmebler project called '$PROJECTNAME' already exists."
            exit
        fi
        
        #create new project based on selected option
        if [ "$2" == "newbasic" ]; then
            echo "Creating JagStudio Basic Application: $PROJECTNAME"
            mkdir ./projects/basic/$PROJECTNAME
            cp -rvf  "$JSTUTOOLS/buildfiles/template/"* ./projects/basic/$PROJECTNAME/
            mv ./projects/basic/$PROJECTNAME/template.bas ./projects/basic/$PROJECTNAME/$PROJECTNAME.bas
            rm -vf ./projects/basic/$PROJECTNAME/template.c
            rm -vf ./projects/basic/$PROJECTNAME/template.s
            rm -vf ./projects/basic/$PROJECTNAME/common.h
        elif [ "$2" == "newc" ]; then
            echo "Creating JagStudio C Application: $PROJECTNAME"
            mkdir ./projects/c/$PROJECTNAME
            cp -rv "$JSTUTOOLS/buildfiles/template/"* ./projects/c/$PROJECTNAME/
            mv ./projects/c/$PROJECTNAME/template.c ./projects/c/$PROJECTNAME/$PROJECTNAME.c
            rm -vf ./projects/c/$PROJECTNAME/template.bas
            rm -vf ./projects/c/$PROJECTNAME/template.s
            echo ""
            echo "ASM Project $PROJECTNAME created successfully!"
        elif [ "$2" == "newasm" ]; then
            echo "Creating JagStudio ASM Application: $PROJECTNAME"
            mkdir ./projects/asm/$PROJECTNAME
            cp -rvf  "$JSTUTOOLS/buildfiles/template/"* ./projects/asm/$PROJECTNAME/
            mv ./projects/asm/$PROJECTNAME/template.s ./projects/asm/$PROJECTNAME/$PROJECTNAME.s
            rm -vf ./projects/asm/$PROJECTNAME/template.bas
            rm -vf ./projects/asm/$PROJECTNAME/template.c
            rm -vf ./projects/asm/$PROJECTNAME/common.h
        else
         echo ""
         exit
        fi

        echo ""
        echo ""
        echo "Type 'build $PROJECTNAME' to run it in VJ."
        echo "Type 'build $PROJECTNAME skunk' to run it on a Skunkboard."
        echo "Type 'build $PROJECTNAME jaggd' to run it on a JagGD."
        echo ""
        echo ""
        
        exit
        
    elif [[ "$2" == "mrq" ]]; then
        echo ""
        gddev=$3
        gdpub=$4
        gdyear=$5
        echo "Creating JagGD MRQ File for;  Dev: $gddev   Pub: $gdpub   Year: $gdyear"
        
        ${WINECMD} "$JSTUTOOLS/buildfiles/bin/jaggd/png2mrq.exe" -box "$BUILDPATH/assets/jaggd/boxart.png" -screen "$BUILDPATH/assets/jaggd/screenshot.png" -title "$PROJECTNAME" -dev "$gddev" -pub "$gdpub" -year $gdyear -out "$BUILDPATH/$PROJECTNAME.mrq" -eeprom 2
        
        exit
    else
        exit
    fi
    exit
fi


exit


fi




