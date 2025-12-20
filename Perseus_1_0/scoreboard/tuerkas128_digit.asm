;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; S C O R E B O A R D :   D I G I T
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; Font
;
SB_DigitsFont:		defb	48, 72, 132, 132, 132, 72, 48, 0	; 0
					defb	16, 48, 80, 16, 16, 16, 16, 0		; 1
					defb	56, 68, 4, 24, 96, 128, 252, 0		; 2
					defb	224, 24, 4, 124, 4, 24, 224, 0		; 3
					defb	132, 132, 132, 156, 228, 4, 4, 0	; 4
					defb	252, 128, 128, 112, 8, 68, 56, 0	; 5
					defb	8, 16, 48, 72, 132, 72, 48, 0		; 6
					defb	252, 4, 8, 8, 16, 16, 32, 0			; 7
					defb	120, 132, 72, 48, 72, 132, 120, 0	; 8
					defb	48, 72, 132, 72, 48, 32, 64, 0		; 9


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SB_DIGIT
;
; Render a digit on scoreboard
;
; Input
;  ix = GameVar address
;  b  = 0
;  a  = number of GameVar
;
SB_DIGIT:			ld		a, (ix+7)
					ld		l, a
					ld		h, (ix+8)
					or		h
					ret		z							; If there is no associated digital display, then return
					ld		b, (hl)						; b = number of digits
					inc		hl							; hl = Value (address)
					ld		e, (ix+3)
					ld		d, (ix+4)					; de = Screen address
;
; Render digital dislpay
;					
SBD_Loop_01:		push	bc
					ld		a, (hl)
					add		a, a
					add		a, a
					add		a, a
					ld		c, a
					ld		b, 0
					push	hl					
					ld		hl, SB_DigitsFont
					add		hl, bc						; hl = Font
;
; Render digit
;
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
					inc		de							; Next screen address
					pop		hl
					inc		hl							; Next digit
					pop		bc
					djnz 	SBD_Loop_01
					ret