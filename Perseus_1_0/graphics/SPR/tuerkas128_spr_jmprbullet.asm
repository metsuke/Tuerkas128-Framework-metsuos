;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; S P R I T E S :   J U M P E R   B U L L E T
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
; Moving: 2 phases 2x1
;
					defb	0, 241, 14, 224, 28, 192, 60, 128, 125, 0, 107, 0, 218, 0, 75, 0
					defb	0, 220, 34, 136, 103, 0, 206, 0, 220, 1, 88, 3, 208, 3, 76, 1
					
					defb	0, 217, 38, 128, 108, 0, 106, 0, 109, 0, 43, 0, 220, 0, 213, 0
					defb	0, 209, 40, 129, 108, 1, 204, 0, 222, 0, 90, 0, 235, 0, 109, 0














