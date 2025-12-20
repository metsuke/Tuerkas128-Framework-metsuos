;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; S P R I T E S :   F R O G   B E L L Y
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
					defb	88, 0, 180, 0, 122, 0, 181, 0, 90, 0, 189, 0, 79, 0, 32, 0
					defb	26, 0, 37, 0, 206, 0, 13, 0, 154, 0, 61, 0, 242, 0, 4, 0

					defb	75, 0, 183, 0, 122, 0, 181, 0, 90, 0, 189, 0, 79, 0, 160, 0
					defb	226, 0, 229, 0, 206, 0, 13, 0, 154, 0, 61, 0, 242, 0, 5, 0








