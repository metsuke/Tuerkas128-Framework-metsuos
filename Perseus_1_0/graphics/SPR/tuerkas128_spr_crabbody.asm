;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; S P R I T E S :   C R A B   B O D Y
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
					defb	39, 0, 92, 0, 43, 0, 87, 0, 49, 128, 34, 128, 68, 17, 68, 17
					defb	228, 0, 58, 0, 212, 0, 234, 0, 140, 1, 68, 1, 34, 136, 34, 136

					defb	39, 0, 92, 0, 43, 0, 87, 0, 49, 128, 34, 128, 34, 136, 34, 136
					defb	228, 0, 58, 0, 212, 0, 234, 0, 140, 1, 68, 1, 68, 17, 68, 17





