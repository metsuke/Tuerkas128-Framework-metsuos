;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Animated Blocks definition tables
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


AB_Pointers:		defw	AB_Pyre, AB_Torch, AB_Torch
					defw	AB_Bush
					defw	AB_Breath					; Breath Right
					defw	AB_Breath					; Breath Left
					defw	AB_Eolo						; Eolo Right
					defw	AB_Eolo						; Eolo Left
					defw	AB_Bottle, AB_Ray, AB_Knife, AB_Shield
					defw	AB_WindowShadow
					defw	AB_Ivy1
					defw	AB_String					; String right
					defw	AB_String					; String left
					defw	AB_Platf1
					defw	AB_FakeWall1L, AB_FakeWall1R
					defw	AB_EyeBig					; Eye Big Left
					defw	AB_EyeSmall					; Eye Small Left
					defw	AB_EyeBig					; Eye Big Right
					defw	AB_EyeSmall					; Eye Big Right
					defw	AB_CeilTrap1
					defw	AB_Spike1					; Spike Top 
					defw	AB_Spike2					; Spike Top Dark
					defw	AB_Spike1					; Spike Bottom
					defw	AB_Spike2					; Spike bottom Dark
					defw	AB_Trap1					; Yellow
					defw	AB_Platf2
					defw	AB_FallingPil
					defw	AB_Creek
					defw	AB_Snake, AB_SnakeHead		; Snake left
					defw	AB_Snake, AB_SnakeHead		; Snake right
					defw	AB_BreathPlant				; Breathing Plant Right
					defw	AB_BreathPlant				; Breathing Plant Left
					defw	AB_Arrrow, AB_Arrrow		; Arrow down and up
					defw	AB_Arrrow, AB_Arrrow		; Arrow right and left
					defw	AB_Trap2					; Cyan
					defw	AB_CeilTrap2, AB_CeilTrap3
					defw	AB_Trap3					; Red
					defw	AB_Trap4					; Green
					defw	AB_KnifeBL
					

					;;;;;;;;;
					; Pyre  ;
					;;;;;;;;;
AB_Pyre:			defb	4							; Number of animated phases (not including stop phases)
					defb	T128_AnimatedBlock_2x1		; Rendering routine
					defb	16							; Size of graphic (a single phase), in bytes
					defb	T128_ANIMBLK_UPFIRST		; Type of animation cycle
					defb	AB_ClassSimple				; Attribute Flag + Class of AB. If Attribute Flag = T128_AB_KEEPATTR then AB's attribute is used,
														; whether current screen has customized PAPER or not.
					; 
					; Attributes (N phases + 1 stop phase)
					;
					defb	T128_BLACK_RED, T128_BLACK_RED, T128_BLACK_RED_DK, T128_BLACK_RED, T128_BLACK_RED_DK
					; 
					; Hardness and depth (N phases + 1 stop phase)
					;
					defb	T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F
					; 
					; Duration  (N phases + 1 stop phase)
					;
					defb	4, 4, 4, 4, 4
					; 
					; Graphic data (N phases + 1 stop phase)
					;
					defb	0, 1, 2, 3, 4

					
					;;;;;;;;;;
					; Torch  ;
					;;;;;;;;;;
AB_Torch:			defb	4							; Number of animated phases (not including stop phase)
					defb	T128_AnimatedBlock_2x1		; Rendering routine
					defb	16							; Size of graphic (a single phase), in bytes
					defb	T128_ANIMBLK_UPFIRST		; Type of animation cycle
					defb	AB_ClassSimple				; Attribute Flag + Class of AB. If Attribute Flag = T128_AB_KEEPATTR then AB's attribute is used,
														; whether current screen has customized PAPER or not.
					; 
					; Attributes
					;
					defb	T128_BLACK_GREEN_DK, T128_BLACK_CYAN, T128_BLACK_GREEN_DK, T128_BLACK_CYAN, T128_BLACK_RED_DK
					; 
					; Hardness and depth
					;
					defb	T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F
					; 
					; Duration 
					;
					defb	4, 4, 4, 4, 4
					; 
					; Graphic data (N phases + 1 stop phase)
					;
					defb	0, 1, 2, 3, 4					

					
					;;;;;;;;
					; Bush ;
					;;;;;;;;
AB_Bush:			defb	3							; Number of animated phases (not including stop phases)
					defb	T128_AnimatedBlock_2x2		; Rendering routine
					defb	32							; Size of graphic (a single phase), in bytes
					defb	T128_ANIMBLK_UPDOWN			; Type of animation cycle
					defb	AB_ClassSimple				; Attribute Flag + Class of AB. If Attribute Flag = T128_AB_KEEPATTR then AB's attribute is used,
														; whether current screen has customized PAPER or not.
					; 
					; Attributes (N phases + 1 stop phase)
					;
					defb	T128_BLACK_GREEN, T128_BLACK_GREEN, T128_BLACK_GREEN, T128_BLACK_GREEN
					; 
					; Hardness and depth (N phases + 1 stop phase)
					;
					defb	T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F
					; 
					; Duration  (N phases + 1 stop phase)
					;
					defb	4, 4, 4, 4
					; 
					; Graphic data (N phases + 1 stop phase)
					;
					defb	0, 1, 2, 2

					
					;;;;;;;;;;
					; Breath ;
					;;;;;;;;;;
AB_Breath:			defb	10							; Number of animated phases (not including stop phases)
					defb	T128_AnimatedBlock_2x2		; Rendering routine
					defb	32							; Size of graphic (a single phase), in bytes
					defb	T128_ANIMBLK_UPDOWN			; Type of animation cycle
					defb	AB_ClassSimple				; Attribute Flag + Class of AB. If Attribute Flag = T128_AB_KEEPATTR then AB's attribute is used,
														; whether current screen has customized PAPER or not.
					; 
					; Attributes (N phases + 1 stop phase)
					;
					defb	T128_BLACK_WHITE, T128_BLACK_WHITE, T128_BLACK_WHITE, T128_BLACK_WHITE, T128_BLACK_WHITE, T128_BLACK_WHITE, T128_BLACK_WHITE, T128_BLACK_WHITE, T128_BLACK_WHITE, T128_BLACK_WHITE, T128_BLACK_WHITE
					; 
					; Hardness and depth (N phases + 1 stop phase)
					;
					defb	T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_B
					; 
					; Duration  (N phases + 1 stop phase)
					;
					defb	128, 1, 1, 1, 2, 2, 2, 4, 4, 4, 0
					; 
					; Graphic data (N phases + 1 stop phase)
					;
					defb	0, 1, 2, 3, 4, 5, 6, 7, 8, 5, 255


					;;;;;;;;
					; Eolo ;
					;;;;;;;;
AB_Eolo:			defb	7							; Number of animated phases (not including stop phases)
					defb	T128_AnimatedBlock_1x2		; Rendering routine
					defb	16							; Size of graphic (a single phase), in bytes
					defb	T128_ANIMBLK_UPFIRST		; Type of animation cycle
					defb	AB_ClassSimple				; Attribute Flag + Class of AB. If Attribute Flag = T128_AB_KEEPATTR then AB's attribute is used,
														; whether current screen has customized PAPER or not.
					; 
					; Attributes (N phases + 1 stop phase)
					;
					defb	T128_BLACK_CYAN, T128_BLACK_CYAN, T128_BLACK_CYAN, T128_BLACK_CYAN, T128_BLACK_CYAN, T128_BLACK_CYAN, T128_BLACK_CYAN, T128_BLACK_CYAN
					; 
					; Hardness and depth (N phases + 1 stop phase)
					;
					defb	T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID
					; 
					; Duration  (N phases + 1 stop phase)
					;
					defb	100, 4, 22, 4, 2, 30, 4, 0
					; 
					; Graphic data (N phases + 1 stop phase)
					;
					defb	0, 1, 0, 2, 3, 4, 3, 255					


					;;;;;;;;;;
					; Bottle ;
					;;;;;;;;;;
AB_Bottle:			defb	4							; Number of animated phases (not including stop phases)
					defb	T128_AnimatedBlock_1x2		; Rendering routine
					defb	16							; Size of graphic (a single phase), in bytes
					defb	T128_ANIMBLK_UPFIRST		; Type of animation cycle
					defb	AB_ClassObject				; Attribute Flag + Class of AB. If Attribute Flag = T128_AB_KEEPATTR then AB's attribute is used,
														; whether current screen has customized PAPER or not.
					; 
					; Attributes (N phases + 1 stop phase)
					;
					defb	T128_BLACK_GREEN_DK, T128_BLACK_GREEN_DK, T128_BLACK_GREEN_DK, T128_BLACK_GREEN_DK, T128_BLACK_WHITE
					; 
					; Hardness and depth (N phases + 1 stop phase)
					;
					defb	T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_B
					; 
					; Duration  (N phases + 1 stop phase)
					;
					defb	4, 4, 3, 1, 128
					; 
					; Graphic data (N phases + 1 stop phase)
					;
					defb	0, 1, 2, 2, 3
					; CLASS DEPENDANT
					defw	T128_GameVar08				; GameVar
					defb	T128_GAMEVAR_SET8, 32		; Operation and parameter
					defb	T128_AY_FX_POWERUP			; FX number


					;;;;;;;;;;
					; Ray    ;
					;;;;;;;;;;
AB_Ray:				defb	3							; Number of animated phases (not including stop phases)
					defb	T128_AnimatedBlock_1x2		; Rendering routine
					defb	16							; Size of graphic (a single phase), in bytes
					defb	T128_ANIMBLK_UPFIRST		; Type of animation cycle
					defb	AB_ClassObject				; Attribute Flag + Class of AB. If Attribute Flag = T128_AB_KEEPATTR then AB's attribute is used,
														; whether current screen has customized PAPER or not.
					; 
					; Attributes (N phases + 1 stop phase)
					;
					defb	T128_BLACK_YELLOW_DK, T128_BLACK_YELLOW, T128_BLACK_YELLOW_DK, T128_BLACK_WHITE
					; 
					; Hardness and depth (N phases + 1 stop phase)
					;
					defb	T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_B
					; 
					; Duration  (N phases + 1 stop phase)
					;
					defb	3, 3, 3, 128
					; 
					; Graphic data (N phases + 1 stop phase)
					;
					defb	0, 1, 2, 3
					; CLASS DEPENDANT
					defw	T128_GameVar01				; GameVar
					defb	T128_GAMEVAR_SET8, 1		; Operation and parameter
					defb	T128_AY_FX_POWERUP			; FX number


					;;;;;;;;;;
					; Knife  ;
					;;;;;;;;;;
AB_Knife:			defb	4							; Number of animated phases (not including stop phases)
					defb	T128_AnimatedBlock_2x1		; Rendering routine
					defb	16							; Size of graphic (a single phase), in bytes
					defb	T128_ANIMBLK_UPDOWN			; Type of animation cycle
					defb	AB_ClassObject				; Attribute Flag + Class of AB. If Attribute Flag = T128_AB_KEEPATTR then AB's attribute is used,
														; whether current screen has customized PAPER or not.
					; 
					; Attributes (N phases + 1 stop phase)
					;
					defb	T128_BLACK_CYAN_DK, T128_BLACK_CYAN, T128_BLACK_CYAN_DK, T128_BLACK_WHITE_DK, T128_BLACK_WHITE
					; 
					; Hardness and depth (N phases + 1 stop phase)
					;
					defb	T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_B
					; 
					; Duration  (N phases + 1 stop phase)
					;
					defb	3, 3, 2, 1, 128
					; 
					; Graphic data (N phases + 1 stop phase)
					;
					defb	0, 1, 2, 2, 3
					; CLASS DEPENDANT
					defw	T128_GameVar11				; GameVar
					defb	T128_GAMEVAR_ADDDEC, T128_DISPLAY_000001 + 5	; Operation and parameter
					defb	T128_AY_FX_POWERUP			; FX number


					;;;;;;;;;;
					; Shield ;
					;;;;;;;;;;
AB_Shield:			defb	4							; Number of animated phases (not including stop phases)
					defb	T128_AnimatedBlock_2x2		; Rendering routine
					defb	32							; Size of graphic (a single phase), in bytes
					defb	T128_ANIMBLK_UPFIRST		; Type of animation cycle
					defb	AB_ClassObject				; Attribute Flag + Class of AB. If Attribute Flag = T128_AB_KEEPATTR then AB's attribute is used,
														; whether current screen has customized PAPER or not.
					; 
					; Attributes (N phases + 1 stop phase)
					;
					defb	T128_BLACK_CYAN_DK, T128_BLACK_CYAN, T128_BLACK_CYAN_DK, T128_BLACK_CYAN_DK, T128_BLACK_WHITE
					; 
					; Hardness and depth (N phases + 1 stop phase)
					;
					defb	T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_B
					; 
					; Duration  (N phases + 1 stop phase)
					;
					defb	3, 3, 3, 3, 128
					; 
					; Graphic data (N phases + 1 stop phase)
					;
					defb	0, 1, 2, 3, 4
					; CLASS DEPENDANT
					defw	T128_GameVar00				; GameVar
					defb	T128_GAMEVAR_SET8, $ff		; Operation and parameter
					defb	T128_AY_FX_POWERUP			; FX number


					;;;;;;;;;;;;;;;;;
					; Window Shadow ;
					;;;;;;;;;;;;;;;;;
AB_WindowShadow		defb	10							; Number of animated phases (not including stop phase)
					defb	T128_AnimatedBlock_2x2		; Rendering routine
					defb	32							; Size of graphic (a single phase), in bytes
					defb	T128_ANIMBLK_UPFIRST		; Type of animation cycle
					defb	AB_ClassSimple				; Attribute Flag + Class of AB. If Attribute Flag = T128_AB_KEEPATTR then AB's attribute is used,
														; whether current screen has customized PAPER or not.
					; 
					; Attributes
					;
					defb	T128_BLACK_RED_DK, T128_BLACK_RED_DK, T128_BLACK_RED_DK, T128_BLACK_RED_DK, T128_BLACK_RED_DK, T128_BLACK_RED_DK, T128_BLACK_RED_DK, T128_BLACK_RED_DK, T128_BLACK_RED_DK, T128_BLACK_RED_DK, T128_BLACK_RED_DK
					; 
					; Hardness and depth (N phases + 1 stop phase)
					;
					defb	T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_B
					; 
					; Duration (N phases + 1 stop phase)
					;
					defb	128, 4, 4, 4, 4, 32, 4, 4, 4, 4, 255
					; 
					; Graphic data (N phases + 1 stop phase)
					;
					defb	0, 1, 2, 3, 4, 0, 5, 6, 7, 8, 0


					;;;;;;;;;;
					; Ivy 1  ;
					;;;;;;;;;;
AB_Ivy1				defb	3							; Number of animated phases (not including stop phase)
					defb	T128_AnimatedBlock_2x2		; Rendering routine
					defb	32							; Size of graphic (a single phase), in bytes
					defb	T128_ANIMBLK_UPDOWN			; Type of animation cycle
					defb	AB_ClassSimple				; Attribute Flag + Class of AB. If Attribute Flag = T128_AB_KEEPATTR then AB's attribute is used,
														; whether current screen has customized PAPER or not.
					; 
					; Attributes
					;
					defb	T128_BLACK_BLUE, T128_BLACK_BLUE, T128_BLACK_BLUE, T128_BLACK_BLUE
					; 
					; Hardness and depth
					;
					defb	T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F
					; 
					; Duration 
					;
					defb	4, 4, 4, 0
					; 
					; Graphic data (N phases + 1 stop phase)
					;
					defb	0, 1, 2, 255


					;;;;;;;;;;
					; String ;
					;;;;;;;;;;
AB_String:			defb	4							; Number of animated phases (not including stop phases)
					defb	T128_AnimatedBlock_1x2		; Rendering routine
					defb	16							; Size of graphic (a single phase), in bytes
					defb	0							; Type of animation cycle
					defb	AB_ClassBubble				; Attribute Flag + Class of AB. If Attribute Flag = T128_AB_KEEPATTR then AB's attribute is used,
														; whether current screen has customized PAPER or not.
					; 
					; Attributes (N phases + 1 stop phase)
					;
					defb	T128_BLACK_YELLOW_DK, T128_BLACK_YELLOW_DK, T128_BLACK_YELLOW_DK, T128_BLACK_YELLOW_DK, T128_BLACK_YELLOW_DK
					; 
					; Hardness and depth (N phases + 1 stop phase)
					;
					defb	T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F
					; 
					; Duration  (N phases + 1 stop phase)
					;
					defb	4, 2, 2, 2, 0
					; 
					; Graphic data (N phases + 1 stop phase)
					;
					defb	0, 1, 2, 3, 4
					; CLASS DEPENDANT
					defb	T128_AY_FX_STRING			; FX number
					
					
					;;;;;;;;;;;;;;
					; Platform 1 ;
					;;;;;;;;;;;;;;
AB_Platf1:			defb	4							; Number of animated phases (not including stop phases)
					defb	T128_AnimatedBlock_2x1		; Rendering routine
					defb	16							; Size of graphic (a single phase), in bytes
					defb	T128_ANIMBLK_UPDOWN			; Type of animation cycle
					defb	AB_ClassSimple				; Attribute Flag + Class of AB. If Attribute Flag = T128_AB_KEEPATTR then AB's attribute is used,
														; whether current screen has customized PAPER or not.
					; 
					; Attributes (N phases + 1 stop phase)
					;
					defb	T128_BLACK_WHITE, T128_BLACK_YELLOW_DK, T128_BLACK_YELLOW_DK, T128_BLACK_YELLOW_DK, T128_BLACK_WHITE
					; 
					; Hardness and depth (N phases + 1 stop phase)
					;
					defb	T128_BLOCK_DEPTH_B,  T128_BLOCK_PLATFORM + T128_BLOCK_DEPTH_F, T128_BLOCK_PLATFORM + T128_BLOCK_DEPTH_F, T128_BLOCK_PLATFORM + T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_B
					; 
					; Duration  (N phases + 1 stop phase)
					;
					defb	64, 4, 4, 128, 0
					; 
					; Graphic data (N phases + 1 stop phase)
					;
					defb	3, 0, 1, 2, 3

					
					
					;;;;;;;;;;;;;;;;;
					; Fake Wall 1 L ;
					;;;;;;;;;;;;:;;:;
AB_FakeWall1L:		defb	5							; Number of animated phases (not including stop phases)
					defb	T128_AnimatedBlock_1x4		; Rendering routine
					defb	32							; Size of graphic (a single phase), in bytes
					defb	0							; Type of animation cycle
					defb	AB_ClassGate				; Attribute Flag + Class of AB. If Attribute Flag = T128_AB_KEEPATTR then AB's attribute is used,
														; whether current screen has customized PAPER or not.
					; 
					; Attributes (N phases + 1 stop phase)
					;
					defb	T128_BLACK_YELLOW_DK, T128_BLACK_YELLOW_DK, T128_BLACK_YELLOW_DK, T128_BLACK_YELLOW_DK, T128_BLACK_WHITE, T128_BLACK_YELLOW_DK
					; 
					; Hardness and depth (N phases + 1 stop phase)
					;
					defb	T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID
					; 
					; Duration  (N phases + 1 stop phase)
					;
					defb	16, 4, 4, 4, 4, 0
					; 
					; Graphic data (N phases + 1 stop phase)
					;
					defb	4, 0, 1, 2, 3, 4
					; CLASS DEPENDANT
					defb	T128_AY_FX_GATE				; FX number					

					
					;;;;;;;;;;;;;;;;;
					; Fake Wall 1 R ;
					;;;;;;;;;;;;:;;:;
AB_FakeWall1R:		defb	5							; Number of animated phases (not including stop phases)
					defb	T128_AnimatedBlock_1x4		; Rendering routine
					defb	32							; Size of graphic (a single phase), in bytes
					defb	0							; Type of animation cycle
					defb	AB_ClassGate				; Attribute Flag + Class of AB. If Attribute Flag = T128_AB_KEEPATTR then AB's attribute is used,
														; whether current screen has customized PAPER or not.
					; 
					; Attributes (N phases + 1 stop phase)
					;
					defb	T128_BLACK_GREEN_DK, T128_BLACK_GREEN_DK, T128_BLACK_GREEN_DK, T128_BLACK_GREEN_DK, T128_BLACK_WHITE, T128_BLACK_GREEN_DK
					; 
					; Hardness and depth (N phases + 1 stop phase)
					;
					defb	T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID
					; 
					; Duration  (N phases + 1 stop phase)
					;
					defb	16, 4, 4, 4, 4, 0
					; 
					; Graphic data (N phases + 1 stop phase)
					;
					defb	4, 0, 1, 2, 3, 4
					; CLASS DEPENDANT
					defb	T128_AY_FX_GATE				; FX number					
					
					
					;;;;;;;;;;;
					; Eye Big ;
					;;;;;;;;;;;
AB_EyeBig			defb	8							; Number of animated phases (not including stop phase)
					defb	T128_AnimatedBlock_2x2		; Rendering routine
					defb	32							; Size of graphic (a single phase), in bytes
					defb	T128_ANIMBLK_UPFIRST		; Type of animation cycle
					defb	AB_ClassSimple				; Attribute Flag + Class of AB. If Attribute Flag = T128_AB_KEEPATTR then AB's attribute is used,
														; whether current screen has customized PAPER or not.
					; 
					; Attributes
					;
					defb	T128_BLACK_WHITE_DK, T128_BLACK_WHITE_DK, T128_BLACK_WHITE_DK, T128_BLACK_WHITE_DK, T128_BLACK_WHITE_DK, T128_BLACK_WHITE_DK, T128_BLACK_WHITE_DK, T128_BLACK_WHITE_DK, T128_BLACK_WHITE_DK
					; 
					; Hardness and depth
					;
					defb	T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F
					; 
					; Duration 
					;
					defb	32, 2, 2, 32, 4, 32, 2, 2, 0
					; 
					; Graphic data (N phases + 1 stop phase)
					;
					defb	0, 1, 2, 3, 2, 3, 2, 1, 255


					;;;;;;;;;;;;;
					; Eye Small ;
					;;;;;;;;;;;;;
AB_EyeSmall			defb	8							; Number of animated phases (not including stop phase)
					defb	T128_AnimatedBlock_1x1		; Rendering routine
					defb	8							; Size of graphic (a single phase), in bytes
					defb	T128_ANIMBLK_UPFIRST		; Type of animation cycle
					defb	AB_ClassSimple				; Attribute Flag + Class of AB. If Attribute Flag = T128_AB_KEEPATTR then AB's attribute is used,
														; whether current screen has customized PAPER or not.
					; 
					; Attributes
					;
					defb	T128_BLACK_WHITE, T128_BLACK_WHITE, T128_BLACK_GREEN_DK, T128_BLACK_GREEN_DK, T128_BLACK_GREEN_DK, T128_BLACK_GREEN_DK, T128_BLACK_GREEN_DK, T128_BLACK_WHITE_DK, T128_BLACK_GREEN_DK
					; 
					; Hardness and depth
					;
					defb	T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_F
					; 
					; Duration 
					;
					defb	32, 2, 2, 32, 4, 32, 2, 2, 0
					; 
					; Graphic data (N phases + 1 stop phase)
					;
					defb	0, 0, 1, 2, 1, 2, 1, 0, 255

					
					;;;;;;;;;;;;;;;;
					; Ceil Trap 1  ;
					;;;;;;;;;;;;;;;;
AB_CeilTrap1:		defb	5							; Number of animated phases (not including stop phases)
					defb	T128_AnimatedBlock_2x1		; Rendering routine
					defb	16							; Size of graphic (a single phase), in bytes
					defb	T128_ANIMBLK_UPDOWN			; Type of animation cycle
					defb	AB_ClassSimple				; Attribute Flag + Class of AB. If Attribute Flag = T128_AB_KEEPATTR then AB's attribute is used,
														; whether current screen has customized PAPER or not.
					; 
					; Attributes (N phases + 1 stop phase)
					;
					defb	T128_BLACK_YELLOW_DK, T128_BLACK_YELLOW_DK, T128_BLACK_YELLOW_DK, T128_BLACK_YELLOW_DK, T128_BLACK_WHITE, T128_BLACK_YELLOW_DK
					; 
					; Hardness and depth (N phases + 1 stop phase)
					;
					defb	T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_B
					; 
					; Duration  (N phases + 1 stop phase)
					;
					defb	64, 4, 4, 4, 16, 0
					; 
					; Graphic data (N phases + 1 stop phase)
					;
					defb	0, 1, 2, 3, 4, 255

					
					;;;;;;;;;;;
					; Spike 1 ;
					;;;;;;;;;;;
AB_Spike1:			defb	3							; Number of animated phases (not including stop phases)
					defb	T128_AnimatedBlock_2x1		; Rendering routine
					defb	16							; Size of graphic (a single phase), in bytes
					defb	0							; Type of animation cycle
					defb	AB_ClassGate				; Attribute Flag + Class of AB. If Attribute Flag = T128_AB_KEEPATTR then AB's attribute is used,
														; whether current screen has customized PAPER or not.
					; 
					; Attributes (N phases + 1 stop phase)
					;
					defb	T128_BLACK_WHITE, T128_BLACK_WHITE, T128_BLACK_RED, T128_BLACK_WHITE
					; 
					; Hardness and depth (N phases + 1 stop phase)
					;
					defb	T128_BLOCK_DEPTH_B, T128_BLOCK_DEATH + T128_BLOCK_DEPTH_B, T128_BLOCK_DEATH + T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_B
					; 
					; Duration  (N phases + 1 stop phase)
					;
					defb	4, 4, 4, 0
					; 
					; Graphic data (N phases + 1 stop phase)
					;
					defb	0, 1, 2, 3
					; CLASS DEPENDANT
					defb	T128_AY_FX_GATE				; FX number					

					
					;;;;;;;;;;;
					; Spike 2 ;
					;;;;;;;;;;;
AB_Spike2:			defb	3							; Number of animated phases (not including stop phases)
					defb	T128_AnimatedBlock_2x1		; Rendering routine
					defb	16							; Size of graphic (a single phase), in bytes
					defb	0							; Type of animation cycle
					defb	AB_ClassGate				; Attribute Flag + Class of AB. If Attribute Flag = T128_AB_KEEPATTR then AB's attribute is used,
														; whether current screen has customized PAPER or not.
					; 
					; Attributes (N phases + 1 stop phase)
					;
					defb	T128_BLACK_WHITE, T128_BLACK_WHITE, T128_BLACK_RED_DK, T128_BLACK_WHITE
					; 
					; Hardness and depth (N phases + 1 stop phase)
					;
					defb	T128_BLOCK_DEPTH_B, T128_BLOCK_DEATH + T128_BLOCK_DEPTH_B, T128_BLOCK_DEATH + T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_B
					; 
					; Duration  (N phases + 1 stop phase)
					;
					defb	4, 4, 4, 0
					; 
					; Graphic data (N phases + 1 stop phase)
					;
					defb	0, 1, 2, 3
					; CLASS DEPENDANT
					defb	T128_AY_FX_GATE				; FX number					
					
					
					;;;;;;;;;;
					; Trap 1 ;
					;;;;;;;;;;
AB_Trap1:			defb	3							; Number of animated phases (not including stop phases)
					defb	T128_AnimatedBlock_2x1		; Rendering routine
					defb	16							; Size of graphic (a single phase), in bytes
					defb	0							; Type of animation cycle
					defb	T128_AB_KEEPATTR + AB_ClassButton 	; Attribute Flag + Class of AB. If Attribute Flag = T128_AB_KEEPATTR then AB's attribute is used,
														; whether current screen has customized PAPER or not.
					; 
					; Attributes (N phases + 1 stop phase)
					;
					defb	T128_BLACK_YELLOW_DK, T128_BLACK_YELLOW_DK, T128_BLACK_YELLOW_DK, T128_BLACK_YELLOW_DK
					; 
					; Hardness and depth (N phases + 1 stop phase)
					;
					defb	T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID
					; 
					; Duration  (N phases + 1 stop phase)
					;
					defb	2, 2, 2, 0
					; 
					; Graphic data (N phases + 1 stop phase)
					;
					defb	0, 1, 0, 2
					; CLASS DEPENDANT
					defb	T128_AY_FX_TRAP				; FX number
					
					
					;;;;;;;;;;;;;;
					; Platform 2 ;
					;;;;;;;;;;;;;;
AB_Platf2:			defb	4							; Number of animated phases (not including stop phases)
					defb	T128_AnimatedBlock_2x1		; Rendering routine
					defb	16							; Size of graphic (a single phase), in bytes
					defb	T128_ANIMBLK_UPDOWN			; Type of animation cycle
					defb	AB_ClassSimple				; Attribute Flag + Class of AB. If Attribute Flag = T128_AB_KEEPATTR then AB's attribute is used,
														; whether current screen has customized PAPER or not.
					; 
					; Attributes (N phases + 1 stop phase)
					;
					defb	T128_BLACK_WHITE, T128_BLACK_BLUE, T128_BLACK_BLUE, T128_BLACK_BLUE, T128_BLACK_WHITE
					; 
					; Hardness and depth (N phases + 1 stop phase)
					;
					defb	T128_BLOCK_DEPTH_B,  T128_BLOCK_PLATFORM + T128_BLOCK_DEPTH_F, T128_BLOCK_PLATFORM + T128_BLOCK_DEPTH_F, T128_BLOCK_PLATFORM + T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_B
					; 
					; Duration  (N phases + 1 stop phase)
					;
					defb	64, 4, 4, 128, 0
					; 
					; Graphic data (N phases + 1 stop phase)
					;
					defb	3, 0, 1, 2, 3


					;;;;;;;;;;;;;;;;;;
					; Falling Pillar ;
					;;;;;;;;;;;;:;;;:;
AB_FallingPil:		defb	5							; Number of animated phases (not including stop phases)
					defb	T128_AnimatedBlock_1x4		; Rendering routine
					defb	32							; Size of graphic (a single phase), in bytes
					defb	0							; Type of animation cycle
					defb	AB_ClassGate				; Attribute Flag + Class of AB. If Attribute Flag = T128_AB_KEEPATTR then AB's attribute is used,
														; whether current screen has customized PAPER or not.
					; 
					; Attributes (N phases + 1 stop phase)
					;
					defb	T128_BLACK_WHITE, T128_BLACK_YELLOW_DK, T128_BLACK_YELLOW_DK, T128_BLACK_YELLOW_DK, T128_BLACK_YELLOW_DK, T128_BLACK_WHITE
					; 
					; Hardness and depth (N phases + 1 stop phase)
					;
					defb	T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_B + T128_BLOCK_DEATH, T128_BLOCK_DEPTH_F + T128_BLOCK_DEATH, T128_BLOCK_DEPTH_F + T128_BLOCK_DEATH, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_B
					; 
					; Duration  (N phases + 1 stop phase)
					;
					defb	20, 4, 3, 2, 1, 0
					; 
					; Graphic data (N phases + 1 stop phase)
					;
					defb	4, 0, 1, 2, 3, 4
					; CLASS DEPENDANT
					defb	T128_AY_FX_GATE				; FX number					
					
					
					;;;;;;;;;;
					; Creek  ;
					;;;;;;;;;;
AB_Creek:			defb	3							; Number of animated phases (not including stop phases)
					defb	T128_AnimatedBlock_3x1		; Rendering routine
					defb	24							; Size of graphic (a single phase), in bytes
					defb	T128_ANIMBLK_UPDOWN			; Type of animation cycle
					defb	T128_AB_KEEPATTR + AB_ClassSimple 	; Attribute Flag + Class of AB. If Attribute Flag = T128_AB_KEEPATTR then AB's attribute is used,
														; whether current screen has customized PAPER or not.
					; 
					; Attributes (N phases + 1 stop phase)
					;
					defb	T128_BLUE_CYAN_DK, T128_BLUE_CYAN_DK, T128_BLUE_CYAN_DK, T128_BLUE_CYAN_DK
					; 
					; Hardness and depth (N phases + 1 stop phase)
					;
					defb	T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F
					; 
					; Duration  (N phases + 1 stop phase)
					;
					defb	4, 4, 4, 0
					; 
					; Graphic data (N phases + 1 stop phase)
					;
					defb	0, 1, 2, 3					
					
					
					;;;;;;;;;
					; Snake ;
					;;;;;;;;;
AB_Snake:			defb	8							; Number of animated phases (not including stop phases)
					defb	T128_AnimatedBlock_1x3		; Rendering routine
					defb	24							; Size of graphic (a single phase), in bytes
					defb	T128_ANIMBLK_UPDOWN			; Type of animation cycle
					defb	AB_ClassSimple				; Attribute Flag + Class of AB. If Attribute Flag = T128_AB_KEEPATTR then AB's attribute is used,
														; whether current screen has customized PAPER or not.
					; 
					; Attributes (N phases + 1 stop phase)
					;
					defb	T128_BLACK_WHITE, T128_BLACK_RED_DK, T128_BLACK_RED_DK, T128_BLACK_RED_DK, T128_BLACK_RED_DK, T128_BLACK_RED_DK, T128_BLACK_RED_DK, T128_BLACK_RED_DK, T128_BLACK_WHITE
					; 
					; Hardness and depth (N phases + 1 stop phase)
					;
					defb	T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_B
					; 
					; Duration  (N phases + 1 stop phase)
					;
					defb	64, 6, 6, 6, 6, 4, 4, 4, 255
					; 
					; Graphic data (N phases + 1 stop phase)
					;
					defb	0, 1, 2, 3, 4, 5, 4, 5, 0					
					
					
					;;;;;;;;;;;;;;
					; Snake head ;
					;;;;;;;;;;;;;;
AB_SnakeHead:		defb	6							; Number of animated phases (not including stop phases)
					defb	T128_AnimatedBlock_2x2		; Rendering routine
					defb	32							; Size of graphic (a single phase), in bytes
					defb	T128_ANIMBLK_UPDOWN			; Type of animation cycle
					defb	AB_ClassSimple				; Attribute Flag + Class of AB. If Attribute Flag = T128_AB_KEEPATTR then AB's attribute is used,
														; whether current screen has customized PAPER or not.
					; 
					; Attributes (N phases + 1 stop phase)
					;
					defb	T128_BLACK_WHITE, T128_BLACK_WHITE, T128_BLACK_RED_DK, T128_BLACK_RED_DK, T128_BLACK_RED_DK, T128_BLACK_RED_DK, T128_BLACK_WHITE
					; 
					; Hardness and depth (N phases + 1 stop phase)
					;
					defb	T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_B + T128_BLOCK_DEATH, T128_BLOCK_DEPTH_B + T128_BLOCK_DEATH, T128_BLOCK_DEPTH_B + T128_BLOCK_DEATH, T128_BLOCK_DEPTH_B
					; 
					; Duration  (N phases + 1 stop phase)
					;
					defb	64, 18, 6, 4, 4, 4, 255
					; 
					; Graphic data (N phases + 1 stop phase)
					;
					defb	0, 0, 1, 2, 3, 2, 0										
					
					
					;;;;;;;;;;;;;;;;;;;
					; Breathing Plant ;
					;;;;;;;;;;;;;;;;;;;
AB_BreathPlant:		defb	7							; Number of animated phases (not including stop phases)
					defb	T128_AnimatedBlock_1x2		; Rendering routine
					defb	16							; Size of graphic (a single phase), in bytes
					defb	T128_ANIMBLK_UPFIRST		; Type of animation cycle
					defb	AB_ClassSimple				; Attribute Flag + Class of AB. If Attribute Flag = T128_AB_KEEPATTR then AB's attribute is used,
														; whether current screen has customized PAPER or not.
					; 
					; Attributes (N phases + 1 stop phase)
					;
					defb	T128_BLACK_GREEN_DK, T128_BLACK_GREEN_DK, T128_BLACK_GREEN_DK, T128_BLACK_GREEN_DK, T128_BLACK_GREEN_DK, T128_BLACK_GREEN_DK, T128_BLACK_GREEN_DK, T128_BLACK_GREEN_DK
					; 
					; Hardness and depth (N phases + 1 stop phase)
					;
					defb	T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID
					; 
					; Duration  (N phases + 1 stop phase)
					;
					defb	100, 4, 22, 4, 2, 30, 4, 0
					; 
					; Graphic data (N phases + 1 stop phase)
					;
					defb	0, 1, 0, 2, 3, 4, 3, 255					


					;;;;;;;;;
					; Arrow ;
					;;;;;;;;;
AB_Arrrow:			defb	2							; Number of animated phases (not including stop phases)
					defb	T128_AnimatedBlock_1x1		; Rendering routine
					defb	8							; Size of graphic (a single phase), in bytes
					defb	T128_ANIMBLK_UPFIRST		; Type of animation cycle
					defb	AB_ClassSimple				; Attribute Flag + Class of AB. If Attribute Flag = T128_AB_KEEPATTR then AB's attribute is used,
														; whether current screen has customized PAPER or not.
					; 
					; Attributes (N phases + 1 stop phase)
					;
					defb	T128_BLACK_RED_DK, T128_BLACK_RED_DK, T128_BLACK_RED_DK
					; 
					; Hardness and depth (N phases + 1 stop phase)
					;
					defb	T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F, T128_BLOCK_DEPTH_F
					; 
					; Duration  (N phases + 1 stop phase)
					;
					defb	4, 2, 0
					; 
					; Graphic data (N phases + 1 stop phase)
					;
					defb	0, 1, 255					
					
					
					;;;;;;;;;;
					; Trap 2 ;
					;;;;;;;;;;
AB_Trap2:			defb	3							; Number of animated phases (not including stop phases)
					defb	T128_AnimatedBlock_2x1		; Rendering routine
					defb	16							; Size of graphic (a single phase), in bytes
					defb	0							; Type of animation cycle
					defb	T128_AB_KEEPATTR + AB_ClassButton 	; Attribute Flag + Class of AB. If Attribute Flag = T128_AB_KEEPATTR then AB's attribute is used,
														; whether current screen has customized PAPER or not.
					; 
					; Attributes (N phases + 1 stop phase)
					;
					defb	T128_BLUE_CYAN_DK, T128_BLUE_CYAN_DK, T128_BLUE_CYAN_DK, T128_BLUE_CYAN_DK
					; 
					; Hardness and depth (N phases + 1 stop phase)
					;
					defb	T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID
					; 
					; Duration  (N phases + 1 stop phase)
					;
					defb	2, 2, 2, 0
					; 
					; Graphic data (N phases + 1 stop phase)
					;
					defb	0, 1, 0, 2
					; CLASS DEPENDANT
					defb	T128_AY_FX_TRAP				; FX number					
					
					
					;;;;;;;;;;;;;;;;
					; Ceil Trap 2  ;
					;;;;;;;;;;;;;;;;
AB_CeilTrap2:		defb	5							; Number of animated phases (not including stop phases)
					defb	T128_AnimatedBlock_2x1		; Rendering routine
					defb	16							; Size of graphic (a single phase), in bytes
					defb	T128_ANIMBLK_UPDOWN			; Type of animation cycle
					defb	AB_ClassSimple				; Attribute Flag + Class of AB. If Attribute Flag = T128_AB_KEEPATTR then AB's attribute is used,
														; whether current screen has customized PAPER or not.
					; 
					; Attributes (N phases + 1 stop phase)
					;
					defb	T128_BLACK_RED_DK, T128_BLACK_RED_DK, T128_BLACK_RED_DK, T128_BLACK_RED_DK, T128_BLACK_WHITE, T128_BLACK_RED_DK
					; 
					; Hardness and depth (N phases + 1 stop phase)
					;
					defb	T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_B
					; 
					; Duration  (N phases + 1 stop phase)
					;
					defb	64, 4, 4, 4, 16, 0
					; 
					; Graphic data (N phases + 1 stop phase)
					;
					defb	0, 1, 2, 3, 4, 255

					
					;;;;;;;;;;;;;;;;
					; Ceil Trap 3  ;
					;;;;;;;;;;;;;;;;
AB_CeilTrap3:		defb	5							; Number of animated phases (not including stop phases)
					defb	T128_AnimatedBlock_2x1		; Rendering routine
					defb	16							; Size of graphic (a single phase), in bytes
					defb	T128_ANIMBLK_UPDOWN			; Type of animation cycle
					defb	AB_ClassSimple				; Attribute Flag + Class of AB. If Attribute Flag = T128_AB_KEEPATTR then AB's attribute is used,
														; whether current screen has customized PAPER or not.
					; 
					; Attributes (N phases + 1 stop phase)
					;
					defb	T128_BLACK_GREEN_DK, T128_BLACK_GREEN_DK, T128_BLACK_GREEN_DK, T128_BLACK_GREEN_DK, T128_BLACK_WHITE, T128_BLACK_GREEN_DK
					; 
					; Hardness and depth (N phases + 1 stop phase)
					;
					defb	T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_B
					; 
					; Duration  (N phases + 1 stop phase)
					;
					defb	64, 4, 4, 4, 16, 0
					; 
					; Graphic data (N phases + 1 stop phase)
					;
					defb	0, 1, 2, 3, 4, 255


					;;;;;;;;;;
					; Trap 3 ;
					;;;;;;;;;;
AB_Trap3:			defb	3							; Number of animated phases (not including stop phases)
					defb	T128_AnimatedBlock_2x1		; Rendering routine
					defb	16							; Size of graphic (a single phase), in bytes
					defb	0							; Type of animation cycle
					defb	T128_AB_KEEPATTR + AB_ClassButton 	; Attribute Flag + Class of AB. If Attribute Flag = T128_AB_KEEPATTR then AB's attribute is used,
														; whether current screen has customized PAPER or not.
					; 
					; Attributes (N phases + 1 stop phase)
					;
					defb	T128_BLACK_RED_DK, T128_BLACK_RED_DK, T128_BLACK_RED_DK, T128_BLACK_RED_DK
					; 
					; Hardness and depth (N phases + 1 stop phase)
					;
					defb	T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID
					; 
					; Duration  (N phases + 1 stop phase)
					;
					defb	2, 2, 2, 0
					; 
					; Graphic data (N phases + 1 stop phase)
					;
					defb	0, 1, 0, 2
					; CLASS DEPENDANT
					defb	T128_AY_FX_TRAP				; FX number					


					;;;;;;;;;;
					; Trap 4 ;
					;;;;;;;;;;
AB_Trap4:			defb	3							; Number of animated phases (not including stop phases)
					defb	T128_AnimatedBlock_2x1		; Rendering routine
					defb	16							; Size of graphic (a single phase), in bytes
					defb	0							; Type of animation cycle
					defb	T128_AB_KEEPATTR + AB_ClassButton 	; Attribute Flag + Class of AB. If Attribute Flag = T128_AB_KEEPATTR then AB's attribute is used,
														; whether current screen has customized PAPER or not.
					; 
					; Attributes (N phases + 1 stop phase)
					;
					defb	T128_BLACK_GREEN_DK, T128_BLACK_GREEN_DK, T128_BLACK_GREEN_DK, T128_BLACK_GREEN_DK
					; 
					; Hardness and depth (N phases + 1 stop phase)
					;
					defb	T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID, T128_BLOCK_DEPTH_F + T128_BLOCK_SOLID
					; 
					; Duration  (N phases + 1 stop phase)
					;
					defb	2, 2, 2, 0
					; 
					; Graphic data (N phases + 1 stop phase)
					;
					defb	0, 1, 0, 2
					; CLASS DEPENDANT
					defb	T128_AY_FX_TRAP				; FX number					


					;;;;;;;;;;;;;;;;;;;;
					; Knife BackLiight ;
					;;;;;;;;;;;;;;;;;;;;
AB_KnifeBL:			defb	2							; Number of animated phases (not including stop phases)
					defb	T128_AnimatedBlock_2x1		; Rendering routine
					defb	16							; Size of graphic (a single phase), in bytes
					defb	T128_ANIMBLK_UPDOWN			; Type of animation cycle
					defb	AB_ClassObject				; Attribute Flag + Class of AB. If Attribute Flag = T128_AB_KEEPATTR then AB's attribute is used,
														; whether current screen has customized PAPER or not.
					; 
					; Attributes (N phases + 1 stop phase)
					;
					defb	T128_BLACK_RED_DK, T128_BLACK_RED_DK, T128_BLACK_RED_DK
					; 
					; Hardness and depth (N phases + 1 stop phase)
					;
					defb	T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_B, T128_BLOCK_DEPTH_B
					; 
					; Duration  (N phases + 1 stop phase)
					;
					defb	4, 4, 128
					; 
					; Graphic data (N phases + 1 stop phase)
					;
					defb	0, 1, 2
					; CLASS DEPENDANT
					defw	T128_GameVar11				; GameVar
					defb	T128_GAMEVAR_ADDDEC, T128_DISPLAY_000001 + 5	; Operation and parameter
					defb	T128_AY_FX_POWERUP			; FX number
