;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; S C O R E B O A R D :   I C O N 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 
; Icon table:
;
; For every GameVar there must be a line in SB_ICON_Table
; Thus to save memory, it is a good practice that all GameVars of type ICON are defined at the top of the GameVar definitions
; 

SB_ICON_Table:		defw	SB_ICON_AttrInvOn, SB_ICON_GraphInvOn, SB_ICON_AttrInvOff, SB_ICON_GraphInvOff		; GameVar00
					defw	SB_ICON_AttrSpdOn, SB_ICON_GraphSpdOn, SB_ICON_AttrSpdOff, SB_ICON_GraphSpdOff		; GameVar01
					defw	SB_ICON_AttrKW1On, SB_ICON_GraphKW1On, SB_ICON_AttrKW1Off, SB_ICON_GraphKW1Off		; GameVar02
					defw	SB_ICON_AttrKW2On, SB_ICON_GraphKW2On, SB_ICON_AttrKW2Off, SB_ICON_GraphKW2Off		; GameVar03
					defw	SB_ICON_AttrKW3On, SB_ICON_GraphKW3On, SB_ICON_AttrKW3Off, SB_ICON_GraphKW3Off		; GameVar04
					defw	SB_ICON_AttrKW4On, SB_ICON_GraphKW4On, SB_ICON_AttrKW4Off, SB_ICON_GraphKW4Off		; GameVar05
					defw	SB_ICON_AttrKW5On, SB_ICON_GraphKW5On, SB_ICON_AttrKW5Off, SB_ICON_GraphKW5Off		; GameVar06
					defw	SB_ICON_AttrKW6On, SB_ICON_GraphKW6On, SB_ICON_AttrKW6Off, SB_ICON_GraphKW6Off		; GameVar07


SB_ICON_AttrInvOn	defb	T128_BLACK_CYAN, T128_BLACK_CYAN, T128_BLACK_CYAN_DK, T128_BLACK_CYAN_DK
SB_ICON_GraphInvOn	defb	0, 0, 6, 5, 4, 5, 5, 5, 5, 5, 5, 2, 1, 0, 0, 0
					defb	0, 0, 12, 20, 228, 4, 212, 164, 196, 164, 68, 136, 16, 224, 0, 0
SB_ICON_AttrInvOff	defb	T128_BLACK_WHITE_DK, T128_BLACK_WHITE_DK, T128_BLACK_WHITE_DK, T128_BLACK_WHITE_DK
SB_ICON_GraphInvOff	defb	0, 0, 6, 0, 4, 0, 5, 5, 0, 5, 0, 2, 0, 0, 0, 0
					defb	0, 0, 12, 0, 164, 0, 84, 36, 0, 36, 0, 136, 0, 224, 0, 0

SB_ICON_AttrSpdOn	defb	T128_BLACK_YELLOW, T128_BLACK_YELLOW, T128_BLACK_YELLOW_DK, T128_BLACK_YELLOW_DK
SB_ICON_GraphSpdOn	defb	0, 0, 0, 0, 0, 1, 2, 2, 1, 0, 0, 1, 2, 4, 0, 0
					defb	0, 0, 36, 76, 152, 48, 96, 112, 56, 156, 152, 48, 96, 192, 0, 0
SB_ICON_AttrSpdOff	defb	T128_BLACK_WHITE_DK, T128_BLACK_WHITE_DK, T128_BLACK_WHITE_DK, T128_BLACK_WHITE_DK
SB_ICON_GraphSpdOff	defb	0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 1, 0, 6, 0, 0
					defb	0, 0, 52, 0, 200, 0, 32, 144, 0, 212, 0, 144, 0, 64, 0, 0

SB_ICON_AttrKW1On	defb	T128_BLACK_YELLOW_DK, T128_BLACK_YELLOW_DK
SB_ICON_GraphKW1On	defb	0, 0, 141, 214, 191, 127, 62, 28, 60, 92, 62, 127, 255, 150, 1, 0
SB_ICON_AttrKW1Off	defb	T128_BLACK_WHITE_DK, T128_BLACK_WHITE_DK
SB_ICON_GraphKW1Off	defb	0, 0, 137, 84, 170, 85, 42, 20, 40, 84, 42, 85, 170, 20, 1, 0

SB_ICON_AttrKW2On	defb	T128_BLACK_YELLOW_DK, T128_BLACK_YELLOW_DK
SB_ICON_GraphKW2On	defb	0, 0, 12, 159, 223, 255, 6, 236, 236, 236, 30, 255, 221, 137, 0, 0
SB_ICON_AttrKW2Off	defb	T128_BLACK_WHITE_DK, T128_BLACK_WHITE_DK
SB_ICON_GraphKW2Off	defb	0, 0, 8, 21, 138, 85, 2, 68, 168, 68, 10, 85, 136, 1, 0, 0

SB_ICON_AttrKW3On	defb	T128_BLACK_YELLOW_DK, T128_BLACK_YELLOW_DK
SB_ICON_GraphKW3On	defb	0, 0, 23, 47, 191, 255, 28, 233, 233, 233, 28, 255, 239, 87, 139, 0
SB_ICON_AttrKW3Off	defb	T128_BLACK_WHITE_DK, T128_BLACK_WHITE_DK
SB_ICON_GraphKW3Off	defb	0, 0, 2, 5, 170, 85, 8, 65, 168, 65, 8, 85, 170, 85, 138, 0

SB_ICON_AttrKW4On	defb	T128_BLACK_YELLOW_DK, T128_BLACK_YELLOW_DK
SB_ICON_GraphKW4On	defb	0, 0, 195, 231, 119, 127, 51, 211, 211, 211, 57, 127, 127, 210, 129, 0
SB_ICON_AttrKW4Off	defb	T128_BLACK_WHITE_DK, T128_BLACK_WHITE_DK
SB_ICON_GraphKW4Off	defb	0, 0, 130, 69, 34, 85, 34, 81, 130, 81, 40, 85, 42, 80, 128, 0

SB_ICON_AttrKW5On	defb	T128_BLACK_YELLOW_DK, T128_BLACK_YELLOW_DK
SB_ICON_GraphKW5On	defb	0, 0, 131, 215, 239, 255, 133, 59, 59, 59, 133, 255, 251, 209, 32, 0
SB_ICON_AttrKW5Off	defb	T128_BLACK_WHITE_DK, T128_BLACK_WHITE_DK
SB_ICON_GraphKW5Off	defb	0, 0, 130, 85, 170, 85, 128, 17, 42, 17, 128, 85, 170, 81, 32, 0

SB_ICON_AttrKW6On	defb	T128_BLACK_YELLOW_DK, T128_BLACK_YELLOW_DK
SB_ICON_GraphKW6On	defb	0, 0, 64, 136, 248, 240, 224, 192, 208, 240, 240, 248, 240, 152, 0, 0
SB_ICON_AttrKW6Off	defb	T128_BLACK_WHITE_DK, T128_BLACK_WHITE_DK
SB_ICON_GraphKW6Off	defb	0, 0, 64, 0, 168, 80, 160, 64, 128, 80, 160, 80, 160, 16, 0, 0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SB_ICON
;
; Render an icon on scoreboard
; If the Gamevar is equal to 0, then it is rendered the OFF version of the ICON. Otherwise, it is rendered the ON version
;
; Input
;  ix = GameVar address
;  b  = 0
;  a  = number of GameVar
;		
SB_ICON				add		a, a
					add		a, a
					add		a, a
					ld		c, a
					ld		iy, SB_ICON_Table
					add		iy, bc
					ld		a, (ix)
					or		a
					jr		nz, SBI_Label_01			; GameVar is On
					ld		bc, 4	
					add		iy, bc						; GameVar is Off
SBI_Label_01:		ld		e, (iy+2)
					ld		d, (iy+3)					; de = Graphic data
					ld		l, (ix+3)
					ld		h, (ix+4)					; hl = Screen address
					push	hl
					exx
					pop		hl
					ld		a, h
					rrca
					rrca
					rrca
					and		3
					or		$58
					ld		h, a						; hl' = Attribute address
					ld		e, (iy)
					ld		d, (iy+1)					; de' = Attribute data
					ld		bc, 32
					exx
;					
					ld		c, (ix+5)
					ld		a, c
					and		%00001111
					inc		a							
					ld		b, a						; b = Rows
					ld		a, c
					and		%11110000
					rrca
					rrca
					rrca
					rrca
					inc		a							
					ld		c, a						; c = Columns
;
; Render b Rows x c Columns
;					
SBI_Loop_01:		push	bc
					push	hl
					exx
					push	hl
					exx
SBI_Loop_02:		ld		a, (de)						; Render graphic
					ld		(hl), a
					inc		h
					inc		de
					ld		a, (de)
					ld		(hl), a
					inc		h
					inc		de
					ld		a, (de)
					ld		(hl), a
					inc		h
					inc		de
					ld		a, (de)
					ld		(hl), a
					inc		h
					inc		de
					ld		a, (de)
					ld		(hl), a
					inc		h
					inc		de
					ld		a, (de)
					ld		(hl), a
					inc		h
					inc		de
					ld		a, (de)
					ld		(hl), a
					inc		h
					inc		de
					ld		a, (de)
					ld		(hl), a
					inc		h
					inc		de
					ld		a, l
					add		a, $20						
					ld		l, a						
					jr		c, SBI_Label_02
					ld		a, h
					sub		$08							
					ld		h, a						
SBI_Label_02:		exx									; Render attribute
					ld		a, (de)
					inc		de
					ld		(hl), a
					add		hl, bc
					exx
					djnz	SBI_Loop_02					; Finish rows
					exx
					pop		hl
					inc		hl							; Next column for attribute
					exx
					pop		hl							; Next column for graphic
					inc		hl
					pop		bc
					dec		c
					jr		nz, SBI_Loop_01				; Finish columns
					ret