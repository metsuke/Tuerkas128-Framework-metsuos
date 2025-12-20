;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; S I M P L E   A B s '   F I N I T E   S T A T E   M A C H I N E 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC _BEGIN_AB_FSM_SIMPLE
_BEGIN_AB_FSM_SIMPLE:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; AB_FSM_Simple
;
; FSM for Simple Animated Blocks
;
; Start animation after initial delay is reached
;
; Input:
;   ix = animated block info
;   iy = animated block definition table
;
AB_FSM_Simple:		ld		a, (ix+5)
					or		a
					jp		z, T128_AB_Animation		; If initial delay is reached, then do animation cycle
					dec		(ix+5)
					ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; AB_FSM_SimpleIS
;
; Calculate initial state and other parameters of a class Simple AB
;
; Input:
;   ix = Address of screen entity data
;   iy = AB table in T128_ScreenAnimBlk
;
AB_FSM_SimpleIS:	ld		a, T128_ANIMBLK_ST_UP
					ld		(iy+4), a					; State
					ret