;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; C Y C L E S '  F I N I T E   S T A T E   M A C H I N E 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC _BEGIN_SPR_FSM_CYCLE
_BEGIN_SPR_FSM_CYCLE:


;
; Macros
;
; Constraints: MCM_X<=7 MCM_Y<=7
;
M_CYCLE_MOVE MACRO MCM_X, MCM_Y
			  defb	((MCM_X<0 ? MCM_X+16 : MCM_X) AND $0f)*16 + ((MCM_Y<0 ? MCM_Y+16 : MCM_Y) AND $0f)
			  
ENDM
;
; Parameters
;
SPR_CYCL_MOVE_FW	EQU		0
SPR_CYCL_MOVE_BW	EQU		1
SPR_CYCL_ZPOS		EQU		T128_SPR_FOREGROUND2
SPR_CycleParams:	defb	T128_SPR_X_OFF, T128_SPR_NORMAL
					defb	T128_SPR_X_OFF, T128_SPR_NORMAL
;
; Movement tables. Tables 0 through 15 are allowed
;
SPR_CycleTables:	defw	SPR_Cycle_00, SPR_Cycle_01, SPR_Cycle_02, SPR_Cycle_03, SPR_Cycle_04, SPR_Cycle_05
					defw	SPR_Cycle_06, SPR_Cycle_16
;
; Ellipse (T128_ENUM_00)	[NOT USED]
;
SPR_Cycle_00:		defb			SPR_Cycle_01 - SPR_Cycle_00 - 2
					defb			$80
;
; Left semicircle (T128_ENUM_01)
;
SPR_Cycle_01:		defb			SPR_Cycle_02 - SPR_Cycle_01 - 2
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	-1, 0
					M_CYCLE_MOVE	-1, 0
					M_CYCLE_MOVE	-1, 0
					M_CYCLE_MOVE	-1, 1
					M_CYCLE_MOVE	-1, 1
					M_CYCLE_MOVE	-1, 1
					M_CYCLE_MOVE	0, 1					
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 1					
					M_CYCLE_MOVE	1, 1
					M_CYCLE_MOVE	1, 1
					M_CYCLE_MOVE	1, 1
					M_CYCLE_MOVE	1, 0
					M_CYCLE_MOVE	1, 0
					M_CYCLE_MOVE	1, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					defb			$80
;
; Right semicircle (T128_ENUM_02)
;
SPR_Cycle_02:		defb			SPR_Cycle_03 - SPR_Cycle_02 - 2
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	1, 0
					M_CYCLE_MOVE	1, 0
					M_CYCLE_MOVE	1, 0
					M_CYCLE_MOVE	1, 1
					M_CYCLE_MOVE	1, 1
					M_CYCLE_MOVE	1, 1
					M_CYCLE_MOVE	0, 1
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 1
					M_CYCLE_MOVE	-1, 1
					M_CYCLE_MOVE	-1, 1
					M_CYCLE_MOVE	-1, 1
					M_CYCLE_MOVE	-1, 0
					M_CYCLE_MOVE	-1, 0
					M_CYCLE_MOVE	-1, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					defb			$80 										
;
; Down rectangle (T128_ENUM_03)
;
SPR_Cycle_03:		defb			SPR_Cycle_04 - SPR_Cycle_03 - 2
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 1
					M_CYCLE_MOVE	0, 1
					M_CYCLE_MOVE	0, 1
					M_CYCLE_MOVE	0, 1
					M_CYCLE_MOVE	0, 1
					M_CYCLE_MOVE	1, 0
					M_CYCLE_MOVE	1, 0
					M_CYCLE_MOVE	1, 0
					M_CYCLE_MOVE	1, 0
					M_CYCLE_MOVE	1, 0
					M_CYCLE_MOVE	1, 0
					M_CYCLE_MOVE	1, 0
					M_CYCLE_MOVE	1, 0
					M_CYCLE_MOVE	1, 0
					M_CYCLE_MOVE	1, 0
					M_CYCLE_MOVE	1, 0
					M_CYCLE_MOVE	1, 0
					M_CYCLE_MOVE	1, 0
					M_CYCLE_MOVE	0, -1
					M_CYCLE_MOVE	0, -1
					M_CYCLE_MOVE	0, -1
					M_CYCLE_MOVE	0, -1
					M_CYCLE_MOVE	0, -1
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					defb			$80 	
;
; Horizontal line (T128_ENUM_04)	[NOT USED]
;
SPR_Cycle_04:		defb			SPR_Cycle_05 - SPR_Cycle_04 - 2
					defb			$80 	
					
;
; Vertical line (T128_ENUM_05)
;
SPR_Cycle_05:		defb			SPR_Cycle_06 - SPR_Cycle_05 - 2
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 1
					M_CYCLE_MOVE	0, 1
					M_CYCLE_MOVE	0, 1
					M_CYCLE_MOVE	0, 1
					M_CYCLE_MOVE	0, 1
					M_CYCLE_MOVE	0, 1
					M_CYCLE_MOVE	0, 1
					M_CYCLE_MOVE	0, 1
					M_CYCLE_MOVE	0, 0
					defb			$80
					
;
; Vertical line for fish (T128_ENUM_06)
;
SPR_Cycle_06:		defb			SPR_Cycle_16 - SPR_Cycle_06 - 2
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, -1
					M_CYCLE_MOVE	0, -1
					M_CYCLE_MOVE	0, -1
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					M_CYCLE_MOVE	0, 0
					defb			$80 	
					
;
; End
;
SPR_Cycle_16:

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
; Decrement energy. It can be called from other FSMs
;
; If Perseusis not invisible then decrement energy and produce sound ==> Output Z
; Otherwise, return ==> Output NZ
;

					; CHECK INVISIBILITY
SPR_DecEnergy:		ld		a, (T128_GameVar00)
					or		a
					ret		nz
					; DECREMENT ENERGY
					ld		de, T128_GameVar08
					ld		a, T128_GAMEVAR_DEC8
					call	T128_UpdateGameVar2
					; SOUND
					ld 		a, T128_AY_FX_OUCH			; FX number
					call	T128_AY_InitFXB0
					xor		a
					ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SPR_FSM_Cycle
;
; FSM for cycles
;
; A cycle moves following a path defined by a table. Table index is in the low nibble of (ix+19)
; High nibble of (ix+19) sets initial direction of the path:
;   0000 = forward
;   1111 = backward
; A cycle follows the path forward and then backward (or backward and then forward)
;
; Collisions with Perseus:
;   - Energy (T128_GameVar08) is decremented, unless Invisivility (T128_GameVar00) is set
;
; This routine uses CLASS-DEPENDANT values of sprite definition table:
;   speed of movement (iy+17)
;   speed of animation (iy+18)
;   number of phases of animation (iy+19)
; 
; Input:
;   ix = sprite info
;

SPR_FSM_Cycle:		ld		iy, T128_MainChar
					call	SPR_CollisionAll
					jr		z, SPRFSMC_Label_00
					call	SPR_DecEnergy				; Process collision with Perseus
;
SPRFSMC_Label_00:	call	SPR_SpriteDefTable			; iy = sprite definition table
					ld		a, (T128_GameLoops)
					ld		b, (iy+17)					; speed of movement
					and		b
					jp		nz, SPRFSMC_Label_08		; Check speed of movement
;
; Process FSM
;
					ld		a, (ix+19)
					and		%00001111					; Cycle table is in the low nibble
					add		a, a
					ld		c, a
					ld		b, 0
					ld		hl, SPR_CycleTables
					add		hl, bc
					ld		e, (hl)
					inc		hl
					ld 		d, (hl)						
					inc		de							; de = movement table (skip length byte)
					ld		a, (ix+20)
					ld		c, a
					ld		l, a
					ld		h, b
					add		hl, de						; hl = next move
					ld		a, (ix+13)
					cp		SPR_CYCL_MOVE_FW
					jr		nz, SPRFSMC_Label_01
					inc		c							; next cycle (moving forward)
					jr		SPRFSMC_Label_02
SPRFSMC_Label_01:	dec		c							; next cycle (moving backward)
					jp		p, SPRFSMC_Label_02		
					ld		a, SPR_CYCL_MOVE_FW			; Change to MOVE_FW
					ld		(ix+13), a
					inc		c
					inc		c							; Reset cycle
;					
SPRFSMC_Label_02:	ld		a, (hl)
					cp		$80
					jr		nz, SPRFSMC_Label_03
					ld		a, SPR_CYCL_MOVE_BW			; Change to MOVE_BW
					ld		(ix+13), a
					dec		c
					dec		c							; Reset cycle
					dec		hl							; Reset cycle address
;					
SPRFSMC_Label_03:	ld		(ix+20), c					; New index
					ld		a, (ix+13)
					cp		SPR_CYCL_MOVE_FW
					jr		nz, SPRFSMC_Label_04					
;
; MOVE_FW
;										
					xor		a							; nop = 0
					ld		(SPRFSMC_SMC_01), a
					ld		(SPRFSMC_SMC_02), a										
					jr		SPRFSMC_Label_05
;
; MOVE_BW
;					
SPRFSMC_Label_04:	ld		a, NEG_1ST					
					ld		(SPRFSMC_SMC_01), a
					ld		(SPRFSMC_SMC_02), a					
					ld		a, NEG_2ND					; neg = ED 44
SPRFSMC_Label_05:	ld		(SPRFSMC_SMC_01+1), a
					ld		(SPRFSMC_SMC_02+1), a										
;
					ld		a, (hl)
					and		%11110000
					rrca
					bit		6, a
					jr		z, SPRFSMC_Label_06
					or		%10000000					; negative delta x
SPRFSMC_Label_06:	ld		b, (ix+6)
SPRFSMC_SMC_01:		neg									; nop if MOVE_FW / neg if MOVE_BW
					add		a, b
					ld		(ix+6), a					; delta x
					ld		a, (hl)
					and		%00001111
					rlca
					rlca
					rlca
					bit		6, a	
					jr		z, SPRFSMC_Label_07
					or		%10000000					; negative delta y
SPRFSMC_Label_07:	ld		b, (ix+8)
SPRFSMC_SMC_02:		neg									; nop if MOVE_FW / neg if MOVE_BW
					add		a, b
					ld		(ix+8), a					; delta y
;
; Next animation phase
;
SPRFSMC_Label_08:	ld		a, (T128_GameLoops)
					ld		b, (iy+18)					; Speed of animation
					and		b
					jr		nz, SPRFSMC_Label_10		; Check speed for animation
					ld		a, (ix+14)					
					inc		a							
					cp		(iy+19)						; Number of phases of animation
					jr		nz, SPRFSMC_Label_09
					xor		a					
;
; Setup sprite graphic
;
SPRFSMC_Label_09:	call	SPR_GraphicAddress
SPRFSMC_Label_10:	ld		de, SPR_CycleParams
					call	SPR_SpriteSetup
					ret
					
					
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SPR_FSM_CycleIS
;
; Calculate initial state of a sprite of class Cycle: Phase ONE
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
SPR_FSM_CycleIS:	ld		de, SPR_CycleParams			; State parameters table for Cycles
					ld		a, SPR_CYCL_MOVE_FW			; Initial state
					ret
					
					
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SPR_FSM_CycleIS2
;
; Calculate other initial parameters  of a sprite of class Cycle: Phase TWO
;
; Input:
;   iy = Pointer to basic info structure (as in T128_ScreenSprPool or in SPR_ScreenSprPool)
;   ix = Sprite table in T128_ScreenSprites
;
SPR_FSM_CycleIS2:	ld		a, (ix+2)
					and		%11111001					
					or		SPR_CYCL_ZPOS
					ld		(ix+2), a					; BACKGOUND / FOREGROUND
					ld		a, (ix+19)
					ld		b, a
					and		%11110000
					ret		z 							; Moving forward
					ld		a, b						; Moving backward
					and		%00001111					; Table number for cycle
					add		a, a
					ld		e, a
					ld		d, 0
					ld		hl, SPR_CycleTables
					add		hl, de
					ld		e, (hl)
					inc		hl
					ld		d, (hl)						; de = Table address
					ld		a, (de)
					dec		a
					ld		(ix+20), a					; COUNTER
					ld		a, SPR_CYCL_MOVE_BW
					ld		(ix+13), a					; STATE
					ret