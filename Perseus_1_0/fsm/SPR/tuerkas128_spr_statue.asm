;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; S T A T U E S '  F I N I T E   S T A T E   M A C H I N E 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC _BEGIN_SPR_FSM_STATUE
_BEGIN_SPR_FSM_STATUE:

;
; Parameters
;
SPR_STATUE_ZPOS		EQU		T128_SPR_FOREGROUND2
;
; States
;
SPR_STATUE_NORMAL	EQU		0
SPR_STATUE_MOV_DOWN	EQU		1
SPR_StatueParams	defb	T128_SPR_X_OFF, T128_SPR_NORMAL		
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
; SPR_FSM_Statue
;
; FSM for statues
;
; If state = SPR_STATUE_NORMAL (initial state) then
;    Change rotation of the sprite depending on the relative x position of the main char
;    If Statue collides with Main Char then
;       If Coins>=50 then
;         produce sound
;         change state to SPR_STATUE_MOV_DOWN
;         set SPR_PARAM.COUNTER1 = SPR_PARAM.HEIGHT_PIXELS
;       else
;         return
;       end if
;    else
;       return
;    end if
;  else
;    if SPR_PARAM.COUNTER1 != 0 then
;       decrement SPR_PARAM.COUNTER1
;       increment SPR_PARAM.y and correct Y coordinate
;       return
;    else
;       substract 50 coins
;       activate next piece of parchment
;       kill sprite
;       set inactivity bit of sprite on map
;       return
;    end if
;  end if
;
; Rotation from SPR_StatueParams will be used only when the statue is created. Bit 0 of SPR_PARAM.FLAGS is updated in this routine, so SPR_SpriteSetup
; cannot be used here. That is why T128_SPR_YB0 is called directly to correct Y coordinate using y coordinate
;
; Input:
;   ix = sprite info
;

SPR_FSM_Statue:		ld		a, (ix+SPR_PARAM.STATE)
					cp		SPR_STATUE_NORMAL
					jr		nz, SPRFSMS_Label_02
;
; Normal behaviour (T128_SPR_NORMAL)
; 					
					ld		b, T128_SPR_NORMAL
					ld		iy, T128_MainChar
					ld		a, (ix+SPR_PARAM.x)
					add		a, 8
					; CHECK WHERE IS PERSEUS							
					cp		(iy+SPR_PARAM.x)
					jr		nc, SPRFSMS_Label_01
					ld		b, T128_SPR_ROTATE
SPRFSMS_Label_01:	ld		a, (ix+SPR_PARAM.FLAGS)
					and		%111111110
					or		b
					ld		(ix+SPR_PARAM.FLAGS), a		; Rotate statue, so that it looks toward Perseus
					; CHECK COLLSIION WITH PERSEUS
					call	SPR_CollisionAll
					ret		z							; If no collision, then return
					; CHECK 50 COINS
					ld		de, T128_GameVar12
					ld		b, T128_DISPLAY_000010 + 5	; 50 coins
					call	T128_CompareDisplay
					ret		c							; If Coins < 50, then return
					; SOUND
					ld 		a, T128_AY_FX_STATUE		; FX number
					call	T128_AY_InitFXB0					
					; SET NEW STATE AND SET COUNTER
					ld		a, SPR_STATUE_MOV_DOWN
					ld		(ix+SPR_PARAM.STATE), a		; New state
					ld		a, (ix+SPR_PARAM.HEIGHT_PIXELS)
					ld		(ix+SPR_PARAM.COUNTER1), a	; Init counter
					ret
;
; Move statue down (SPR_STATUE_MOV_DOWN)
; 					
SPRFSMS_Label_02:	ld		a, (ix+SPR_PARAM.COUNTER1)
					or		a
					jr		z, SPRFSMS_Label_03
					dec		(ix+SPR_PARAM.COUNTER1)
					inc		(ix+SPR_PARAM.y)
					jp		T128_SPR_YB0
					; SUBSTRACT 50 COINS
SPRFSMS_Label_03:	ld		de, T128_GameVar12
					ld		b, T128_DISPLAY_000010 + 5	; 50 coins
					ld		a, T128_GAMEVAR_SUBDEC
					call	T128_UpdateGameVar2
					; ACTIVATE NEXT PIECE OF PARCHMENT
					ld		hl, T128_GameVar13
					ld		a, (hl)
					inc		(hl)						; Next keyword
					ld		b, a
					add		a, a
					add		a, a
					add		a, a
					add		a, b						; a = a * 9
					ld		c, a
					ld		b, 0
					ld		hl, T128_GameVar02
					add		hl, bc
					ex		de, hl
					ld		b, $ff
					ld		a, T128_GAMEVAR_SET8
					call	T128_UpdateGameVar2		
					; KILL STATUE
					call	SPR_SetInactive				; Set inactivity bit, so that Statue will not be spawned next time Perseus goes back to current screen					
					jp		SPR_KillSprite				; Kill statue					
					

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SPR_FSM_StatueIS
;
; Calculate initial state of a sprite of class Statue: Phase ONE
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
SPR_FSM_StatueIS:	ld		de, SPR_StatueParams		; State parameters table for Statues
					xor		a							; Initial state
					ret					


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SPR_FSM_StatueIS2
;
; Calculate other initial parameters of a sprite of class Statue: Phase TWO
;
; Input:
;   iy = Pointer to basic info structure (as in T128_ScreenSprPool or in SPR_ScreenSprPool)
;   ix = Sprite table in T128_ScreenSprites
;
SPR_FSM_StatueIS2:	ld		a, (ix+SPR_PARAM.FLAGS)
					and		%11111001
					or		SPR_STATUE_ZPOS
					ld		(ix+SPR_PARAM.FLAGS), a		; BACKGOUND / FOREGROUND
					push	iy
					call	SPR_FSM_Statue
					pop		iy
					ret					