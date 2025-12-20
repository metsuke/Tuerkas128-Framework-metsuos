;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; S P R I T E S :   M O R M O   E Y E
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
; Moving: 4 phases 1x1
;
					defb	3, 128, 121, 0, 124, 0, 102, 0, 34, 128, 50, 128, 28, 192, 1, 224

					defb	1, 192, 60, 128, 62, 128, 51, 128, 17, 192, 25, 192, 14, 224, 1, 240

					defb	0, 224, 30, 192, 31, 192, 25, 192, 8, 224, 12, 224, 7, 240, 0, 248

					defb	1, 192, 60, 128, 62, 128, 51, 128, 17, 192, 25, 192, 14, 224, 1, 240









