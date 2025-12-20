;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; J U M P E R S '  F I N I T E   S T A T E   M A C H I N E 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC _BEGIN_SPR_FSM_JUMPER
_BEGIN_SPR_FSM_JUMPER:

;
; Parameters
;
SPR_JMPR_ZPOS		EQU		T128_SPR_FOREGROUND2	
SPR_JMPR_START_COUNT EQU	8
SPR_JMPR_STOP_COUNT	EQU		16
SPR_JMPR_DELTA_Y	EQU		3
SPR_JMPR_UP_COUNT	EQU		32
;
; States
;
; Cycle: > START_LFT > MOVE_LFT > MOVE_RGH > STOP_RGH > GOUP_RGH > UP_RGH > UP_RGH > GODOWN_RGH > DOWN_RGH >
;        > START_RGH > MOVE_RGH > MOVE_LFT > STOP_LFT > GOUP_LFT > UP_LFT > UP_LFT > GODOWN_LFT > DOWN_LFT >
;
SPR_JMPR_START_LFT	EQU		0
SPR_JMPR_START_RGH	EQU		1
SPR_JMPR_MOVE_LFT	EQU		2
SPR_JMPR_MOVE_RGH	EQU		3
SPR_JMPR_STOP_LFT	EQU		4
SPR_JMPR_STOP_RGH	EQU		5
SPR_JMPR_GOUP_LFT	EQU		6
SPR_JMPR_GOUP_RGH	EQU		7
SPR_JMPR_UP_LFT		EQU		8 
SPR_JMPR_UP_RGH		EQU		9 
SPR_JMPR_GODOWN_LFT	EQU		10
SPR_JMPR_GODOWN_RGH	EQU		11
SPR_JMPR_DOWN_LFT	EQU		12
SPR_JMPR_DOWN_RGH	EQU		13


SPR_JumperParams:	defb	T128_SPR_X_OFF, T128_SPR_NORMAL
					defb	T128_SPR_X_OFF, T128_SPR_NORMAL
					defb	T128_SPR_X_OFF, T128_SPR_NORMAL
					defb	T128_SPR_X_OFF, T128_SPR_NORMAL
					defb	T128_SPR_X_OFF, T128_SPR_NORMAL
					defb	T128_SPR_X_OFF, T128_SPR_NORMAL
					defb	T128_SPR_X_OFF, T128_SPR_NORMAL
					defb	T128_SPR_X_OFF, T128_SPR_NORMAL
					defb	T128_SPR_X_OFF, T128_SPR_NORMAL
					defb	T128_SPR_X_OFF, T128_SPR_NORMAL
					defb	T128_SPR_X_OFF, T128_SPR_NORMAL
					defb	T128_SPR_X_OFF, T128_SPR_NORMAL
					defb	T128_SPR_X_OFF, T128_SPR_NORMAL
					defb	T128_SPR_X_OFF, T128_SPR_NORMAL
					defb	T128_SPR_X_OFF, T128_SPR_NORMAL
					defb	T128_SPR_X_OFF, T128_SPR_NORMAL

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
; SPR_FSM_Jumper
;
; FSM for Jumpers
;
; A jumper can walk left and right, between two points. 
; In the middle point it jumps up and down and it generates running flames at both sides (JmprBullet)
; COUNTER 1 (ix+20) is used to control pauses
;
; Collisions with Perseus:
;   - Energy (T128_GameVar08) is decremented, unless Invisivility (T128_GameVar00) is set
;
; This routine uses CLASS-DEPENDANT values of sprite definition table:
;   speed of movement (iy+17)
;   speed of animation (iy+18)
;   phases of animation (iy+19)
;
; Input:
;   ix = sprite info
;

SPR_FSM_Jumper:		ld		iy, T128_MainChar
					call	SPR_CollisionAll
					jr		z, SPRFSMJ_Label_01
;
; Process collsion with main char
;
					call	SPR_DecEnergy				; Process collision with Perseus
;					; CHECK INVISIBILITY
;					ld		a, (T128_GameVar00)
;					or		a
;					jr		nz, SPRFSMJ_Label_01
;					; DECREMENT ENERGY
;					ld		de, T128_GameVar08
;					ld		a, T128_GAMEVAR_DEC8
;					call	T128_UpdateGameVar2
;					; SOUND
;					ld 		a, 1						; FX number
;					call	T128_AY_InitFXB0					
;					
; Proccess FSM
;
SPRFSMJ_Label_01:	call	SPR_SpriteDefTable			; iy = sprite definition table
					ld		a, (ix+13)					; Get state
;
; Start left
;
					cp		SPR_JMPR_START_LFT
					jr		nz, SPRFSMJ_Label_02
					call	SPRFSMJ_Label_45			; Check counter
					ld		a, (ix+6)
					sub 	8
					ld		(ix+6), a					
					ld		a, SPR_JMPR_MOVE_LFT
					ld		(ix+13), a
					jp		SPRFSMJ_Label_40
;
; Start right
;
SPRFSMJ_Label_02:	cp		SPR_JMPR_START_RGH
					jr		nz, SPRFSMJ_Label_03
					call	SPRFSMJ_Label_45			; Check counter
					ld		a, (ix+6)
					add		a, 	8
					ld		(ix+6), a					
					ld		a, SPR_JMPR_MOVE_RGH
					ld		(ix+13), a
					jp		SPRFSMJ_Label_40
;
; Move left
;
SPRFSMJ_Label_03:	cp		SPR_JMPR_MOVE_LFT
					jr		nz, SPRFSMJ_Label_09
					call	SPRFSMJ_Label_48
;					
SPRFSMJ_Label_04:	call	SPRFSMJ_Label_43			; Do height correction for 8 pixels-high jumpers before calling T128_BlockColLeft
					jr		nz, SPRFSMJ_Label_05
					call	T128_BlockColLeft
					call	SPRFSMJ_Label_44			; Undo height correction for 8 pixels-high jumpers after calling T128_BlockColLeft
					jr		SPRFSMJ_Label_06
SPRFSMJ_Label_05:	call	T128_BlockColLeft
SPRFSMJ_Label_06:	cp		T128_BLOCK_STEP				; Check step up
					jr		nz, SPRFSMJ_Label_07
					ld		a, (ix+8)
					sub		8							; Step up
					ld		(ix+8), a
SPRFSMJ_Label_07:	ld		a, (ix+19)
					ld		b, a
					and		%11110000					; Left boundary
					rrca	
					rrca	
					rrca								; Rotate right 4 times, multiply by 2
					cp		(ix+5)						; Check left boundary
					jr		nz, SPRFSMJ_Label_08		
					ld		a, SPR_JMPR_MOVE_RGH
					ld		(ix+13), a
					jp		SPRFSMJ_Label_40
					
SPRFSMJ_Label_08:	ld		c, a
					ld		a, b
					and		%00001111					; Right boundary
					add		a, a						; Multiply by 2
					add		a, c
					ld		b, SPR_JMPR_STOP_LFT
					ld		c, 248
					jp		SPRFSMJ_Label_50			; Check middle point of path (or walk)
;
; Move right
;
SPRFSMJ_Label_09:	cp		SPR_JMPR_MOVE_RGH
					jr		nz, SPRFSMJ_Label_15
					call	SPRFSMJ_Label_48
;
SPRFSMJ_Label_10:	call	SPRFSMJ_Label_43			; Do height correction for 8 pixels-high jumpers before calling T128_BlockColLeft
					jr		nz, SPRFSMJ_Label_11		
					call	T128_BlockColRight			
					call	SPRFSMJ_Label_44			; Undo height correction for 8 pixels-high jumpers after calling T128_BlockColLeft
					jr		SPRFSMJ_Label_12
SPRFSMJ_Label_11:	call	T128_BlockColRight
SPRFSMJ_Label_12:	cp		T128_BLOCK_STEP				; Check step up
					jr		nz, SPRFSMJ_Label_13
					ld		a, (ix+8)
					sub		8							; Step up
					ld		(ix+8), a
SPRFSMJ_Label_13:	ld		a, (ix+19)
					ld		b, a
					and		%00001111					; Right boundary
					add		a, a						; Multiply by 2
					cp		(ix+5)						; check right boundary
					jr		nz, SPRFSMJ_Label_14
					ld		a, SPR_JMPR_MOVE_LFT
					ld		(ix+13), a
					jp		SPRFSMJ_Label_40

SPRFSMJ_Label_14:	ld		c, a
					ld		a, b
					and		%11110000					; Left boundary
					rrca	
					rrca	
					rrca								; Rotate right 4 times, multiply by 2
					add		a, c
					ld		b, SPR_JMPR_STOP_RGH
					ld		c, 8
					jp		SPRFSMJ_Label_50			; Check middle point of path (or walk)
;
; Stop left
; 
SPRFSMJ_Label_15:	cp		SPR_JMPR_STOP_LFT
					jr		nz, SPRFSMJ_Label_16
					call	SPRFSMJ_Label_45			; Check counter
					ld		a, SPR_JMPR_GOUP_LFT
					ld		(ix+13), a
					ld		a, SPR_JMPR_DELTA_Y
					ld		(ix+20), a
					jp		SPRFSMJ_Label_40
;
; Stop right
; 
SPRFSMJ_Label_16:	cp		SPR_JMPR_STOP_RGH
					jr		nz, SPRFSMJ_Label_17
					call	SPRFSMJ_Label_45			; Check counter
					ld		a, SPR_JMPR_GOUP_RGH
					ld		(ix+13), a
					ld		a, SPR_JMPR_DELTA_Y
					ld		(ix+20), a
					jp		SPRFSMJ_Label_40
;
; Go up left
; 
SPRFSMJ_Label_17:	cp		SPR_JMPR_GOUP_LFT
					jr		nz, SPRFSMJ_Label_18
					ld		b, 248
					ld		d, SPR_JMPR_UP_LFT
					ld		e, SPR_JMPR_UP_COUNT
					jp		SPRFSMJ_Label_46
;
; Go up right
; 
SPRFSMJ_Label_18:	cp		SPR_JMPR_GOUP_RGH
					jr		nz, SPRFSMJ_Label_19
					ld		b, 248
					ld		d, SPR_JMPR_UP_RGH
					ld		e, SPR_JMPR_UP_COUNT
					jp		SPRFSMJ_Label_46
;
; Up left
; 
SPRFSMJ_Label_19: 	cp		SPR_JMPR_UP_LFT
					jr		nz, SPRFSMJ_Label_20
					call	SPRFSMJ_Label_45			; Check counter
					ld		a, SPR_JMPR_GODOWN_LFT
					ld		(ix+13), a
					ld		a, SPR_JMPR_DELTA_Y
					ld		(ix+20), a
					jr		SPRFSMJ_Label_40
;
; Up right
; 
SPRFSMJ_Label_20: 	cp		SPR_JMPR_UP_RGH
					jr		nz, SPRFSMJ_Label_21
					call	SPRFSMJ_Label_45			; Check counter
					ld		a, SPR_JMPR_GODOWN_RGH
					ld		(ix+13), a
					ld		a, SPR_JMPR_DELTA_Y
					ld		(ix+20), a
					jr		SPRFSMJ_Label_40
;
; Go down left
;
SPRFSMJ_Label_21:	cp		SPR_JMPR_GODOWN_LFT
					jr		nz, SPRFSMJ_Label_22
					ld		b, 8
					ld		d, SPR_JMPR_START_LFT
					ld		e, SPR_JMPR_START_COUNT
					jp		SPRFSMJ_Label_46
;
; Go down right
;
SPRFSMJ_Label_22:	cp		SPR_JMPR_GODOWN_RGH
					jr		nz, SPRFSMJ_Label_38
					ld		b, 8
					ld		d, SPR_JMPR_START_RGH
					ld		e, SPR_JMPR_START_COUNT
					jp		SPRFSMJ_Label_46
;
; End
; 
SPRFSMJ_Label_38:	ret			
;
; Step down
;		
SPRFSMJ_Label_39:	ld		a, (ix+8)
					add		a, 8						; Step down
					ld		(ix+8), a
;
; Next animation phase
;
SPRFSMJ_Label_40:	ld		a, (T128_GameLoops)
					ld		b, (iy+18)					; Speed of animation
					and		b
					jr		nz, SPRFSMJ_Label_42		; Check speed for animation
					ld		a, (ix+14)					
					inc		a							
					cp		(iy+19)						; Number of phases of animation
					jr		nz, SPRFSMJ_Label_41
					xor		a					
;
; Setup sprite graphic
;
SPRFSMJ_Label_41:	call	SPR_GraphicAddress
SPRFSMJ_Label_42:	ld		de, SPR_JumperParams
					call	SPR_SpriteSetup
					ret
;
; Do sprite parametrs correction for 8-pixels height sprites
;
SPRFSMJ_Label_43:	ld		a, (ix+11)
					cp		8
					ret		nz
					ld		a, (ix+8)
					sub		8
					ld		(ix+8), a
					dec		 (ix+7)
					ld		a, 16
					ld		(ix+11), a
					xor		a							; Set zero flag
					ret
;
; Undo sprite parametrs correction for 8-pixels height sprites
;
SPRFSMJ_Label_44:	ex		af, af'
					ld		a, (ix+8)
					add		a, 8
					ld		(ix+8), a
					inc		 (ix+7)
					ld		a, 8
					ld		(ix+11), a					
					ex 		af, af'
					ret
;
; Dec counter (ix+20). Limit is 0
;
SPRFSMJ_Label_45:	ld		a, (ix+20)
					or		a
					ret		z							; Return if counter reaches 0
					dec		a							; Dec counter
					ld		(ix+20), a
					jr		SPRFSMJ_Label_49

;
; Go up and down
;					
SPRFSMJ_Label_46:	ld		a, (ix+20)
					or		a
					jr		z, SPRFSMJ_Label_47
					dec		a							; Dec counter
					ld		(ix+20), a
					ld		a, (ix+8)
					add		a, b
					ld		(ix+8), a
					jr		SPRFSMJ_Label_40
SPRFSMJ_Label_47:	ld		(ix+13), d
					ld		(ix+20), e
					ld		a, e
					cp		SPR_JMPR_START_COUNT
					jr		nz, SPRFSMJ_Label_40		; Finish if not going down
					ld		a, T128_AY_FX_ONFLOOR
					call	T128_AY_InitFXB0			; Sound
					ld		d, SPR_JMPRBULLET_LFT					
					call 	SPRFSMJ_Label_52			; Spawn flame left
					ld		d, SPR_JMPRBULLET_RGH
					call 	SPRFSMJ_Label_52			; Spawn flame right
					jp		SPRFSMJ_Label_40		
;
; Check speed of movement
;					
SPRFSMJ_Label_48:	ld		a, (T128_GameLoops)
					ld		b, (iy+17)					; speed of movement
					and		b
					ret		z							; Check speed
SPRFSMJ_Label_49:	pop		hl							; Depreciate returning address from stack
					jp		SPRFSMJ_Label_40			; Next animation phase

;
; Check middle point or walk
;					
SPRFSMJ_Label_50:	rrca
					and		%01111111					; (Left boundary+rightboundary)/2
					cp		(ix+5)						; Check middle point
					jr		nz, SPRFSMJ_Label_51
					ld		a, SPR_JMPR_STOP_COUNT
					ld		(ix+20), a
					ld		a, b
					ld		(ix+13), a
					jp 		SPRFSMJ_Label_40
SPRFSMJ_Label_51:	ld		a, (ix+6)
					add		a, c
					ld		(ix+6), a
					call	T128_BlockColDown
					cp		T128_BLOCK_STEP				; Check step down
					jp		z, SPRFSMJ_Label_39
					jp		SPRFSMJ_Label_40
;
; Spawn flames
;					
SPRFSMJ_Label_52:	ld		a, (ix+6)
					ld		b, a						; x = jumper x
					ld		c, (ix+8)					; y = jumper y
					ld		e, 0						; null
					ld		h, 0						; null
					ld		a, T128_SPRITE_JMPRBULLET	; sprite class
					call	SPR_Spawn					; Spawn bullet
					ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SPR_FSM_JumperIS
;
; Calculate initial state of a sprite of class Jumper: Phase ONE
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
SPR_FSM_JumperIS:	ld		de, SPR_JumperParams		; State parameters table for Jumpers
					exx
					ld		a, b
					exx
					cp		SPR_LOOK_RIGHT				; Initial state
					ld		a, SPR_JMPR_START_RGH
					ret		nz
					ld		a, SPR_JMPR_START_LFT
					ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SPR_FSM_JumperIS2
;
; Calculate other initial parameters of a sprite of class Jumper: Phase TWO
;
; Input:
;   iy = Pointer to basic info structure (as in T128_ScreenSprPool or in SPR_ScreenSprPool)
;   ix = Sprite table in T128_ScreenSprites
;
SPR_FSM_JumperIS2:	ld		a, (ix+2)
					and		%11111001
					or		SPR_JMPR_ZPOS
					ld		(ix+2), a					; BACKGOUND / FOREGROUND										
					ld		a, SPR_JMPR_START_COUNT
					ld		(ix+20), a
					ret