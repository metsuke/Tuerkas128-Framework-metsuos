;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; M A I N   C H A R ' S   F I N I T E   S T A T E   M A C H I N E
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


PUBLIC _BEGIN_SPR_FSM_MAINCHAR_
_BEGIN_SPR_FSM_MAINCHAR_:

PUBLIC FSM_MainCharB0, FSM_MainCharSetupB0, FSM_MainCharXAnchorB0

;
; Time saving variables
;
FSM_StatePhases		defb	0							; Number of phases of currente state
FSM_StateXCorrect	defb	0							; X correction parameter of current state
FSM_StateRoutine	defw	0							; Routine for currente state

;
; Solid collision flags and variables
;
FSM_SOLID_LEFT		EQU		2
FSM_SOLID_RIGHT		EQU		1
FSM_SOLID_UP		EQU		8
FSM_SOLID_DOWN		EQU		4
FSM_SolidColFlags	defb	0
FSM_SolidCol_x		defb	0
FSM_SolidCol_y		defb	0

;
; Speed control variable
;
FSM_SpeedControl	defb	0							; 0 = Normal speed, 1 = speed up, 2 = speed down

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
; FSM_MainCharXAnchorB0
;
; Get left-aligment of the sprite, according to its state
;
; Output
;   a = c  = T128_SPR_X_ON 		when sprite x coordinate is NOT left-aligned to the leftmost sprite cell
;            T128_SPR_X_OFF		when sprite x coordinate is left-aligned to the leftmost sprite cell
;

FSM_MainCharXAnchorB0:	ld	a, (FSM_StateXCorrect)
						ld	c, a
						ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_MainCharSetupB0
;
; Setup sprite parameters for current state and phase
;
; If FSM_SpeedControl = 1 them speed up
; If FSM_SpeedControl = 2 then speed down
;
; Input:
;   ix = sprite address
;   a  = State
;   b  = phase
;

FSM_MainCharSetupB0 ld		(ix+14), b					; Update phase counter
					push	bc
					call	FSM_GetStateParams
					ld		b, (ix+13)					; Previous state
					ld		(ix+13), a					; Update new state
					ld		c, (iy+10)					; State speed
					; NORMAL SPEED / SPEED UP / SPEED DOWN
					ld		a, (FSM_SpeedControl)
					or		a
					jr		z, FSM_MCS_Label_02			; Normal speed
					cp		1
					jr		nz, FSM_MCS_Label_01
					dec		c							; Speed up
					dec		a
					cp		c
					jr		nz, FSM_MCS_Label_02
FSM_MCS_Label_01:	inc		c							; Speed down
					;
FSM_MCS_Label_02:	ld		(ix+15), c					; Update speed for new state
					xor		a
					ld		(ix+16), a					
FSM_MCS_Label_03:	ld		a, (ix+2)
					and		%11111110
					or		(iy+2)
					ld		(ix+2), a					; Update normal / Rotated
					ld		a, (iy+4)
					ld		(ix+9), a					; Update width
					ld		a, (iy+5)
					ld		(ix+11), a					; Update scanlines
					ld		a, (iy+6)
					ld		(ix+3), a					; Update initial relative address for rotated mode
					ld		a, (iy+7)
					ld		(ix+4), a					; Update relative address decrement for rotated mode
					ld		a, (iy+11)
					ld		(ix+12), a				; Update sprite attribute
;
; Y correction
;
					call	T128_SPR_YB0
;
; X correction  
;
					ld		c, (iy+9)
					call	T128_SPR_XB0
;
; Calculate sprite address
;					
					ld		l, (iy)
					ld		h, (iy+1)
					pop		bc
					ld		a, b
					or		a
					jr		z, FSM_MCS_Label_05
					ld		e, (iy+8)
					ld		d, 0
;
; T128_MASKED_SPRITES=2 if masked sprites are used
;
IF T128_MASKED_SPRITES=2
					ex		de, hl
					add		hl, hl						; Sprite size is stored divided by 2 to ensure it fits in 1 byte
					ex		de, hl
ENDIF					

FSM_MCS_Label_04:	add		hl, de
					djnz	FSM_MCS_Label_04
FSM_MCS_Label_05:	ld		(ix), l
					ld		(ix+1), h					; Sprite address
;
; Time saving variables. They are used to avoid extra calls to FSM_GetStateParams in FSM_MainCharB0, FSM_IncPhase, FSM_DecPhase and FSM_MainCharXAnchorB0
;
					ld		a, (iy+3)
					ld		(FSM_StatePhases), a
					ld		a, (iy+9)
					ld		(FSM_StateXCorrect), a
					ld		c, (iy+12)
					ld		b, (iy+13)
					ld		(FSM_StateRoutine), bc
					ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_MainCharB0
;
; Manage Finite State Machine for Main Char
;
; If Main char is active then:
;   1. Run BEFOREFSM
;   2. Check state speed
;   3. Check Main Char with Breath Areas
;   4. Run KEYPRESSED / NOKEYPRESSED
;   5. Call FSM routine according to Main Char's state
;   6. Check if Main Char is killed
;
; Output:
;  NZ = If Main Char is killed
;    

FSM_MainCharB0:		ld		ix, T128_MainChar
					bit		6, (ix+2)
					ret		z							; Return if Main Char is not active (tipically, when Main Char is dead)
					xor		a
					ld		(T128_DeathBlkCol), a		; Unset Death Block Collision variable
;
; Control BEFOREFSM
;
					call	FSM_BEFOREFSM
;
; Check state speed
;
					ld		a, (ix+16)
					inc		a
					ld		(ix+16), a
					cp		(ix+15)						; Check speed counter with speed
;					ret		nz							; If speed is not reached, then return. No need to call FSM_MainCharSetupB0
					jp		nz, FSM_ISMAINCHARDEAD		; If speed is not reached, then check if Main char is killed. No need to call FSM_MainCharSetupB0
					xor		a							
					ld		(ix+16), a					; Reset speed counter		
					ld		(FSM_SolidColFlags), a		; Reset collision flags
;
; Check Main Char with Breath Areas
;					
					call	T128_BA_CheckB0				
;
; Control KEYPRESSED / NOKEYPRESSED
;
					ld		a, (T128_EventControl)
					cp		T128_EVENT_NULL_3S
					jr		nz, FSM_MC_Label_01
					call	FSM_NOKEYPRESSED
					jr		FSM_MC_Label_02
FSM_MC_Label_01:	call	FSM_KEYPRESSED
;
; Call FSM routine according to Main Char's state
; 					
FSM_MC_Label_02:	ld		hl, FSM_MC_Label_03			; Returning address
					push	hl							
					ld		hl, (FSM_StateRoutine)
					jp		(hl)						; Call FSM routine according to Perseus state
FSM_MC_Label_03:	call	FSM_MainCharSetupB0
;
; Check if Main Char is killed
;
					jp		FSM_ISMAINCHARDEAD
					

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_GetStateParams
;
; Get current state parameters
;
; Input:
;   ix = sprite address
;   a  = State
;
; Output
;   iy = parameters address
;

FSM_GetStateParams:	ld		l, a
					ld		h, 0
					add		hl,	hl						
					ld		e, l
					ld		d, h						; a * 2
					add		hl, hl
					ld		c, l
					ld		b, h						; a * 4
					add		hl, hl						; a * 8 
					add		hl, de
					add		hl, bc						; hl = a*8 + a*4 + a*2 = a * 14
					ld		c, l
					ld		b, h						; bc = a * 14
					ld		iy, FSM_StateParams
					add		iy, bc
					ret
					
					
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_IncPhase
;
; Increment phase number of current state. Check maximun number of phases in FSM_StateParams table
;
; Input:
;   ix = sprite address
;
; Output
;   b = new phase
;

FSM_IncPhase:		ld		a, (ix+14)
					inc		a
					ld		hl, FSM_StatePhases
					cp		(hl)
					jr		nz, FSM_IP_Label_01
					xor		a
FSM_IP_Label_01:	ld		b, a
					ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM_DecPhase
;
; Decrement phase number of current state. Check 0 and set maximun number of phases from FSM_StateParams table
;
; Input:
;   ix = sprite address
;
; Output
;   b = new phase
;

FSM_DecPhase:		ld		a, (ix+14)
					or		a
					jr		nz, FSM_DP_Label_01
					ld		a, (FSM_StatePhases)
FSM_DP_Label_01:	dec		a
					ld		b, a
					ret