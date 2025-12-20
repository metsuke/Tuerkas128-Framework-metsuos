;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; S P R I T E S :   B U L L Y   H O R N S
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
; Moving: 1 phases 4x1
;
					defb	0, 243, 12, 193, 56, 131, 112, 3, 124, 0, 63, 128, 15, 192, 0, 240
					defb	0, 255, 0, 255, 0, 255, 0, 255, 0, 255, 0, 255, 0, 255, 0, 255
					defb	0, 255, 0, 255, 0, 255, 0, 255, 0, 255, 0, 255, 0, 255, 0, 255
					defb	0, 207, 48, 131, 28, 193, 14, 192, 62, 0, 252, 1, 240, 3, 0, 15

