;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; D E A D ' S   F I N I T E   S T A T E   M A C H I N E 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC _BEGIN_SPR_FSM_DEAD
_BEGIN_SPR_FSM_DEAD:

;
; Parameters
;
SPR_DEAD_ZPOS		EQU		T128_SPR_FOREGROUND1
;
; States
;
SPR_DEAD			EQU		0
SPR_DeadParams 		defb	T128_SPR_X_OFF, T128_SPR_NORMAL

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
; SPR_FSM_Dead
;
; FSM for Dead sprites
;
; Move downwards Dead sprite 32 pixels. T128_ProcessDeath is set (Perseus dies) at the end of the path (or if sprite is outside screen)
; COUNTER 1 (ix+20) is used to control vertical position
;
; This routine uses CLASS-DEPENDANT values of sprite definition table:
;   speed of animation (iy+17)
;   phases of animation (iy+18)
;
; Input:
;   ix = sprite info
;

SPR_FSM_Dead:		ld		a, (ix+20)
					inc		a
					cp		32
					jr		z, SPRFSMDD_Label_03		; ¿24 times?
;
					ld		(ix+20), a
					ld		a, (ix+8)
					inc		a
					ld		(ix+8), a
					cp		T128_MAX_Y*8
					jr		nc, SPRFSMDD_Label_03		; ¿sprite is outside screen?
;					
					call	SPR_SpriteDefTable			; iy = sprite definition table
					ld		a, (T128_GameLoops)					
					ld		b, (iy+17)					; speed of animation
					and		b
					jr		nz, SPRFSMDD_Label_02		; Check speed
					ld		a, (ix+14)
					inc		a
					cp		(iy+18)						; Number of phases of animation
					jr		nz, SPRFSMDD_Label_01
					xor		a
SPRFSMDD_Label_01:	ld		(ix+14), a
					call	SPR_GraphicAddress		
SPRFSMDD_Label_02:	ld		de, SPR_DeadParams
					jp	 	SPR_SpriteSetup					
;					
SPRFSMDD_Label_03:	ld		a, 1
					ld		(T128_ProcessDeath), a		; Perseus must die
					jp		SPR_KillSprite				; Kill sprite when it reaches last phase


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SPR_FSM_DeadIS
;
; Calculate initial state of a sprite of class Dead: Phase ONE
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
SPR_FSM_DeadIS:		ld		de, SPR_DeadParams			; State parameters table for Deads
					ld		a, (ix+3)					; Initial state
					ret					


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SPR_FSM_DeadIS2
;
; Calculate other initial parameters of a sprite of class Dead: Phase TWO
;
; Input:
;   iy = Pointer to basic info structure (as in T128_ScreenSprPool or in SPR_ScreenSprPool)
;   ix = Sprite table in T128_ScreenSprites
;
SPR_FSM_DeadIS2: 	ld		a, (ix+2)
					and		%11111001
					or		SPR_DEAD_ZPOS
					ld		(ix+2), a					; BACKGOUND / FOREGROUND
					ret					