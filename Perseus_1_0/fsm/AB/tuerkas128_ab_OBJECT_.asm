;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; O B J E C T   A B s '   F I N I T E   S T A T E   M A C H I N E 
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC _BEGIN_AB_FSM_OBJECT
_BEGIN_AB_FSM_OBJECT:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; AB_FSM_Object
;
; FSM for Object Animated Blocks
;
; Collsion with MainChar is computed by checking if bubble and Main Chr are overlapped
;
; If inactivity entity bit is set (bit 7 of byte 0 of entity data), then object is inactive. Do nothing
;
; If collision whith Main Char then
;    set inactivity entity bit and produce the sound associated to the object
;    set last object phase
; else
;    animate object
; end if
;
; Input:
;   ix = animated block info
;   iy = animated block definition table
;

AB_FSM_Object:		ld		l, (ix+13)
					ld		h, (ix+14)
					bit		7, (hl)						; check initivity entity bit
					ret		nz							; if Object is inactive, then return
;
					call 	T128_AB_GetABSize			; Get Animated block size
					call	T128_AB_CheckVert			; Check vertical collision with Main char
					jr		c, ABFSMO_Label_01			; No vertical collision if carry
					jr		z, ABFSMO_Label_01			; or zero
					call	T128_AB_CheckHor			; Check horizontal collision with Main char
					jr		c, ABFSMO_Label_01			; No vertical collision if carry
					jr		z, ABFSMO_Label_01			; or zero
					call	FSM_OBJECTALLOWED			; Check if Main char is in the appropiate state to collide with objects
					jr		nz, ABFSMO_Label_01			; If NZ is returned, then collision is not allowed
;
; Collision with Main Char
;					
					ld		a, (hl)
					set		7, a						; set inactivity entity bit
					ld		(hl), a
					call	T128_AB_GetDepInfo			; hl = GameVar info address for current object
					call	T128_UpdateGameVar			; Update GameVar
					; Play FX
					ld		a, (hl)						; a = FX number
					call	T128_AY_InitFXB0
					;
					ld		a, (iy)
					ld		(ix+3), a					; new phase = stop phase
					push	iy
					push	ix
					pop		iy
					call	T128_AB_PhaseParam			; Update duration and graphic address for current phase					
					pop		iy


					ret
;
; No collision with Main Char
;				
ABFSMO_Label_01:	jp	T128_AB_Animation				; Do animation cycle


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; AB_FSM_ObjectIS
;
; Calculate initial state and other parameters of a class Object AB
;
; If inactivity is not set in the object, then keep initial phase (0) so that the object can be Animated
; Otherwise, phase is set to STO phase
;
; Input:
;   ix = Address of screen entity data
;   iy = AB table in T128_ScreenAnimBlk
;
AB_FSM_ObjectIS:	ld		a, T128_ANIMBLK_ST_UP
					ld		(iy+4), a					; State
					ld		l, (iy+13)
					ld		h, (iy+14)
					bit		7, (hl)						; check initivity entity bit
					ret		z							; If inactivity is not set, then keep initial phase
					ld		l, (iy+6)
					ld		h, (iy+7)					; hl = animated block definition table
					ld		e, (hl)						; Initial phase = Phase STOP
					ld		(iy+3), e					
					ret					