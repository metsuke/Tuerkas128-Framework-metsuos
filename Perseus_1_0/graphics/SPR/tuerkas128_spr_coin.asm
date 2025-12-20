;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; S P R I T E S :   C O I N
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
					defb	0, 255, 0, 231, 89, 130, 60, 129, 126, 0, 126, 0, 60, 129, 89, 130

					defb	2, 253, 0, 243, 76, 161, 30, 192, 63, 128, 191, 0, 30, 192, 12, 225

					defb	34, 209, 12, 225, 30, 192, 63, 128, 63, 128, 158, 64, 12, 225, 1, 242

					defb	32, 199, 24, 195, 61, 128, 126, 0, 126, 0, 60, 129, 25, 194, 64, 167

					








					
				












