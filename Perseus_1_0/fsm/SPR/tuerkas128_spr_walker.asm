;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; W A L K E R S '  F I N I T E   S T A T E   M A C H I N E 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC _BEGIN_SPR_FSM_WALKER
_BEGIN_SPR_FSM_WALKER:

;
; Parameters
;
SPR_WLKR_MINX		EQU		8 							; Min X distance to spawn Walkers
SPR_WLKR_INCx		EQU		2 							; Delta x when moving right
SPR_WLKR_INCX		EQU		1 							; Delta X when moving right at exeact x coordinates
SPR_WLKR_DECx		EQU		254							; Delta x when moving left
SPR_WLKR_DECX		EQU		255							; Delta X when moving left at exeact x coordinates
SPR_WLKR_PHASES		EQU		4							; Number of phases when moving left/right
SPR_WLKR_ZPOS		EQU		T128_SPR_BACKGROUND1		
SPR_WLKR_KILL		EQU		64							; Mumber of cycles before killing
SPR_WLKR_KILLING	EQU		8							; Mumber of cycles killing
SPR_WLKR_KILL_DELTA_Y EQU	4							; Minimum vertical distance to Main char to increment killing mode counter
;
; States
;
SPR_WLKR_WALK_LFT	EQU		0
SPR_WLKR_WALK_RGH	EQU		1
SPR_WLKR_TURN_LFT	EQU		2
SPR_WLKR_TURN_RGH	EQU		3
SPR_WLKR_IDLE_LFT	EQU		4
SPR_WLKR_IDLE_RGH	EQU		5
SPR_WLKR_KILL1_LFT	EQU		6
SPR_WLKR_KILL1_RGH	EQU		7
SPR_WLKR_KILL2_LFT	EQU		8
SPR_WLKR_KILL2_RGH	EQU		9
SPR_WalkerParams:	defb	T128_SPR_X_ON, T128_SPR_NORMAL
					defb	T128_SPR_X_OFF, T128_SPR_ROTATE
					defb	T128_SPR_X_ON, T128_SPR_NORMAL
					defb	T128_SPR_X_OFF, T128_SPR_ROTATE
					defb	T128_SPR_X_ON, T128_SPR_NORMAL
					defb	T128_SPR_X_OFF, T128_SPR_ROTATE
					defb	T128_SPR_X_ON, T128_SPR_NORMAL
					defb	T128_SPR_X_OFF, T128_SPR_ROTATE
					defb	T128_SPR_X_ON, T128_SPR_NORMAL
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
; SPR_FSM_Walker
;
; FSM for Walkers
;
; A walker can walk left and right, between two points. 
; It enters into killing mode after a certaing number of cycles, but only if vertical distance to Main Char is small enough
; and only if it is moving towards Main char
; Whenever it enters into killing mode, its speed is doubled/halved and it shoots a bullet
; Double/half speed is managed using bit 3 of FLAGS (ix+21)
; Whenever a Walker is killed, it produces: 6 Debris sprite, 1 Enmydeath2 sprite and 1 coin
;
; This routine uses CLASS-DEPENDANT values of sprite definition table:
;   speed of movement (iy+17)
;   number of punchings to kill Walker (iy+18)
;
; Collisions with Perseus:
;   - If Perseus has SPEEDUP, then Walker is killed
;   - If Perseus is in SLIDE state, then Walker's FSM is not processed (Walker is stopped)
;   - If Perseus is in PUNCH state (phase!=0) and Walker is in front of Perseus, then Walker steps back (whenever he is not in  his boundary)
;     COUNTER 2 (ix+26) is used to check if Walker is hit N times, where N is a CLASS-DEPENDANT value of the Walker (iy+18)
;     If Walker is hit N times, then he is killed
;   - If Perseus is any other state, then Energy (T128_GameVar08) is decremented, unless Invisivility (T128_GameVar00) is set 
;   
; Collisions with Knives: 
;   - If a knife hits a Walker, then Walker is killed
;
; SPR_GraphicAddress and SPR_SpriteSetup are not needed in every state.
;
; Input:
;   ix = sprite info
;

SPR_FSM_Walker:		
;
; Process collision with main char
;				
					ld		iy, T128_MainChar
					call	SPR_CollisionAll
					ld		c, a						; c = relative position of Walker and MainChar: 00AB00LR
					jp		z, SPRFSMW_Label_05
					ld		b, (iy+13)
					; CHECK SPEED UP
					ld		a, (T128_GameVar01)
					or		a
					jr		nz, SPRFSMW_Label_03		; If Perseus has SPEEDUP powerup, then kill Walker
					; CHECK SLIDE (do not process FSM, so that Walker stops)
					ld		a, b
					cp		TK128_FSM_SLIDE_LFT
					ret		z
					cp		TK128_FSM_SLIDE_RGH
					ret		z					
					; CHECK PUNCH LEFT
					cp		TK128_FSM_PUNCH_LFT
					jr		nz, SPRFSMW_Label_01
					ld		a, (iy+14)
					or		a
					jp		z, SPRFSMW_Label_04			; if Perseus is phase 0 of punch, then skip
;					ld		a, c
;					bit		0, a	
					bit		0, c
					jp		z, SPRFSMW_Label_04
					; SOUND
					ld 		a, T128_AY_FX_PUNCH			; FX number
					call	T128_AY_InitFXB0
					ld		a, (ix+19)					; If MainChar is on the right, then process backward motion
					and		%11110000
					rrca
					rrca
					rrca								
					inc		a							; Left boundary + 1
					cp		(ix+5)
					jr		nc , SPRFSMW_Label_02
					dec		(ix+5)						; If Walker is not in the left boundary, move 1 char left
					ld		a, (ix+6)
					sub		8
					ld		(ix+6), a
					jr		SPRFSMW_Label_02
					; CHECK PUNCH RIGHT
SPRFSMW_Label_01:	cp		TK128_FSM_PUNCH_RGH
					jp		nz, SPRFSMW_Label_04
					ld		a, (iy+14)
					or		a
					jp		z, SPRFSMW_Label_04			; if Perseus is phase 0 of punch, then skip
;					ld		a, c
;					bit		1, a
					bit		1, c
					jp		z, SPRFSMW_Label_04
					; SOUND
					ld 		a, T128_AY_FX_PUNCH			; FX number
					call	T128_AY_InitFXB0					
					ld		a, (ix+19)					; If MainChar is on the left, then process backward motion
					and		%00001111
					add		a, a						
					dec		a							; Right boundary - 1
					cp		(ix+5)
					jr		z, SPRFSMW_Label_02
					jr		c, SPRFSMW_Label_02
					inc		(ix+5)						; If Walker is not in the right boundary, move 1 char right
					ld		a, (ix+6)
					add		a, 8
					ld		(ix+6), a
					; COUNT HITS
SPRFSMW_Label_02:	call	SPR_SpriteDefTable			; iy = sprite definition table
					inc		(ix+26)
					ld		a, (iy+18)						
					cp		(ix+26)
					ret		nz							; If Walker is not hit N times, then return. Otherwise, kill Walker
;
; Kill Walker
; 							
SPRFSMW_Label_03:	call	SPR_SetInactive				; Set inactivity bit, so that Walker will not be spawned next time Perseus goes back to current screen					
					call	SPR_KillSprite				; Kill sprite
					; SOUND
					ld 		a, T128_AY_FX_KILLWALKER	; FX number
					call	T128_AY_InitFXB0					
					ld		a, (ix+6)					
					add		a, 4
					and		%11111000
					ld		b, a						; x = round (walker x)
					ld		c, (ix+8)					; y = walker y
					ld		d, 0
					ld		e, d						; null
					ld		h, d						; null
					ld		a, T128_SPRITE_COIN			; sprite class
					call	SPR_Spawn					; Spawn Coin
;
					ld		a, b
					add		a, 8
					ld		b, a						; x walker x + 8
					ld		d, 0
					ld		e, d						; null
					ld		h, d						; delay = 0
					ld		a, T128_SPRITE_ENMYDEATH02	; sprite class
					call	SPR_Spawn					; Spawn Enemy Death
					ld		a, b
					sub 	8
					ld		b, a						; x walker x
					ld		a, c
					add		a, 8							
					ld		c, a						; y walker y + 8
					ld		d, 0
					ld		e, d						; null
					ld		h, 5						; delay = 5
					ld		a, T128_SPRITE_ENMYDEATH02	; sprite class
					call	SPR_Spawn					; Spawn Enemy Death					
;					
					ld		d, SPR_DEBRIS_LFT			; state
					ld		h, SPR_DEBRIS_L				; counter
					call	SPRFSMW_Label_99			; Spawn Debris LFT
;
					ld		d, SPR_DEBRIS_UPLFT			; state
					ld		h, SPR_DEBRIS_L				; counter
					call	SPRFSMW_Label_99			; Spawn Debris UPLFT
;
					ld		d, SPR_DEBRIS_DOWNLFT		; state
					ld		h, 4-SPR_DEBRIS_D			; counter					
					call	SPRFSMW_Label_99			; Spawn Debris DOWNLFT
;					
					ld		a, b
					add		a, 8
					ld		b, a
					ld		d, SPR_DEBRIS_RGH			; state
					ld		h, SPR_DEBRIS_L				; counter
					call	SPRFSMW_Label_99			; Spawn Debris RGH
;
					ld		d, SPR_DEBRIS_UPRGH			; state
					ld		h, SPR_DEBRIS_L				; counter					
					call	SPRFSMW_Label_99			; Spawn Debris UPRGH
;					
					ld		d, SPR_DEBRIS_DOWNRGH		; state
					ld		h, 4-SPR_DEBRIS_D			; counter										
					jp		SPRFSMW_Label_99			; Spawn Debris DOWNRGH
SPRFSMW_Label_04:	call	SPR_DecEnergy				; Process collision with Perseus
;					jr		z, SPRFSMW_Label_06
					
;					; CHECK INVISIBILITY
;SPRFSMW_Label_04:	ld		a, (T128_GameVar00)
;					or		a
;					jr		nz, SPRFSMW_Label_05
;					; DECREMENT ENERGY
;					ld		de, T128_GameVar08
;					ld		a, T128_GAMEVAR_DEC8
;					call	T128_UpdateGameVar2
;					; SOUND
;					ld 		a, 1						; FX number
;					call	T128_AY_InitFXB0
;					jr		SPRFSMW_Label_06
;
; Collision with knife
;
SPRFSMW_Label_05:	call	SPR_BulletCollision
					jr		z, SPRFSMW_Label_06			; If no collision then procces Walker
					push	ix
					push	iy
					pop		ix							; ix = Address of knife
					call	SPR_KillSprite				; kill kniffe
					pop		ix
					ld		hl, FSM_ThrownKnives
					dec 	(hl)						; Update thrown knives
					jp		SPRFSMW_Label_03			; Kill Walker
;
; Process speed of movement
;
SPRFSMW_Label_06:	call	SPR_SpriteDefTable			; iy = sprite definition table
					ld		b, (iy+17)					; speed of movement
					ld		a, (ix+21)
					and		%00001000
					jr		z, SPRFSMW_Label_07
					sra		b							; half speed
SPRFSMW_Label_07:	ld		a, (T128_GameLoops)
					and		b
					ret		nz							; Check speed
;					
; Proccess FSM
;
					ld		a, (ix+13)					; Get state
;
; Idle left
;
					cp		SPR_WLKR_IDLE_LFT
					jr		nz, SPRFSMW_Label_08
					ld		a, SPR_WLKR_WALK_LFT
					ld		(ix+13), a
					xor		a
					jp		SPR_GraphicAddress
;
; Idle right
;
SPRFSMW_Label_08:	cp		SPR_WLKR_IDLE_RGH
					jr		nz, SPRFSMW_Label_09
					ld		a, SPR_WLKR_WALK_RGH
					ld		(ix+13), a
					xor		a
					jp		SPR_GraphicAddress
;
; Turn left
;
SPRFSMW_Label_09:	cp		SPR_WLKR_TURN_LFT
					jr		nz, SPRFSMW_Label_10
					ld		a, SPR_WLKR_IDLE_RGH
					ld		(ix+13), a
					ld		de, SPR_WalkerParams
					jp 		SPR_SpriteSetup
;
; Turn right
;					
SPRFSMW_Label_10:	cp		SPR_WLKR_TURN_RGH
					jr		nz, SPRFSMW_Label_11
					ld		a, SPR_WLKR_IDLE_LFT
					ld		(ix+13), a
					ld		de, SPR_WalkerParams
					jp 		SPR_SpriteSetup
;
; Kill 1 left
;					
SPRFSMW_Label_11:	cp		SPR_WLKR_KILL1_LFT
					jr		nz, SPRFSMW_Label_12
					ld		a, SPR_WLKR_KILL2_LFT
					ld		(ix+13), a					; Set killing state
;					
					ld		a, (ix+6)
					sub		8
					ld		b, a						; x = walker x - 8
					ld		c, (ix+8)					; y = walker y
					ld		d, SPR_WLKBULLET_LFT		; state
					ld		e, 0						; null
					ld		h, 0						; null
					ld		a, T128_SPRITE_WLKBULLET	; sprite class
					call	SPR_Spawn					; Spawn bullet
;					
					ld		a, SPR_WLKR_PHASES+1		; Phase for Killing state
					jp		SPR_GraphicAddress					
;
; Kill 1 right
;					
SPRFSMW_Label_12:	cp		SPR_WLKR_KILL1_RGH
					jr		nz, SPRFSMW_Label_13
					ld		a, SPR_WLKR_KILL2_RGH
					ld		(ix+13), a					; Set killing state
;					
					ld		a, (ix+6)
					ld		b, (ix+10)
					add		a, b
					ld		b, a						; x = walker x + walker width in pixels
					ld		c, (ix+8)                   ; y = walker y
					ld		d, SPR_WLKBULLET_RGH        ; state
					ld		e, 0                        ; null
					ld		h, 0                        ; null
					ld		a, T128_SPRITE_WLKBULLETR   ; sprite class
					call	SPR_Spawn					; Spawn bullet
;					
					ld		a, SPR_WLKR_PHASES+1		; Phase for Killing state
					jp		SPR_GraphicAddress										
;
; Kill 2 left
;					
SPRFSMW_Label_13:	cp		SPR_WLKR_KILL2_LFT
					jr		nz, SPRFSMW_Label_15
					ld		a, (ix+20)
					inc		a
					cp 		SPR_WLKR_KILLING			; Check killing mode
					jr		z, SPRFSMW_Label_14
					ld		(ix+20), a
					ret
SPRFSMW_Label_14:	xor		a
					ld		(ix+20), a
					ld		a, SPR_WLKR_IDLE_LFT
					ld		(ix+13), a
					ld		a, (ix+21)
					xor		%00001000
					ld		(ix+21), a					; Double / half speed
					ld		a, SPR_WLKR_PHASES			; Phase for iddle state
					jp		SPR_GraphicAddress
;
; Kill 2 right
;					
SPRFSMW_Label_15:	cp		SPR_WLKR_KILL2_RGH
					jr		nz, SPRFSMW_Label_17
					ld		a, (ix+20)
					inc		a
					cp 		SPR_WLKR_KILLING			; Check killing mode
					jr		z, SPRFSMW_Label_16
					ld		(ix+20), a
					ret
SPRFSMW_Label_16:	xor		a
					ld		(ix+20), a					
					ld		a, SPR_WLKR_IDLE_RGH
					ld		(ix+13), a
					
					ld		a, (ix+21)
					xor		%00001000
					ld		(ix+21), a					; Double / half speed
					ld		a, SPR_WLKR_PHASES			; Phase for iddle state
					jp		SPR_GraphicAddress															
;
; Move left (check step up)
;					
SPRFSMW_Label_17:	cp 		SPR_WLKR_WALK_LFT
					jr		nz, SPRFSMW_Label_20
SPRFSMW_Label_18:	call	T128_BlockColLeft
					cp		T128_BLOCK_STEP				; Check step up
					jr		nz, SPRFSMW_Label_19
					ld		a, (ix+8)
					sub		8							; Step up
					ld		(ix+8), a
					dec		(ix+7)
SPRFSMW_Label_19:	ld		b, SPR_WLKR_DECx
					ld		c, SPR_WLKR_DECX
					ex		af, af'
					ld		a, (ix+19)
					and		%11110000					; Left boundary
					rrca	
					rrca	
					rrca								; Rotate right 3 times = multiply by 2
					ex		af, af'
					jr 		SPRFSMW_Label_22
;
; Move right (check up)
;					
SPRFSMW_Label_20:	call	T128_BlockColRight
					cp		T128_BLOCK_STEP				; Check step up
					jr		nz, SPRFSMW_Label_21
					ld		a, (ix+8)
					sub		8							; Step up
					ld		(ix+8), a
					dec		(ix+7)
SPRFSMW_Label_21:	ld		b, SPR_WLKR_INCx
					ld		c, SPR_WLKR_INCX
					ex		af, af'
					ld		a, (ix+19)
					and		%00001111					; Right boundary
					add		a, a						; Multiply by 2
					ex		af, af'
;
; Walk left and right (check step down)
;
SPRFSMW_Label_22:	ld		a, (ix+6)
					add		a, b
					ld		(ix+6), a
					and		%00000111
					jr		nz, SPRFSMW_Label_23		
					ld		a, (ix+5)
					add		a, c						; Increase / decrease X
					ld		(ix+5), a
					push	bc
					call	T128_BlockColDown
					pop		bc
					cp		T128_BLOCK_STEP
					jr		nz, SPRFSMW_Label_23
					ld		a, (ix+8)
					add		a, 8						; Step down
					ld		(ix+8), a
					inc		(ix+7)
SPRFSMW_Label_23:	ld		c, (ix+7)
					ld		hl, T128_MainChar+7
					ld		a, (hl)
					sub		c
					jr		nc, SPRFSMW_Label_24
					neg
SPRFSMW_Label_24:	cp		SPR_WLKR_KILL_DELTA_Y
					jr		nc, SPRFSMW_Label_25
					inc		(ix+20)						; Increase kill mode counter if vertical distance is lower than SPR_WLKR_KILL_DELTA_Y
SPRFSMW_Label_25:	ld		a, (ix+14)
					inc		a
					cp		SPR_WLKR_PHASES
					jr		nz, SPRFSMW_Label_26		; Check max phase
					xor		a							; Set phase 0
SPRFSMW_Label_26:	call	SPR_GraphicAddress
					ex		af, af'
					cp		(ix+5)
					jr		z, SPRFSMW_Label_29			; Check boundaries
					ex		af, af'
					ld		a, (ix+20)
					cp 		SPR_WLKR_KILL				; Check kill mode
					ret		c
;
; Kill mode
;
					ld		a, (ix+6)
					and		%00000111
					ret		nz							; Kill mode only in exact x
					ld		a, b
					cp		SPR_WLKR_DECx
					jr		nz, SPRFSMW_Label_27
					ld		hl, T128_MainChar+5
					ld		a, (hl)
					ld		c, (ix+5)
					sub		c
					ret		nc							; Kill mode left if Main Char is on the left
					ld		a, SPR_WLKR_KILL1_LFT
					jr		SPRFSMW_Label_28
SPRFSMW_Label_27:	ld		hl, T128_MainChar+5
					ld		c, (hl)
					ld		a, (ix+5)
					sub		c
					ret		nc							; Kill mode left if Main Char is on the right
					ld		a, SPR_WLKR_KILL1_RGH
SPRFSMW_Label_28:	ld		(ix+13), a
					xor		a							; Reset kill counter
					ld		(ix+20), a
					ld		a, SPR_WLKR_PHASES
					jp		SPR_GraphicAddress					
;
; Turn around
;
SPRFSMW_Label_29:	ex		af, af'
					ld		a, SPR_WLKR_PHASES
					call	SPR_GraphicAddress
					ld		a, b
					cp		SPR_WLKR_DECx
					ld		a, SPR_WLKR_TURN_RGH
					jr		nz, SPRFSMW_Label_30
					ld		a, SPR_WLKR_TURN_LFT
SPRFSMW_Label_30:	ld		(ix+13), a
					ret
;
; Create Debris sprite
;					
SPRFSMW_Label_99:	ld		a, T128_SPRITE_DEBRIS01		; sprite class
					call	SPR_Spawn					; Spawn Debris LFT
					ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SPR_FSM_WalkerIS
;
; Calculate initial state of a sprite of class Walker: Phase ONE
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
SPR_FSM_WalkerIS:	ld		de, SPR_WalkerParams		; State parameters table for Walkers
					exx
					ld		a, b
					exx
					cp		SPR_LOOK_RIGHT				; Initial state
					ld		a, SPR_WLKR_IDLE_LFT
					ret		nz
					ld		a, SPR_WLKR_IDLE_RGH		
					ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SPR_FSM_WalkerIS2
;
; Calculate other initial parameters of a sprite of class Walker: Phase TWO
;
; Input:
;   iy = Pointer to basic info structure (as in T128_ScreenSprPool or in SPR_ScreenSprPool)
;   ix = Sprite table in T128_ScreenSprites
;
SPR_FSM_WalkerIS2:	ld		a, (ix+2)
					and		%11111001
					or		SPR_WLKR_ZPOS
					ld		(ix+2), a					; BACKGOUND / FOREGROUND										
					ret