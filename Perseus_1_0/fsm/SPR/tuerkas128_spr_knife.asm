;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; K N I F E ' S   F I N I T E   S T A T E   M A C H I N E 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC _BEGIN_SPR_FSM_KNIFE
_BEGIN_SPR_FSM_KNIFE:

;
; Parameters
;
SPR_KNIFE_ZPOS		EQU		T128_SPR_FOREGROUND1
;
; States
;
SPR_KNIFE_LFT		EQU		0
SPR_KNIFE_RGH		EQU		1
SPR_KnifeParams 	defb	T128_SPR_X_OFF, T128_SPR_NORMAL
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
; SPR_FSM_Knife
;
; FSM for knives thrown by Perseus
;
; Move knives shot by Perseus
; Knives moves from left to right or from right to left
; If screen boundaries are reached, or a non empty block is reached, then Knives is killed
;
; this routine uses CLASS-DEPENDANT values of sprite definition table:
;   speed of animation (iy+17)
;   phases of animation (iy+18)
;
; Input:
;   ix = sprite info
;

SPR_FSM_Knife:		call	SPR_SpriteDefTable			; iy = sprite definition table
					ld		a, (T128_GameLoops)					
					ld		b, (iy+17)					; speed of animation
					and		b
					jr		nz, SPRFSMK_Label_02		; Check speed
					ld		a, (ix+14)
					inc		a
					cp		(iy+18)						; Number of phases of animation
					jp		nz, SPRFSMK_Label_01
					xor		a
SPRFSMK_Label_01:	call	SPR_GraphicAddress	
SPRFSMK_Label_02:	ld		a, (ix+13)					
					cp		SPR_KNIFE_RGH
					jr		z, SPRFSMK_Label_03
;
					call	T128_BlockColLeft
					cp		T128_BLOCK_EMPTY			; Check collision left
					jr		nz, SPRFSMK_Label_04		; Kill sprite
					ld		a, (ix+6)
					cp		T128_MIN_X*8				; Check left limit
					jr		z, SPRFSMK_Label_04			; Kill sprite
					sub		8							; Move left
					ld		(ix+6), a
					dec		(ix+5)
					ret									
;
SPRFSMK_Label_03:	call	T128_BlockColRight
					cp		T128_BLOCK_EMPTY			; Check collision right
					jr		nz, SPRFSMK_Label_04		; Kill sprite
					ld		a, (ix+6)
					cp		T128_MAX_X*8				; Check right limit
					jr		z, SPRFSMK_Label_04			; Kill sprite
					add		a, 8						; Move right
					ld		(ix+6), a
					inc		(ix+5)
					ret	
;
; Substract 1 knife and kill sprite
; 
SPRFSMK_Label_04:	ld		hl, FSM_ThrownKnives
					dec 	(hl)
					jp		SPR_KillSprite				; Kill sprite when sprite reaches last phase


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SPR_FSM_KnifeIS
;
; Calculate initial state of a sprite of class Knife: Phase ONE
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
SPR_FSM_KnifeIS 	ld		de, SPR_KnifeParams			; State parameters table for Knives
					ld		a, (ix+3)					; Initial state
					cp		TK128_FSM_THROW_LFT
					jr		nz, SPRFSMKIS_Labeel_01
					ld		a, SPR_KNIFE_LFT
					ret
SPRFSMKIS_Labeel_01 ld		a, SPR_KNIFE_RGH
					ret					


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SPR_FSM_KnifeIS2
;
; Calculate other initial parameters of a sprite of class Knife: Phase TWO
;
; Input:
;   iy = Pointer to basic info structure (as in T128_ScreenSprPool or in SPR_ScreenSprPool)
;   ix = Sprite table in T128_ScreenSprites
;
SPR_FSM_KnifeIS2: 	ld		a, (ix+2)
					and		%11111001
					or		SPR_KNIFE_ZPOS
					ld		(ix+2), a					; BACKGOUND / FOREGROUND
					ld		a, (ix+21)
					or		%10000000
					ld		(ix+21), a					; This sprite is a Mainchar's bullet
					ret					