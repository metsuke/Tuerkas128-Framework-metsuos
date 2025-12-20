;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; B U B B L E   A B s '   F I N I T E   S T A T E   M A C H I N E 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC _BEGIN_AB_FSM_BUBBLE
_BEGIN_AB_FSM_BUBBLE:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; AB_FSM_Bubble
;
; FSM for Bubble Animated Blocks
;
; Collsion with MainChar is computed by checking if bubble and Main Chr are overlapped
;
; If 1 bit flag (ix+5) is no set then
;   If collision whith Main Char then
;      set 1 bit flag (to trigger a gate) and produce the sound associated to the bubble
;      set last bubble phase
;   else
;      animate bubble
;   end if
; end if
;
; Input:
;   ix = animated block info
;   iy = animated block definition table
;

AB_FSM_Bubble:		ld		a, (ix+5)
					call 	T128_Check1bFlagB0			; hl = address of 1bitFlag
					ret		nz							; If 1bitFlag is set, then nothing to do
					ld		a, b
					ld		(ABFSMBU_SMC_01+1), a					
					call 	T128_AB_GetABSize			; Get Animated block size
					call	T128_AB_CheckVert			; Check vertical collision with Main char
					jr		c, ABFSMBU_Label_01			; No vertical collision if carry
					jr		z, ABFSMBU_Label_01			; or zero
					call	T128_AB_CheckHor			; Check horizontal collision with Main char
					jr		c, ABFSMBU_Label_01			; No vertical collision if carry
					jr		z, ABFSMBU_Label_01			; or zero					
;
; Collision with Main Char
;					
ABFSMBU_SMC_01:		set		0, (hl)						; set [bit within 1bitFlag], (hl)
					; Play FX
					call	T128_AB_GetDepInfo			; hl = FX info address
					ld		a, (hl)						; a = FX number
					call 	T128_AY_InitFXB0
					;
					ld		a, (iy)
					ld		(ix+3), a					; new phase = stop phase
					push	iy
					push	ix
					pop		iy
					call	T128_AB_PhaseParam			; Update duration and graphic address for current phase					
					pop		iy										
					ret
;
; No collision with Main Char
;				
ABFSMBU_Label_01:	jp	T128_AB_Animation				; Do animation cycle


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; AB_FSM_BubbleIS
;
; Calculate initial state and other parameters of a class Bubble AB
;
; If 1bitFlag associated to Bubble is not set (bubble was not blown), then keep initial phase (0)
; Otherwise, set phase to STOP phase
;
; Input:
;   ix = Address of screen entity data
;   iy = AB table in T128_ScreenAnimBlk
;
AB_FSM_BubbleIS:	ld		a, T128_ANIMBLK_ST_UP
					ld		(iy+4), a					; State
					ld		a, (iy+5)
					call	T128_Check1bFlagB0
					ret		z							; If 1bitFlag is not set, then keep initial phase
					ld		l, (iy+6)
					ld		h, (iy+7)					; hl = animated block definition table
					ld		e, (hl)						; Initial phase = Phase STOP
					ld		(iy+3), e					
					ret					