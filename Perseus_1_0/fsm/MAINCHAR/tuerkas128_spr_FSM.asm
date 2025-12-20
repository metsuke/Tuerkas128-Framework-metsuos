;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; P E R S E U S ' S   F I N I T E   S T A T E   M A C H I N E
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;
; Perseus sprite parameters:
;
; 	0  = sprite address
;	2  = IABWCZZR
;		   I  = 0 - normal        /  1 - invisible
;		   A  = 0 - inactive      /  1 - active
;          B  = 1 if sprite is affected by Breath Areas
;          W  = Wait-next-loop in FSM routine
;          C  = child sprite
;          ZZ = 00 - background 1 / 01 - background 2 / 10 - foreground 1 / 11 - foreground 2
;		   R  = 0 - normal        /  1 - rotated
;        A, B W, and ZZ are not used in Main Char
;	3  = Initial relative address for rotated mode 	= (columns-1)*scanlines*2
;	4  = Relative address decrement for rotated mode 	= scanlines*2*2
;	5  = X (0-31)
;	6  = x (0-255) 
;	7  = Y (0-23)
;	8  = y (0-191)
;	9  = sprite width (in columns)
;	10 = sprite width (in pixels)
;	11 = sprite height (in scanlines)
;	12 = sprite attribute
;	13 = state
;	14 = phase counter
;	15 = state speed 
;	16 = speed counter
;	17 = jump table pointer (word)
;	18 = slide counter / punch-knife subphase counter
;	19 = counter of steps before jumping / counter of steps before sliding
;   20 = not used
;   21 = not used
;   22 = not used (word)
;   24 = not used (word)
;   26 = not used (byte)
;	27 = not used (word)
;


PUBLIC _BEGIN_SPR_FSM_PERSEUS
_BEGIN_SPR_FSM_PERSEUS:
PUBLIC FSM_WHENNEWSCREEN_B0, FSM_INITMAINCHAR_B0

;
; States for Perseus' Finite State Machine
;

TK128_FSM_WALK_LFT		EQU		0
TK128_FSM_WALK_RGH		EQU		1
TK128_FSM_IDLE_LFT		EQU		2
TK128_FSM_IDLE_RGH		EQU		3
TK128_FSM_TURN_LFT		EQU		4
TK128_FSM_TURN_RGH		EQU		5
TK128_FSM_DOWN_LFT		EQU		6
TK128_FSM_DOWN_RGH		EQU		7
TK128_FSM_BACK_LFT		EQU		8
TK128_FSM_BACK_RGH		EQU		9
TK128_FSM_DOWNTURN_LFT	EQU		10
TK128_FSM_DOWNTURN_RGH	EQU		11
TK128_FSM_FALL_LFT		EQU		12
TK128_FSM_FALL_RGH		EQU		13
TK128_FSM_FALL_END_LFT	EQU		14
TK128_FSM_FALL_END_RGH	EQU		15
TK128_FSM_JUMP_UP0_LFT	EQU		16
TK128_FSM_JUMP_UP0_RGH	EQU		17
TK128_FSM_JUMP_UP1_LFT	EQU		18
TK128_FSM_JUMP_UP1_RGH	EQU		19
TK128_FSM_JUMP_HO1_LFT	EQU		20
TK128_FSM_JUMP_HO1_RGH	EQU		21
TK128_FSM_JUMP_HO2_LFT	EQU		22
TK128_FSM_JUMP_HO2_RGH	EQU		23
TK128_FSM_LADDER_ST_LFT	EQU		24
TK128_FSM_LADDER_ST_RGH	EQU		25
TK128_FSM_LADDER_LFT	EQU		26
TK128_FSM_LADDER_RGH	EQU		27
TK128_FSM_LADDERUP_LFT	EQU		28
TK128_FSM_LADDERUP_RGH	EQU		29
TK128_FSM_SLIDE_LFT		EQU		30
TK128_FSM_SLIDE_RGH		EQU		31
TK128_FSM_PUNCH_LFT		EQU		32
TK128_FSM_PUNCH_RGH		EQU		33
TK128_FSM_LADDERDW1_LFT	EQU		34
TK128_FSM_LADDERDW1_RGH EQU		35
TK128_FSM_LADDERDWN_LFT EQU		36
TK128_FSM_LADDERDWN_RGH EQU		37
TK128_FSM_THROW_LFT 	EQU		38
TK128_FSM_THROW_RGH	 	EQU		39


;
; Constants to control Perseus behavior
;
FSM_FallDeltaY		EQU		8							; Delta Y when falling
FSM_JumpHoCycles	EQU		6							; 4 pixel-steps before long jumping
FSM_SlideCycles		EQU		6							; 4 pixel-steps before sliding
FSM_SlideCounter	EQU		10							; 8 pixel-cycles to slide

;
; FSM_StateParams contains parameters for every Perseus' state
; Even states are LOOKING-LEFT states and odd states are LOOKING-RIGHT states
; Sprite width in pixels is 16 for every state. Another parameter could be added to FSM_StateParams
; in case sprite width in pixels were different at any given state
;
; Last parameter of M_FSM_PARAM is the address of the routine to process a given state.
; These routines must be coded to define main char's behavior
; For instance, if Main char can move left, right, stay idle left and stay idle right, then M_FSM_PARAM must be invoked 4 times and
; 4 routines must be coded, one for every state (you can name routines whatever you want, for instance: FSM_MOVE_LEFT, FSM_MOVE_RIGHT, 
; FSM_IDLE_LEFT and FSM_MOVE_RIGHT)
;
; In order to interact with class Button ABs, T128_SetSolidColB0 must be called whenever a solid collision
; is detected. This has only to be done in those FSM routines which make sense.
;
; There must be a prefixed routine that can be used to do some processing before FSM routine is called:
;  - FSM_BEFOREFSM: do something
;  For instance, it can be used to check whether an invisibility GameVar is set and, in that case, activate invisibility flag in Main Char (bit 7 at ix+2)
;
; There must be two prefixed routines to control no-key-pressed situations:
;  - FSM_NOKEYPRESSED: if no key is pressed for a while
;  - FSM_KEYPRESSED: if a key is pressed again 
;    For instance, Main char could turn his head front when no key is pressed for a while, and then turn it back when a key is pressed again
;
; There must be a prefixed routine that can be used to interact with an Object class ABs:
;  - FSM_OBJECTALLOWED: when Main Char collides with an Object class AB, this routine decides whether collision must be processed or not
;    For instance, Main Char could pick up objects only when he is bending over
;
; There must be a prefixed routine that is called whenever a new screen is rendered
;  - FSM_WHENNEWSCREEN_B0: do something
;    For instance, reset number of currently thron kinves 
;
; There must be a prefixed routine that is called from FSM_MainCharB0 in the game loop to check if Main Char is killed
;  - FSM_ISMAINCHARDEAD
;    For instance, if T128_DeathBlkCol!=0 (collision with death block) or T128_BlockDeath returns T128_BLOCK_DEATH or 
;    T128_GameVar08 (Energy)=0 (Main Char is killed) then
;    set Perseus inactive, produce sound and spawn Dead sprite
;
; There must be a prefixed routine that is called when a new game is started to init Main Char and Main Char Aux sprites
; It is a good practice calling FSM_MainCharSetupB0 from this routine to set up some values easily.
;  - FSM_INITMAINCHAR_B0
;    For instance, set initital bitmap, initial coordinates, etc. 
;


FSM_StateParams:

M_FSM_PARAM Spr_PerseusWalk    , T128_SPR_NORMAL, 6, T128_SPR_WIDTH_3, T128_SPR_HEIGHT_32, T128_SPR_X_ON , 2, 0               , FSM_WALK_LFT
M_FSM_PARAM Spr_PerseusWalk    , T128_SPR_ROTATE, 6, T128_SPR_WIDTH_3, T128_SPR_HEIGHT_32, T128_SPR_X_OFF, 2, 0               , FSM_WALK_RGH
M_FSM_PARAM Spr_PerseusIddle   , T128_SPR_NORMAL, 1, T128_SPR_WIDTH_3, T128_SPR_HEIGHT_32, T128_SPR_X_ON , 2, 0               , FSM_IDLE_LFT
M_FSM_PARAM Spr_PerseusIddle   , T128_SPR_ROTATE, 1, T128_SPR_WIDTH_3, T128_SPR_HEIGHT_32, T128_SPR_X_OFF, 2, 0               , FSM_IDLE_RGH
M_FSM_PARAM Spr_PerseusFront   , T128_SPR_NORMAL, 1, T128_SPR_WIDTH_3, T128_SPR_HEIGHT_32, T128_SPR_X_OFF, 2, 0               , FSM_TURN_LFT
M_FSM_PARAM Spr_PerseusFront   , T128_SPR_ROTATE, 1, T128_SPR_WIDTH_3, T128_SPR_HEIGHT_32, T128_SPR_X_OFF, 2, 0               , FSM_TURN_RGH
M_FSM_PARAM Spr_PerseusDown    , T128_SPR_NORMAL, 1, T128_SPR_WIDTH_3, T128_SPR_HEIGHT_24, T128_SPR_X_ON , 2, 0               , FSM_DOWN_LFT
M_FSM_PARAM Spr_PerseusDown    , T128_SPR_ROTATE, 1, T128_SPR_WIDTH_3, T128_SPR_HEIGHT_24, T128_SPR_X_OFF, 2, 0               , FSM_DOWN_RGH
M_FSM_PARAM Spr_PerseusWalk    , T128_SPR_NORMAL, 2, T128_SPR_WIDTH_3, T128_SPR_HEIGHT_32, T128_SPR_X_ON , 2, 0               , FSM_BACK_LFT
M_FSM_PARAM Spr_PerseusWalk    , T128_SPR_ROTATE, 2, T128_SPR_WIDTH_3, T128_SPR_HEIGHT_32, T128_SPR_X_OFF, 2, 0               , FSM_BACK_RGH
M_FSM_PARAM Spr_PerseusDownFr  , T128_SPR_NORMAL, 1, T128_SPR_WIDTH_3, T128_SPR_HEIGHT_24, T128_SPR_X_OFF, 2, 0               , FSM_DOWNTURN_LFT
M_FSM_PARAM Spr_PerseusDownFr  , T128_SPR_ROTATE, 1, T128_SPR_WIDTH_3, T128_SPR_HEIGHT_24, T128_SPR_X_OFF, 2, 0               , FSM_DOWNTURN_RGH
M_FSM_PARAM Spr_PerseusJumpDwn , T128_SPR_NORMAL, 1, T128_SPR_WIDTH_3, T128_SPR_HEIGHT_32, T128_SPR_X_ON , 1, 0               , FSM_FALL_LFT
M_FSM_PARAM Spr_PerseusJumpDwn , T128_SPR_ROTATE, 1, T128_SPR_WIDTH_3, T128_SPR_HEIGHT_32, T128_SPR_X_OFF, 1, 0               , FSM_FALL_RGH
M_FSM_PARAM Spr_PerseusDown    , T128_SPR_NORMAL, 1, T128_SPR_WIDTH_3, T128_SPR_HEIGHT_24, T128_SPR_X_ON , 6, 0               , FSM_FALL_END_LFT
M_FSM_PARAM Spr_PerseusDown    , T128_SPR_ROTATE, 1, T128_SPR_WIDTH_3, T128_SPR_HEIGHT_24, T128_SPR_X_OFF, 6, 0               , FSM_FALL_END_RGH
M_FSM_PARAM Spr_PerseusDown    , T128_SPR_NORMAL, 1, T128_SPR_WIDTH_3, T128_SPR_HEIGHT_24, T128_SPR_X_ON , 4, 0               , FSM_JUMP_UP0_LFT
M_FSM_PARAM Spr_PerseusDown    , T128_SPR_ROTATE, 1, T128_SPR_WIDTH_3, T128_SPR_HEIGHT_24, T128_SPR_X_OFF, 4, 0               , FSM_JUMP_UP0_RGH
M_FSM_PARAM Spr_PerseusJumpUp  , T128_SPR_NORMAL, 2, T128_SPR_WIDTH_3, T128_SPR_HEIGHT_32, T128_SPR_X_ON , 1, 0               , FSM_JUMP_UP1_LFT
M_FSM_PARAM Spr_PerseusJumpUp  , T128_SPR_ROTATE, 2, T128_SPR_WIDTH_3, T128_SPR_HEIGHT_32, T128_SPR_X_OFF, 1, 0               , FSM_JUMP_UP1_RGH
M_FSM_PARAM Spr_PerseusJumpHor , T128_SPR_NORMAL, 2, T128_SPR_WIDTH_3, T128_SPR_HEIGHT_32, T128_SPR_X_ON , 1, 0               , FSM_JUMP_HO1_LFT
M_FSM_PARAM Spr_PerseusJumpHor , T128_SPR_ROTATE, 2, T128_SPR_WIDTH_3, T128_SPR_HEIGHT_32, T128_SPR_X_OFF, 1, 0               , FSM_JUMP_HO1_RGH
M_FSM_PARAM Spr_PerseusJumpHor , T128_SPR_NORMAL, 2, T128_SPR_WIDTH_3, T128_SPR_HEIGHT_32, T128_SPR_X_ON , 1, 0               , FSM_JUMP_HO2_LFT
M_FSM_PARAM Spr_PerseusJumpHor , T128_SPR_ROTATE, 2, T128_SPR_WIDTH_3, T128_SPR_HEIGHT_32, T128_SPR_X_OFF, 1, 0               , FSM_JUMP_HO2_RGH
M_FSM_PARAM Spr_PerseusWalk    , T128_SPR_NORMAL, 2, T128_SPR_WIDTH_3, T128_SPR_HEIGHT_32, T128_SPR_X_ON , 2, 0               , FSM_LADDER_ST_LFT
M_FSM_PARAM Spr_PerseusWalk    , T128_SPR_ROTATE, 2, T128_SPR_WIDTH_3, T128_SPR_HEIGHT_32, T128_SPR_X_OFF, 2, 0               , FSM_LADDER_ST_RGH					
M_FSM_PARAM Spr_PerseusLadder  , T128_SPR_NORMAL, 4, T128_SPR_WIDTH_2, T128_SPR_HEIGHT_32, T128_SPR_X_OFF, 3, 0               , FSM_LADDER_LFT
M_FSM_PARAM Spr_PerseusLadder  , T128_SPR_ROTATE, 4, T128_SPR_WIDTH_2, T128_SPR_HEIGHT_32, T128_SPR_X_OFF, 3, 0               , FSM_LADDER_RGH
M_FSM_PARAM Spr_PerseusLadderUp, T128_SPR_NORMAL, 1, T128_SPR_WIDTH_3, T128_SPR_HEIGHT_24, T128_SPR_X_ON , 4, 0               , FSM_LADDERUP_LFT
M_FSM_PARAM Spr_PerseusLadderUp, T128_SPR_ROTATE, 1, T128_SPR_WIDTH_3, T128_SPR_HEIGHT_24, T128_SPR_X_OFF, 4, 0               , FSM_LADDERUP_RGH
M_FSM_PARAM Spr_PerseusSlide   , T128_SPR_NORMAL, 4, T128_SPR_WIDTH_2, T128_SPR_HEIGHT_16, T128_SPR_X_OFF, 1, T128_BLACK_GREEN, FSM_SLIDE_LFT
M_FSM_PARAM Spr_PerseusSlide   , T128_SPR_ROTATE, 4, T128_SPR_WIDTH_2, T128_SPR_HEIGHT_16, T128_SPR_X_OFF, 1, T128_BLACK_GREEN, FSM_SLIDE_RGH
M_FSM_PARAM Spr_PerseusPunch   , T128_SPR_NORMAL, 2, T128_SPR_WIDTH_3, T128_SPR_HEIGHT_32, T128_SPR_X_OFF, 2, 0               , FSM_PUNCH_LFT
M_FSM_PARAM Spr_PerseusPunch   , T128_SPR_ROTATE, 2, T128_SPR_WIDTH_3, T128_SPR_HEIGHT_32, T128_SPR_X_ON , 2, 0               , FSM_PUNCH_RGH
M_FSM_PARAM Spr_PerseusDown    , T128_SPR_NORMAL, 1, T128_SPR_WIDTH_3, T128_SPR_HEIGHT_24, T128_SPR_X_ON , 4, 0               , FSM_LADDERDW1_LFT
M_FSM_PARAM Spr_PerseusDown    , T128_SPR_ROTATE, 1, T128_SPR_WIDTH_3, T128_SPR_HEIGHT_24, T128_SPR_X_OFF, 4, 0               , FSM_LADDERDW1_RGH
M_FSM_PARAM Spr_PerseusLadderUp, T128_SPR_NORMAL, 1, T128_SPR_WIDTH_3, T128_SPR_HEIGHT_24, T128_SPR_X_ON , 4, 0               , FSM_LADDERDWN_LFT
M_FSM_PARAM Spr_PerseusLadderUp, T128_SPR_ROTATE, 1, T128_SPR_WIDTH_3, T128_SPR_HEIGHT_24, T128_SPR_X_OFF, 4, 0               , FSM_LADDERDWN_RGH		
M_FSM_PARAM Spr_PerseusThrow   , T128_SPR_NORMAL, 1, T128_SPR_WIDTH_3, T128_SPR_HEIGHT_24, T128_SPR_X_ON , 4, 0               , FSM_THROW_LFT
M_FSM_PARAM Spr_PerseusThrow   , T128_SPR_ROTATE, 1, T128_SPR_WIDTH_3, T128_SPR_HEIGHT_24, T128_SPR_X_OFF, 4, 0               , FSM_THROW_RGH


;
; Knives parameters
; 
FSM_MAX_KNIVES		EQU		3
FSM_ThrownKnives	defb	0							; Number of thrown kinves


;
; Perseus' jump tables
; Pairs of (DeltaY, DeltaX). End byte is 128
;
FSM_JumpTable_UP	defb	-8, 0, -8, 0, -8, 0, -4, 0, -4, 0, -4, 0, -2, 0, -2, 0, 0, 0, 128

FSM_JumpTable_UPLFT	defb	-8, -4, -8, -4, -8, -4, -4, -4, -2, -4, -2, -4, 128
FSM_JumpTable_UPRGH	defb	-8, 4, -8, 4, -8, 4, -4, 4, -2, 4, -2, 4, 128

FSM_JumpTable_LFT1	defb	-8, -4, -4, -4, -2, -4, -2, -4, 0, -4, 0, -4, 0, -4, 0, -4, 128
;FSM_JumpTable_LFT2	defb	0, -4, 0, -4, 0, -4, 0, -4, 2, -4, 2, -4, 4, -4, 8, -4, 128
FSM_JumpTable_LFT2	defb	0, -4, 0, -4, 0, -4, 0, -4, 8, -4, 8, -4, 128
FSM_JumpTable_RGH1	defb	-8, 4, -4, 4, -2, 4, -2, 4, 0, 4, 0, 4, 0, 4, 0, 4, 128
;FSM_JumpTable_RGH2	defb	0, 4, 0, 4, 0, 4, 0, 4, 2, 4, 2, 4, 4, 4, 8, 4, 128
FSM_JumpTable_RGH2	defb	0, 4, 0, 4, 0, 4, 0, 4, 8, 4, 8, 4, 128


FSM_JumpTable_LFT3	defb	-8, -8, -4, -8, -4, -8, 0, -8, 0, -8, 128
;FSM_JumpTable_LFT4	defb	0, -8, 0, -8, 4, -8, 4, -8, 8, -8, 128
FSM_JumpTable_LFT4	defb	0, -8, 0, -8, 8, -8, 8, -8, 128
FSM_JumpTable_RGH3	defb	-8, 8, -4, 8, -4, 8, 0, 8, 0, 8, 128
;FSM_JumpTable_RGH4	defb	0, 8, 0, 8, 4, 8, 4, 8, 8, 8, 128
FSM_JumpTable_RGH4	defb	0, 8, 0, 8, 8, 8, 8, 8, 128

;
; Initial values for Perseus and Perseus Aux sprites
;
FSM_MainChar:		defw	Spr_PerseusIddle
					defb	T128_SPR_VISIBLE + T128_SPR_ACTIVE + T128_SPR_NORMAL
					defb	(3-1)*32*2, 32*2*2
					defb	10, 10*8, 15, 15*8, 3, 16, 32
FSM_MainCharAux:	defw	Spr_PerseusTurnHead
					defb	T128_SPR_VISIBLE + T128_SPR_INACTIVE + T128_SPR_NORMAL


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_InitJumpTable
;
; Init jump table pointer. This function saves 24 bytes
;
; Input:
;   ix = sprite address
;   hl = jump table
;

FSM_InitJumpTable:	ld		(ix+17), l
					ld		(ix+18), h
					ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_INITMAINCHAR_B0
;
; Init Perseus
;

FSM_INITMAINCHAR_B0	ld		hl, FSM_MainChar
					ld		de, T128_MainChar
					ld		bc, 12
					ldir								; Init Perseus sprite
					ld		hl, FSM_MainCharAux
					ld		de, T128_MainCharAux
					ld		bc, 3
					ldir								; Init Perseus Aux sprite
;
					ld		ix, T128_MainChar
					ld		a, 2						; Initial state: TK128_FSM_IDLE_LFT
					ld		b, 0						; Initial phase: 0
;					ld		(ix+13), b					; Set previous state. A trick to set up initial speed in FSM_MainCharSetupB0	
					jp		FSM_MainCharSetupB0			; Init parameters for Peseus current state
				
				
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_ISMAINCHARDEAD
;
; If Main Char is killed set Perseus inactive and do something else
;
; If T128_BlockDeath returns T128_BLOCK_DEATH (collision with death block, unless Perseus is invisible) or
; T128_GameVar08 (Energy)=0 (Main Char has run out of energy) then set Perseus inactive, produce sound and spawn Dead sprite
;
; Input:
;	ix = Sprite data
;

FSM_ISMAINCHARDEAD: ld		a, (T128_GameVar00)
					or		a
					jr		nz, FSM_IMCD_Label_01		; If Perseus is invisible, then do not check DEATH blocks
					call	T128_BlockDeath
					cp		T128_BLOCK_DEATH
					jr		z, FSM_IMCD_Label_02		; If collision with a DEATH BLOCK, then spawn Dead sprite
;					ld		a, (T128_DeathBlkCol)
;					or		a
;					jr		nz, FSM_IMCD_Label_02		; If T128_DeathBlkCol!=0 then spawn Dead sprite
FSM_IMCD_Label_01:	ld		a, (T128_GameVar08)
					or		a
					ret 	nz							; If T128_GameVar08!=0 then return
FSM_IMCD_Label_02:	res		6, (ix+2)					; Perseus = Inactive
					ld		hl, T128_MainCharAux+2
					res 	6, (hl)						; Perseus Aux = Inactive
					; SOUND
					ld 		a, T128_AY_FX_DEAD			; FX number
					call	T128_AY_InitFXB0
					; SPAWN DEAD SPRITE
					ld		a, (ix+6)					
					add		a, 4
					and		%11111000					
					ld		b, a						; b = int(Perseus x + 4)
					ld		c, (ix+8)					; y = Perseus y
					ld		d, SPR_DEAD					; Dead sprite looking left
					ld		e, 0						; null
					ld		h, e						; null
					ld		a, T128_SPRITE_DEAD			; sprite class
					jp		SPR_Spawn					; Spawn 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_WHENNEWSCREEN_B0
;
; Do some processing when a new screen is rendered
;
; Reset thrown knives
;
FSM_WHENNEWSCREEN_B0 xor	a
					ld		(FSM_ThrownKnives), a					
					ret					


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_BEFOREFSM
;
; Do some processing before FSM routine is called
;
; CHECK POWERUPS: INVISIBILITY AND SPEED UP
; =========================================
;
; If GameVar00 (invisibility) is not 0, then set invisbility flag (bit 7 of ix+2). Otherwise, unset invisbility flag
; If GameVar01 (speed up) is 0, then set FSM_SpeedControl=0 (normal speed). Otherwise, set FSM_SpeedControl=1 (speed up)
;
; CHECK END-OF-GAME CONDITION
; ===========================
;
; 1bitflags used:
;
;   * T128_1BITFLAG_fe = Perseus got 6 pieces of parchment
;   * T128_1BITFLAG_fd = Perseus is sacrified
;   * T128_1BITFLAG_fc = Perseus has turned into Medusa, right after he is sacrified
;   * T128_1BITFLAG_fb = Perseus touches (kills) Medusa ==> END OF GAME (1)
;   * T128_1BITFLAG_fa = Medusa touches (kills) Polydectes ==> END OF GAME (2)
;
; If T128_1BITFLAG_fe is not set
;    if T128_1BITFLAG_fd is not set then
;      if T128_GameVar13=6 (pieces of parchment) then
;         set T128_1BITFLAG_fe (show arrows pointing to Medusa)
;      end if
;    end if
; else  
;    if T128_ScreenCurrent = 1_05
;       if Perseus is sacrified (y>=136 and x<=112) then
;            set T128_1BITFLAG_fd   (show arrows pointing to Polydectes and show obstacle to sacrifice and unlock gate at screen 0_13)
;            reset T128_1BITFLAG_fe  (hide arrows pointing to Medusa)
;            download Medusa's bitmap
;            set Medusa at a certain position
;       else
;          if Perseus is touching Medusa (x=32) then
;             set T128_1BITFLAG_fb ==> END OF GAME (1)
;          end if
;       end if
;    else
;       if T128_ScreenCurrent = 8_15 then
;          if Medusa is touching Polydectes (x>=224) then
;             set T128_1BITFLAG_fa ==> END OF GAME (2)
;          end if
;       end if;
;    end if
; end if
;
; Input:
;	ix = Sprite data
;
FSM_BEFOREFSM:		;INVISIBILITY
					ld		a, (T128_GameVar00)
					or		a
					ld		a, (ix+2)
					jr		z, FSM_BFSM_Label_01
					or		%10000000
					jr		FSM_BFSM_Label_02
FSM_BFSM_Label_01:	and		%01111111
FSM_BFSM_Label_02:	ld		(ix+2), a	
					; SPEED UP
					ld		a, (T128_GameVar01)
					ld		(FSM_SpeedControl), a
;
; End of game
; 					
					; T128_1BITFLAG_fe IS NOT SET?
					ld		a, T128_1BITFLAG_fe
					call	T128_Check1bFlagB0			; hl = T128_1BITFLAG_fe address   b = set N, (hl)
					jr		nz, FSM_BFSM_Label_03
					
					; T128_1BITFLAG_fd IS NOT SET?
					ld		a, T128_1BITFLAG_fd
					push	hl
					push	bc
					call	T128_Check1bFlagB0
					pop		bc
					pop		hl
					jr		nz, FSM_BFSM_Label_03					
					; CHECK 6 PIECES OF PARCHMENT					
					ld		a, (T128_GameVar13)
					cp		6
					jr		nz, FSM_BFSM_Label_03
					ld		a, b
					ld		(FSM_BFSM_SMC_01+1), a
FSM_BFSM_SMC_01:	set		0, (hl)						; Set 1 bitFlag number T128_1BITFLAG_fe (show arrows pointing to Medusa)
					ld 		a, T128_AY_FX_6_PIECES		; FX number
					jp		T128_AY_InitFXB0			; Produce sound	
;					
					; T128_ScreenCurrent = 1_05 ?
FSM_BFSM_Label_03:	ld		a, (T128_ScreenCurrent)
					cp		1*T128_SCREEN_ROW_1+5
					jr		nz, FSM_BFSM_Label_20
					
					; PERSEUS IS SACRIFIED?
					ld		a, (ix+SPR_PARAM.y)
					cp		136
					jr		c, FSM_BFSM_Label_04
					ld		a, (ix+SPR_PARAM.x)
					cp		112
					jr		nc, FSM_BFSM_Label_04 
					ld		a, T128_1BITFLAG_fd
					call	T128_Check1bFlagB0			; hl = T128_1BITFLAG_fd address   b = set N, (hl)
					ld		a, b
					ld		(FSM_BFSM_SMC_02+1), a
FSM_BFSM_SMC_02:	set		0, (hl)						; Set 1bitFlag number T128_1BITFLAG_fd (show arrows pointing to Polydectes)
					ld		a, T128_1BITFLAG_fe
					call	T128_Check1bFlagB0			; hl = T128_1BITFLAG_fe address   b = set N, (hl)
					ld		a, b
					xor		$40							; b = res N, a
					ld		(FSM_BFSM_SMC_03+1), a
FSM_BFSM_SMC_03:	res		0, (hl)						; Reset 1bitFlag number T128_1BITFLAG_fe (hide arrows pointing to Medusa)
					call	FSM_BFSM_Label_05			; Spawn 2 Enemy Death sprites at Perseus' position
					ld		a, (ix+SPR_PARAM.x)
					add		a, 136						; Move Perseus 136 pixels right
					ld 		(ix+SPR_PARAM.x), a
					ld		a, (ix+SPR_PARAM.XX)
					add		a, 17						
					ld		(ix+SPR_PARAM.XX), a
					ld		a, (ix+SPR_PARAM.y)
					sub		80							; Move Perseus 40 pixels up
					ld 		(ix+SPR_PARAM.y), a
					ld		a, (ix+SPR_PARAM.YY)
					sub		10
					ld		(ix+SPR_PARAM.YY), a
					call	FSM_BFSM_Label_05			; Spawn 2 Enemy Death sprites at Medusa's position
					ld 		a, T128_AY_FX_6_PIECES		; FX number
					jp		T128_AY_InitFXB0			; Produce sound						

					; PERSEUS IS TOUCHING MEDUSA?
FSM_BFSM_Label_04:	ld		a, (ix+SPR_PARAM.x)
					cp		32
					ret		nc
					ld		a, T128_1BITFLAG_fb
					call	T128_Check1bFlagB0			; hl = T128_1BITFLAG_fb address   b = set N, (hl)
					ld		a, b
					ld		(FSM_BFSM_SMC_04+1), a
FSM_BFSM_SMC_04:	set		0, (hl)						; Set 1bitFlag number T128_1BITFLAG_fb (END OF GAME 1)
					ret
					
					; T128_ScreenCurrent = 8_15 ?
FSM_BFSM_Label_20:	cp		8*T128_SCREEN_ROW_1+15
					ret		nz
					; MEDUSA IS TOUCHING POLYDECTES?
					ld		a, (ix+SPR_PARAM.x)
					cp		224
					ret		c
					ld		a, T128_1BITFLAG_fa
					call	T128_Check1bFlagB0			; hl = T128_1BITFLAG_fa address   b = set N, (hl)
					ld		a, b
					ld		(FSM_BFSM_SMC_05+1), a
FSM_BFSM_SMC_05:	set		0, (hl)						; Set 1bitFlag number T128_1BITFLAG_fa (END OF GAME 2)
					ret
;
; Spawn 2 Enemy Death sprites
;
FSM_BFSM_Label_05:	ld		a, (ix+SPR_PARAM.x)					
					add		a, 4
					and		%11111000					; round (Perseus x)
					ld		c, (ix+SPR_PARAM.y)			; y = Perseus y
					add		a, 8
					ld		b, a						; x = Perseus x + 8
					ld		d, 0
					ld		e, d						; null
					ld		h, d						; delay = 0
					ld		a, T128_SPRITE_ENMYDEATH02	; sprite class
					call	SPR_Spawn					; Spawn Enemy Death
					ld		a, b
					sub 	8
					ld		b, a						; x = Perseus x
					ld		a, c
					add		a, 8							
					ld		c, a						; y = Perseus y + 8
					ld		d, 0
					ld		e, d						; null
					ld		h, 5						; delay = 5
					ld		a, T128_SPRITE_ENMYDEATH02	; sprite class
					jp		SPR_Spawn					; Spawn Enemy Death										
					


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_OBJECTALLOWED
;
; Check if class Object ABs and Main Char interaction is allowed
; For instance, Main Char could take objects only when he is bending over
; hl and iy registers must be preserved
; If interactoin is always allowed, this function must contain only a "xor a" instruction
;
; Allow Perseus take objects when he is bending over
;
; Output
;   Z  = Interaction is allowed
;   NZ = Interaction is not allowd
;
FSM_OBJECTALLOWED:	push	iy
					ld		iy, T128_MainChar
					ld		a, (iy+13)					; a = Perseus state
					cp		TK128_FSM_DOWN_LFT
					jr		z, FSM_OA_Label_01
					cp		TK128_FSM_DOWN_RGH
					jr		z, FSM_OA_Label_01
					cp		TK128_FSM_DOWNTURN_LFT
					jr		z, FSM_OA_Label_01
					cp		TK128_FSM_DOWNTURN_RGH
					jr		z, FSM_OA_Label_01
					or		1							; Reset zero flag for other states
FSM_OA_Label_01:	pop		iy
					ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_NOKEYPRESSED
;
; Do something when no key is pressed for a while
; For instance, Main Char could turn his head
; If there is nothing to do, then this routine must only have a ret instruction
;
; Turn Perseus' head if he is in idle state
;
; Input:
;	ix = Sprite data
;
FSM_NOKEYPRESSED:	ld		iy, T128_MainCharAux
					ld		a, (ix+13)					; Perseus state
					cp		TK128_FSM_IDLE_LFT
					jr		z, FSM_NOKP_Label_01
					cp		TK128_FSM_IDLE_RGH
					jr		nz, FSM_KEYPRESSED
FSM_NOKP_Label_01:	ld		a, (ix+5)
					inc		a							
					ld		(iy+5), a					; Copy X+1
					ld		a, (ix+6)					
					ld		(iy+6), a					; Copy x
					ld		a, (ix+7)	
					ld		(iy+7), a					; Copy Y
					ld		a, (ix+8)
					ld		(iy+8), a					; Copy y
					ld		a, (ix+2)
					ld		(iy+2), a					; Copy flags byte from Main Char to Auxiliar Main Char
					ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_KEYPRESSED
;
; Do something when a key is pressed again
; For instance, Main Char could return his head back to its normal position
; If there is nothing to do, then this routine must only have a ret instruction
;
; Turn forward Perseus' head
;
; Input:
;	ix = Sprite data
;
FSM_KEYPRESSED:		ld		iy, T128_MainCharAux
					ld		a, (iy+2)
					and		%10111111					; Set Auxiliar Main Char inactive
					ld		(iy+2), a
					ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_WALK_LFT
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;
					
FSM_WALK_LFT:		ld		a, (ix+6)
					and		%00000111
					jr		nz, FSM_WALK_LFT_03			; Check colision down only if x is multiple of 8
;					
					call	T128_BlockColDown
					cp		T128_BLOCK_STEP
					jr		nz, FSM_WALK_LFT_02
					ld		a, (ix+8)
					add		a, 8						; Step down
					ld		(ix+8), a
					inc		(ix+19)						; Cycles counter to jump
					ld		b, 0						; Phase 0
					ld		a, TK128_FSM_WALK_LFT       ; Walk left										
					ret
;
FSM_WALK_LFT_02:	cp		T128_BLOCK_SOLID
					jr		z, FSM_WALK_LFT_03			; D E A T H   D O W N <==
					ld		b, 0						; New phase
					ld		a, TK128_FSM_FALL_LFT       ; Fall left
					ret
;					
FSM_WALK_LFT_03:	ld		a, FSM_SOLID_DOWN
					call	T128_SetSolidColB0			; Update Solid Collsion variables used in ABs FSM routines
					ld		a, (T128_EventControl)
					cp		T128_EVENT_LEFT
					jr		nz, FSM_WALK_LFT_09
;					
					ld		a, (ix+6)
					and		%00000111
					jr		z, FSM_WALK_LFT_05
;
FSM_WALK_LFT_04:	ld		a, (ix+6)
					sub		4
					ld		(ix+6), a
					inc		(ix+19)						; Cycles counter to jump or slide
					call	FSM_IncPhase				; Inc phase
					ld		a, TK128_FSM_WALK_LFT		; Walk left
					ret
;					
FSM_WALK_LFT_05:	call	T128_BlockColLeft
					cp		T128_BLOCK_SOLID			
					jr		nz, FSM_WALK_LFT_07
;
FSM_WALK_LFT_06:	ld		a, FSM_SOLID_LEFT
					call	T128_SetSolidColB0			; Update Solid Collsion variables used in ABs FSM routines
					ld		a, (ix+6)
					add		a, 4						; Step back
					ld		(ix+6), a
					ld		b, 1
					ld		a, TK128_FSM_BACK_LFT       ; Back left
					ret
;
FSM_WALK_LFT_07:	cp		T128_BLOCK_STEP
					jr		nz, FSM_WALK_LFT_08
;
					ld		a, (ix+8)
					sub		8							; Step up
					ld		(ix+8), a
					jr		FSM_WALK_LFT_04				; And walk left
;
FSM_WALK_LFT_08:	cp		T128_BLOCK_EMPTY
;					jr		z, FSM_WALK_LFT_04			; Walk left
;					jr		FSM_WALK_LFT_07				; D E A T H   <== [OJO]
					call	T128_BlockLadderLeft		; Check ladder left
					cp		T128_BLOCK_LADDER
					ld		e, TK128_FSM_LADDER_ST_LFT
					jp		z, FSM_IDLE_LFT_11
;
; If speed up is activated, then Generate puf every 2 chars
;					
					ld		a, (T128_GameVar01)
					or		a
					jr		z, FSM_WALK_LFT_04
					ld		a, (ix+5)
					and		%00000001
					jr		nz, FSM_WALK_LFT_04
					ld		a, (ix+6)				
					cp		(T128_MAX_X-1)*8
					jr		nc, FSM_WALK_LFT_04			; Check right border
					add		a, 8
					ld		b, a						; b = Perseus x + 8
					ld		a, (ix+8)					
					add		a, 24
					ld		c, a						; y = Perseus y + 24
					ld		d, SPR_SIMPLEANIM_LFT		; Puf looking left
					ld		e, 0						; null
					ld		h, e						; null
					ld		a, T128_SPRITE_PUF1CHAR		; sprite class
					call	SPR_Spawn					; Spawn puf
					jr		FSM_WALK_LFT_04
;					
FSM_WALK_LFT_09:	ld		c, a
					ld		a, (ix+6)
					and		%00000111
					jr		nz, FSM_WALK_LFT_04			; Walk left
;
					ld		a, c
					cp		T128_EVENT_UPLEFT
					jr		nz, FSM_WALK_LFT_10
					ld		a, (ix+19)
					cp		FSM_JumpHoCycles
					jr		c, FSM_WALK_LFT_12			; Check number of cycles to jump
;					
					ld		hl, FSM_JumpTable_LFT1
					ld		a, (T128_GameVar01)
					or		a
					jr		z, FSM_WALK_LFT_09b
					ld		hl, FSM_JumpTable_LFT3		; Speed up jump
FSM_WALK_LFT_09b:	call	FSM_InitJumpTable					
					ld		b, 0						; New phase
					ld		a, TK128_FSM_JUMP_HO1_LFT	; Horizontal jump
					ret
;
FSM_WALK_LFT_10:	cp		T128_EVENT_DOWNLEFT
					jr		nz, FSM_WALK_LFT_12
					ld		a, (ix+19)
					cp		FSM_SlideCycles
					jr		c, FSM_WALK_LFT_12			; Check number of cycles to slide
					ld		e, TK128_FSM_SLIDE_LFT		; New state
FSM_WALK_LFT_11:	ld		a, (ix+8)
					add		a, 8
					ld		(ix+8), a										
					ld		a, FSM_SlideCounter
					ld		(ix+18), a					
					ld		b, 0						; New phase
					ld		a, e						; Slide
					ret
;
FSM_WALK_LFT_12:	call	T128_BlockColLeft
					cp		T128_BLOCK_SOLID			; [OJO] ¿ Q u i z á s   n z   E M P T Y ?
					jp		z, FSM_WALK_LFT_06			; Step back
;
					ld		b, 0						; New phase
					ld		a, TK128_FSM_IDLE_LFT       ; Idle
					ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_IDLE_LFT
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;

FSM_IDLE_LFT:		call	T128_BlockColDown
					cp		T128_BLOCK_SOLID
					jr		z, FSM_IDLE_LFT_01
					ld		b, 0						; New phase
					ld		a, TK128_FSM_FALL_LFT       ; Fall left
					ret
;
FSM_IDLE_LFT_01:	ld		a, (T128_EventControl)
					cp		T128_EVENT_LEFT
					jr		nz, FSM_IDLE_LFT_02
					call	T128_BlockLadderLeft		; Check ladder left
					cp		T128_BLOCK_LADDER
					ld		e, TK128_FSM_LADDER_ST_LFT
					jr		z, FSM_IDLE_LFT_11
					ld		b, 0						; New phase
					ld		(ix+19), b					; Reset counter of cycles to jump
					ld		a, TK128_FSM_WALK_LFT		; Walk left
					ret
;					
FSM_IDLE_LFT_02:	cp		T128_EVENT_RIGHT
					jr		z, FSM_IDLE_LFT_03
					cp		T128_EVENT_UPRIGHT
					jr		nz, FSM_IDLE_LFT_05
FSM_IDLE_LFT_03:	ld		e, TK128_FSM_TURN_RGH		; New state
					ld		d, 4						; Sub 4
FSM_IDLE_LFT_04:	ld		a, (ix+6)
					sub		d							
					ld		(ix+6), a
					ld		b, 0						; New phase
					ld		a, e						; Turn right
					ret
;
FSM_IDLE_LFT_05:	cp		T128_EVENT_DOWN
					jr		nz, FSM_IDLE_LFT_07
					call	T128_BlockLadderLftDwn
					cp		T128_BLOCK_LADDER
					ld		a, (T128_EventControl)		; Restore keyboard/joystick value
					jr		nz, FSM_IDLE_LFT_08
;					
					ld		e, TK128_FSM_LADDERDW1_LFT	; New state
FSM_IDLE_LFT_06:	ld		a, (ix+8)
					add		a, 8
					ld		(ix+8), a					
					ld		b, 0						; New phase
					ld		a, e					
					ret
;					
FSM_IDLE_LFT_07:	cp		T128_EVENT_DOWNLEFT
					jr		nz, FSM_IDLE_LFT_09
FSM_IDLE_LFT_08:	ld		e, TK128_FSM_DOWN_LFT		; New state
					jr		FSM_IDLE_LFT_06
;					
FSM_IDLE_LFT_09:	cp		T128_EVENT_UP
					jr		nz, FSM_IDLE_LFT_13
					call	T128_BlockLadderLeft
					ld		e, TK128_FSM_LADDER_ST_LFT	; New state
					ld		c, TK128_FSM_JUMP_UP0_LFT	; New state 2
FSM_IDLE_LFT_10:	cp		T128_BLOCK_LADDER
					jr		nz, FSM_IDLE_LFT_12
FSM_IDLE_LFT_11:	ld		b, 0
					ld		a, e
					ret
;					
FSM_IDLE_LFT_12:	ld		a, (ix+8)
					add		a, 8
					ld		(ix+8), a					
					ld		hl, FSM_JumpTable_UP
					call	FSM_InitJumpTable
					ld		b, 0						; New phase
					ld		a, c						; Jump up 1
					ret
;					
FSM_IDLE_LFT_13:	cp		T128_EVENT_UPLEFT
					jr		nz, FSM_IDLE_LFT_15
					ld		e, TK128_FSM_JUMP_UP0_LFT	; New state
					ld		hl, FSM_JumpTable_UPLFT		; Jump table
FSM_IDLE_LFT_14:	ld		a, (ix+8)
					add		a, 8
					ld		(ix+8), a					
					call	FSM_InitJumpTable					
					ld		b, 0						; New phase
					ld		a, e						; Jump up 1
					ret
;
FSM_IDLE_LFT_15:	ld		e, TK128_FSM_PUNCH_LFT		; New state
					ld		d, 4						; Sub 4
FSM_IDLE_LFT_16:	and		T128_EVENT_FIRE
					jr		z, FSM_IDLE_LFT_17
					ld		a, (ix+6)
					sub		d
					ld		(ix+6), a
					ld		b, 0
					ld		(ix+18), b
					ld		a, e
					ret
;					
FSM_IDLE_LFT_17:	ld		b, 0						; Same phase
					ld		a, (ix+13)			    	; Same state
					ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_WALK_RGH
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;

FSM_WALK_RGH:		ld		a, (ix+6)
					and		%00000111
					jr		nz, FSM_WALK_RGH_03			; Check colision down only if x is multiple of 8
;					
					call	T128_BlockColDown
					cp		T128_BLOCK_STEP
					jr		nz, FSM_WALK_RGH_02
					ld		a, (ix+8)
					add		a, 8						; Step down
					ld		(ix+8), a		
					inc		(ix+19)						; Cycles counter to jump
					ld		b, 0						; Phase 0
					ld		a, TK128_FSM_WALK_RGH       ; Walk right									
					ret
;
FSM_WALK_RGH_02:	cp		T128_BLOCK_SOLID
					jr		z, FSM_WALK_RGH_03			; D E A T H   D O W N <==
					ld		b, 0						; New phase
					ld		a, TK128_FSM_FALL_RGH       ; Fall right
					ret
;					
FSM_WALK_RGH_03:	ld		a, FSM_SOLID_DOWN
					call	T128_SetSolidColB0			; Update Solid Collsion variables used in ABs FSM routines
					ld		a, (T128_EventControl)
					cp		T128_EVENT_RIGHT
					jr		nz, FSM_WALK_RGH_09
;					
					ld		a, (ix+6)
					and		%00000111
					jr		z, FSM_WALK_RGH_05
;
FSM_WALK_RGH_04:	ld		a, (ix+6)
					add		a, 4
					ld		(ix+6), a
					inc		(ix+19)						; Cycles counter to jump or slide
					call	FSM_IncPhase				; Inc phase
					ld		a, TK128_FSM_WALK_RGH		; Walk right
					ret
;					
FSM_WALK_RGH_05:	call	T128_BlockColRight
					cp		T128_BLOCK_SOLID			
					jr		nz, FSM_WALK_RGH_07
;
FSM_WALK_RGH_06:	ld		a, FSM_SOLID_RIGHT
					call	T128_SetSolidColB0			; Update Solid Collsion variables used in ABs FSM routines
					ld		a, (ix+6)
					sub		4							; Step back
					ld		(ix+6), a
					ld		b, 1
					ld		a, TK128_FSM_BACK_RGH       ; Back right
					ret
;
FSM_WALK_RGH_07:	cp		T128_BLOCK_STEP
					jr		nz, FSM_WALK_RGH_08
;
					ld		a, (ix+8)
					sub		8							; Step up
					ld		(ix+8), a
					jr		FSM_WALK_RGH_04				; And walk right
;
FSM_WALK_RGH_08:	cp		T128_BLOCK_EMPTY
;					jr		z, FSM_WALK_RGH_04			; Walk right
;					jr		FSM_WALK_RGH_07				; D E A T H   <== [OJO]
					call	T128_BlockLadderRight		; Check ladder right
					cp		T128_BLOCK_LADDER
					ld		e, TK128_FSM_LADDER_ST_RGH
					jp		z, FSM_IDLE_LFT_11
;
; If speed up is activated, then Generate puf every 2 chars
;					
					ld		a, (T128_GameVar01)
					or		a
					jr		z, FSM_WALK_RGH_04
					ld		a, (ix+5)
					and		%00000001
					jr		z, FSM_WALK_RGH_04
					ld		b, (ix+6)					; b = Perseus x
					ld		a, (ix+8)					
					add		a, 24
					ld		c, a						; y = Perseus y + 24
					ld		d, SPR_SIMPLEANIM_RGH		; Puf looking Right
					ld		e, 0						; null
					ld		h, e						; null
					ld		a, T128_SPRITE_PUF1CHAR		; sprite class
					call	SPR_Spawn					; Spawn puf
					jr		FSM_WALK_RGH_04
;					
FSM_WALK_RGH_09:	ld		c, a
					ld		a, (ix+6)
					and		%00000111
					jr		nz, FSM_WALK_RGH_04			; Walk right
;
					ld		a, c
					cp		T128_EVENT_UPRIGHT
					jr		nz, FSM_WALK_RGH_10
					ld		a, (ix+19)
					cp		FSM_JumpHoCycles
					jr		c, FSM_WALK_RGH_11			; Check number of cycles to jump
;					
					ld		hl, FSM_JumpTable_RGH1
					ld		a, (T128_GameVar01)
					or		a
					jr		z, FSM_WALK_RGH_09b
					ld		hl, FSM_JumpTable_RGH3		; Speed up jump
FSM_WALK_RGH_09b:	call	FSM_InitJumpTable					
					ld		b, 0						; New phase
					ld		a, TK128_FSM_JUMP_HO1_RGH	; Horizontal jump
					ret
;
FSM_WALK_RGH_10:	cp		T128_EVENT_DOWNRIGHT
					jr		nz, FSM_WALK_RGH_11
					ld		a, (ix+19)
					cp		FSM_SlideCycles
					jr		c, FSM_WALK_RGH_11			; Check number of cycles to slide
					ld		e, TK128_FSM_SLIDE_RGH		; New state
					jp 		FSM_WALK_LFT_11
;
FSM_WALK_RGH_11:	call	T128_BlockColRight
					cp		T128_BLOCK_SOLID			; [OJO] ¿ Q u i z á s   n z   E M P T Y ?
					jp		z, FSM_WALK_RGH_06			; Step back
;
					ld		b, 0						; New phase
					ld		a, TK128_FSM_IDLE_RGH       ; Idle
					ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_IDLE_RGH
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;

FSM_IDLE_RGH:		call	T128_BlockColDown
					cp		T128_BLOCK_SOLID
					jr		z, FSM_IDLE_RGH_01
					ld		b, 0						; New phase
					ld		a, TK128_FSM_FALL_RGH       ; Fall right
					ret
;
FSM_IDLE_RGH_01:	ld		a, (T128_EventControl)
					cp		T128_EVENT_RIGHT
					jr		nz, FSM_IDLE_RGH_02
					call	T128_BlockLadderRight		; Check ladder right
					cp		T128_BLOCK_LADDER
					ld		e, TK128_FSM_LADDER_ST_RGH
					jp		z, FSM_IDLE_LFT_11
					ld		b, 0						; New phase
					ld		(ix+19), b					; Reset counter of cycles to jump
					ld		a, TK128_FSM_WALK_RGH		; Wal wight
					ret
;					
FSM_IDLE_RGH_02:	cp		T128_EVENT_LEFT
					jr		z, FSM_IDLE_RGH_03
					cp		T128_EVENT_UPLEFT
					jr		nz, FSM_IDLE_RGH_04
FSM_IDLE_RGH_03:	ld		e, TK128_FSM_TURN_LFT		; New state
					ld		d, 252						; Add 4
					jp		FSM_IDLE_LFT_04
;
FSM_IDLE_RGH_04:	cp		T128_EVENT_DOWN
					jr		nz, FSM_IDLE_RGH_05
					call	T128_BlockLadderRghDwn
					cp		T128_BLOCK_LADDER
					ld		a, (T128_EventControl)		; Restore keyboard/joystick value
					jr		nz, FSM_IDLE_RGH_06
;					
					ld		e, TK128_FSM_LADDERDW1_RGH	; New state
					jp		FSM_IDLE_LFT_06
;					
FSM_IDLE_RGH_05:	cp		T128_EVENT_DOWNRIGHT
					jr		nz, FSM_IDLE_RGH_07
FSM_IDLE_RGH_06:	ld		e, TK128_FSM_DOWN_RGH		; New state
					jp		FSM_IDLE_LFT_06
;					
FSM_IDLE_RGH_07:	cp		T128_EVENT_UP
					jr		nz, FSM_IDLE_RGH_08
					call	T128_BlockLadderRight
					ld		e, TK128_FSM_LADDER_ST_RGH	; New state
					ld		c, TK128_FSM_JUMP_UP0_RGH	; New state 2
					jp		FSM_IDLE_LFT_10
;					
FSM_IDLE_RGH_08:	cp		T128_EVENT_UPRIGHT
					jr		nz, FSM_IDLE_RGH_09
					ld		e, TK128_FSM_JUMP_UP0_RGH	; New state
					ld		hl, FSM_JumpTable_UPRGH		; Jump table
					jp		FSM_IDLE_LFT_14
;
FSM_IDLE_RGH_09:	ld		e, TK128_FSM_PUNCH_RGH		; New state
					ld		d, 252						; Add 4
					jp		FSM_IDLE_LFT_16


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_TURN_LFT
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;

FSM_TURN_LFT:		jp		FSM_BACK_LFT


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_TURN_RGH
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;

FSM_TURN_RGH:		jp		FSM_BACK_RGH


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_DOWN_LFT
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;

FSM_DOWN_LFT:		call	T128_BlockColDown
					ld		e, TK128_FSM_FALL_LFT		; New state
					ld		c, T128_EVENT_DOWNLEFT
					ld		l, TK128_FSM_DOWN_LFT		; New state 2
					ld		h, T128_EVENT_DOWNRIGHT
					ld		b, TK128_FSM_THROW_LFT		; New state 3
					ld		d, 4						; sub 4
					ex		af, af'
					ld		a, 248						; sub 8
					ex		af, af'
					exx	
					ld		hl, TK128_FSM_DOWNTURN_RGH*256+TK128_FSM_IDLE_LFT	; New state 3 & 4
					exx
;					
FSM_DOWN_LFT_01:	cp		T128_BLOCK_SOLID
					jr		z, FSM_DOWN_LFT_02
					ld		a, (ix+8)
					sub		8
					ld		(ix+8), a										
					ld		b, 0						; New phase
					ld		a, e						; Fall left
					ret
;
; Check fire for knives
; 					
FSM_DOWN_LFT_02:	ld		a, (T128_EventControl)
					and		255-T128_EVENT_FIRE
					cp		T128_EVENT_DOWN
					jr		z, FSM_DOWN_LFT_03
					cp		c
					jr		nz, FSM_DOWN_LFT_06
FSM_DOWN_LFT_03:	ld		a, (T128_EventControl)
					and		T128_EVENT_FIRE
					jr		z, FSM_DOWN_LFT_05
					; PROCESS KNIVES
					ld		a, (T128_GameVar11)
					or		a
					jr		z, FSM_DOWN_LFT_05			; If knives counter=0, then don't throw more knives
					ld		a, (FSM_ThrownKnives)
					cp		FSM_MAX_KNIVES
					jr		z, FSM_DOWN_LFT_05 			; If FSM_MAX_KNIVES is reached then don't throw more knives

					push	bc
					ld		de, T128_GameVar11			; GameVar
					ld		a, T128_GAMEVAR_SUBDEC		; Substract
					ld		b, T128_DISPLAY_000001 + 1	; 1 unit
					call	T128_UpdateGameVar2			; Update knife counter
					pop		bc
					push	bc
					ld		d, b						; d = same direction as Perseus
					ex		af, af'
					ld		b, (ix+6)					; b = Perseus x
					add		a, b
					ld		b, a						; b = Perseus x + 8 (right) / Perseus x - 8 (left)
					ex		af, af'
					ld		a, (ix+8)					
					add		a, 8
					ld		c, a						; y = Perseus y + 8
					ld		e, 0						; null
					ld		h, e						; null
					ld		a, T128_SPRITE_KNIFE		; sprite class
					call	SPR_Spawn					; Spawn knife					
					pop		bc
					jr		z, FSM_DOWN_LFT_04	
					ld		a, (FSM_ThrownKnives)
					inc		a							; Update thrown knives if spawning was succesfull
					ld		(FSM_ThrownKnives), a
;										
FSM_DOWN_LFT_04:	ld		a, b						; Throw
					ld		b, 0						
					ret
FSM_DOWN_LFT_05:	ld		b, 0                        ; Same phase
					ld		a, l						; Same state										
					ret
;					
FSM_DOWN_LFT_06:	cp		h
					jr		nz, FSM_DOWN_LFT_07
					ld		a, (ix+6)
					sub		d
					ld		(ix+6), a
					ld		b, 0                        ; New phase
					exx
					ld		a, h						; New state
					exx
					ret
;					
FSM_DOWN_LFT_07:	ld		a, (ix+8)
					sub		8
					ld		(ix+8), a										
					ld		b, 0                        ; New phase
					exx
					ld		a, l						; New state					
					exx
					ret
					
					
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_DOWN_RGH
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;

FSM_DOWN_RGH:		call	T128_BlockColDown
					ld		e, TK128_FSM_FALL_RGH		; New state
					ld		c, T128_EVENT_DOWNRIGHT		
					ld		l, TK128_FSM_DOWN_RGH		; New state 2
					ld		h, T128_EVENT_DOWNLEFT
					ld		b, TK128_FSM_THROW_RGH		; New state 3
					ld		d, 252						; Add 4
					ex		af, af'
					ld		a, 8						; add 8
					ex		af, af'					
					exx	
					ld		hl, TK128_FSM_DOWNTURN_LFT*256+TK128_FSM_IDLE_RGH	; New state 3 & 4
					exx
					jp		FSM_DOWN_LFT_01


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_BACK_LFT
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;

FSM_BACK_LFT:		ld		e, TK128_FSM_IDLE_LFT		; New state
					ld		d, 4						; Add 4
					jr		FSM_DOWNTURN_LFT_01
					
					
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_BACK_RGH
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;

FSM_BACK_RGH:		ld		e, TK128_FSM_IDLE_RGH		; New state
					ld		d, 252						; Sub 4
					jr		FSM_DOWNTURN_LFT_01



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_DOWNTURN_LFT
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;

FSM_DOWNTURN_LFT:	ld		e, TK128_FSM_DOWN_LFT		; New state
					ld		d, 4						; Add 4
FSM_DOWNTURN_LFT_01	ld		a, (ix+6)
					add		a, d
					ld		(ix+6), a
					ld		b, 0						; New phase
					ld		a, e				  		; New state
					ret
					

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_DOWNTURN_RGH
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;

FSM_DOWNTURN_RGH:	ld		e, TK128_FSM_DOWN_RGH		; New state
					ld		d, 252						; Sub 4
					jr		FSM_DOWNTURN_LFT_01
					

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_FALL_LFT
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;

FSM_FALL_LFT:		ld		e, TK128_FSM_FALL_LFT
					ld		d, TK128_FSM_FALL_END_LFT
FSM_FALL_LFT_01:	push	de
					call	T128_BlockColDown
					pop		de
					cp		T128_BLOCK_SOLID			; D E A T H <==
					jr		z, FSM_FALL_LFT_02
;
					ld		a, (ix+8)
					and		%11111000
					add		a, FSM_FallDeltaY
					ld		(ix+8), a										
					ld		b, 0                        ; Same phase
					ld		a, e						; Same state
					ret
;					
FSM_FALL_LFT_02:	ld		a, (ix+8)
					add		a, 8
					ld		(ix+8), a
					; SOUND
					ld 		a, T128_AY_FX_STEP			; FX number
					push	de
					call	T128_AY_InitFXB0
					pop		de
					;
					ld		b, 0						; New phase	
					ld		a, d					  	; New state
					ret
					
					
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_FALL_RGH
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;

FSM_FALL_RGH:		ld		e, TK128_FSM_FALL_RGH		; New state
					ld		d, TK128_FSM_FALL_END_RGH	; New state 2
					jr		FSM_FALL_LFT_01


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_FALL_END_LFT
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;

FSM_FALL_END_LFT:	call	T128_BlockColLeft
					ld		e, TK128_FSM_BACK_LFT		; New state
					ld		d, 4						; Add 4
					ld		c, TK128_FSM_IDLE_LFT		; New state 2
FSM_FALL_END_LFT_01	cp		T128_BLOCK_SOLID
					jr		nz, FSM_FALL_END_LFT_02
					ld		a, (ix+6)
					add		a, d						; Step back
					ld		(ix+6), a
;					
					ld		a, (ix+8)
					sub		8							; New y
					ld		(ix+8), a					
;
					ld		b, 1
					ld		a, e				       ; Back left
					ret
;					
FSM_FALL_END_LFT_02 ld		a, (ix+8)
					sub		8							; New y
					ld		(ix+8), a					
;
					ld		b, 0                        ; New phase
					ld		a, c						; Idle
					ret



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_FALL_END_RGH
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;

FSM_FALL_END_RGH:	call	T128_BlockColRight
					ld		e, TK128_FSM_BACK_RGH		; New state
					ld		d, 252						; Sub 4
					ld		c, TK128_FSM_IDLE_RGH		; New state 2
					jr		FSM_FALL_END_LFT_01


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_JUMP_UP0_LFT
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;

FSM_JUMP_UP0_LFT:	ld		e, TK128_FSM_JUMP_UP1_LFT
FSM_JUMP_UP0_LFT_01	ld		a, (ix+8)
					sub		8
					ld		(ix+8), a	
					ld		b, 0                        ; New phase
					ld		a, e						; Vertical jump, upward
					ret
					
					
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_JUMP_UP0_RGH
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;

FSM_JUMP_UP0_RGH:	ld		e, TK128_FSM_JUMP_UP1_RGH	; Vertical jump, upward
					jr		FSM_JUMP_UP0_LFT_01



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_JUMP_UP1_LFT
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;

FSM_JUMP_UP1_LFT:	ld		e, TK128_FSM_FALL_LFT
					ld		d, 8
					exx
					ld		hl, T128_BlockColLeft
					exx
;
FSM_JUMP_UP1_LFT_01	ld		l, (ix+17)
					ld		h, (ix+18)
					ld		a, (hl)
					cp		128
					jr		nz, FSM_JUMP_UP1_LFT_02
					ld		b, 0                        ; New phase
					ld		a, e						; New state					
					ret
;			
FSM_JUMP_UP1_LFT_02	ld		a, (hl)
					ld		c, a
					inc		hl
					or		a
					jr		z, FSM_JUMP_UP1_LFT_05
					push	hl
					push	bc
					push	de
					call	T128_BlockColUp
					pop		de
					pop		bc
					pop		hl
					cp		T128_BLOCK_EMPTY			; D E A T H    <==
					jr		z, FSM_JUMP_UP1_LFT_04
					ld		a, (ix+6)
					and		%00000111
					jr		z, FSM_JUMP_UP1_LFT_03
					ld		a, (ix+6)
					and		%11111000
					add		a, d
					ld		(ix+6), a					
FSM_JUMP_UP1_LFT_03	ld		b, 0                        ; New phase
					ld		a, e						; New state					
					ret
;					
FSM_JUMP_UP1_LFT_04	ld		a, (ix+8)					
					add		a, c						; DeltaY
					ld		(ix+8), a
					call	T128_SPR_YB0
;
FSM_JUMP_UP1_LFT_05 ld		a, (hl)
					inc		hl
					ld		(ix+17), l
					ld		(ix+18), h
					ld		c, a
					or		a
					jr		z, FSM_JUMP_UP1_LFT_08
					push	bc
					push	de
					ld		de, FSM_JUMP_UP1_LFT_06	; Returning address
					push	de
					exx
					push	hl							; Collision routine address on top of the stack
					exx
					ret									; Call collision routine
FSM_JUMP_UP1_LFT_06 pop		de
					pop		bc
					cp		T128_BLOCK_EMPTY			; D E A T H    <==
					jr		z, FSM_JUMP_UP1_LFT_07
					ld		b, 0                        ; New phase
					ld		a, e						; New state					
					ret
;
FSM_JUMP_UP1_LFT_07	ld		a, (ix+6)
					add		a, c						; DeltaX
					ld		(ix+6), a
;					
FSM_JUMP_UP1_LFT_08	ld		b, (ix+14)					; Same phase
					ld		a, c
					or		a
					jr		z, FSM_JUMP_UP1_LFT_09
					call	FSM_IncPhase				; Inc phase
FSM_JUMP_UP1_LFT_09	ld		a, (ix+13)					; Same state
					ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_JUMP_UP1_RGH
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;

FSM_JUMP_UP1_RGH:	ld		e, TK128_FSM_FALL_RGH
					ld		d, 0
					exx
					ld		hl, T128_BlockColRight
					exx
					jr 		FSM_JUMP_UP1_LFT_01


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_JUMP_HO1_LFT
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;

FSM_JUMP_HO1_LFT:	ld		l, (ix+17)
					ld		h, (ix+18)
					ld		a, (hl)
					cp		128
					jr		nz, FSM_JUMP_HO1_LFT_02
					ld		hl, FSM_JumpTable_LFT2
					ld		a, (T128_GameVar01)
					or		a
					jr		z, FSM_JUMP_HO1_LFT_01
					ld		hl, FSM_JumpTable_LFT4		; Speed up jump
FSM_JUMP_HO1_LFT_01 call	FSM_InitJumpTable
					ld		b, 0                        ; New phase
					ld		a, TK128_FSM_JUMP_HO2_LFT	; New state					
					ret
;			
FSM_JUMP_HO1_LFT_02	ld		e, TK128_FSM_FALL_LFT		; New stte
					ld		d, 8						; x correction
					exx
					ld		hl, T128_BlockColLeft		; collision routine
					exx

FSM_JUMP_HO1_LFT_03 ld		a, (hl)
					ld		c, a
					inc		hl
					or		a
					jr		z, FSM_JUMP_HO1_LFT_06
					push	hl
					push	bc
					push	de
					call	T128_BlockColUp
					pop		de
					pop		bc
					pop		hl
					cp		T128_BLOCK_EMPTY			; D E A T H    <==
					jr		z, FSM_JUMP_HO1_LFT_05
					ld		a, (ix+6)
					and		%00000111
					jr		z, FSM_JUMP_HO1_LFT_04
					ld		a, (ix+6)
					and		%11111000
					add		a, d
					ld		(ix+6), a					
FSM_JUMP_HO1_LFT_04	ld		b, 0                        ; New phase
					ld		a, e						; New state					
					ret
;					
FSM_JUMP_HO1_LFT_05	ld		a, (ix+8)					
					add		a, c						; DeltaY
					ld		(ix+8), a
					call	T128_SPR_YB0
;
FSM_JUMP_HO1_LFT_06 ld		a, (hl)
					inc		hl
					ld		(ix+17), l
					ld		(ix+18), h
					ld		c, a
					or		a
					jr		z, FSM_JUMP_HO1_LFT_09
					push	bc
					push	de
					ld		de, FSM_JUMP_HO1_LFT_07	; Returning address
					push	de
					exx
					push	hl							; Collision routine address on top of the stack
					exx
					ret									; Call collision routine
FSM_JUMP_HO1_LFT_07 pop		de
					pop		bc
					cp		T128_BLOCK_EMPTY			; D E A T H    <==
					jr		z, FSM_JUMP_HO1_LFT_08
					ld		b, 0                        ; New phase
					ld		a, e						; New state					
					ret
;
FSM_JUMP_HO1_LFT_08	ld		a, (ix+6)
					add		a, c						; DeltaX
					ld		(ix+6), a
;					
FSM_JUMP_HO1_LFT_09	ld		b, (ix+14)					; Same phase
					ld		a, c
					and		%00000111					
					jr		z, FSM_JUMP_HO1_LFT_10
					call	FSM_IncPhase				; Inc phase, only if |DeltaX| = 4
FSM_JUMP_HO1_LFT_10	ld		a, (ix+13)					; Same state
					ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_JUMP_HO1_RGH
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;

FSM_JUMP_HO1_RGH:	ld		l, (ix+17)
					ld		h, (ix+18)
					ld		a, (hl)
					cp		128
					jr		nz, FSM_JUMP_HO1_RGH_02
					ld		hl, FSM_JumpTable_RGH2
					ld		a, (T128_GameVar01)
					or		a
					jr		z, FSM_JUMP_HO1_RGH_01
					ld		hl, FSM_JumpTable_RGH4		; Speed up jump
FSM_JUMP_HO1_RGH_01 call	FSM_InitJumpTable
					ld		b, 0                        ; New phase
					ld		a, TK128_FSM_JUMP_HO2_RGH	; New state					
					ret
;			
FSM_JUMP_HO1_RGH_02	ld		e, TK128_FSM_FALL_RGH		; New stte
					ld		d, 0                        ; x correction
					exx                                 
					ld		hl, T128_BlockColRight      ; collision routine
					exx
					jp		FSM_JUMP_HO1_LFT_03


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_JUMP_HO2_LFT
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;

FSM_JUMP_HO2_LFT:	ld		e, TK128_FSM_FALL_LFT
					ld		d, 8
					exx
					ld		hl, T128_BlockColLeft
					exx
;
FSM_JUMP_HO2_LFT_01	ld		l, (ix+17)
					ld		h, (ix+18)
					ld		a, (hl)
					cp		128
					jr		nz, FSM_JUMP_HO2_LFT_02					
					ld		b, 0                        ; New phase
					ld		a, e						; New state					
					ret
;			
FSM_JUMP_HO2_LFT_02	ld		a, (hl)
					inc		hl
					ld		c, a
					or		a
					jr		z, FSM_JUMP_HO2_LFT_05
					push	bc
					push	hl
					push	de
					call	T128_BlockColDown
					pop		de
					pop		hl
					pop		bc
					cp		T128_BLOCK_SOLID			; D E A T H    <==
					jr		nz, FSM_JUMP_HO2_LFT_04
					ld		a, (ix+6)
					and		%00000111
					jr		z, FSM_JUMP_HO2_LFT_03
					ld		a, (ix+6)
					and		%11111000
					add		a, d
					ld		(ix+6), a
FSM_JUMP_HO2_LFT_03	ld		b, 0                        ; New phase
					ld		a, e						; New state					
					ret
;					
FSM_JUMP_HO2_LFT_04	ld		a, (ix+8)					
					add		a, c						; DeltaY
					ld		(ix+8), a
					call	T128_SPR_YB0
;
FSM_JUMP_HO2_LFT_05	ld		a, (hl)
					inc		hl
					ld		(ix+17), l
					ld		(ix+18), h
					ld		c, a
					or		a
					jr		z, FSM_JUMP_HO2_LFT_08
					push	bc
					push	de
					ld		de, FSM_JUMP_HO2_LFT_06
					push	de							; Returning addres
					exx
					push	hl							; Collision routine address on top of the stack
					exx
					ret									; Call collision routine
FSM_JUMP_HO2_LFT_06 pop		de
					pop		bc
					cp		T128_BLOCK_EMPTY			; D E A T H    <==
					jr		z, FSM_JUMP_HO2_LFT_07
					ld		b, 0                        ; New phase
					ld		a, e						; New state					
					ret
;
FSM_JUMP_HO2_LFT_07	ld		a, (ix+6)
					add		a, c						; DeltaX
					ld		(ix+6), a
;					
FSM_JUMP_HO2_LFT_08	ld		b, (ix+14)					; Same phase
					ld		a, c
					or		a
					jr		z, FSM_JUMP_HO2_LFT_09
					call	FSM_IncPhase				; Inc phase
FSM_JUMP_HO2_LFT_09	ld		a, (ix+13)					; Same state
					ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_JUMP_HO2_RGH
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;

FSM_JUMP_HO2_RGH:	ld		e, TK128_FSM_FALL_RGH
					ld		d, 0
					exx
					ld		hl, T128_BlockColRight
					exx
					jr		FSM_JUMP_HO2_LFT_01


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_LADDER_ST_LFT
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;

FSM_LADDER_ST_LFT:	ld		e, TK128_FSM_LADDER_ST_LFT	; Same state
					ld		d, 4						; Sub 4
					ld		c, TK128_FSM_LADDER_LFT		; New state
FSM_LADDER_ST_LFT_01 ld		a, (ix+6)
					sub		d							; Step left
					ld		(ix+6), a
					call	FSM_IncPhase				; New phase
					xor		a
					cp		b
					jr		z, FSM_LADDER_ST_LFT_02
;
					ld		a, e						; Same state
					ret
;					
FSM_LADDER_ST_LFT_02 ld		a, c						; New state
					ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_LADDER_ST_RGH
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;

FSM_LADDER_ST_RGH:	ld		e, TK128_FSM_LADDER_ST_RGH	; Same state
					ld		d, 252						; Add 4
					ld		c, TK128_FSM_LADDER_RGH		; New state
					jr		FSM_LADDER_ST_LFT_01


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_LADDER_LFT
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;

FSM_LADDER_LFT:		ld		a, (T128_EventControl)
					cp		T128_EVENT_UP
					jr		z, FSM_LADDER_LFT_01
					cp		T128_EVENT_UPLEFT
					jr		nz, FSM_LADDER_LFT_04					
FSM_LADDER_LFT_01:	ld		e, 1
					call	T128_BlockLadderUpLeft
					cp		T128_BLOCK_LADDER
					jr		z, FSM_LADDER_LFT_02
					ld		b, 0						; New phase
					ld		a, TK128_FSM_LADDERUP_LFT	; New state
					ret
;					
FSM_LADDER_LFT_02:	ld		e, TK128_FSM_LADDER_LFT		; New state
FSM_LADDER_LFT_03:	ld		a, (ix+8)
					sub		4
					ld		(ix+8), a
					call	FSM_IncPhase				; Inc phase
					ld		a, e	
					ret
FSM_LADDER_LFT_04:	cp		T128_EVENT_DOWN
					jr		z, FSM_LADDER_LFT_05
					cp		T128_EVENT_DOWNLEFT
					jr		nz, FSM_LADDER_LFT_10
FSM_LADDER_LFT_05:	call	T128_BlockLadderDwnLeft
					cp		T128_BLOCK_LADDER
					jr		z, FSM_LADDER_LFT_08
FSM_LADDER_LFT_06:	ld		e, TK128_FSM_BACK_LFT       ; Back left
					ld		d, 4						; Add 4
FSM_LADDER_LFT_07:	ld		a, (ix+6)
					add		a, d
					ld		(ix+6), a
					ld		b, 1
					ld		a, e				       ; Back left
					ret
;					
FSM_LADDER_LFT_08:	ld		e, TK128_FSM_LADDER_LFT		; New state
FSM_LADDER_LFT_09:	ld		a, (ix+8)
					add		a, 4
					ld		(ix+8), a
					call	FSM_DecPhase				; Inc phase
					ld		a, e
					ret	
;					
FSM_LADDER_LFT_10:	cp		T128_EVENT_RIGHT
					jr		nz, FSM_LADDER_LFT_12
					call	T128_BlockLadderDwnLeft
					cp		T128_BLOCK_LADDER					
					jr		nz, FSM_LADDER_LFT_06
;					
					ld		e, TK128_FSM_FALL_LFT		; Fall left
					ld		d, 8						; Add 8
FSM_LADDER_LFT_11:	ld		a, (ix+6)
					add		a, d
					ld		(ix+6), a
					ld		b, 0						; New phase
					ld		a, e						; Fall left
					ret
FSM_LADDER_LFT_12:	ld		b, (ix+14)					; Same phase
					ld		a, TK128_FSM_LADDER_LFT		; Same state
					ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_LADDER_RGH
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;

FSM_LADDER_RGH:		ld		a, (T128_EventControl)
					cp		T128_EVENT_UP
					jr		z, FSM_LADDER_RGH_01
					cp		T128_EVENT_UPRIGHT
					jr		nz, FSM_LADDER_RGH_03					
FSM_LADDER_RGH_01:	ld		e, 1
					call	T128_BlockLadderUpRight
					cp		T128_BLOCK_LADDER
					jr		z, FSM_LADDER_RGH_02
					ld		b, 0						; New phase
					ld		a, TK128_FSM_LADDERUP_RGH	; New state
					ret
;					
FSM_LADDER_RGH_02:	ld		e, TK128_FSM_LADDER_RGH		; New state
					jr		FSM_LADDER_LFT_03
FSM_LADDER_RGH_03:	cp		T128_EVENT_DOWN
					jr		z, FSM_LADDER_RGH_04
					cp		T128_EVENT_DOWNRIGHT
					jr		nz, FSM_LADDER_RGH_07
FSM_LADDER_RGH_04:	call	T128_BlockLadderDwnRight
					cp		T128_BLOCK_LADDER
					jr		z, FSM_LADDER_RGH_06
FSM_LADDER_RGH_05:	ld		e, TK128_FSM_BACK_RGH       ; Back right
					ld		d, 252
					jr		FSM_LADDER_LFT_07
;					
FSM_LADDER_RGH_06:	ld		e, TK128_FSM_LADDER_RGH		; New state
					jr		FSM_LADDER_LFT_09
;					
FSM_LADDER_RGH_07:	cp		T128_EVENT_LEFT
					jr		nz, FSM_LADDER_RGH_08
					call	T128_BlockLadderDwnRight
					cp		T128_BLOCK_LADDER					
					jr		nz, FSM_LADDER_RGH_05
;					
					ld		e, TK128_FSM_FALL_RGH		; Fall right
					ld		d, 248						; Sub 8
					jr 		FSM_LADDER_LFT_11
FSM_LADDER_RGH_08:	ld		b, (ix+14)					; Same phase
					ld		a, TK128_FSM_LADDER_RGH		; Same state
					ret



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_LADDERUP_LFT
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;

FSM_LADDERUP_LFT:	ld		e, TK128_FSM_DOWN_LFT		; New state
					ld		d, 8						; Sub 8
FSM_LADDERUP_LFT_01 ld		a, (ix+6)
					sub		d
					ld		(ix+6), a	
					ld		a, (ix+8)
					sub		8
					ld		(ix+8), a					
					ld		b, 0                        ; New phase
					ld		a, e						; New state
					ret
					
					
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_LADDERUP_RGH
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;

FSM_LADDERUP_RGH:	ld		e, TK128_FSM_DOWN_RGH		; New state
					ld		d, 248						; Add 8
					jr		FSM_LADDERUP_LFT_01
										
					
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_SLIDE_LFT
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;

FSM_SLIDE_LFT:		ld		a, (ix+18)
					or		a
					jr		nz, FSM_SLIDE_LFT_05
FSM_SLIDE_LFT_01:	call	T128_BlockColDown
					cp		T128_BLOCK_SOLID			
					jr		z, FSM_SLIDE_LFT_03
					ld		e, TK128_FSM_FALL_LFT		; New state
FSM_SLIDE_LFT_02:	ld		a, (ix+8)
					sub		8
					and		%11111000					; y coordinate correction: when slider is falling it falls 4 pixels		
					ld		(ix+8), a
					ld		b, 0                        ; New phase
					ld		a, e						; New state
					ret
;					
FSM_SLIDE_LFT_03:	ld		e, TK128_FSM_FALL_END_LFT	; new state
FSM_SLIDE_LFT_04:	ld		a, (ix+8)
					sub		8
					ld		(ix+8), a
					; SOUND
					ld 		a, T128_AY_FX_STEP			; FX number
					push	de
					call	T128_AY_InitFXB0
					pop		de
;					
					ld		b, 0                        ; New phase
					ld		a, e						; New state
					ret
;					
FSM_SLIDE_LFT_05:	cp		FSM_SlideCounter/2+2
					jr		nc, FSM_SLIDE_LFT_06
					call	T128_BlockColDown
					cp		T128_BLOCK_SOLID			; <=== D E A T H
					jr		z, FSM_SLIDE_LFT_06
					ld		a, (ix+8)					
					add		a, 4						
					ld		(ix+8), a
					call	T128_SPR_YB0
FSM_SLIDE_LFT_06:	call	T128_BlockColLeft
					cp		T128_BLOCK_SOLID			; <=== D E A T H
					jr		z, FSM_SLIDE_LFT_01
					cp		T128_BLOCK_STEP
					jr		z, FSM_SLIDE_LFT_01
;
FSM_SLIDE_LFT_07:	ld		e, TK128_FSM_SLIDE_LFT		; New state
					ld		d, 8						; Sub 8
FSM_SLIDE_LFT_08:	ld		a, (ix+18)
					dec		a
					ld		(ix+18), a					; Decrement slide counter
					ld		a, (ix+6)
					sub		d
					ld		(ix+6), a
					call 	FSM_IncPhase
					ld		a, e						; New state
					ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_SLIDE_RGH
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;

FSM_SLIDE_RGH:		ld		a, (ix+18)
					or		a
					jr		nz, FSM_SLIDE_RGH_03
FSM_SLIDE_RGH_01:	call	T128_BlockColDown
					cp		T128_BLOCK_SOLID			
					jr		z, FSM_SLIDE_RGH_02
					ld		e, TK128_FSM_FALL_RGH		; New state
					jr		FSM_SLIDE_LFT_02
;					
FSM_SLIDE_RGH_02:	ld		e, TK128_FSM_FALL_END_RGH	; New state
					jr		FSM_SLIDE_LFT_04
;					
FSM_SLIDE_RGH_03:	cp		FSM_SlideCounter/2+2
					jr		nc, FSM_SLIDE_RGH_04
					call	T128_BlockColDown
					cp		T128_BLOCK_SOLID			; <=== D E A T H
					jr		z, FSM_SLIDE_RGH_04
					ld		a, (ix+8)					
					add		a, 4						
					ld		(ix+8), a
					call	T128_SPR_YB0
FSM_SLIDE_RGH_04:	call	T128_BlockColRight
					cp		T128_BLOCK_SOLID			; <=== D E A T H
					jr		z, FSM_SLIDE_RGH_01
					cp		T128_BLOCK_STEP
					jr		z, FSM_SLIDE_RGH_01
;
FSM_SLIDE_RGH_05:	ld		e, TK128_FSM_SLIDE_RGH		; New state
					ld		d, 248						; Add 8
					jr		FSM_SLIDE_LFT_08
					
					
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_PUNCH_LFT
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;

FSM_PUNCH_LFT:		ld		a, (ix+18)
					cp		2
					jr		z, FSM_PUNCH_LFT_03
					ld		e, 4
					ld		d, TK128_FSM_PUNCH_LFT
					ld		c, 252					
FSM_PUNCH_LFT_01:	inc		(ix+18)
					ld		b, e
					cp		1
					jr		nz, FSM_PUNCH_LFT_02
					ld		b, c
FSM_PUNCH_LFT_02:	ld		a, (ix+6)
					sub		b
					ld		(ix+6), a
					call	FSM_IncPhase
					ld		a, d						; Same state
					ret
;					
FSM_PUNCH_LFT_03:	ld		e, TK128_FSM_IDLE_LFT		; New state 1
					ld		d, 4						; Add 4
					ld		c, T128_EVENT_RIGHT			; Press RIGHT
					ld		l, TK128_FSM_IDLE_RGH		; New state 2
					ld		h, 8						; Sub 8
FSM_PUNCH_LFT_04:	ld		a, (ix+6)
					add		a, d
					ld		(ix+6), a
					ld		a, (T128_EventControl)
					and		c
					ld		b, 0                        ; New phase
					ld		a, e						; New state
					ret		z
;				
					ld		a, (ix+6)
					sub		h
					ld		(ix+6), a
					ld		a, l						; New state
					ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_PUNCH_RGH
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;

FSM_PUNCH_RGH:		ld		a, (ix+18)
					cp		2
					jr		z, FSM_PUNCH_RGH_01
					ld		e, 252
					ld		d, TK128_FSM_PUNCH_RGH
					ld		c, 4
					jr		FSM_PUNCH_LFT_01
;					
FSM_PUNCH_RGH_01:	ld		e, TK128_FSM_IDLE_RGH		; New state 1
					ld		d, 252						; Sub 4
					ld		c, T128_EVENT_LEFT			; Press LEFT
					ld		l, TK128_FSM_IDLE_LFT		; New state 2
					ld		h, 248						; Add 8
					jr		FSM_PUNCH_LFT_04
					

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_LADDERDW1_LFT
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;

FSM_LADDERDW1_LFT:	ld		e, TK128_FSM_LADDERDWN_LFT	; New state
					ld		d, 8						; Add 8
FSM_LADDERDW1_LFT_01: ld	a, (ix+6)
					add		a, d
					ld		(ix+6), a	
					ld		a, (ix+8)
					add		a, 8
					ld		(ix+8), a					
					ld		b, 0                        ; New phase
					ld		a, e						; New state
					ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_LADDERDW1_RGH
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;

FSM_LADDERDW1_RGH:	ld		e, TK128_FSM_LADDERDWN_RGH	; New state
					ld		d, 248						; Sub 8
					jr		FSM_LADDERDW1_LFT_01
					
					
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_LADDERDWN_LFT
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;

FSM_LADDERDWN_LFT:	ld		b, 0                        ; New phase
					ld		a, TK128_FSM_LADDER_LFT		; New state
					ret
					
					
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_LADDERDWN_RGH
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;

FSM_LADDERDWN_RGH:	ld		b, 0                        ; New phase
					ld		a, TK128_FSM_LADDER_RGH		; New state
					ret					
					

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_THROW_LFT
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;
FSM_THROW_LFT:		ld		b, 0
					ld		a, TK128_FSM_DOWN_LFT
					ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_THROW_RGH
;
; Input:
;	ix = Sprite data
;
; Output:
;   ix (coordinates) = new coordinates
;	b = new phase
;   a = new state
;
FSM_THROW_RGH:		ld		b, 0
					ld		a, TK128_FSM_DOWN_RGH
					ret

