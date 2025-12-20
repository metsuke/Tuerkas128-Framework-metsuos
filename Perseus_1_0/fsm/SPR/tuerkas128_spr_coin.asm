;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; C O I N ' S   F I N I T E   S T A T E   M A C H I N E 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC _BEGIN_SPR_FSM_COIN
_BEGIN_SPR_FSM_COIN:

;
; Parameters
;
SPR_COIN_ZPOS	EQU		T128_SPR_FOREGROUND1
;
; States
;
SPR_COIN_FALLING	EQU		0
SPR_COIN_IDLE		EQU		1
SPR_COIN_MOVING		EQU		2
SPR_CoinParams 		defb	T128_SPR_X_OFF, T128_SPR_NORMAL
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
; SPR_FSM_Coin
;
; FSM for Coins
;
; Coins fall from its spawning position. When they touch floor, they stay idle.
; When coins are the floor, if Main char collides with them they move toward the scoreboard and a certaing amount of coins is added up
;
; this routine uses CLASS-DEPENDANT values in sprite definition table:
;   speed of animation (iy+17)
;   phases of animation (iy+18)
;
; Input:
;   ix = sprite info
;

SPR_FSM_Coin:		call	SPR_SpriteDefTable			; iy = sprite definition table
					ld		a, (ix+13)					; Get state
;
; Falling
;					
					cp		SPR_COIN_FALLING
					jr		nz, SPRFSMCo_Label_02
					ld		a, (T128_GameLoops)	
					and		%00000001					; Delay
					ret		nz
					call	T128_BlockColDown
					cp		T128_BLOCK_SOLID
					jr		z, SPRFSMCo_Label_01
					ld		a, (ix+8)
					add		a, 8
					ld		(ix+8), a
					inc		(ix+7)
					jr		SPRFSMCo_Label_08
SPRFSMCo_Label_01	inc		(ix+13)						; New state = IDLE
					jr		SPRFSMCo_Label_08
;
; Idle					
;
SPRFSMCo_Label_02:	cp		SPR_COIN_IDLE
					jr		nz, SPRFSMCo_Label_04
SPRFSMCo_Label_03:  push	iy
					ld		iy, T128_MainChar
					call	SPR_CollisionAll			
					pop		iy
					jr		z, SPRFSMCo_Label_08		; Collision with Main Char?
					ld		a, SPR_COIN_MOVING
					ld		(ix+13), a					; New state = Moving
					; ADD UP 3 COINS
					ld		de, T128_GameVar12
					ld		a, T128_GAMEVAR_ADDDEC
					ld		b, T128_DISPLAY_000001 + 3
					call	T128_UpdateGameVar2
					; SOUND
					ld 		a, T128_AY_FX_GETCOINS		; FX number
					call	T128_AY_InitFXB0
					jr		SPRFSMCo_Label_08
;
; Moving		
;
SPRFSMCo_Label_04:	ld		a, (ix+5)
					cp		23
					jr		z, SPRFSMCo_Label_07
					jr		c, SPRFSMCo_Label_05
					sub		1							; Move left
					ld		(ix+5), a
					ld		a, (ix+6)
					sub		8
					ld		(ix+6), a
					jr		SPRFSMCo_Label_07
SPRFSMCo_Label_05:	ld		b, (ix+7)
					add		a, b
					cp		25
					ld		b, 2
					jr		c, SPRFSMCo_Label_06
					dec		b
SPRFSMCo_Label_06:	ld		a, (ix+5)
					add		a, b						; Move right
					ld		(ix+5), a
					ld		a, (ix+6)
					add		a, 8
					ld		(ix+6), a
SPRFSMCo_Label_07: 	ld		a, (ix+7)
					sub		2
					cp		2
					jp		c, SPR_KillSprite			; Kill when coin reaches scoreboard
					ld		(ix+7), a					; Move up
					ld		a, (ix+8)
					sub		16
					ld		(ix+8), a
;
SPRFSMCo_Label_08:	ld		a, (T128_GameLoops)					
					ld		b, (iy+17)					; speed of animation
					and		b
					ret		nz							; Check speed
					ld		a, (ix+14)
					inc		a
					cp		(iy+18)						; Number of phases of animation
					jp		nz, SPRFSMCo_Label_09
					xor		a
SPRFSMCo_Label_09:	ld		(ix+14), a
					jp		SPR_GraphicAddress		


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SPR_FSM_CoinIS
;
; Calculate initial state of a sprite of class Coin: Phase ONE
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
SPR_FSM_CoinIS: 	ld		de, SPR_CoinParams			; State parameters table for Cpins
					ld		a, (ix+3)					; Initial state
					ret					


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SPR_FSM_CoinIS2
;
; Calculate other initial parameters of a sprite of class Coin: Phase TWO
;
; Input:
;   iy = Pointer to basic info structure (as in T128_ScreenSprPool or in SPR_ScreenSprPool)
;   ix = Sprite table in T128_ScreenSprites
;
SPR_FSM_CoinIS2: 	ld		a, (ix+2)
					and		%11111001
					or		SPR_COIN_ZPOS
					ld		(ix+2), a					; BACKGOUND / FOREGROUND
					ret					