;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; S P R I T E S :   F I S H   E Y E
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
; Moving: 3 phases 1x
;
					defb	0, 227, 28, 193, 38, 128, 67, 0, 67, 0, 39, 128, 62, 128, 28, 192

