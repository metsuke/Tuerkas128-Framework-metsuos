;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; B U T T O N   A B s '   F I N I T E   S T A T E   M A C H I N E 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC _BEGIN_AB_FSM_BUTTON
_BEGIN_AB_FSM_BUTTON:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; AB_FSM_Button
;
; FSM for Button Animated Blocks
;
; Activity state of the button is checked using its asociated 1 bit flag in (ix+5)
;
; Collsion with MainChar is computed using FSM_SolidColFlags:
; If FSM_SOLID_RIGHT is set, then this code checks if button is on the rightside of Main Char
; If FSM_SOLID_LEFT is set, then this code checks if button is on the leftside of Main Char 
; If FSM_SOLID_DOWN is set, then this code checks if button is bellow Main Char 
;
; If 1 bit flag (ix+5) is unset (animation is off) then
;   If collision whith Main Char then
;      Set 1 bit flag (to trigger a Gate) and produce the sound associated to the button
;   end if
; else
;   If phase duration=0 and Animation phase != Last animation phase
;      increase animatino phase
;      calculate new phase duration
;   end if
; end if
;
; Input:
;   ix = animated block info
;   iy = animated block definition table
;
AB_FSM_Button:		ld		a, (ix+5)
					call 	T128_Check1bFlagB0			; hl = address of 1bitFlag
					jp		nz, ABFSMB_Label_04
;;;;;;;;;;;;;;;;;;;;;;;
;
; Button inactive
;
;;;;;;;;;;;;;;;;;;;;;;;
					ld		a, b
					ld		(ABFSMB_SMC_01+1), a
					ld		a, (FSM_SolidColFlags)
;
; Check collision right
;					
					cp		FSM_SOLID_RIGHT
					jr		nz, ABFSMB_Label_01
					call 	T128_AB_GetABSize			; Get Animated block size: e = AB width in pixels / d = AB height in pixels
					call	T128_AB_CheckVert			; Check vertical collision with Main char
					ret		c							; No vertical collision if carry
					ret		z							; or zero
					ld		a, (ix)
					and		%00011111					; a = X
					rlca
					rlca
					rlca		
					ld		c, a						; c = x
					push	ix
					ld		ix, T128_MainChar
					ld		a, (FSM_SolidCol_x)
					add		a, (ix+10)					; a = x Main Char + width Main Char
					pop		ix
					jr		ABFSMB_Label_03
;
; Check collision left
;					
ABFSMB_Label_01:	cp		FSM_SOLID_LEFT
					jr		nz, ABFSMB_Label_02
					call 	T128_AB_GetABSize			; Get Animated block size: e = AB width in pixels / d = AB height in pixels
					call	T128_AB_CheckVert			; Check vertical collision with Main char
					ret		c							; No vertical collision if carry
					ret		z							; or zero
					ld		a, (ix)
					and		%00011111					; a = X
					rlca
					rlca
					rlca
					add		a, e
					ld		c, a						; c = x + width
					ld		a, (FSM_SolidCol_x)
					jr		ABFSMB_Label_03
;
; Check collision down
;				
ABFSMB_Label_02:	cp		FSM_SOLID_DOWN
					ret		nz
					call 	T128_AB_GetABSize			; Get Animated block size: e = AB width in pixels / d = AB height in pixels
					call	T128_AB_CheckHor			; Check horizontal collision with Main char
					ret		c							; No horizontal collision if carry
					ret		z							; or zero
					ld		a, (ix)
					and		%11100000
					rrca
					rrca
					ld		c, a
					ld		a, (ix+1)
					and		%00011111
					rlca
					rlca
					rlca
					or		c
					ld		c, a						; c = y
					push	ix
					ld		ix, T128_MainChar
					ld		a, (FSM_SolidCol_y)
					add		a, (ix+11)					; a = y Main Char + height Main Char										
					pop		ix
ABFSMB_Label_03:	cp		c
					ret		nz							; Check right/left/down collision with Main char
;
; Trigger Animated Block animation
; 
ABFSMB_SMC_01:		set		0, (hl)						; set [bit within 1bitFlag], (hl)
					; Play FX
					call	T128_AB_GetDepInfo			; hl = FX info address
					ld		a, (hl)						; a = FX number
					call T128_AY_InitFXB0
					;
					xor		a							; Set phase to 0
					jr		ABFSMB_Label_05

;;;;;;;;;;;;;;;;;;;;;;;					
;
; Button active
;
;;;;;;;;;;;;;;;;;;;;;;;
ABFSMB_Label_04:	dec		(ix+8)
					ret		nz							; check animation duration
					ld		a, (ix+3)
					inc		a
					cp		(iy)						; Reached number of phases?
					jr		nz, ABFSMB_Label_05
					dec		a							; Reset to last phase
ABFSMB_Label_05:	ld		(ix+3), a
					push	iy
					push	ix
					pop		iy
					call	T128_AB_PhaseParam			; Update duration and graphic address for current phase					
					pop		iy					
					ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; AB_FSM_ButtonIS
;
; Calculate initial state and other parameters of a class Gate AB
;
; If 1bitFlag is set (button was already pressed), then set phase to last animated phaseº
; Otherwise, phase is set to STOP phase
;
; Input:
;   ix = Address of screen entity data
;   iy = AB table in T128_ScreenAnimBlk
;
AB_FSM_ButtonIS:	ld		l, (iy+6)
					ld		h, (iy+7)					; hl = animated block definition table
					ld		a, (iy+5)
					ld		e, (hl)						; Initial phase = Phase STOP
					call	T128_Check1bFlagB0
					jr		z, ABFSMBIS_Label_01
					dec		e							; If Button has been pressed then Initial phase = Last animated phase
ABFSMBIS_Label_01:	ld		(iy+3), e					
					ret