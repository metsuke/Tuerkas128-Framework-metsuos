;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; S P R I T E S :   P U F 1 C H A R
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
; Moving: 3 phases 1x1
;
					defb	0, 211, 44, 129, 94, 0, 126, 0, 124, 1, 94, 0, 52, 129, 0, 203
					
					defb	0, 255, 0, 207, 48, 135, 40, 131, 24, 195, 24, 195, 0, 231, 0, 255

					defb	0, 255, 0, 255, 0, 247, 8, 227, 24, 195, 0, 231, 0, 255, 0, 255
					
					



