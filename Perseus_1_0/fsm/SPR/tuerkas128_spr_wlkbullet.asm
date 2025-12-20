;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; W A L K E R   B U L L E T S '  F I N I T E   S T A T E   M A C H I N E 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC _BEGIN_SPR_FSM_WLKBULLET
_BEGIN_SPR_FSM_WLKBULLET:

;
; Parameters
;
SPR_WLKBULLET_ZPOS	EQU		T128_SPR_FOREGROUND1
;
; States
;
SPR_WLKBULLET_LFT	EQU		0
SPR_WLKBULLET_RGH	EQU		1
SPR_WLKBULLET_COL	EQU		2
SPR_WlkBulletParams	defb	T128_SPR_X_OFF, T128_SPR_NORMAL
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
; SPR_FSM_WlkBullet
;
; FSM for wallker bullets
;
; Move bullets shot by Walkers. Bullets affects Main char
; Walkerbullets moves from left to right or from right to left
; If screen boundaries are reached, or a non empty block is reached, then Walkerbullet is killed
;
; Collisions with Perseus:
;   - Energy (T128_GameVar08) is decremented, unless Invisivility (T128_GameVar00) is set. Walkerbullet color is changed before killing it
;
; This routine uses CLASS-DEPENDANT values of sprite definition table:
;   speed of animation (iy+17)
;   number of phases of animation (iy+18)
;
; SPR_SpriteSetup is not needed because sprite does not sprite does not rotate. Its position is calculated con dec/inc (ix+5)
;
; Input:
;   ix = sprite info
;

SPR_FSM_WlkBullet:	ld		a, (ix+13)
					cp		SPR_WLKBULLET_COL
					jp		z, SPR_KillSprite			; Kill sprite
;
; Collision with Main char
;
					ld		iy, T128_MainChar
					call	SPR_CollisionAll
					jr		z, SPRFSMWB_Label_01
					call	SPR_DecEnergy				; Process collision with Perseus
					jr		nz, SPRFSMWB_Label_01		; check invisibility
					ld		a, SPR_WLKBULLET_COL		; New state
					ld		(ix+13), a
					ld		a, T128_BLACK_YELLOW
					ld		(ix+12), a					; Change color
					ret
					
;					; CHECK INVISIBILITY
;					ld		a, (T128_GameVar00)
;					or		a
;					jr		nz, SPRFSMWB_Label_01		; check invisibility
;					ld		a, SPR_WLKBULLET_COL		; New state
;					ld		(ix+13), a
;					ld		a, T128_BLACK_YELLOW
;					ld		(ix+12), a					; Change color
;					; DECREMENT ENERGY
;					ld		de, T128_GameVar08
;					ld		a, T128_GAMEVAR_DEC8
;					call	T128_UpdateGameVar2
;					; SOUND
;					ld 		a, 1						; FX number
;					jp		T128_AY_InitFXB0
;
; Process FSM
; 					
SPRFSMWB_Label_01	call	SPR_SpriteDefTable			; iy = sprite definition table
					ld		a, (T128_GameLoops)					
					ld		b, (iy+17)					; speed of animation
					and		b
					jr		nz, SPRFSMWB_Label_03		; Check speed
;					
					ld		a, (ix+14)
					inc		a
					cp		(iy+18)						; Number of phases of animation
					jr		nz, SPRFSMWB_Label_02
					xor		a
SPRFSMWB_Label_02:	call	SPR_GraphicAddress
SPRFSMWB_Label_03:	ld		a, (ix+13)					
					cp		SPR_WLKBULLET_RGH
					jr		z, SPRFSMWB_Label_04
;
					call	T128_BlockColLeft
					cp		T128_BLOCK_EMPTY			; Check collision left
					jp		nz, SPR_KillSprite			; Kill sprite
					ld		a, (ix+6)
					cp		T128_MIN_X*8				; Check left limit
					jp		z, SPR_KillSprite			; Kill sprite
					sub		8							; Move left
					ld		(ix+6), a
					dec		(ix+5)
					ret									
;
SPRFSMWB_Label_04:	call	T128_BlockColRight
					cp		T128_BLOCK_EMPTY			; Check collision right
					jp		nz, SPR_KillSprite			; Kill sprite
					ld		a, (ix+6)
					cp		T128_MAX_X*8				; Check right limit
					jp		z, SPR_KillSprite			; Kill sprite
					add		a, 8						; Move right
					ld		(ix+6), a
					inc		(ix+5)
					ret					
					
					
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SPR_FSM_WlkBulletIS
;
; Calculate initial state of a sprite of class Walker Bullet: Phase ONE
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
SPR_FSM_WlkBulletIS	ld		de, SPR_WlkBulletParams		; State parameters table for Wlaker Bullets
					ld		a, (ix+3)					; Initial state
					ret
										
										
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SPR_FSM_WlkBulletIS2
;
; Calculate other initial parameters of a sprite of class Walker Bullet: Phase TWO
;
; Input:
;   iy = Pointer to basic info structure (as in T128_ScreenSprPool or in SPR_ScreenSprPool)
;   ix = Sprite table in T128_ScreenSprites
;
SPR_FSM_WlkBulletIS2 ld		a, (ix+2)
					and		%11111001
					or		SPR_WLKBULLET_ZPOS
					ld		(ix+2), a					; BACKGOUND / FOREGROUND					
					ret