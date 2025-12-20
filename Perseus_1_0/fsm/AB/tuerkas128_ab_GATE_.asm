;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; G A T E   A B s '   F I N I T E   S T A T E   M A C H I N E 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC _BEGIN_AB_FSM_GATE
_BEGIN_AB_FSM_GATE:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; AB_FSM_Gate
;
; FSM for Gate Animated Blocks
;
; If 1 bit flag (ix+5) is unset (animation is off) then
;   return
; else
;   If gate is in the STOP phase then
;      set phase to 0 and begin animation
;   else
;      animate (take into account phase durtion in ix+8)
;      play sound associated to gate at the begining of pahse 1
;      if phase = last phase then
;          set Gate inactive (bit 7 of byte 0 of entity data)
;      end if
;   end if
; end if
;
; Input:
;   ix = animated block info
;   iy = animated block definition table
;
AB_FSM_Gate:		ld		a, (ix+5)
					call 	T128_Check1bFlagB0
					ret		z							; Gate inactive
;
; Gate active
;
					ld		a, (ix+3)
					cp		(iy)
					jr		nz, ABFSMG_Label_01
					xor		a							; Begin animation
					jr		ABFSMG_Label_03
ABFSMG_Label_01:	dec		(ix+8)
					ret		nz							; check animation duration
					ld		a, (ix+3)
					inc		a
					; Play FX (GATE in different screen from BUTTON/BUBBLE)
					cp		1
					jr		nz, ABFSMG_Label_02
					ex		af, af'
					call	T128_AB_GetDepInfo			; hl = FX info address
					ld		a, (hl)						; a = FX number
					call 	T128_AY_InitFXB0
					ex		af, af'
					;
ABFSMG_Label_02:	cp		(iy)						; Reached number of phases?
					jr		nz, ABFSMG_Label_03
					dec		a							; Reset to last phase
					ld		l, (ix+13)
					ld		h, (ix+14)
					set		7, (hl)						; Set inactivity entity bit
ABFSMG_Label_03:	ld		(ix+3), a
					push	iy
					push	ix
					pop		iy
					call	T128_AB_PhaseParam			; Update duration and graphic address for current phase					
					pop		iy					
					ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; AB_FSM_GateIS
;
; Calculate initial state and other parameters of a class Gate AB
;
; If 1bitFlag associted to gate is not set, then phase = STOP phase
; Otherwise, if inactivity is not set in the Gate, then set phase (0). Otherwise, set phase to lasta animated phase
;
; Input:
;   ix = Address of screen entity data
;   iy = AB table in T128_ScreenAnimBlk
;
AB_FSM_GateIS:		ld		l, (iy+6)
					ld		h, (iy+7)					; hl = animated block definition table
					ld		a, (iy+5)
					ld		e, (hl)						; Initial phase = Phase STOP
					call	T128_Check1bFlagB0
					jr		z, ABFSMGIS_Label_02		; jump if gate is not active
					ld		l, (iy+13)					
					ld		h, (iy+14)
					bit		7, (hl)						; check inactivity entity bit
					jr		nz, ABFSMGIS_Label_01
					ld		e, 1						; ld e, 1 + dec e ==> Initial phase = 0
ABFSMGIS_Label_01:	dec		e							; Initial phase = Last animated phase
ABFSMGIS_Label_02:	ld		(iy+3), e					
					ret