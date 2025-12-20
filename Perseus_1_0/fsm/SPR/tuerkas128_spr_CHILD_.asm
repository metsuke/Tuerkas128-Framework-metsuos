;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; _ C H I L D _ '  F I N I T E   S T A T E   M A C H I N E 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC _BEGIN_SPR_FSM_CHILD_
_BEGIN_SPR_FSM_CHILD_:


SPR_CHILD_NORMAL	EQU		0
SPR_CHILD_ROTATED	EQU		1
SPR_CHILD_Params:	defb	T128_SPR_X_OFF, T128_SPR_NORMAL
					defb	T128_SPR_X_OFF, T128_SPR_ROTATE

;
; Sprite structure.
; For the sake of clarity, these constants can be used to access sprite data. For instance:
;
;   (ix+SPR_PARAM.x) instead of (ix+6)
;   (ix+SPR_PARAM.y) instead of (ix+8)
;
;   SPR_PARAM.ADDRESS		EQU		0					; Word
;   SPR_PARAM.FLAGS			EQU		2					; Byte
;   SPR_PARAM.INIT_ADDR_ROT	EQU		3					; Byte
;   SPR_PARAM.DEC_ADDR_ROT	EQU		4					; Byte
;   SPR_PARAM.XX			EQU		5					; Byte
;   SPR_PARAM.x				EQU		6					; Byte
;   SPR_PARAM.YY			EQU		7					; Byte
;   SPR_PARAM.y				EQU		8					; Byte
;   SPR_PARAM.WIDTH_COLUMNS	EQU		9					; Byte
;   SPR_PARAM.WIDTH_PIXELS	EQU		10					; Byte
;   SPR_PARAM.HEIGHT_PIXELS	EQU		11					; Byte
;   SPR_PARAM.ATTRIBUTE		EQU		12					; Byte
;   SPR_PARAM.STATE			EQU		13					; Byte
;   SPR_PARAM.PHASE			EQU		14					; Byte
;   SPR_PARAM.BASE_ADDRESS	EQU		15					; Byte
;   SPR_PARAM.SPR_DEF_TABLE	EQU		17					; Word
;   SPR_PARAM.CONTROL		EQU		19					; Byte
;   SPR_PARAM.COUNTER1		EQU		20					; Byte
;   SPR_PARAM.FLAX_AUX		EQU		21					; Byte
;   SPR_PARAM.CHILD_SPR1	EQU		22					; Word
;   SPR_PARAM.CHILD_SPR2	EQU		24					; Word
;   SPR_PARAM.COUNTER2		EQU		26					; Byte
;   SPR_PARAM.SCR_ENT_DATA	EQU		27					; Word
;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SPR_FSM_CHILD_
;
; FSM for CHILDS
;
; A sprite of class _CHILD_ has only one state and moves alongside its parent sprite. So it must be used
; only in association with parent sprites
; It inherits parent sprite's ZPOS
; It uses CLASS DEPENDANT values of sprite definition table:
;   speed of animation
;   number of phases of animation
;   state: NORMAL (looking left) or ROTATED (looking right)
;
; Input:
;   ix = sprite info
;   b  = sprite x position
;   c  = sprite y position
;

SPR_FSM_CHILD_:		ld		(ix+6), b
					ld		(ix+8), c
					call	SPR_SpriteDefTable			; iy = sprite definition table
					ld		a, (T128_GameLoops)										
					ld		b, (iy+17)					; speed of animation
					and		b
					jr		nz, SSPRFSMC_Label_02
					ld		a, (ix+14)					; animate
					inc		a
					cp		(iy+18)						; number of phases
					jr		nz, SSPRFSMC_Label_01
					xor		a
SSPRFSMC_Label_01:	call	SPR_GraphicAddress
SSPRFSMC_Label_02:	ld		de, SPR_CHILD_Params
					jp		SPR_SpriteSetup


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SPR_FSM_CHILD_IS
;
; Calculate initial state of a sprite of class _CHILD_: Phase ONE
;
; Input:
;   iy = sprite definition table
;   ix = Pointer to basic info structure (as in T128_ScreenSprPool or in SPR_ScreenSprPool)
;   c' = SPR_LOOK_UP / SPR_LOOK_DOWN
;   b' = SPR_LOOK_RIGHT / SPR_LOOK_LEFT
;
; Output:
;   a  = initial state
;   de = State parameters table
; 
SPR_FSM_CHILD_IS:	ld		de, SPR_CHILD_Params		; State parameters table for Cycles
					ld		a, (iy+19)					; Initial state
					ret					


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SPR_FSM_CHILD_IS2
;
; Calculate other initial parameters of a sprite of class _CHILD_: Phase TWO
;
; Input:
;   iy = Pointer to basic info structure (as in T128_ScreenSprPool or in SPR_ScreenSprPool)
;   ix = Sprite table in T128_ScreenSprites
;
SPR_FSM_CHILD_IS2:	ld		a, (ix+2)
					or		%00001000					; Set child sprite bit
					ld		(ix+2), a					
					ret					