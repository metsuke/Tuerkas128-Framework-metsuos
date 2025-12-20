;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; J U M P E R   B U L L E T S '  F I N I T E   S T A T E   M A C H I N E 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC _BEGIN_SPR_FSM_JMPRBULLET
_BEGIN_SPR_FSM_JMPRBULLET:

;
; Parameters
;
SPR_JMPRBULLET_ZPOS	EQU		T128_SPR_FOREGROUND1
;
; States
;
SPR_JMPRBULLET_LFT	EQU		0
SPR_JMPRBULLET_RGH	EQU		1
SPR_JmprBulletParams defb	T128_SPR_X_OFF, T128_SPR_NORMAL
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
; SPR_FSM_JmprBullet
;
; FSM for jumper bullets
;
; Move bullets shooted by Jumpers. Bullets affects Main char
; Jumperbullets moves from left to right or from right to left. Jumperbullets can step up and step down
; If screen boundaries are reached, or a non empty block is reached, then Jumperbullet is killed
; Jumper bullets generate pufs
;
; Collisions with Perseus:
;   - Energy (T128_GameVar08) is decremented, unless Invisivility (T128_GameVar00) is set
;
; This routine uses CLASS-DEPENDANT values of sprite definition table:
;   Speed of animation (iy+17)
;   Number of phases of animation (iy+18)
;
; Input:
;   ix = sprite info
;

SPR_FSM_JmprBullet:	ld		iy, T128_MainChar
					call	SPR_CollisionAll
					jr		z, SPRFSMJB_Label_01
;
; Collision with Main char
;
					call	SPR_DecEnergy				; Process collision with Perseus
;					; CHECK INVISIBILITY
;					ld		a, (T128_GameVar00)
;					or		a
;					jr		nz, SPRFSMJB_Label_01
;					; DECREMENT ENERGY
;					ld		de, T128_GameVar08
;					ld		a, T128_GAMEVAR_DEC8
;					call	T128_UpdateGameVar2
;					; SOUND
;					ld 		a, 1						; FX number
;					call	T128_AY_InitFXB0					
;					
SPRFSMJB_Label_01:	ld		a, (ix+12)
					cp		T128_BLACK_RED
					jr		z, SPRFSMJB_Label_02
					ld		a, T128_BLACK_RED
					jr		SPRFSMJB_Label_03
SPRFSMJB_Label_02:	ld		a, T128_BLACK_YELLOW
SPRFSMJB_Label_03:	ld		(ix+12), a
					call	SPR_SpriteDefTable			; iy = sprite definition table
					ld		a, (T128_GameLoops)					
					ld		b, (iy+17)					; speed of animation
					and		b
					jr		nz, SPRFSMJB_Label_05		; Check speed
;					
					ld		a, (ix+14)
					inc		a
					cp		(iy+18)						; Number of phases of animation
					jr		nz, SPRFSMJB_Label_04
					xor		a
SPRFSMJB_Label_04:	call	SPR_GraphicAddress
SPRFSMJB_Label_05:	ld		a, (ix+13)					
					cp		SPR_JMPRBULLET_RGH
					jr		z, SPRFSMJB_Label_10
;
; Move left
;					
					call	SPRFSMJ_Label_43			; Do height correction for 8 pixels-high jumpers before calling T128_BlockColLeft
					jr		nz, SPRFSMJB_Label_06		
					call	T128_BlockColLeft
					call	SPRFSMJ_Label_44			; Undo height correction for 8 pixels-high jumpers after calling T128_BlockColLeft
					jr		SPRFSMJB_Label_07
SPRFSMJB_Label_06:	call	T128_BlockColLeft
SPRFSMJB_Label_07:	cp		T128_BLOCK_STEP				; Check step up
					jr		nz, SPRFSMJB_Label_08
					ld		a, (ix+8)
					sub		8							; Step up
					ld		(ix+8), a
					dec		(ix+7)
					jr		SPRFSMJB_Label_09
SPRFSMJB_Label_08:	cp		T128_BLOCK_EMPTY			; Check collision left
					jp		nz, SPR_KillSprite			; Kill sprite
SPRFSMJB_Label_09:	ld		a, (ix+6)
					cp		T128_MIN_X*8				; Check left limit
					jp		z, SPR_KillSprite			; Kill sprite
					sub		8							; Move left
					ld		(ix+6), a
					dec		(ix+5)
					ld		d, SPR_SIMPLEANIM_LFT		; Puf looking left
					ld		b, (ix+10)
					add		a, b
					ld		b, a						; x = jumper bbullet x + jumper bullet width
					jr		SPRFSMJB_Label_15
;
; Move right
;
SPRFSMJB_Label_10:	call	SPRFSMJ_Label_43			; Do height correction for 8 pixels-high jumpers before calling T128_BlockColLeft
					jr		nz, SPRFSMJB_Label_11
					call	T128_BlockColRight	
					call	SPRFSMJ_Label_44			; Undo height correction for 8 pixels-high jumpers after calling T128_BlockColLeft
					jr		SPRFSMJB_Label_12
SPRFSMJB_Label_11:	call	T128_BlockColRight
SPRFSMJB_Label_12:	cp		T128_BLOCK_STEP				; Check step up
					jr		nz, SPRFSMJB_Label_13
					ld		a, (ix+8)
					sub		8							; Step up
					ld		(ix+8), a
					dec		(ix+7)
					jr		SPRFSMJB_Label_14
SPRFSMJB_Label_13:	cp		T128_BLOCK_EMPTY			; Check collision right
					jp		nz, SPR_KillSprite			; Kill sprite
SPRFSMJB_Label_14:	ld		a, (ix+6)
					cp		T128_MAX_X*8				; Check right limit
					jp		z, SPR_KillSprite			; Kill sprite
					ld		b, a						; x = jumper bullet x					
					add		a, 8						; Move right
					ld		(ix+6), a
					inc		(ix+5)
					ld		d, SPR_SIMPLEANIM_RGH		; Puf looking right 
;
; Generate puf every 2 chars
;					
SPRFSMJB_Label_15:	ld		a, (ix+5)
					and		%00000001
					jr		nz, SPRFSMJB_Label_16
					ld		c, (ix+8)					; y = jumper bullet y
					ld		e, 0						; null
					ld		h, 0						; null
					ld		a, T128_SPRITE_PUF1CHAR		; sprite class
					call	SPR_Spawn					; Spawn puf
;
; Check step down
;					
SPRFSMJB_Label_16:	call	T128_BlockColDown
					cp		T128_BLOCK_STEP				; Check step down
					ret		nz
					ld		a, (ix+8)
					add		a, 8						; Step down
					ld		(ix+8), a
					inc		(ix+7)
					ret
					
					
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SPR_FSM_JmprBulletIS
;
; Calculate initial state of a sprite of class Jumper Bullet: Phase ONE
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
SPR_FSM_JmprBulletIS ld		de, SPR_JmprBulletParams	; State parameters table for JmprBullets
					ld		a, (ix+3)					; Initial state
					ret
										
										
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SPR_FSM_JmprBulletIS2
;
; Calculate other initial parameters of a sprite of class Jumper Bullet: Phase TWO
;
; Input:
;   iy = Pointer to basic info structure (as in T128_ScreenSprPool or in SPR_ScreenSprPool)
;   ix = Sprite table in T128_ScreenSprites
;
SPR_FSM_JmprBulletIS2 ld		a, (ix+2)
					and		%11111001
					or		SPR_JMPRBULLET_ZPOS
					ld		(ix+2), a					; BACKGOUND / FOREGROUND					
					ret