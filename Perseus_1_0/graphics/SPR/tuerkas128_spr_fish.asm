;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; S P R I T E S :   F I S H
;
; For each column, every scanline of the column is stored in pairs graphic/mask,
; first 1 byte for the graphic, then 1 byte for the mask
;
; For example, an sprite two columns wide and 8 scanlines tall:
;
; G11 M11  G12 M12  G13 M13  G14 M14  G15 M15  G16 M16  G17 M17  G18 M18
;
; G21 M21  G22 M22  G23 M23  G24 M24  G25 M25  G26 M26  G27 M27  G28 M28
; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;
; Moving: 3 phases 1x2
;
					defb	0, 167, 88, 3, 220, 1, 92, 1, 94, 0, 94, 0, 222, 0, 238, 0, 238, 0, 254, 0, 30, 0, 236, 1, 252, 1, 56, 3, 216, 3, 240, 7

					defb	0, 167, 72, 3, 204, 1, 76, 1, 78, 0, 78, 0, 206, 0, 238, 0, 238, 0, 254, 0, 14, 0, 244, 1, 252, 1, 24, 3, 232, 3, 240, 7

					defb	0, 191, 64, 27, 196, 17, 68, 17, 70, 16, 70, 16, 198, 16, 198, 16, 238, 0, 254, 0, 6, 0, 248, 1, 252, 1, 8, 3, 240, 3, 240, 7



