;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; S C O R E B O A R D :   B A R
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; 1-char bar 
;
SB_BarFont:			defb	0, 0, 0, 0, 0, 0, 0, 0		; width = 0
					defb	0, 0, 0, 64, 64, 64, 64, 64	; width = 1
					defb	0, 0, 0, 64, 64, 64, 64, 64	; width = 2
					defb	0, 0, 0, 80, 80, 80, 80, 80	; width = 3
					defb	0, 0, 0, 80, 80, 80, 80, 80	; width = 4
					defb	0, 0, 0, 84, 84, 84, 84, 84	; width = 5
					defb	0, 0, 0, 84, 84, 84, 84, 84	; width = 6
					defb	0, 0, 0, 85, 85, 85, 85, 85	; width = 7
					defb	0, 0, 0, 85, 85, 85, 85, 85	; width = 8

SB_BAR_CHARS		EQU		4							; Width of the bar (number of chars)
SB_BarDigits:		defs	SB_BAR_CHARS


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SB_BAR
;
; Render a bar on scoreboard
;   Width = SB_BAR_CHARS chars
;   Height = 1 char
;
; Input
;  ix = GameVar address
;  b  = 0
;  a  = number of GameVar
;		
SB_BAR:				ld		a, SB_BAR_CHARS
					ld		b, a
					dec		a
					add		a, a
					add		a, a
					add		a, a
					ld		c, a
;
; Setup bar
;					
					ld		hl, SB_BarDigits
					ld		e, 8
SBB_Loop_01:		ld		(hl), e
					inc		hl
					djnz	SBB_Loop_01
					dec		hl
					ld		d, b						; d = 0
					ld		e, (ix)						; e = GameVar value
;
; Calculate actual bar
; 					
SBB_Loop_02:		ld		a, e
					cp		c
					jr		c, SBB_Label_01
					jr		z, SBB_Label_01
					sub		c
					ld		(hl), a
					jr		SBB_Label_02
SBB_Label_01:		ld		(hl), d
					ld		a, c
					or		a
					jr		z, SBB_Label_02
					sub		8
					ld		c, a
					dec		hl
					jr		SBB_Loop_02
;
; Render bar 
;					
SBB_Label_02:		ld		e, (ix+3)
					ld		d, (ix+4)					; de = Screen address
					exx
					ld		hl, SB_BarDigits
					ld		b, SB_BAR_CHARS
SBB_Loop_03:		ld		a, (hl)
					exx
					add		a, a
					add		a, a
					add		a, a
					ld		c, a
					ld		b, 0
					ld		hl, SB_BarFont
					add		hl, bc						; hl = Font
					push	de
					ld		a, (hl)						; Byte 0
					ld		(de), a
					inc		hl
					inc		d					
					ld		a, (hl)						; Byte 1
					ld		(de), a
					inc		hl
					inc		d					
					ld		a, (hl)						; Byte 2
					ld		(de), a
					inc		hl
					inc		d					
					ld		a, (hl)						; Byte 3
					ld		(de), a
					inc		hl
					inc		d					
					ld		a, (hl)						; Byte 4
					ld		(de), a
					inc		hl
					inc		d					
					ld		a, (hl)						; Byte 5
					ld		(de), a
					inc		hl
					inc		d					
					ld		a, (hl)						; Byte 6
					ld		(de), a
					inc		hl
					inc		d					
					ld		a, (hl)						; Byte 7
					ld		(de), a
					pop		de
					inc 	de
					exx
					inc		hl
					djnz	SBB_Loop_03
					exx
					ret