;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; S I M P L E   A N I M A T I O N ' S   F I N I T E   S T A T E   M A C H I N E 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC _BEGIN_SPR_FSM_SIMPLEANIM
_BEGIN_SPR_FSM_SIMPLEANIM:

;
; Parameters
;
SPR_SIMPLEANIM_ZPOS	EQU		T128_SPR_BACKGROUND1
;
; States
;
SPR_SIMPLEANIM_LFT	EQU		0
SPR_SIMPLEANIM_RGH	EQU		1
SPR_SimpleAnimParams defb	T128_SPR_X_OFF, T128_SPR_NORMAL
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
; SPR_FSM_SimpleAnim
;
; FSM for Simple Animated sprites
;
; Simple animated sprites don't move. They are animated in the same position
;
; This routine uses CLASS-DEPENDANT values of sprite definition table:
;   speed of animation (iy+17)
;   phases of animation (iy+18)
;
; Input:
;   ix = sprite info
;

SPR_FSM_SimpleAnim:	ld		a, (ix+20)
					or		a
					jr		z, SPRFSMSA_Label_01
					dec		(ix+20)						; Wait until initial delay is reached
					ret
;
SPRFSMSA_Label_01:	call	SPR_SpriteDefTable			; iy = sprite definition table
					ld		a, (T128_GameLoops)					
					ld		b, (iy+17)					; speed of animation
					and		b
					ret		nz							; Check speed
					ld		a, (ix+14)
					inc		a
					cp		(iy+18)						; Number of phases of animation
					jp		nz, SPR_GraphicAddress		;
					jp		SPR_KillSprite				; Kill sprite when sprite reaches last phase


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SPR_FSM_SimpleAnimIS
;
; Calculate initial state of a sprite of class Simple Animation: Phase ONE
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
SPR_FSM_SimpleAnimIS ld		de, SPR_SimpleAnimParams	; State parameters table for SimpleAnims
					ld		a, (ix+3)					; Initial state
					ret					


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SPR_FSM_SimpleAnimIS2
;
; Calculate other initial parameters of a sprite of class Simple Animation: Phase TWO
;
; Input:
;   iy = Pointer to basic info structure (as in T128_ScreenSprPool or in SPR_ScreenSprPool)
;        iy + 5 = initial delay
;   ix = Sprite table in T128_ScreenSprites
;
SPR_FSM_SimpleAnimIS2 ld	a, (ix+2)
					and		%11111001
					or		SPR_SIMPLEANIM_ZPOS
					ld		(ix+2), a					; BACKGOUND / FOREGROUND
					ld		a, (iy+5)
					ld		(ix+20), a					; DELAY
					ret					