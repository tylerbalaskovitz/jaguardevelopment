;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; RAPTOR GD WRAPPER
;;
;; Include file
;;

					.extern		RAPTOR_GD_Init
					.extern		RAPTOR_GD_BIOSVersion
					.extern		RAPTOR_GD_ROMWriteEnable
					.extern		RAPTOR_GD_GetCartSerial
					.extern		RAPTOR_GD_GetCardSerial
					.extern		RAPTOR_GD_CardIn
					.extern		RAPTOR_GD_Reset
					.extern		RAPTOR_GD_SetLED
					.extern		RAPTOR_GD_DebugString
					
					.extern		RAPTOR_GD_DirOpen
					.extern		RAPTOR_GD_DirRead
					.extern		RAPTOR_GD_DirClose
					
					.extern		RAPTOR_GD_FileOpen
					.extern		RAPTOR_GD_FileClose
					.extern		RAPTOR_GD_FileSeek
					.extern		RAPTOR_GD_FileRead
					.extern		RAPTOR_GD_FileWrite
					.extern		RAPTOR_GD_FileTell
					.extern		RAPTOR_GD_FileSize
					.extern		RAPTOR_GD_FileInfo	

; helper functions
					.extern		RAPTOR_GD_LoadFile
					.extern		RAPTOR_GD_SaveFile

					.extern		RAPTOR_ftime_to_ascii
					.extern		RAPTOR_fdate_to_ascii

					.extern		raptor_GD_SERIAL
					.extern		raptor_GD_ASERIAL
					.extern		raptor_SD_SERIAL
					.extern		raptor_GD_LEDstate
					.extern		raptor_GD_cardstat
					
					.extern		raptor_fileinfo
					.extern		raptor_fsize
					.extern		raptor_fdate
					.extern		raptor_ftime
					.extern		raptor_fattr
					.extern		raptor_fshort
					.extern		raptor_flong
					.extern		raptor_GD_detect
					

;; GD_Reset flags
GD_RESET_NORMAL					equ		$0
GD_RESET_MENU					equ		$1
GD_RESET_DEBUG					equ		$2

;; GD_ROM flags
GD_ROMWRITE_ENABLE				equ		$1
GD_ROMWRITE_DISABLE				equ		$0

;; GD_FInfo & GD_DRead flags
GD_FINFO_SHORT_NAME				equ		$0
GD_FINFO_LONG_NAME				equ		$1

;; GD_FOpen mode
GD_FOPEN_READ					equ		$1
GD_FOPEN_WRITE					equ		$2
GD_FOPEN_OPEN_EXISTING			equ		$0
GD_FOPEN_CREATE_NEW				equ		$4
GD_FOPEN_CREATE_ALWAYS			equ		$8
GD_FOPEN_OPEN_ALWAYS			equ		$10
GD_FOPEN_OPEN_APPEND			equ		$30

;; GD_FSEEK flags
GD_FSEEK_SET					equ		0
GD_FSEEK_CUR					equ		1
GD_FSEEK_END					equ		2

;; File Attributes

AM_RDO							equ		$1	; Read only
AM_HID							equ		$2	; Hidden
AM_SYS							equ		$4	; System
AM_VOL							equ		$8	; Volume Label
AM_DIR							equ		$10 ; Directory
AM_ARC							equ		$20 ; Archive
AM_MASK							equ		$3f ; Mask


