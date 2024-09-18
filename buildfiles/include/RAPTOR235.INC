;;
;; RAPTOR-U235 Module
;;
;; (c) REBOOT
;;

			.extern		dspcode
			.extern		moduleaddy
	
			.extern		rotary_interval1
			.extern		dsp_l1
			.extern		dsp_l2
			.extern		dsp_l3
			.extern		dsp_l4
			.extern		rotary_mode1
			.extern		turn_direction1
			.extern 	spin_delta1
			.extern		spin_delta2
			.extern		spin_step1
			.extern		spin_step2

			.extern		rotary_interval2
			.extern		dsp_l12
			.extern		dsp_l22
			.extern		dsp_l32
			.extern		dsp_l42
			.extern		rotary_mode2
			.extern		turn_direction2
			.extern		dspcode
			.extern		U235SE_modspeed
			.extern		modinit
			.extern		moduleaddy	

			.extern		RAPTOR_U235init
			.extern		RAPTOR_U235stopDSP
			.extern		RAPTOR_U235playsample
			.extern		RAPTOR_U235setmodule
			.extern		RAPTOR_U235gomodule_mono
			.extern		RAPTOR_U235gomodule_stereo
			.extern		RAPTOR_U235stopmodule	
			.extern		RAPTOR_U235SilenceChannels
			.extern		RAPTOR_U235ChangeReplayFrq
	
			.extern		RAPTOR_U235setpad1
			.extern		RAPTOR_U235setrot1
			.extern		RAPTOR_U235setpad2
			.extern		RAPTOR_U235setrot2	
			.extern		raptor_sampelbank_ptr
			.extern		raptor_ntsc_flag
			.extern		raptor_playlist

; END OF FILE			