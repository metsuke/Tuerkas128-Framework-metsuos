;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Sprite definition tables
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
					
SPR_Pointers:		defw	SPR_Walker2x4 				; SPR_Skeleton
					defw	SPR_Walker2x3 				; SPR_Cyclop
					defw	SPR_Walker2x4 				; SPR_Minotaurus
					defw	SPR_Vortex
					defw	SPR_Square
					defw	SPR_Ball
					defw	SPR_Mouth, SPR_MouthDOWN
					defw	SPR_Blade, SPR_BladeIN
					defw	SPR_WingL, SPR_WingR
					defw	SPR_Screw
					defw	SPR_WlkBullet
					defw	SPR_EnmyDeath01
					defw	SPR_Debris01
					defw	SPR_Statue3x4				; SPR_Discobolus
					defw	SPR_Statue3x3				; SPR_Sphinx					
					defw	SPR_Walker2x4 				; SPR_Satyr
					defw	SPR_WlkBulletL2, SPR_WlkBulletR2, SPR_WlkBulletR
					defw	SPR_CrabBody, SPR_CrabEyes, SPR_CrabClaws
					defw	SPR_BullyBody, SPR_BullyEyes, SPR_BullyHorns
					defw	SPR_JmprBullet
					defw	SPR_Puf1Char
					defw	SPR_Coin
					defw	SPR_Statue3x4				; SPR_Pegasus
					defw	SPR_EyeBulletLD, SPR_EyeBulletLDfire, SPR_EyeBulletRD, SPR_EyeBulletRDfire
					defw	SPR_Falling1
					defw	SPR_Knife
					defw	SPR_FrogBody, SPR_FrogEyes, SPR_FrogBelly
					defw	SPR_Walker2x4 				; SPR_Graia	
					defw	SPR_MormoLeft, SPR_MormoRight, SPR_MormoEye
					defw	SPR_Walker2x3 				; SPR_Dwarf
					defw	SPR_EnmyDeath02
					defw	SPR_Dead
					defw	SPR_PortalGlass
					defw	SPR_Fish, SPR_FishBack, SPR_FishEye

					;;;;;;;;;;;;;;
					; Walker 2x4 ;
					;;;;;;;;;;;;;;
SPR_Walker2x4:		defb	192							; Size of graphic (a single phase), in bytes
					defb	0							; Attribute
					defb	T128_SPR_WIDTH_3			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_16			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_32			; Sprite height (in scanlines)
					defb	50							; Min time to respawn
					defb	SPR_WLKR_MINX/2*16 + 0		; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_ClassWalker				; Class of sprite
					defb	(T128_SPR_WIDTH_3-1)*T128_SPR_HEIGHT_32*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_32*2*2		; Relative address decrement for rotated mode = scanlines*2*2	
					defb	%00100000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas					
					defb	$ff, 00, 00					; Child sprite #1 (type, delta x, delta y)
					defb	$ff, 00, 00					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00000001					; Speed of movement of animation
					defb	3							; Number of punchings to kill Walker
	
	
					;;;;;;;;;;;;;;;;;;;;;;;;
					; Vortex and Vortex BL ;
					;;;;;;;;;;;;;;;;;;;;;;;;
SPR_Vortex:			defb	64							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_MAGENTA_DK		; Attribute										
					defb	T128_SPR_WIDTH_2			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_16			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_16			; Sprite height (in scanlines)
					defb	50							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_ClassCycle				; Class of sprite
					defb	(T128_SPR_WIDTH_2-1)*T128_SPR_HEIGHT_16*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_16*2*2		; Relative address decrement for rotated mode = scanlines*2*2
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas
					defb	$ff, 00, 00					; Child sprite #1 (type, delta x, delta y)
					defb	$ff, 00, 00					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00000001					; Speed of movement					
					defb	%00000001					; Speed of animation
					defb	4							; Number of phases of animation
	
	
					;;;;;;;;;;
					; Square ;
					;;;;;;;;;;
SPR_Square:			defb	64							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_MAGENTA_DK		; Attribute										
					defb	T128_SPR_WIDTH_2			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_16			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_16			; Sprite height (in scanlines)
					defb	50							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_ClassCycle				; Class of sprite
					defb	(T128_SPR_WIDTH_2-1)*T128_SPR_HEIGHT_16*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_16*2*2		; Relative address decrement for rotated mode = scanlines*2*2
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas
					defb	$ff, 00, 00					; Child sprite #1 (type, delta x, delta y)
					defb	$ff, 00, 00					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00000011					; Speed of movement
					defb	%00000001					; Speed of animation
					defb	4							; Number of phases of animation					


					;;;;;;;;;;;;;;;;;;;;
					; Ball and Ball BL ;
					;;;;;;;;;;;;;;;;;;;;
SPR_Ball:			defb	64							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_RED				; Attribute										
					defb	T128_SPR_WIDTH_2			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_16			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_16			; Sprite height (in scanlines)
					defb	50							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_ClassCycle				; Class of sprite
					defb	(T128_SPR_WIDTH_2-1)*T128_SPR_HEIGHT_16*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_16*2*2		; Relative address decrement for rotated mode = scanlines*2*2
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas
					defb	$ff, 00, 00					; Child sprite #1 (type, delta x, delta y)
					defb	$ff, 00, 00					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00000001					; Speed of movement
					defb	%00000001					; Speed of animation
					defb	4							; Number of phases of animation					


					;;;;;;;;;
					; Mouth ;
					;;;;;;;;;
SPR_Mouth:			defb	64							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_YELLOW			; Attribute										
					defb	T128_SPR_WIDTH_2			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_16			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_16			; Sprite height (in scanlines)
					defb	50							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_ClassCycle				; Class of sprite
					defb	(T128_SPR_WIDTH_2-1)*T128_SPR_HEIGHT_16*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_16*2*2		; Relative address decrement for rotated mode = scanlines*2*2	
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas															
					defb	T128_SPRITE_MOUTH_DOWN, 0, 16 ; Child sprite #1 (type, delta x, delta y)
					defb	$ff,  0, 0					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00000011					; Speed of movement
					defb	%00000011					; Speed of animation
					defb	4							; Number of phases of animation					
	
	
					;;;;;;;;;;;;;;
					; Mouth DOWN ;
					;;;;;;;;;;;;;;
SPR_MouthDOWN:		defb	32							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_GREEN_DK			; Attribute										
					defb	T128_SPR_WIDTH_2			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_16			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_8			; Sprite height (in scanlines)
					defb	0							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_Class_CHILD_			; Class of sprite
					defb	(T128_SPR_WIDTH_2-1)*T128_SPR_HEIGHT_8*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_8*2*2		; Relative address decrement for rotated mode = scanlines*2*2
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas															
					defb	$ff, 00, 00					; Child sprite #1 (type, delta x, delta y)
					defb	$ff, 00, 00					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00000011					; Speed of animation
					defb	4							; Number of phases
					defb	SPR_CHILD_NORMAL			; Looking left


					;;;;;;;;;
					; Blade ;
					;;;;;;;;;
SPR_Blade:			defb	144							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_MAGENTA_DK		; Attribute										
					defb	T128_SPR_WIDTH_3			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_24			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_24			; Sprite height (in scanlines)
					defb	50							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_ClassCycle				; Class of sprite
					defb	(T128_SPR_WIDTH_3-1)*T128_SPR_HEIGHT_24*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_24*2*2		; Relative address decrement for rotated mode = scanlines*2*2
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas
					defb	T128_SPRITE_BLADE_IN, 8, 8 	; Child sprite #1 (type, delta x, delta y)
					defb	$ff,  0, 0					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00000001					; Speed of movement
					defb	%00000001					; Speed of animation
					defb	4							; Number of phases of animation					


					;;;;;;;;;;;;
					; Blade IN ;
					;;;;;;;;;;;;
SPR_BladeIN:		defb	16							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_CYAN				; Attribute										
					defb	T128_SPR_WIDTH_1			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_8			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_8			; Sprite height (in scanlines)
					defb	0							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_Class_CHILD_			; Class of sprite
					defb	(T128_SPR_WIDTH_1-1)*T128_SPR_HEIGHT_8*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_8*2*2		; Relative address decrement for rotated mode = scanlines*2*2
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas
					defb	$ff, 00, 00					; Child sprite #1 (type, delta x, delta y)
					defb	$ff, 00, 00					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00000001					; Speed of animation
					defb	1							; Number of phases of animation			
					defb	SPR_CHILD_NORMAL			; Looking left					


					;;;;;;;;;;;;;
					; Wing Left ;
					;;;;;;;;;;;;;
SPR_WingL:			defb	32							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_WHITE_DK			; Attribute										
					defb	T128_SPR_WIDTH_1			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_8			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_16			; Sprite height (in scanlines)
					defb	0							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_Class_CHILD_			; Class of sprite
					defb	(T128_SPR_WIDTH_1-1)*T128_SPR_HEIGHT_16*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_16*2*2		; Relative address decrement for rotated mode = scanlines*2*2
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas															
					defb	$ff, 00, 00					; Child sprite #1 (type, delta x, delta y)
					defb	$ff, 00, 00					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00000001					; Speed of animation
					defb	4							; Number of phases of animation			
					defb	SPR_CHILD_NORMAL			; Looking left					
;					defb	T128_SPR_FOREGROUND2		; ZPOS					


					;;;;;;;;;;;;;;
					; Wing Right ;
					;;;;;;;;;;;;;;
SPR_WingR:			defb	32							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_WHITE_DK			; Attribute										
					defb	T128_SPR_WIDTH_1			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_8			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_16			; Sprite height (in scanlines)
					defb	0							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_Class_CHILD_			; Class of sprite
					defb	(T128_SPR_WIDTH_1-1)*T128_SPR_HEIGHT_16*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_16*2*2		; Relative address decrement for rotated mode = scanlines*2*2
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas															
					defb	$ff, 00, 00					; Child sprite #1 (type, delta x, delta y)
					defb	$ff, 00, 00					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00000001					; Speed of animation
					defb	4							; Number of phases of animation			
					defb	SPR_CHILD_ROTATED			; Looking right


					;;;;;;;;;
					; Screw ;
					;;;;;;;;;
SPR_Screw:			defb	32							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_RED				; Attribute										
					defb	T128_SPR_WIDTH_1			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_8			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_16			; Sprite height (in scanlines)
					defb	50							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_ClassCycle				; Class of sprite
					defb	(T128_SPR_WIDTH_1-1)*T128_SPR_HEIGHT_16*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_16*2*2		; Relative address decrement for rotated mode = scanlines*2*2
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas
					defb	T128_SPRITE_WING_LEFT, -8, 0 ; Child sprite #1 (type, delta x, delta y)
					defb	T128_SPRITE_WING_RIGHT, 8, 0 ; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00000001					; Speed of movement
					defb	%00000011					; Speed of animation
					defb	4							; Number of phases of animation					
	
	
					;;;;;;;;;;;;;;;
					; WlkBullet L ;
					;;;;;;;;;;;;;::
SPR_WlkBullet:		defb	16							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_MAGENTA			; Attribute										
					defb	T128_SPR_WIDTH_1			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_8			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_8			; Sprite height (in scanlines)
					defb	0							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_ClassWlkBullet			; Class of sprite
					defb	(T128_SPR_WIDTH_1-1)*T128_SPR_HEIGHT_8*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_8*2*2		; Relative address decrement for rotated mode = scanlines*2*2
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas
					defb	T128_SPRITE_WLKBULLETL2, 8, 00 ; Child sprite #1 (type, delta x, delta y)
					defb	$ff, 00, 00					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00000011					; Speed of animation
					defb	2							; Number of phases of animation


					;;;;;;;;;;;;;;;;
					; EnemyDeath01 ;
					;;;;;;;;;;;;;;;;
SPR_EnmyDeath01:	defb	64							; Size of graphic (a single phase), in bytes
					defb	0							; Attribute										
					defb	T128_SPR_WIDTH_2			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_16			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_16			; Sprite height (in scanlines)
					defb	0							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_ClassSimpleAnim			; Class of sprite
					defb	(T128_SPR_WIDTH_2-1)*T128_SPR_HEIGHT_16*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_16*2*2		; Relative address decrement for rotated mode = scanlines*2*2																									
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas
					defb	$ff, 00, 00					; Child sprite #1 (type, delta x, delta y)
					defb	$ff, 00, 00					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00000001					; Speed of animation
					defb	5							; Number of phases of animation


					;;;;;;;;;;;;
					; Debris01 ;
					;;;;;;;;;;;;
SPR_Debris01:		defb	16							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_CYAN				; Attribute										
					defb	T128_SPR_WIDTH_1			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_8			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_8			; Sprite height (in scanlines)
					defb	0							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_ClassDebris				; Class of sprite
					defb	(T128_SPR_WIDTH_1-1)*T128_SPR_HEIGHT_8*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_8*2*2		; Relative address decrement for rotated mode = scanlines*2*2																									
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas
					defb	$ff, 00, 00					; Child sprite #1 (type, delta x, delta y)
					defb	$ff, 00, 00					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00000000					; Speed of movement


					;;;;;;;;;:;;;;
					; Statue 3x4 ;
					;;;;;;;;;;;;;;
SPR_Statue3x4:		defb	192							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_WHITE_DK			; Attribute										
					defb	T128_SPR_WIDTH_3			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_24			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_32			; Sprite height (in scanlines)
					defb	50							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_ClassStatue				; Class of sprite
					defb	(T128_SPR_WIDTH_3-1)*T128_SPR_HEIGHT_32*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_32*2*2		; Relative address decrement for rotated mode = scanlines*2*2																									
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas
					defb	$ff, 00, 00					; Child sprite #1 (type, delta x, delta y)
					defb	$ff, 00, 00					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT


					;;;;;;;;;;;;;;
					; Statue 3x3 ;
					;;;;;;;;;;;;;;
SPR_Statue3x3:		defb	144							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_WHITE_DK			; Attribute										
					defb	T128_SPR_WIDTH_3			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_24			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_24			; Sprite height (in scanlines)
					defb	50							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_ClassStatue				; Class of sprite
					defb	(T128_SPR_WIDTH_3-1)*T128_SPR_HEIGHT_24*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_24*2*2		; Relative address decrement for rotated mode = scanlines*2*2																									
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas
					defb	$ff, 00, 00					; Child sprite #1 (type, delta x, delta y)
					defb	$ff, 00, 00					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT					


					;;;;;;;;;;;;;;;
					; WlkBulletL2 ;
					;;;;;;;;;;;;;;;
SPR_WlkBulletL2:	defb	16							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_CYAN_DK		; Attribute										
					defb	T128_SPR_WIDTH_1			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_8			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_8			; Sprite height (in scanlines)
					defb	0							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_Class_CHILD_			; Class of sprite
					defb	(T128_SPR_WIDTH_1-1)*T128_SPR_HEIGHT_8*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_8*2*2		; Relative address decrement for rotated mode = scanlines*2*2
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas															
					defb	$ff, 00, 00					; Child sprite #1 (type, delta x, delta y)
					defb	$ff, 00, 00					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00000111					; Speed of animation
					defb	1							; Number of phases
					defb	SPR_CHILD_NORMAL			; Looking left


					;;;;;;;;;;;;;;;
					; WlkBulletR2 ;
					;;;;;;;;;;;;;;;
SPR_WlkBulletR2:	defb	16							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_CYAN_DK		; Attribute										
					defb	T128_SPR_WIDTH_1			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_8			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_8			; Sprite height (in scanlines)
					defb	0							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_Class_CHILD_			; Class of sprite
					defb	(T128_SPR_WIDTH_1-1)*T128_SPR_HEIGHT_8*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_8*2*2		; Relative address decrement for rotated mode = scanlines*2*2
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas															
					defb	$ff, 00, 00					; Child sprite #1 (type, delta x, delta y)
					defb	$ff, 00, 00					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00000111					; Speed of animation
					defb	1							; Number of phases
					defb	SPR_CHILD_ROTATED			; Looking right


					;;;;;;;;;;;;;;;
					; WlkBullet R ;
					;;;;;;;;;;;;;;;
SPR_WlkBulletR:		defb	16							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_MAGENTA			; Attribute										
					defb	T128_SPR_WIDTH_1			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_8			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_8			; Sprite height (in scanlines)
					defb	0							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_ClassWlkBullet			; Class of sprite
					defb	(T128_SPR_WIDTH_1-1)*T128_SPR_HEIGHT_8*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_8*2*2		; Relative address decrement for rotated mode = scanlines*2*2
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas
					defb	T128_SPRITE_WLKBULLETR2, -8, 00 ; Child sprite #1 (type, delta x, delta y)
					defb	$ff, 00, 00					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00000011					; Speed of animation
					defb	2							; Number of phases of animation


					;;;;;;;;;;;;;
					; Crab Body ;
					;;;;;;;;;;;;;
SPR_CrabBody:		defb	32							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_MAGENTA_DK		; Attribute										
					defb	T128_SPR_WIDTH_2			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_16			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_8			; Sprite height (in scanlines)
					defb	50							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_ClassJumper				; Class of sprite
					defb	(T128_SPR_WIDTH_2-1)*T128_SPR_HEIGHT_8*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_8*2*2		; Relative address decrement for rotated mode = scanlines*2*2
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas
					defb	T128_SPRITE_CRABCLAWS, -8, -8 ; Child sprite #2 (type, delta x, delta y)
					defb	T128_SPRITE_CRABEYES, 0, -8 ; Child sprite #1 (type, delta x, delta y)					
					; CLASS DEPENDANT
					defb	%00000111					; Speed of movement
					defb	%00000011					; Speed of animation
					defb	2							; Phases of animation


					;;;;;;;;;;;;;
					; Crab Eyes ;
					;;;;;;;;;;;;;
SPR_CrabEyes:		defb	32							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_WHITE			; Attribute										
					defb	T128_SPR_WIDTH_2			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_16			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_8			; Sprite height (in scanlines)
					defb	0							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_Class_CHILD_			; Class of sprite
					defb	(T128_SPR_WIDTH_2-1)*T128_SPR_HEIGHT_8*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_8*2*2		; Relative address decrement for rotated mode = scanlines*2*2
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas															
					defb	$ff, 00, 00					; Child sprite #1 (type, delta x, delta y)
					defb	$ff, 00, 00					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00001111					; Speed of animation
					defb	2							; Number of phases of animation			
					defb	SPR_CHILD_NORMAL			; Normal


					;;;;;;;;;;;;;;
					; Crab Claws ;
					;;;;;;;;;;;;;;
SPR_CrabClaws:		defb	64							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_MAGENTA_DK		; Attribute										
					defb	T128_SPR_WIDTH_4			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_32			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_8			; Sprite height (in scanlines)
					defb	0							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_Class_CHILD_			; Class of sprite
					defb	(T128_SPR_WIDTH_4-1)*T128_SPR_HEIGHT_8*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_8*2*2		; Relative address decrement for rotated mode = scanlines*2*2
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas															
					defb	$ff, 00, 00					; Child sprite #1 (type, delta x, delta y)
					defb	$ff, 00, 00					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00000011					; Speed of animation
					defb	2							; Number of phases of animation			
					defb	SPR_CHILD_NORMAL			; Normal


					;;;;;;;;;;;;;;
					; Bully Body ;
					;;;;;;;;;;;;;;
SPR_BullyBody:		defb	64							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_RED_DK			; Attribute										
					defb	T128_SPR_WIDTH_2			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_16			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_16			; Sprite height (in scanlines)
					defb	50							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_ClassJumper				; Class of sprite
					defb	(T128_SPR_WIDTH_2-1)*T128_SPR_HEIGHT_16*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_16*2*2		; Relative address decrement for rotated mode = scanlines*2*2
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas
					defb	T128_SPRITE_BULLYHORNS, -8, -8 ; Child sprite #2 (type, delta x, delta y)
					defb	T128_SPRITE_BULLYEYES ,  0, -8 ; Child sprite #1 (type, delta x, delta y)					
					; CLASS DEPENDANT
					defb	%00000111					; Speed of movement
					defb	%00000111					; Speed of animation
					defb	2							; Phases of animation


					;;;;;;;;;;;;;;
					; Bully Eyes ;
					;;;;;;;;;;;;;;
SPR_BullyEyes:		defb	32							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_YELLOW			; Attribute										
					defb	T128_SPR_WIDTH_2			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_16			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_8			; Sprite height (in scanlines)
					defb	0							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_Class_CHILD_			; Class of sprite
					defb	(T128_SPR_WIDTH_2-1)*T128_SPR_HEIGHT_8*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_8*2*2		; Relative address decrement for rotated mode = scanlines*2*2
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas															
					defb	$ff, 00, 00					; Child sprite #1 (type, delta x, delta y)
					defb	$ff, 00, 00					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00001111					; Speed of animation
					defb	2							; Number of phases of animation			
					defb	SPR_CHILD_NORMAL			; Normal


					;;;;;;;;;;;;;;;
					; Bully Horns ;
					;;;;;;;;;;;;;;;
SPR_BullyHorns:		defb	64							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_WHITE			; Attribute										
					defb	T128_SPR_WIDTH_4			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_32			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_8			; Sprite height (in scanlines)
					defb	0							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_Class_CHILD_			; Class of sprite
					defb	(T128_SPR_WIDTH_4-1)*T128_SPR_HEIGHT_8*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_8*2*2		; Relative address decrement for rotated mode = scanlines*2*2
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas															
					defb	$ff, 00, 00					; Child sprite #1 (type, delta x, delta y)
					defb	$ff, 00, 00					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00000111					; Speed of animation
					defb	1							; Number of phases of animation			
					defb	SPR_CHILD_NORMAL			; Normal


					;;;;;;;;;;;;;;
					; JmprBullet ;
					;;;;;;;;;;;;;;
SPR_JmprBullet:		defb	32							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_RED				; Attribute										
					defb	T128_SPR_WIDTH_2			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_16			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_8			; Sprite height (in scanlines)
					defb	0							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_ClassJmprBullet			; Class of sprite
					defb	(T128_SPR_WIDTH_2-1)*T128_SPR_HEIGHT_8*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_8*2*2		; Relative address decrement for rotated mode = scanlines*2*2
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas
					defb	$ff, 00, 00 				; Child sprite #1 (type, delta x, delta y)
					defb	$ff, 00, 00					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00000011					; Speed of animation
					defb	2							; Number of phases of animation


					;;;;;;;;;;;;;;
					; Puf 1 Char ;
					;;;;;;;;;;;;;;
SPR_Puf1Char:		defb	16							; Size of graphic (a single phase), in bytes
					defb	0							; Attribute										
					defb	T128_SPR_WIDTH_1			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_8			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_8			; Sprite height (in scanlines)
					defb	0							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_ClassSimpleAnim			; Class of sprite
					defb	(T128_SPR_WIDTH_1-1)*T128_SPR_HEIGHT_8*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_8*2*2		; Relative address decrement for rotated mode = scanlines*2*2
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas
					defb	$ff, 00, 00 				; Child sprite #1 (type, delta x, delta y)
					defb	$ff, 00, 00					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00000001					; Speed of animation
					defb	3							; Number of phases of animation


					;;;;;;;;
					; Coin ;
					;;;;;;;;
SPR_Coin:			defb	16							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_YELLOW			; Attribute										
					defb	T128_SPR_WIDTH_1			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_8			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_8			; Sprite height (in scanlines)
					defb	0							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_ClassCoin				; Class of sprite
					defb	(T128_SPR_WIDTH_1-1)*T128_SPR_HEIGHT_8*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_8*2*2		; Relative address decrement for rotated mode = scanlines*2*2
					defb	%00100000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas
					defb	$ff, 00, 00 				; Child sprite #1 (type, delta x, delta y)
					defb	$ff, 00, 00					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00000001					; Speed of animation
					defb	4							; Number of phases of animation


					;;;;;;;;;;;;;;;;;;;;;;;
					; EyeBullet Left Down ;
					;;;;;;;;;;;;;;;;;;;;;;;
SPR_EyeBulletLD:	defb	16							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_YELLOW_DK		; Attribute										
					defb	T128_SPR_WIDTH_1			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_8			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_8			; Sprite height (in scanlines)
					defb	107							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_ClassProjectile			; Class of sprite
					defb	(T128_SPR_WIDTH_1-1)*T128_SPR_HEIGHT_8*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_8*2*2		; Relative address decrement for rotated mode = scanlines*2*2
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas
					defb	T128_SPRITE_EYEBU_LD2, 8, -8 ; Child sprite #1 (type, delta x, delta y)
					defb	$ff, 00, 00					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00000001					; Speed of movement
					defb	%00000001					; Speed of animation
					defb	1							; Phases of animation
					defb	SPR_PROJ_LFT_DOWN           ; Next state, after HIDDEN state
					defb	T128_SPRITE_PUF1CHAR        ; Spawning sprite after killing projectile


					;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
					; EyeBullet Left Down Child ;
					;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SPR_EyeBulletLDfire	defb	16							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_RED				; Attribute										
					defb	T128_SPR_WIDTH_1			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_8			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_8			; Sprite height (in scanlines)
					defb	0							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_Class_CHILD_			; Class of sprite
					defb	(T128_SPR_WIDTH_1-1)*T128_SPR_HEIGHT_8*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_8*2*2		; Relative address decrement for rotated mode = scanlines*2*2
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas															
					defb	$ff, 00, 00					; Child sprite #1 (type, delta x, delta y)
					defb	$ff, 00, 00					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00000001					; Speed of animation
					defb	2							; Number of phases
					defb	SPR_CHILD_NORMAL			; Looking left


					;;;;;;;;;;;;;;;;;;;;;;;;
					; EyeBullet Right Down ;
					;;;;;;;;;;;;;;;;;;;;;;;;
SPR_EyeBulletRD:	defb	16							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_YELLOW_DK		; Attribute										
					defb	T128_SPR_WIDTH_1			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_8			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_8			; Sprite height (in scanlines)
					defb	107							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_ClassProjectile			; Class of sprite
					defb	(T128_SPR_WIDTH_1-1)*T128_SPR_HEIGHT_8*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_8*2*2		; Relative address decrement for rotated mode = scanlines*2*2
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas
					defb	T128_SPRITE_EYEBU_RD2, -8, -8 ; Child sprite #1 (type, delta x, delta y)
					defb	$ff, 00, 00					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00000001					; Speed of movement
					defb	%00000001					; Speed of animation
					defb	1							; Phases of animation
					defb	SPR_PROJ_RGH_DOWN           ; Next state, after HIDDEN state
					defb	T128_SPRITE_PUF1CHAR        ; Spawning sprite after killing projectile


					;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
					; EyeBullet Right Down Child ;
					;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SPR_EyeBulletRDfire	defb	16							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_RED				; Attribute										
					defb	T128_SPR_WIDTH_1			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_8			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_8			; Sprite height (in scanlines)
					defb	0							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_Class_CHILD_			; Class of sprite
					defb	(T128_SPR_WIDTH_1-1)*T128_SPR_HEIGHT_8*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_8*2*2		; Relative address decrement for rotated mode = scanlines*2*2
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas															
					defb	$ff, 00, 00					; Child sprite #1 (type, delta x, delta y)
					defb	$ff, 00, 00					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00000001					; Speed of animation
					defb	2							; Number of phases
					defb	SPR_CHILD_ROTATED			; Looking right


					;;;;;;;;;;;;;
					; Falling 1 ;
					;;;;;;;;;;;;;
SPR_Falling1:		defb	64							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_YELLOW_DK		; Attribute										
					defb	T128_SPR_WIDTH_2			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_16			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_16			; Sprite height (in scanlines)
					defb	103							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_ClassProjectile			; Class of sprite
					defb	(T128_SPR_WIDTH_2-1)*T128_SPR_HEIGHT_16*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_16*2*2		; Relative address decrement for rotated mode = scanlines*2*2
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas
					defb	$ff, 00, 00					; Child sprite #1 (type, delta x, delta y)
					defb	$ff, 00, 00					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00000001					; Speed of movement
					defb	%00000001					; Speed of animation
					defb	1							; Phases of animation
					defb	SPR_PROJ_DOWN				; Next state, after HIDDEN state
					defb	T128_SPRITE_ENMYDEATH01		; Spawning sprite after killing projectile


					;;;;;;;;;
					; Knife ;
					;;;;;;;;;
SPR_Knife:			defb	32							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_CYAN				; Attribute										
					defb	T128_SPR_WIDTH_2			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_16			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_8			; Sprite height (in scanlines)
					defb	0							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_ClassKnife				; Class of sprite
					defb	(T128_SPR_WIDTH_2-1)*T128_SPR_HEIGHT_8*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_8*2*2		; Relative address decrement for rotated mode = scanlines*2*2
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas															
					defb	$ff, 00, 00					; Child sprite #1 (type, delta x, delta y)
					defb	$ff, 00, 00					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00000001					; Speed of animation
					defb	4							; Number of phases


					;;;;;;;;;;;;;
					; Frog Body ;
					;;;;;;;;;;;;;
SPR_FrogBody:		defb	128							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_GREEN_DK			; Attribute										
					defb	T128_SPR_WIDTH_4			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_32			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_16			; Sprite height (in scanlines)
					defb	50							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_ClassJumper				; Class of sprite
					defb	(T128_SPR_WIDTH_4-1)*T128_SPR_HEIGHT_16*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_16*2*2		; Relative address decrement for rotated mode = scanlines*2*2
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas
					defb	T128_SPRITE_FROGEYES, 8, -8 ; Child sprite #2 (type, delta x, delta y)
					defb	T128_SPRITE_FROGBELLY, 8, 8 ; Child sprite #1 (type, delta x, delta y)					
					; CLASS DEPENDANT
					defb	%00000111					; Speed of movement
					defb	%00000111					; Speed of animation
					defb	2							; Phases of animation


					;;;;;;;;;;;;;
					; Frog Eyes ;
					;;;;;;;;;;;;;
SPR_FrogEyes:		defb	32							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_WHITE			; Attribute										
					defb	T128_SPR_WIDTH_2			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_16			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_8			; Sprite height (in scanlines)
					defb	0							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_Class_CHILD_			; Class of sprite
					defb	(T128_SPR_WIDTH_2-1)*T128_SPR_HEIGHT_8*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_8*2*2		; Relative address decrement for rotated mode = scanlines*2*2
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas															
					defb	$ff, 00, 00					; Child sprite #1 (type, delta x, delta y)
					defb	$ff, 00, 00					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00001111					; Speed of animation
					defb	2							; Number of phases of animation			
					defb	SPR_CHILD_NORMAL			; Normal


					;;;;;;;;;;;;;;
					; Frog Belly ;
					;;;;;;;;;;;;;;
SPR_FrogBelly:		defb	32							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_YELLOW_DK		; Attribute										
					defb	T128_SPR_WIDTH_2			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_16			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_8			; Sprite height (in scanlines)
					defb	0							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_Class_CHILD_			; Class of sprite
					defb	(T128_SPR_WIDTH_2-1)*T128_SPR_HEIGHT_8*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_8*2*2		; Relative address decrement for rotated mode = scanlines*2*2
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas															
					defb	$ff, 00, 00					; Child sprite #1 (type, delta x, delta y)
					defb	$ff, 00, 00					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00000111					; Speed of animation
					defb	2							; Number of phases of animation			
					defb	SPR_CHILD_NORMAL			; Normal


					;;;;;;;;;;;;;;
					; Mormo Left ;
					;;;;;;;;;;;;;;
SPR_MormoLeft:		defb	96							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_CYAN				; Attribute										
					defb	T128_SPR_WIDTH_2			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_24			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_24			; Sprite height (in scanlines)
					defb	50							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_ClassCycle				; Class of sprite
					defb	(T128_SPR_WIDTH_2-1)*T128_SPR_HEIGHT_24*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_24*2*2		; Relative address decrement for rotated mode = scanlines*2*2
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas
					defb	T128_SPRITE_MORMORIGHT, 16, 0 ; Child sprite #1 (type, delta x, delta y)
					defb	T128_SPRITE_MORMOEYE, 0, 8 	; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00000001					; Speed of movement
					defb	%00000011					; Speed of animation
					defb	4							; Number of phases of animation					


					;;;;;;;;;;;;;;;
					; Mormo Right ;
					;;;;;;;;;;;;;;;
SPR_MormoRight:		defb	48							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_CYAN_DK			; Attribute										
					defb	T128_SPR_WIDTH_1			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_8			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_24			; Sprite height (in scanlines)
					defb	0							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_Class_CHILD_			; Class of sprite
					defb	(T128_SPR_WIDTH_1-1)*T128_SPR_HEIGHT_24*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_24*2*2		; Relative address decrement for rotated mode = scanlines*2*2
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas
					defb	$ff, 00, 00					; Child sprite #1 (type, delta x, delta y)
					defb	$ff, 00, 00					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00000011					; Speed of animation
					defb	4							; Number of phases of animation			
					defb	SPR_CHILD_NORMAL			; Looking left					


					;;;;;;;;;;;;;
					; Mormo Eye ;
					;;;;;;;;;;;;;
SPR_MormoEye:		defb	16							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_WHITE_DK			; Attribute										
					defb	T128_SPR_WIDTH_1			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_8			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_8			; Sprite height (in scanlines)
					defb	0							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_Class_CHILD_			; Class of sprite
					defb	(T128_SPR_WIDTH_1-1)*T128_SPR_HEIGHT_8*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_8*2*2		; Relative address decrement for rotated mode = scanlines*2*2
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas
					defb	$ff, 00, 00					; Child sprite #1 (type, delta x, delta y)
					defb	$ff, 00, 00					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00000011					; Speed of animation
					defb	4							; Number of phases of animation			
					defb	SPR_CHILD_NORMAL			; Looking left					


					;;;;;;;;;;;;;;
					; Walker 2x3 ;
					;;;;;;;;;;;;;;
SPR_Walker2x3:		defb	144							; Size of graphic (a single phase), in bytes
					defb	0							; Attribute
					defb	T128_SPR_WIDTH_3			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_16			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_24			; Sprite height (in scanlines)
					defb	40							; Min time to respawn
					defb	SPR_WLKR_MINX/2*16 + 0		; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_ClassWalker				; Class of sprite
					defb	(T128_SPR_WIDTH_3-1)*T128_SPR_HEIGHT_24*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_24*2*2		; Relative address decrement for rotated mode = scanlines*2*2	
					defb	%00100000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas					
					defb	$ff, 00, 00					; Child sprite #1 (type, delta x, delta y)
					defb	$ff, 00, 00					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00000001					; Speed of movement of animation
					defb	2							; Number of punchings to kill Walker

					
					;;;;;;;;;;;;;;;;
					; EnemyDeath02 ;
					;;;;;;;;;;;;;;;;
SPR_EnmyDeath02:	defb	64							; Size of graphic (a single phase), in bytes
					defb	0							; Attribute										
					defb	T128_SPR_WIDTH_2			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_16			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_16			; Sprite height (in scanlines)
					defb	0							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_ClassSimpleAnim			; Class of sprite
					defb	(T128_SPR_WIDTH_2-1)*T128_SPR_HEIGHT_16*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_16*2*2		; Relative address decrement for rotated mode = scanlines*2*2																									
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas
					defb	$ff, 00, 00					; Child sprite #1 (type, delta x, delta y)
					defb	$ff, 00, 00					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00000011					; Speed of animation
					defb	3							; Number of phases of animation


					;;;;;;;;
					; Dead ;
					;;;;;;;;
SPR_Dead:			defb	64							; Size of graphic (a single phase), in bytes
					defb	0							; Attribute										
					defb	T128_SPR_WIDTH_2			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_16			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_16			; Sprite height (in scanlines)
					defb	0							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_ClassDead				; Class of sprite
					defb	(T128_SPR_WIDTH_2-1)*T128_SPR_HEIGHT_16*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_16*2*2		; Relative address decrement for rotated mode = scanlines*2*2																									
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas
					defb	$ff, 00, 00					; Child sprite #1 (type, delta x, delta y)
					defb	$ff, 00, 00					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00000011					; Speed of animation
					defb	2							; Number of phases of animation


					;;;;;;;;;:;;;;;
					; PortalGlass ;
					;;;;;;;;;;;;;;;
SPR_PortalGlass:	defb	128							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_MAGENTA_DK		; Attribute										
					defb	T128_SPR_WIDTH_2			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_24			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_32			; Sprite height (in scanlines)
					defb	50							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_ClassDummy				; Class of sprite
					defb	(T128_SPR_WIDTH_2-1)*T128_SPR_HEIGHT_32*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_32*2*2		; Relative address decrement for rotated mode = scanlines*2*2																									
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas
					defb	$ff, 00, 00					; Child sprite #1 (type, delta x, delta y)
					defb	$ff, 00, 00					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT


					;;;;;;;;
					; Fish ;
					;;;;;;;;
SPR_Fish:			defb	32							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_CYAN_DK			; Attribute										
					defb	T128_SPR_WIDTH_1			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_8			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_16			; Sprite height (in scanlines)
					defb	50							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_ClassCycle				; Class of sprite
					defb	(T128_SPR_WIDTH_1-1)*T128_SPR_HEIGHT_16*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_16*2*2		; Relative address decrement for rotated mode = scanlines*2*2
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas
					defb	T128_SPRITE_FISHBACK, -8, 8 ; Child sprite #1 (type, delta x, delta y)
					defb	T128_SPRITE_FISHEYE, -8, 0 	; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00000001					; Speed of movement
					defb	%00000011					; Speed of animation
					defb	3							; Number of phases of animation					


					;;;;;;;;;;;;;
					; Fish Back ;
					;;;;;;;;;;;;;
SPR_FishBack:		defb	16							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_CYAN				; Attribute										
					defb	T128_SPR_WIDTH_1			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_8			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_8			; Sprite height (in scanlines)
					defb	0							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_Class_CHILD_			; Class of sprite
					defb	(T128_SPR_WIDTH_1-1)*T128_SPR_HEIGHT_8*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_8*2*2		; Relative address decrement for rotated mode = scanlines*2*2
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas
					defb	$ff, 00, 00					; Child sprite #1 (type, delta x, delta y)
					defb	$ff, 00, 00					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00000000					; Speed of animation
					defb	1							; Number of phases of animation			
					defb	SPR_CHILD_NORMAL			; Looking left					


					;;;;;;;;;;;;
					; Fish Eye ;
					;;;;;;;;;;;;
SPR_FishEye:		defb	16							; Size of graphic (a single phase), in bytes
					defb	T128_BLACK_WHITE_DK			; Attribute										
					defb	T128_SPR_WIDTH_1			; Sprite width (in columns)
					defb	T128_SPR_WIDTH_8			; Sprite width for colision (in pixels)
					defb	T128_SPR_HEIGHT_8			; Sprite height (in scanlines)
					defb	0							; Min time to respawn
					defb	0*16 + 0					; Min distance to main char divided by 2 (format XXXXYYYY)
					defb	SPR_Class_CHILD_			; Class of sprite
					defb	(T128_SPR_WIDTH_1-1)*T128_SPR_HEIGHT_8*2 ; Initial relative address for rotated mode = (columns-1)*scanlines*2
					defb	T128_SPR_HEIGHT_8*2*2		; Relative address decrement for rotated mode = scanlines*2*2
					defb	%00000000					; Flags: 00B00000
														;   B = 1 if sprite is affected by Breath Areas
					defb	$ff, 00, 00					; Child sprite #1 (type, delta x, delta y)
					defb	$ff, 00, 00					; Child sprite #2 (type, delta x, delta y)
					; CLASS DEPENDANT
					defb	%00000000					; Speed of animation
					defb	1							; Number of phases of animation			
					defb	SPR_CHILD_NORMAL			; Looking left					
