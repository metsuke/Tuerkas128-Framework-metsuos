;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; D E B R I S '  F I N I T E   S T A T E   M A C H I N E 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC _BEGIN_SPR_FSM_DEBRIS
_BEGIN_SPR_FSM_DEBRIS:

;
; Parameters
;
SPR_DEBRIS_ZPOS		EQU		T128_SPR_FOREGROUND1

SPR_DEBRIS_L 		EQU 	3							; Number of steps upward and sideward
SPR_DEBRIS_D		EQU		2							; Number of steps downward

;
; States
;
SPR_DEBRIS_LFT		EQU		0
SPR_DEBRIS_RGH		EQU		1
SPR_DEBRIS_UPLFT	EQU		2
SPR_DEBRIS_UPRGH	EQU		3
SPR_DEBRIS_DOWNLFT	EQU		4
SPR_DEBRIS_DOWNRGH	EQU		5
SPR_DEBRIS_UP		EQU		6
SPR_DEBRIS_DOWN		EQU		7
SPR_DebrisParams	defb	T128_SPR_X_OFF, T128_SPR_NORMAL
					defb	T128_SPR_X_OFF, T128_SPR_ROTATE
					defb	T128_SPR_X_OFF, T128_SPR_NORMAL
					defb	T128_SPR_X_OFF, T128_SPR_ROTATE
					defb	T128_SPR_X_OFF, T128_SPR_NORMAL
					defb	T128_SPR_X_OFF, T128_SPR_ROTATE
					defb	T128_SPR_X_OFF, T128_SPR_NORMAL
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
; SPR_FSM_Debris
;
; FSM for debris
;
; Move fast 6 coloured 1x1 sprites in six different paths:
;   - UPLEFT, then DOWNLEFT and then DOWN
;   - UPRIGHT, then DOWNWIGHT and then DOWN
;   - LEFT, then DOWNLEFT and then DOWN
;   - RIGHT, then DOWNWIGHT and then DOWN
;   - DOWNLEFT and then DOWN
;   - DOWNWIGHT and then DOWN
; COUNTER 1 (ix+20) is used to control paths
;
; This routine uses CLASS-DEPENDANT values of sprite definition table:
;   speed of movement (iy+17)
;
; SPR_GraphicAddress is not needed because sprite has only one phase
; SPR_SpriteSetup is not needed because sprite does not not rotate. Its position is calculated con dec/inc (ix+5)
;
; Input:
;   ix = sprite info
;

SPR_FSM_Debris:		call	SPR_SpriteDefTable			; iy = sprite definition table
					ld		a, (T128_GameLoops)										
					ld		b, (iy+17)					; speed of movement
					and		b
					ret		nz							; Check speed
					ld		a, (ix+13)					; State
;
; SPR_DEBRIS_LFT
;
					cp		SPR_DEBRIS_LFT
					jr		nz, SPRFSMD_Label_02
					ld		a, (ix+6)
					cp		T128_MIN_X*8				; Check screen limits
					jp		z, SPR_KillSprite			; Kill sprite
					sub		8
					ld		(ix+6), a
					dec		(ix+5)
					ld		b, SPR_DEBRIS_DOWNLFT
SPRFSMD_Label_01:	call	SPRFSMD_Label_99
					ret		nz							; Check counter
					ld		a, 4-SPR_DEBRIS_D
					ld		(ix+20), a					; New counter
					ld		(ix+13), b					; New state
					ret
;
; SPR_DEBRIS_RGH
;
SPRFSMD_Label_02:	cp		SPR_DEBRIS_RGH
					jr		nz, SPRFSMD_Label_03
					ld		a, (ix+6)
					cp		T128_MAX_X*8				; Check screen limits
					jp		z, SPR_KillSprite			; Kill sprite
					add		a, 8
					ld		(ix+6), a
					inc		(ix+5)
					ld		b, SPR_DEBRIS_DOWNRGH		; New state
					jr 		SPRFSMD_Label_01
;
; SPR_DEBRIS_UPLFT
;
SPRFSMD_Label_03:	cp		SPR_DEBRIS_UPLFT
					jr		nz, SPRFSMD_Label_05
					ld		a, (ix+8)
					cp		T128_MIN_Y*8				; Check screen limits
					jp		z, SPR_KillSprite			; Kill sprite
					sub		8
					ld		(ix+8), a
					dec		(ix+7)
					ld		a, (ix+6)
					cp		T128_MIN_X*8				; Check screen limits
					jp		z, SPR_KillSprite			; Kill sprite
					sub		8
					ld		(ix+6), a
					dec		(ix+5)
					ld		b, SPR_DEBRIS_DOWNLFT
SPRFSMD_Label_04:	call	SPRFSMD_Label_99
					ret		nz							; Check counter
					ld		a, 4-SPR_DEBRIS_D+SPR_DEBRIS_L
					ld		(ix+20), a					; New counter
					ld		(ix+13), b					; New state
					ret					
;
; SPR_DEBRIS_UPRGH
;
SPRFSMD_Label_05:	cp		SPR_DEBRIS_UPRGH
					jr		nz, SPRFSMD_Label_06
					ld		a, (ix+8)
					cp		T128_MIN_Y*8				; Check screen limits
					jp		z, SPR_KillSprite			; Kill sprite
					sub		8
					ld		(ix+8), a
					dec		(ix+7)		
					ld		a, (ix+6)
					cp		T128_MAX_X*8				; Check screen limits
					jp		z, SPR_KillSprite			; Kill sprite
					add		a, 8
					ld		(ix+6), a
					inc		(ix+5)
					ld		b, SPR_DEBRIS_DOWNRGH		; New state
					jr 		SPRFSMD_Label_04
;
; SPR_DEBRIS_DOWNLFT
;
SPRFSMD_Label_06:	cp		SPR_DEBRIS_DOWNLFT
					jr		nz, SPRFSMD_Label_08
					ld		a, (ix+8)
					cp		(T128_MAX_Y-1)*8			; Check screen limits
					jp		z, SPR_KillSprite			; Kill sprite
					add		a, 8
					ld		(ix+8), a
					inc		(ix+7)					
					ld		a, (ix+6)
					cp		T128_MIN_X*8				; Check screen limits
					jp		z, SPR_KillSprite			; Kill sprite
					sub		8
					ld		(ix+6), a
					dec		(ix+5)
SPRFSMD_Label_07:	call	SPRFSMD_Label_99
					ret		nz							; Check counter
					ld		a, SPR_DEBRIS_D
					ld		(ix+20), a					; New counter
					ld		a, SPR_DEBRIS_DOWN			; New state
					ld		(ix+13), a					; New state
					ret
;					
; SPR_DEBRIS_DOWNRGH
;
SPRFSMD_Label_08:	cp		SPR_DEBRIS_DOWNRGH
					jr		nz, SPRFSMD_Label_09
					ld		a, (ix+8)
					cp		(T128_MAX_Y-1)*8			; Check screen limits
					jp		z, SPR_KillSprite			; Kill sprite
					add		a, 8
					ld		(ix+8), a
					inc		(ix+7)					
					ld		a, (ix+6)
					cp		T128_MAX_X*8				; Check screen limits
					jp		z, SPR_KillSprite			; Kill sprite
					add		a, 8
					ld		(ix+6), a
					inc		(ix+5)
					jr		SPRFSMD_Label_07
					
;					
; SPR_DEBRIS_DOWN
;
SPRFSMD_Label_09:	cp		SPR_DEBRIS_DOWN
					jr		nz, SPRFSMD_Label_10
					ld		a, (ix+8)	
					cp		(T128_MAX_Y-1)*8			; Check screen limits
					jp		z, SPR_KillSprite			; Kill sprite
					add		a, 8
					ld		(ix+8), a
					inc		(ix+7)	
					call	SPRFSMD_Label_99
					ret		nz							; Check counter					
					jp		SPR_KillSprite				; Kill sprite
;					
SPRFSMD_Label_10:	ret										

;
; Dec counter
; 
SPRFSMD_Label_99:	ld		a, (ix+20)
					dec		a							; Dec counter
					ld		(ix+20), a
					or		a	
					ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SPR_FSM_DebrisIS
;
; Calculate initial state of a sprite of class Debris: Phase ONE
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
SPR_FSM_DebrisIS	ld		de, SPR_DebrisParams		; State parameters table for Cycles
					ld		a, (ix+3)					; Initial state
					ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SPR_FSM_DebrisIS2
;
; Calculate other initial parameters of a sprite of class Walker Debris: Phase TWO
;
; Input:
;   iy = Pointer to basic info structure (as in T128_ScreenSprPool or in SPR_ScreenSprPool)
;   ix = Sprite table in T128_ScreenSprites
;
SPR_FSM_DebrisIS2:	ld		a, (ix+2)
					and		%11111001
					or		SPR_DEBRIS_ZPOS
					ld		(ix+2), a					; BACKGOUND / FOREGROUND
					ld		a, (iy+5)
					ld		(ix+20), a					; COUNTER
					ret