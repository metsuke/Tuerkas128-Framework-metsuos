;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; P R O J E C T I L E ' S   F I N I T E   S T A T E   M A C H I N E 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC _BEGIN_SPR_FSM_PROJECTILE
_BEGIN_SPR_FSM_PROJECTILE:

;
; Parameters
;
SPR_PROJECTILE_ZPOS	EQU		T128_SPR_FOREGROUND1
;
; States
;
SPR_PROJ_HIDDEN		EQU		0
SPR_PROJ_LFT_DOWN	EQU		1
SPR_PROJ_RGH_DOWN	EQU		2
SPR_PROJ_DOWN		EQU		3

SPR_ProjectileParams defb	T128_SPR_X_OFF, T128_SPR_NORMAL
					defb	T128_SPR_X_OFF, T128_SPR_NORMAL
					defb	T128_SPR_X_OFF, T128_SPR_ROTATE
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
; SPR_FSM_Projectile
;
; FSM for Projectiles
;
; This sprites moves in diferent directions, depending on its state
; Projectile initial state is HIDDEN. When COUNTER 1 (ix+20) reaches 0, state is set to its final state which is used to move sprite
; If screen boundaries are reached, or a non empty block is reached, then Walkerbullet is killed
;
; Collisions with Perseus:
;   - Energy (T128_GameVar08) is decremented, unless Invisivility (T128_GameVar00) is set. Projectile os killed
;
; This routine uses CLASS-DEPENDANT values in sprite definition table:
;   speed of animation (iy+17)
;   speed of animation (iy+18)
;   phases of animation (iy+19)
;   Next state, after HIDDEN state (iy+20)
;   Spawning sprite after killing projectile (iy+21)
;
; Input:
;   ix = sprite info
;

SPR_FSM_Projectile:	call	SPR_SpriteDefTable			; iy = sprite definition table
					ld		a, (ix+13)
					cp		SPR_PROJ_HIDDEN
					jr		nz, SPRFSMP_Label_03
;
; Projectile is hidden
;					
SPRFSMP_Label_01:	ld		a, (ix+20)
					or		a
					jr		z, SPRFSMP_Label_02
					dec		a
					ld		(ix+20), a
					ret		
SPRFSMP_Label_02:	ld		a, (ix+21)
					and		%11111110
					ld		(ix+21), a					; Show projectile
					ld		a, (iy+20)
					ld		(ix+13), a					; State
					jp		SPRFSMP_Label_12			; Setup sprite
;
; Projectile is not hidden
; 					
SPRFSMP_Label_03:	ld		a, (T128_GameLoops)
					ld		b, (iy+17)					; speed of movement
					and		b
					jp		nz, SPRFSMP_Label_10		; Check speed of movement
;
; Check collision with Main Char
;
					push	iy
					ld		iy, T128_MainChar
					call	SPR_CollisionAll
					pop		iy
					jr		z, SPRFSMP_Label_04
					call	SPR_DecEnergy				; Process collision with Perseus
					jr		z, SPRFSMP_Label_08
;					; CHECK INVISIBILITY
;					ld		a, (T128_GameVar00)
;					or		a
;					jr		nz, SPRFSMP_Label_04
;					; DECREMENT ENERGY
;					ld		de, T128_GameVar08
;					ld		a, T128_GAMEVAR_DEC8
;					call	T128_UpdateGameVar2
;					; SOUND
;					ld 		a, 1						; FX number
;					call	T128_AY_InitFXB0
;					; KILL SPRITE SPAWNING PROJECTILE DEATH
;					jr		SPRFSMP_Label_08
;
; Left down
; 
SPRFSMP_Label_04:	ld		a, (ix+13)
					cp		SPR_PROJ_LFT_DOWN
					jr		nz, SPRFSMP_Label_05
					call	T128_BlockColLeft
					cp		T128_BLOCK_EMPTY			; Check collision left
					jr		nz, SPRFSMP_Label_08		; Kill sprite spawinng Projectile Death
					ld		a, (ix+6)
					cp		T128_MIN_X*8				; Check left limit
					jp		z, SPR_KillSprite			; Kill sprite
					sub		8							; Move left
					ld		(ix+6), a
					dec		(ix+5)
					jr		SPRFSMP_Label_07
;
; Right down
; 
					
SPRFSMP_Label_05:	cp		SPR_PROJ_RGH_DOWN
					jr		nz, SPRFSMP_Label_06
					call	T128_BlockColRight
					cp		T128_BLOCK_EMPTY			; Check collision right
					jr		nz, SPRFSMP_Label_08		; Kill sprite spawinng Projectile Death
					ld		a, (ix+6)
					cp		T128_MAX_X*8				; Check right limit
					jp		z, SPR_KillSprite			; Kill sprite
					add		a, 8						; Move right
					ld		(ix+6), a
					inc		(ix+5)
					jr		SPRFSMP_Label_07
;
; Down
; 
SPRFSMP_Label_06:	cp		SPR_PROJ_DOWN
					jr		nz, SPRFSMP_Label_10
SPRFSMP_Label_07:	call	T128_BlockColDown
					cp		T128_BLOCK_STEP				; Check collision down with step
					jp		z, SPRFSMP_Label_09			
					cp		T128_BLOCK_EMPTY			; Check collision down
					jp		z, SPRFSMP_Label_09
;
; Kill projectile
;					
					; SOUND
					ld 		a, T128_AY_FX_ONFLOOR		; FX number
					call	T128_AY_InitFXB0
SPRFSMP_Label_08:	ld		b, (ix+6)					; x = round (projectile x)
					ld		c, (ix+8)					; y = projectile y
					ld		d, SPR_SIMPLEANIM_LFT
					ld		e, 0						; null
					ld		h, 0						; null
					ld		a, (iy+21)					; sprite class
					call	SPR_Spawn					; Spawn Projectile Death
					jp 		SPR_KillSprite				; Kill sprite					
SPRFSMP_Label_09:	ld		a, (ix+8)
					cp		(T128_MAX_Y-1)*8			; Check down limit
					jp		z, SPR_KillSprite			; Kill sprite
					add		a, 8						; Move down
					ld		(ix+8), a
					inc		(ix+7)
					jr		SPRFSMP_Label_10
;
; Next animation phase
;
SPRFSMP_Label_10:	ld		a, (T128_GameLoops)
					ld		b, (iy+18)					; Speed of animation
					and		b
					jr		nz, SPRFSMP_Label_12		; Check speed for animation
					ld		a, (ix+14)					
					inc		a							
					cp		(iy+19)						; Number of phases of animation
					jr		nz, SPRFSMP_Label_11
					xor		a					
;
; Setup sprite graphic
;
SPRFSMP_Label_11:	call	SPR_GraphicAddress
SPRFSMP_Label_12:	ld		de, SPR_ProjectileParams
					call	SPR_SpriteSetup
					ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SPR_FSM_ProjectileIS
;
; Calculate initial state of a sprite of class Projectile: Phase ONE
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
SPR_FSM_ProjectileIS ld		de, SPR_ProjectileParams	; State parameters table for Projectiles
					ld		a, SPR_PROJ_HIDDEN			; Initial state
					ret					


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SPR_FSM_ProjectileIS2
;
; Calculate other initial parameters of a sprite of class Projectile: Phase TWO
;
; Input:
;   iy = Pointer to basic info structure (as in T128_ScreenSprPool or in SPR_ScreenSprPool)
;   ix = Sprite table in T128_ScreenSprites
;
SPR_FSM_ProjectileIS2 ld		a, (ix+2)
					and		%11111001
					or		SPR_PROJECTILE_ZPOS
					ld		(ix+2), a					; BACKGOUND / FOREGROUND
					ld		a, (ix+19)				
					ld		(ix+20), a					; INITIAL DELAY
					ld		a, (ix+21)
					or		%00000001
					ld		(ix+21), a					; FLAGS = hidden sprite
					ret					