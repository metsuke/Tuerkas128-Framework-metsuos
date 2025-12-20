;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; S P R I T E S :   F A L L I N G   1
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
; Moving: 1 phase 2x2
;
					defb	0, 254, 1, 192, 60, 128, 122, 0, 125, 0, 122, 0, 63, 128, 30, 192, 63, 128, 95, 0, 127, 0, 127, 0, 125, 0, 42, 128, 20, 192, 0, 227
					defb	0, 7, 232, 3, 212, 1, 232, 1, 244, 1, 250, 0, 116, 0, 250, 0, 244, 0, 250, 0, 212, 0, 170, 0, 84, 1, 168, 3, 0, 7, 0, 255


					













