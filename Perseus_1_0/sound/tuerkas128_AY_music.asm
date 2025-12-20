;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; A Y   M U S I C
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


PUBLIC _BEGIN_AY_MUSIC
_BEGIN_AY_MUSIC:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; S O N G S
;
; For every song in this file, add a line in tukeras128_AY_constants.asm
; It is not mandatory, but it makes things easier
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

T128_AY_Songs:		defw	T128_AY_Song00, T128_AY_Song01


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Song 00 (T128_AY_MUSIC_INGAME)
;;
;; Main chord progresssion: Am Em G D (key of Am: A B C D E F# G 
;;
;; Channel A = Bassline			Intruments: 	02
;; Channel B = Main theme		Intruments: 	12, 13, 14, 15
;; Channel C = Chords			Intruments: 	07, 11
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

TEMPO_S00			EQU		T128_AY_TEMPO5

T128_AY_Song00:		defw	Song00Channel_A, Song00Channel_B, Song00Channel_C

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SONG 00: Channel A = Bassline
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Song00Channel_A:	defw	PatternFadeIn_6s
					defw	S00_A_Pattern01															; ONLY BASSLINE
					defw	S00_A_Pattern01								
					defw	S00_A_Pattern01															; BASSLINE + CHORDS
					defw	S00_A_Pattern01								
					defw	S00_A_Pattern02															; BLOCK 1
					defw	S00_A_Pattern02
					defw	S00_A_Pattern02
					defw	S00_A_Pattern02
					defw	S00_A_Pattern02
					defw	S00_A_Pattern02
					defw	S00_A_Pattern02															
					defw	S00_A_Pattern02
					defw	S00_A_Pattern01															; TRANSITION
					defw	S00_A_Pattern01
					defw	S00_A_Pattern01															
					defw	S00_A_Pattern00, S00_A_Pattern00, S00_A_Pattern00, S00_A_Pattern00
					defw	S00_A_Pattern02															; BASSLINE + BASSDRUM
					defw	S00_A_Pattern02															; BASSLINE + CHORDS					
					defw	S00_A_Pattern02															; BLOCK 2
					defw	S00_A_Pattern02
					defw	S00_A_Pattern02
					defw	S00_A_Pattern02
					defw	S00_A_Pattern02
					defw	S00_A_Pattern02
					defw	S00_A_Pattern02
					defw	S00_A_Pattern02
					defw	S00_A_Pattern01															; TRANSITION
					defw	S00_A_Pattern01
					defw	S00_A_Pattern01															
					defw	S00_A_Pattern00, S00_A_Pattern00, S00_A_Pattern00, S00_A_Pattern00
					defw	S00_A_Pattern02															; BASSLINE + BASSDRUM					
					defw	S00_A_Pattern02															; BASSLINE + CHORDS										
					defw	S00_A_Pattern02															; BLOCK 3
					defw	S00_A_Pattern02															
					defw	S00_A_Pattern02															
					defw	S00_A_Pattern02															
					defw	S00_A_Pattern02															
					defw	S00_A_Pattern02															
					defw	S00_A_Pattern02															
					defw	S00_A_Pattern02															
					defw	S00_A_Pattern01															; TRANSITION
					defw	S00_A_Pattern01
					defw	S00_A_Pattern01															
					defw	S00_A_Pattern00, S00_A_Pattern00, S00_A_Pattern00, S00_A_Pattern00		
					defw	S00_A_Pattern02															; BASSLINE + BASSDRUM					
					defw	S00_A_Pattern02															; BASSLINE + CHORDS															
					defw	S00_A_Pattern02															; BLOCK 4
					defw	S00_A_Pattern02															
					defw	S00_A_Pattern02															
					defw	S00_A_Pattern02															
					defw	PatternFadeOut_9s														; THE END
					defw	S00_A_Pattern02															
					defw	S00_A_Pattern02																				
					defw	S00_A_Pattern02																				
					M_AY_LOOP_SONG

S00_A_Pattern00:	M_AY_NOTE 		T128_AY_A_2  , 16*TEMPO_S00, 05, T128_AY_NO_APR_ORN, $00		; Rest
					M_AY_END_OF_PATT											

S00_A_Pattern01:	M_AY_NOTE 		T128_AY_A_2  , 4 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_A_3  , 4 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_A_2  , 2 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_A_2  , 2 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_A_3  , 4 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_E_2  , 4 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_E_3  , 4 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_E_2  , 2 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_E_2  , 2 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_E_3  , 4 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_G_2  , 4 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_G_3  , 4 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_G_2  , 2 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_G_2  , 2 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_G_3  , 4 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_D_2  , 4 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_D_3  , 4 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_D_2  , 2 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_D_2  , 2 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_D_3  , 4 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_END_OF_PATT											
										
S00_A_Pattern02:	M_AY_NOTE 		T128_AY_A_2  , 4 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_A_2  , 1 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_A_2  , 1 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_A_3  , 2 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_A_2  , 2 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_A_2  , 2 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_A_3  , 4 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_E_2  , 4 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_E_2  , 1 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_E_2  , 1 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_E_3  , 2 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_E_2  , 2 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_E_2  , 2 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_E_3  , 4 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_G_2  , 4 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_G_2  , 1 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_G_2  , 1 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_G_3  , 2 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_G_2  , 2 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_G_2  , 2 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_G_3  , 4 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_D_2  , 4 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_D_2  , 1 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_D_2  , 1 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_D_3  , 2 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_D_2  , 2 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_D_2  , 2 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_D_3  , 4 *TEMPO_S00, 02, T128_AY_NO_APR_ORN, $00
					M_AY_END_OF_PATT				


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SONG 00: Channel B = Main theme
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
					
Song00Channel_B:	defw	PatternFadeIn_6s
					defw	S00_B_Pattern000, S00_B_Pattern000, S00_B_Pattern000, S00_B_Pattern000	; ONLY BASSLINE
					defw	S00_B_Pattern000, S00_B_Pattern000, S00_B_Pattern000, S00_B_Pattern000		
					defw	S00_B_Pattern000, S00_B_Pattern000, S00_B_Pattern000, S00_B_Pattern000	; BASSLINE + CHORDS
					defw	S00_B_Pattern000, S00_B_Pattern000, S00_B_Pattern000, S00_B_Pattern000		
					defw	S00_B_Pattern045, S00_B_Pattern046, S00_B_Pattern047, S00_B_Pattern048	; BLOCK 1
					defw	S00_B_Pattern001, S00_B_Pattern002, S00_B_Pattern003, S00_B_Pattern004		
					defw	S00_B_Pattern005, S00_B_Pattern006, S00_B_Pattern007, S00_B_Pattern008
					defw	S00_B_Pattern009, S00_B_Pattern010, S00_B_Pattern011, S00_B_Pattern012
					defw	S00_B_Pattern017, S00_B_Pattern018, S00_B_Pattern019, S00_B_Pattern020
					defw	S00_B_Pattern021, S00_B_Pattern022, S00_B_Pattern023, S00_B_Pattern024
					defw	S00_B_Pattern025, S00_B_Pattern026, S00_B_Pattern027, S00_B_Pattern028
					defw	S00_B_Pattern025, S00_B_Pattern026, S00_B_Pattern027, S00_B_Pattern028
					defw	S00_B_Pattern029, S00_B_Pattern030, S00_B_Pattern031, S00_B_Pattern032	; TRANSITION
					defw	S00_B_Pattern033, S00_B_Pattern034, S00_B_Pattern035, S00_B_Pattern036
					defw	S00_B_Pattern037, S00_B_Pattern038, S00_B_Pattern039, S00_B_Pattern040
					defw	S00_B_Pattern041, S00_B_Pattern042, S00_B_Pattern043, S00_B_Pattern044		
					defw	S00_B_Pattern000, S00_B_Pattern000, S00_B_Pattern000, S00_B_Pattern000	; BASSLINE + BASSDRUM
					defw	S00_B_Pattern000, S00_B_Pattern000, S00_B_Pattern000, S00_B_Pattern000	; BASSLINE + CHORDS					
					defw	S00_B_Pattern045, S00_B_Pattern046, S00_B_Pattern047, S00_B_Pattern048	; BLOCK 2
					defw	S00_B_Pattern049, S00_B_Pattern050, S00_B_Pattern051, S00_B_Pattern052
					defw	S00_B_Pattern053, S00_B_Pattern054, S00_B_Pattern055, S00_B_Pattern056
					defw	S00_B_Pattern057, S00_B_Pattern058, S00_B_Pattern059, S00_B_Pattern060
					defw	S00_B_Pattern045, S00_B_Pattern046, S00_B_Pattern047, S00_B_Pattern048	;
					defw	S00_B_Pattern061, S00_B_Pattern062, S00_B_Pattern063, S00_B_Pattern064
					defw	S00_B_Pattern077, S00_B_Pattern078, S00_B_Pattern079, S00_B_Pattern080					
					defw	S00_B_Pattern065, S00_B_Pattern066, S00_B_Pattern067, S00_B_Pattern068
					defw	S00_B_Pattern089, S00_B_Pattern090, S00_B_Pattern091, S00_B_Pattern092	; TRANSITION
					defw	S00_B_Pattern093, S00_B_Pattern094, S00_B_Pattern095, S00_B_Pattern096
					defw	S00_B_Pattern097, S00_B_Pattern098, S00_B_Pattern099, S00_B_Pattern100
					defw	S00_B_Pattern133, S00_B_Pattern134, S00_B_Pattern135, S00_B_Pattern136					
					defw	S00_B_Pattern000, S00_B_Pattern000, S00_B_Pattern000, S00_B_Pattern000	; BASSLINE	+ BASSDRUM					
					defw	S00_B_Pattern000, S00_B_Pattern000, S00_B_Pattern000, S00_B_Pattern000	; BASSLINE + CHORDS										
					defw	S00_B_Pattern069, S00_B_Pattern070, S00_B_Pattern071, S00_B_Pattern072	; BLOCK 3
					defw	S00_B_Pattern073, S00_B_Pattern074, S00_B_Pattern075, S00_B_Pattern076
					defw	S00_B_Pattern013, S00_B_Pattern014, S00_B_Pattern015, S00_B_Pattern016					
					defw	S00_B_Pattern081, S00_B_Pattern082, S00_B_Pattern083, S00_B_Pattern084
					defw	S00_B_Pattern045, S00_B_Pattern046, S00_B_Pattern047, S00_B_Pattern048	;										
					defw	S00_B_Pattern101, S00_B_Pattern102, S00_B_Pattern103, S00_B_Pattern104
					defw	S00_B_Pattern085, S00_B_Pattern086, S00_B_Pattern087, S00_B_Pattern088  					
					defw	S00_B_Pattern105, S00_B_Pattern106, S00_B_Pattern107, S00_B_Pattern108  
					defw	S00_B_Pattern117, S00_B_Pattern118, S00_B_Pattern119, S00_B_Pattern120  ; TRANSITION
					defw	S00_B_Pattern121, S00_B_Pattern122, S00_B_Pattern123, S00_B_Pattern124  
					defw	S00_B_Pattern125, S00_B_Pattern126, S00_B_Pattern127, S00_B_Pattern128  
					defw	S00_B_Pattern041, S00_B_Pattern042, S00_B_Pattern043, S00_B_Pattern044
					defw	S00_B_Pattern000, S00_B_Pattern000, S00_B_Pattern000, S00_B_Pattern000	; BASSLINE	+ BASSDRUM					
					defw	S00_B_Pattern000, S00_B_Pattern000, S00_B_Pattern000, S00_B_Pattern000	; BASSLINE + CHORDS															
					defw	S00_B_Pattern045, S00_B_Pattern046, S00_B_Pattern047, S00_B_Pattern048	; BLOCK 4
					defw	S00_B_Pattern129, S00_B_Pattern130, S00_B_Pattern131, S00_B_Pattern132	
					defw	S00_B_Pattern109, S00_B_Pattern110, S00_B_Pattern111, S00_B_Pattern112	
					defw	S00_B_Pattern113, S00_B_Pattern114, S00_B_Pattern115, S00_B_Pattern116	
					defw	PatternFadeOut_9s														; THE END
					defw	S00_B_Pattern025, S00_B_Pattern026, S00_B_Pattern027, S00_B_Pattern028																									
					defw	S00_B_Pattern025, S00_B_Pattern026, S00_B_Pattern027, S00_B_Pattern028
					defw	S00_B_Pattern025, S00_B_Pattern026, S00_B_Pattern027, S00_B_Pattern028
					M_AY_LOOP_SONG
					
					
S00_B_Pattern000:	M_AY_NOTE 		T128_AY_D_4  , 16*TEMPO_S00, 05, T128_AY_GLISANDO, $00			; Rest
					M_AY_END_OF_PATT						
									
S00_B_Pattern001:	M_AY_NOTE 		T128_AY_A_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern002:	M_AY_NOTE 		T128_AY_E_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern003:	M_AY_NOTE 		T128_AY_G_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern004:	M_AY_NOTE 		T128_AY_D_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
									
S00_B_Pattern005:	M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_5, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_5, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT											
					
S00_B_Pattern006:	M_AY_NOTE 		T128_AY_E_4  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern007:	M_AY_NOTE 		T128_AY_G_5  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern008:	M_AY_NOTE 		T128_AY_D_5  , 8 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_5  , 8 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
									
S00_B_Pattern009:	M_AY_NOTE 		T128_AY_A_5  , 16*TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern010:	M_AY_NOTE 		T128_AY_E_5  , 8 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_5  , 8 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern011:	M_AY_NOTE 		T128_AY_G_5  , 16*TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern012:	M_AY_NOTE 		T128_AY_D_5  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_5, 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_5  , 8 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
									
S00_B_Pattern013:	M_AY_NOTE 		T128_AY_A_3  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_3  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_3, 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_3  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern014:	M_AY_NOTE 		T128_AY_G_3  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_3, 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_3  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_3  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern015:	M_AY_NOTE 		T128_AY_G_3  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_3  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern016:	M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 8 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
									
S00_B_Pattern017:	M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern018:	M_AY_NOTE 		T128_AY_E_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern019:	M_AY_NOTE 		T128_AY_G_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern020:	M_AY_NOTE 		T128_AY_D_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_3, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_3, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_3, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_3, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT	

S00_B_Pattern021:	M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern022:	M_AY_NOTE 		T128_AY_E_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_5, 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_5, 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_5  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern023:	M_AY_NOTE 		T128_AY_D_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_5, 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_5, 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_5  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern024:	M_AY_NOTE 		T128_AY_D_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT

S00_B_Pattern025:	M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 05, T128_AY_GLISANDO, $00			; Rest
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 05, T128_AY_GLISANDO, $00			; Rest
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern026:	M_AY_NOTE 		T128_AY_E_4  , 1 *TEMPO_S00, 05, T128_AY_GLISANDO, $00			; Rest
					M_AY_NOTE 		T128_AY_E_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 1 *TEMPO_S00, 05, T128_AY_GLISANDO, $00			; Rest
					M_AY_NOTE 		T128_AY_E_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern027:	M_AY_NOTE 		T128_AY_G_4  , 1 *TEMPO_S00, 05, T128_AY_GLISANDO, $00			; Rest
					M_AY_NOTE 		T128_AY_G_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 1 *TEMPO_S00, 05, T128_AY_GLISANDO, $00			; Rest
					M_AY_NOTE 		T128_AY_G_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern028:	M_AY_NOTE 		T128_AY_D_4  , 1 *TEMPO_S00, 05, T128_AY_GLISANDO, $00			; Rest
					M_AY_NOTE 		T128_AY_D_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00					
					M_AY_NOTE 		T128_AY_F_S_4, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 1 *TEMPO_S00, 05, T128_AY_GLISANDO, $00			; Rest
					M_AY_NOTE 		T128_AY_D_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00					
					M_AY_NOTE 		T128_AY_F_S_4, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00					
					M_AY_END_OF_PATT	

S00_B_Pattern029:	M_AY_NOTE 		T128_AY_E_4  , 16*TEMPO_S00, 13, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern030:	M_AY_NOTE 		T128_AY_G_4  , 16*TEMPO_S00, 13, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern031:	M_AY_NOTE 		T128_AY_D_4  , 16*TEMPO_S00, 13, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern032:	M_AY_NOTE 		T128_AY_A_4  , 16*TEMPO_S00, 13, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT	
					
S00_B_Pattern033:	M_AY_NOTE 		T128_AY_E_4  , 2 *TEMPO_S00, 13, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_4  , 14*TEMPO_S00, 13, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern034:	M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 13, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_3  , 14*TEMPO_S00, 13, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern035:	M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S00, 13, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 14*TEMPO_S00, 13, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern036:	M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 13, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 14*TEMPO_S00, 13, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT	
					
S00_B_Pattern037:	M_AY_NOTE 		T128_AY_E_4  , 2 *TEMPO_S00, 13, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 4 *TEMPO_S00, 13, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_5  , 10*TEMPO_S00, 13, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern038:	M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 13, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_5  , 4 *TEMPO_S00, 13, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 10*TEMPO_S00, 13, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern039:	M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S00, 13, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_5  , 4 *TEMPO_S00, 13, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_5  , 10*TEMPO_S00, 13, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern040:	M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 13, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 4 *TEMPO_S00, 13, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 10*TEMPO_S00, 13, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT	

S00_B_Pattern041:	M_AY_NOTE 		T128_AY_A_2  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $1f
					M_AY_NOTE 		T128_AY_B_2  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_C_3  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_D_3  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_E_3  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_F_S_3, 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_G_3  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_A_3  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_E_3  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $1f
					M_AY_NOTE 		T128_AY_F_S_3, 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_G_3  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_A_3  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_B_3  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_C_4  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_D_4  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_E_4  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern042:	M_AY_NOTE 		T128_AY_B_3  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $1f
					M_AY_NOTE 		T128_AY_C_4  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_D_4  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_E_4  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_F_S_4, 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_G_4  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_F_S_4, 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $1f
					M_AY_NOTE 		T128_AY_G_4  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_C_5  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_D_5  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_E_5  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_F_S_5, 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_END_OF_PATT		
					
S00_B_Pattern043:	M_AY_NOTE 		T128_AY_C_5  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $1f
					M_AY_NOTE 		T128_AY_D_5  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_E_5  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_F_S_5, 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_G_5  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_A_5  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_B_5  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_C_6  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_G_5  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $1f
					M_AY_NOTE 		T128_AY_A_5  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_B_5  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_C_6  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_D_6  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_E_6  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_F_S_6, 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_G_6  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_END_OF_PATT	
					
S00_B_Pattern044:	M_AY_NOTE 		T128_AY_D_6  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $1f
					M_AY_NOTE 		T128_AY_E_6  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_F_S_6, 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_G_6  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_A_6  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_B_6  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_C_7  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_D_7  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_A_6  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $1f
					M_AY_NOTE 		T128_AY_B_6  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_C_7  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_D_7  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_E_7  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_F_S_7, 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_G_7  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_A_7  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_END_OF_PATT
	
S00_B_Pattern045:	M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 12*TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern046:	M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 8 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern047:	M_AY_NOTE 		T128_AY_G_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_5, 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern048:	M_AY_NOTE 		T128_AY_A_4  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 12*TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT			

S00_B_Pattern049:	M_AY_NOTE 		T128_AY_C_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_3  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_3  , 12*TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern050:	M_AY_NOTE 		T128_AY_C_3  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_3  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_3  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_3  , 8 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern051:	M_AY_NOTE 		T128_AY_B_3  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern052:	M_AY_NOTE 		T128_AY_A_4  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 12*TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT			
					
S00_B_Pattern053:	M_AY_NOTE 		T128_AY_A_3  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_3  , 1 *TEMPO_S00, 12, T128_AY_MINOR_5 , $00
					M_AY_NOTE 		T128_AY_F_S_3, 1 *TEMPO_S00, 12, T128_AY_MINOR_5 , $00					
					M_AY_NOTE 		T128_AY_G_3  , 1 *TEMPO_S00, 12, T128_AY_MAJOR_5 , $00
					M_AY_NOTE 		T128_AY_A_3  , 1 *TEMPO_S00, 12, T128_AY_MAJOR_5 , $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern054:	M_AY_NOTE 		T128_AY_E_3  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_3  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_3  , 1 *TEMPO_S00, 12, T128_AY_MINOR_5 , $00
					M_AY_NOTE 		T128_AY_C_4  , 1 *TEMPO_S00, 12, T128_AY_MINOR_5 , $00					
					M_AY_NOTE 		T128_AY_D_4  , 1 *TEMPO_S00, 12, T128_AY_MAJOR_5 , $00
					M_AY_NOTE 		T128_AY_E_4  , 1 *TEMPO_S00, 12, T128_AY_MAJOR_5 , $00
					M_AY_END_OF_PATT	
					
S00_B_Pattern055:	M_AY_NOTE 		T128_AY_G_3  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_3  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_3  , 1 *TEMPO_S00, 12, T128_AY_MINOR_5 , $00
					M_AY_NOTE 		T128_AY_E_3  , 1 *TEMPO_S00, 12, T128_AY_MINOR_5 , $00					
					M_AY_NOTE 		T128_AY_F_S_3, 1 *TEMPO_S00, 12, T128_AY_MAJOR_5 , $00
					M_AY_NOTE 		T128_AY_G_3  , 1 *TEMPO_S00, 12, T128_AY_MAJOR_5 , $00
					M_AY_END_OF_PATT	
					
S00_B_Pattern056:	M_AY_NOTE 		T128_AY_A_4  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 12*TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT			

S00_B_Pattern057:	M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00					
					M_AY_NOTE 		T128_AY_C_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00					
					M_AY_NOTE 		T128_AY_A_3  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern058:	M_AY_NOTE 		T128_AY_C_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_3  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_3  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_3  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_3, 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_3  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_3  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00					
					M_AY_NOTE 		T128_AY_E_3  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00		
					M_AY_END_OF_PATT	
					
S00_B_Pattern059:	M_AY_NOTE 		T128_AY_G_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00					
					M_AY_NOTE 		T128_AY_F_S_5, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00					
					M_AY_NOTE 		T128_AY_G_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00					
					M_AY_END_OF_PATT	
					
S00_B_Pattern060:	M_AY_NOTE 		T128_AY_D_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_5, 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_5  , 10*TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT			

S00_B_Pattern061:	M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00					
					M_AY_END_OF_PATT						
					
S00_B_Pattern062:	M_AY_NOTE 		T128_AY_E_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00					
					M_AY_END_OF_PATT		
					
S00_B_Pattern063:	M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00					
					M_AY_END_OF_PATT	
					
S00_B_Pattern064:	M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 12*TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT			

S00_B_Pattern065:	M_AY_NOTE 		T128_AY_A_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern066:	M_AY_NOTE 		T128_AY_E_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern067:	M_AY_NOTE 		T128_AY_G_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_3  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00					
					M_AY_END_OF_PATT						
					
S00_B_Pattern068:	M_AY_NOTE 		T128_AY_D_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT

S00_B_Pattern069:	M_AY_NOTE 		T128_AY_C_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						

S00_B_Pattern070:	M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						

S00_B_Pattern071:	M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT											
					
S00_B_Pattern072:	M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT			

S00_B_Pattern073:	M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						

S00_B_Pattern074:	M_AY_NOTE 		T128_AY_E_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						

S00_B_Pattern075:	M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT											
					
S00_B_Pattern076:	M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT	

S00_B_Pattern077:	M_AY_NOTE 		T128_AY_E_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						

S00_B_Pattern078:	M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						

S00_B_Pattern079:	M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT											
					
S00_B_Pattern080:	M_AY_NOTE 		T128_AY_F_S_4, 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT	
					
S00_B_Pattern081:	M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						

S00_B_Pattern082:	M_AY_NOTE 		T128_AY_E_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						

S00_B_Pattern083:	M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT											
					
S00_B_Pattern084:	M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00					
					M_AY_NOTE 		T128_AY_F_S_4, 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT	

S00_B_Pattern085:	M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 05, T128_AY_GLISANDO, $00			; Rest
					M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern086:	M_AY_NOTE 		T128_AY_E_4  , 2 *TEMPO_S00, 05, T128_AY_GLISANDO, $00			; Rest
					M_AY_NOTE 		T128_AY_E_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern087:	M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 05, T128_AY_GLISANDO, $00			; Rest
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern088:	M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S00, 05, T128_AY_GLISANDO, $00			; Rest
					M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00					
					M_AY_NOTE 		T128_AY_F_S_4, 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT											

S00_B_Pattern089:	M_AY_NOTE 		T128_AY_E_4  , 16*TEMPO_S00, 15, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern090:	M_AY_NOTE 		T128_AY_G_4  , 16*TEMPO_S00, 15, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern091:	M_AY_NOTE 		T128_AY_D_4  , 16*TEMPO_S00, 15, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern092:	M_AY_NOTE 		T128_AY_A_4  , 16*TEMPO_S00, 15, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT	
					
S00_B_Pattern093:	M_AY_NOTE 		T128_AY_E_4  , 2 *TEMPO_S00, 15, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_4  , 14*TEMPO_S00, 15, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern094:	M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 15, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_3  , 14*TEMPO_S00, 15, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern095:	M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S00, 15, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 14*TEMPO_S00, 15, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern096:	M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 15, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 14*TEMPO_S00, 15, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT	
					
S00_B_Pattern097:	M_AY_NOTE 		T128_AY_E_4  , 2 *TEMPO_S00, 15, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 4 *TEMPO_S00, 15, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_5  , 10*TEMPO_S00, 15, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern098:	M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 15, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_5  , 4 *TEMPO_S00, 15, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 10*TEMPO_S00, 15, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern099:	M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S00, 15, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_5  , 4 *TEMPO_S00, 15, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_5  , 10*TEMPO_S00, 15, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern100:	M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 15, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 4 *TEMPO_S00, 15, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 10*TEMPO_S00, 15, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT	
					
S00_B_Pattern101:	M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern102:	M_AY_NOTE 		T128_AY_E_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_5, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_5, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_5, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_5, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern103:	M_AY_NOTE 		T128_AY_D_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_5, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_5, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_5, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_5, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern104:	M_AY_NOTE 		T128_AY_D_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT					
					
S00_B_Pattern105:	M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 6 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 6 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern106:	M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern107:	M_AY_NOTE 		T128_AY_G_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_5, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_5, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern108:	M_AY_NOTE 		T128_AY_A_4  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 12*TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT			

S00_B_Pattern109:	M_AY_NOTE 		T128_AY_A_3  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_3  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern110:	M_AY_NOTE 		T128_AY_E_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern111:	M_AY_NOTE 		T128_AY_G_3  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_3  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_3  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_3  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern112:	M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT

S00_B_Pattern113:	M_AY_NOTE 		T128_AY_A_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_5, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00					
					M_AY_NOTE 		T128_AY_A_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_5, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00					
					M_AY_END_OF_PATT						
					
S00_B_Pattern114:	M_AY_NOTE 		T128_AY_E_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00					
					M_AY_NOTE 		T128_AY_A_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_5, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00					
					M_AY_NOTE 		T128_AY_G_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00					
					M_AY_NOTE 		T128_AY_F_S_4, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00					
					M_AY_NOTE 		T128_AY_E_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00					
					M_AY_END_OF_PATT						
					
S00_B_Pattern115:	M_AY_NOTE 		T128_AY_G_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_5, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00					
					M_AY_NOTE 		T128_AY_A_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_5, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00		
					M_AY_NOTE 		T128_AY_G_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00		
					M_AY_END_OF_PATT						
					
S00_B_Pattern116:	M_AY_NOTE 		T128_AY_D_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00					
					M_AY_NOTE 		T128_AY_A_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_5, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00					
					M_AY_NOTE 		T128_AY_G_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00					
					M_AY_NOTE 		T128_AY_F_S_4, 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00					
					M_AY_NOTE 		T128_AY_E_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00			
					M_AY_NOTE 		T128_AY_D_4  , 1 *TEMPO_S00, 12, T128_AY_GLISANDO, $00			
					M_AY_END_OF_PATT						
					
S00_B_Pattern117:	M_AY_NOTE 		T128_AY_E_4  , 14*TEMPO_S00, 13, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_5  , 2 *TEMPO_S00, 15, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern118:	M_AY_NOTE 		T128_AY_G_4  , 14*TEMPO_S00, 13, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_5  , 2 *TEMPO_S00, 15, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern119:	M_AY_NOTE 		T128_AY_D_4  , 14*TEMPO_S00, 13, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 2 *TEMPO_S00, 15, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern120:	M_AY_NOTE 		T128_AY_A_4  , 14*TEMPO_S00, 13, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_5  , 2 *TEMPO_S00, 15, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT	
					
S00_B_Pattern121:	M_AY_NOTE 		T128_AY_E_4  , 10*TEMPO_S00, 13, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 4 *TEMPO_S00, 15, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 2 *TEMPO_S00, 13, T128_AY_GLISANDO, $00					
					M_AY_END_OF_PATT						
					
S00_B_Pattern122:	M_AY_NOTE 		T128_AY_G_4  , 10*TEMPO_S00, 13, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_3  , 4 *TEMPO_S00, 15, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 13, T128_AY_GLISANDO, $00					
					M_AY_END_OF_PATT						
					
S00_B_Pattern123:	M_AY_NOTE 		T128_AY_D_4  , 10*TEMPO_S00, 13, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 4 *TEMPO_S00, 15, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S00, 13, T128_AY_GLISANDO, $00					
					M_AY_END_OF_PATT						
					
S00_B_Pattern124:	M_AY_NOTE 		T128_AY_A_4  , 10*TEMPO_S00, 13, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 4 *TEMPO_S00, 15, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 13, T128_AY_GLISANDO, $00					
					M_AY_END_OF_PATT	
					
S00_B_Pattern125:	M_AY_NOTE 		T128_AY_A_5  , 2 *TEMPO_S00, 15, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 14*TEMPO_S00, 13, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern126:	M_AY_NOTE 		T128_AY_E_5  , 2 *TEMPO_S00, 15, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 14*TEMPO_S00, 13, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern127:	M_AY_NOTE 		T128_AY_G_5  , 2 *TEMPO_S00, 15, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 14*TEMPO_S00, 13, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern128:	M_AY_NOTE 		T128_AY_D_5  , 2 *TEMPO_S00, 15, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 14*TEMPO_S00, 13, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT	

S00_B_Pattern129:	M_AY_NOTE 		T128_AY_A_3  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_3  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 8 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern130:	M_AY_NOTE 		T128_AY_E_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 8 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern131:	M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 2 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 8 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S00_B_Pattern132:	M_AY_NOTE 		T128_AY_D_5  , 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_5, 4 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_5  , 8 *TEMPO_S00, 12, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT
					
S00_B_Pattern133:	M_AY_NOTE 		T128_AY_A_7  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_G_7  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_F_S_7, 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_E_7  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_D_7  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_C_7  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_B_6  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_A_6  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $1f
					M_AY_NOTE 		T128_AY_D_7  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_C_7  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_B_6  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_A_6  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_G_6  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_F_S_6, 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_E_6  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_D_6  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $1f
					M_AY_END_OF_PATT	

S00_B_Pattern134:	M_AY_NOTE 		T128_AY_G_6  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_F_S_6, 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_E_6  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_D_6  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_C_6  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_B_5  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_A_5  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_G_5  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $1f
					M_AY_NOTE 		T128_AY_C_6  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_B_5  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_A_5  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_G_5  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_F_S_5, 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_E_5  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_D_5  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_C_5  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $1f
					M_AY_END_OF_PATT					

S00_B_Pattern135:	M_AY_NOTE 		T128_AY_F_S_5, 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_E_5  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_D_5  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_C_5  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_G_4  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_F_S_4, 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $1f
					M_AY_NOTE 		T128_AY_B_4  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_G_4  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_F_S_4, 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_E_4  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_D_4  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_C_4  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_B_3  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $1f
					M_AY_END_OF_PATT
					
S00_B_Pattern136:	M_AY_NOTE 		T128_AY_E_4  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_D_4  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_C_4  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_B_3  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_A_3  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_G_3  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_F_S_3, 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_E_3  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $1f
					M_AY_NOTE 		T128_AY_A_3  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_G_3  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_F_S_3, 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_E_3  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_D_3  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_C_3  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_B_2  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_A_2  , 1 *TEMPO_S00, 14, T128_AY_MINOR_5, $1f
					M_AY_END_OF_PATT						
					

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SONG 00: Channel C = Chords
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
					
Song00Channel_C:	defw	PatternFadeIn_6s
					defw	S00_C_Pattern00, S00_C_Pattern00, S00_C_Pattern00, S00_C_Pattern00		; ONLY BASSLINE
					defw	S00_C_Pattern00, S00_C_Pattern00, S00_C_Pattern00, S00_C_Pattern00		
					defw	S00_C_Pattern01, S00_C_Pattern02, S00_C_Pattern03, S00_C_Pattern04		; BASSLINE + CHORDS
					defw	S00_C_Pattern01, S00_C_Pattern02, S00_C_Pattern03, S00_C_Pattern06		; BASSLINE + CHORDS (3) + BASSDRUM (1)
					defw	S00_C_Pattern01, S00_C_Pattern02, S00_C_Pattern03, S00_C_Pattern04		; BLOCK 1
					defw	S00_C_Pattern01, S00_C_Pattern02, S00_C_Pattern03, S00_C_Pattern04		
					defw	S00_C_Pattern01, S00_C_Pattern02, S00_C_Pattern03, S00_C_Pattern04
					defw	S00_C_Pattern01, S00_C_Pattern02, S00_C_Pattern03, S00_C_Pattern04
					defw	S00_C_Pattern01, S00_C_Pattern02, S00_C_Pattern03, S00_C_Pattern04
					defw	S00_C_Pattern01, S00_C_Pattern02, S00_C_Pattern03, S00_C_Pattern04
					defw	S00_C_Pattern01, S00_C_Pattern02, S00_C_Pattern03, S00_C_Pattern04
					defw	S00_C_Pattern01, S00_C_Pattern02, S00_C_Pattern03, S00_C_Pattern04		
					defw	S00_C_Pattern00, S00_C_Pattern00, S00_C_Pattern00, S00_C_Pattern00		; TRANSITION
					defw	S00_C_Pattern00, S00_C_Pattern00, S00_C_Pattern00, S00_C_Pattern00		
					defw	S00_C_Pattern00, S00_C_Pattern00, S00_C_Pattern00, S00_C_Pattern00		
					defw	S00_C_Pattern00, S00_C_Pattern00, S00_C_Pattern00, S00_C_Pattern00		
					defw	S00_C_Pattern06, S00_C_Pattern05, S00_C_Pattern06, S00_C_Pattern05		; BASSLINE + BASSDRUM
					defw	S00_C_Pattern01, S00_C_Pattern02, S00_C_Pattern03, S00_C_Pattern04		; BASSLINE + CHORDS					
					defw	S00_C_Pattern01, S00_C_Pattern02, S00_C_Pattern03, S00_C_Pattern04		; BLOCK 2					
					defw	S00_C_Pattern01, S00_C_Pattern02, S00_C_Pattern03, S00_C_Pattern04
					defw	S00_C_Pattern01, S00_C_Pattern02, S00_C_Pattern03, S00_C_Pattern04
					defw	S00_C_Pattern01, S00_C_Pattern02, S00_C_Pattern03, S00_C_Pattern04
					defw	S00_C_Pattern01, S00_C_Pattern02, S00_C_Pattern03, S00_C_Pattern04
					defw	S00_C_Pattern01, S00_C_Pattern02, S00_C_Pattern03, S00_C_Pattern04
					defw	S00_C_Pattern01, S00_C_Pattern02, S00_C_Pattern03, S00_C_Pattern04
					defw	S00_C_Pattern01, S00_C_Pattern02, S00_C_Pattern03, S00_C_Pattern04
					defw	S00_C_Pattern00, S00_C_Pattern00, S00_C_Pattern00, S00_C_Pattern00		; TRANSITION
					defw	S00_C_Pattern00, S00_C_Pattern00, S00_C_Pattern00, S00_C_Pattern00		
					defw	S00_C_Pattern00, S00_C_Pattern00, S00_C_Pattern00, S00_C_Pattern00		
					defw	S00_C_Pattern00, S00_C_Pattern00, S00_C_Pattern00, S00_C_Pattern00							
					defw	S00_C_Pattern06, S00_C_Pattern05, S00_C_Pattern06, S00_C_Pattern05		; BASSLINE + BASSDRUM					
					defw	S00_C_Pattern01, S00_C_Pattern02, S00_C_Pattern03, S00_C_Pattern04		; BASSLINE + CHORDS										
					defw	S00_C_Pattern01, S00_C_Pattern02, S00_C_Pattern03, S00_C_Pattern04		; BLOCK 3
					defw	S00_C_Pattern01, S00_C_Pattern02, S00_C_Pattern03, S00_C_Pattern04					
					defw	S00_C_Pattern01, S00_C_Pattern02, S00_C_Pattern03, S00_C_Pattern04					
					defw	S00_C_Pattern01, S00_C_Pattern02, S00_C_Pattern03, S00_C_Pattern04					
					defw	S00_C_Pattern01, S00_C_Pattern02, S00_C_Pattern03, S00_C_Pattern04					
					defw	S00_C_Pattern01, S00_C_Pattern02, S00_C_Pattern03, S00_C_Pattern04					
					defw	S00_C_Pattern01, S00_C_Pattern02, S00_C_Pattern03, S00_C_Pattern04					
					defw	S00_C_Pattern01, S00_C_Pattern02, S00_C_Pattern03, S00_C_Pattern04					
					defw	S00_C_Pattern00, S00_C_Pattern00, S00_C_Pattern00, S00_C_Pattern00		; TRANSITION
					defw	S00_C_Pattern00, S00_C_Pattern00, S00_C_Pattern00, S00_C_Pattern00		
					defw	S00_C_Pattern00, S00_C_Pattern00, S00_C_Pattern00, S00_C_Pattern00		
					defw	S00_C_Pattern00, S00_C_Pattern00, S00_C_Pattern00, S00_C_Pattern00							
					defw	S00_C_Pattern06, S00_C_Pattern05, S00_C_Pattern06, S00_C_Pattern05		; BASSLINE + BASSDRUM					
					defw	S00_C_Pattern01, S00_C_Pattern02, S00_C_Pattern03, S00_C_Pattern04		; BASSLINE + CHORDS															
					defw	S00_C_Pattern01, S00_C_Pattern02, S00_C_Pattern03, S00_C_Pattern04		; BLOCK 4
					defw	S00_C_Pattern01, S00_C_Pattern02, S00_C_Pattern03, S00_C_Pattern04		
					defw	S00_C_Pattern01, S00_C_Pattern02, S00_C_Pattern03, S00_C_Pattern04		
					defw	S00_C_Pattern01, S00_C_Pattern02, S00_C_Pattern03, S00_C_Pattern04		
					defw	PatternFadeOut_9s														; THE END					
					defw	S00_C_Pattern01, S00_C_Pattern02, S00_C_Pattern03, S00_C_Pattern04					
					defw	S00_C_Pattern01, S00_C_Pattern02, S00_C_Pattern03, S00_C_Pattern04										
					defw	S00_C_Pattern01, S00_C_Pattern02, S00_C_Pattern03, S00_C_Pattern04										
					M_AY_LOOP_SONG
					
S00_C_Pattern00:	M_AY_NOTE 		T128_AY_A_2  , 16*TEMPO_S00, 05, T128_AY_MINOR_5, $0F			; Rest
					M_AY_END_OF_PATT					
					
S00_C_Pattern01:	M_AY_NOTE 		T128_AY_A_2  , 1 *TEMPO_S00, 11, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_A_2  , 3 *TEMPO_S00, 05, T128_AY_MINOR_5, $00			; Rest
					M_AY_NOTE 		T128_AY_A_2  , 1 *TEMPO_S00, 11, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_A_2  , 3 *TEMPO_S00, 05, T128_AY_MINOR_5, $00			; Rest
					M_AY_NOTE 		T128_AY_A_2  , 1 *TEMPO_S00, 11, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_A_2  , 3 *TEMPO_S00, 05, T128_AY_MINOR_5, $00			; Rest
					M_AY_NOTE 		T128_AY_A_2  , 1 *TEMPO_S00, 11, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_A_2  , 3 *TEMPO_S00, 05, T128_AY_MINOR_5, $00			; Rest
					M_AY_END_OF_PATT						

S00_C_Pattern02:	M_AY_NOTE 		T128_AY_E_3  , 1 *TEMPO_S00, 11, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_E_3  , 3 *TEMPO_S00, 05, T128_AY_MINOR_5, $00			; Rest
					M_AY_NOTE 		T128_AY_E_3  , 1 *TEMPO_S00, 11, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_E_3  , 3 *TEMPO_S00, 05, T128_AY_MINOR_5, $00			; Rest
					M_AY_NOTE 		T128_AY_E_3  , 1 *TEMPO_S00, 11, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_E_3  , 3 *TEMPO_S00, 05, T128_AY_MINOR_5, $00			; Rest
					M_AY_NOTE 		T128_AY_E_3  , 1 *TEMPO_S00, 11, T128_AY_MINOR_5, $00
					M_AY_NOTE 		T128_AY_E_3  , 3 *TEMPO_S00, 05, T128_AY_MINOR_5, $00			; Rest
					M_AY_END_OF_PATT						

S00_C_Pattern03:	M_AY_NOTE 		T128_AY_G_2  , 1 *TEMPO_S00, 11, T128_AY_MAJOR_5, $00
					M_AY_NOTE 		T128_AY_G_2  , 3 *TEMPO_S00, 05, T128_AY_MAJOR_5, $00			; Rest
					M_AY_NOTE 		T128_AY_G_2  , 1 *TEMPO_S00, 11, T128_AY_MAJOR_5, $00
					M_AY_NOTE 		T128_AY_G_2  , 3 *TEMPO_S00, 05, T128_AY_MAJOR_5, $00			; Rest
					M_AY_NOTE 		T128_AY_G_2  , 1 *TEMPO_S00, 11, T128_AY_MAJOR_5, $00
					M_AY_NOTE 		T128_AY_G_2  , 3 *TEMPO_S00, 05, T128_AY_MAJOR_5, $00			; Rest
					M_AY_NOTE 		T128_AY_G_2  , 1 *TEMPO_S00, 11, T128_AY_MAJOR_5, $00
					M_AY_NOTE 		T128_AY_G_2  , 3 *TEMPO_S00, 05, T128_AY_MAJOR_5, $00			; Rest
					M_AY_END_OF_PATT						

S00_C_Pattern04:	M_AY_NOTE 		T128_AY_D_3  , 1 *TEMPO_S00, 11, T128_AY_MAJOR_5, $00
					M_AY_NOTE 		T128_AY_D_3  , 3 *TEMPO_S00, 05, T128_AY_MAJOR_5, $00			; Rest
					M_AY_NOTE 		T128_AY_D_3  , 1 *TEMPO_S00, 11, T128_AY_MAJOR_5, $00
					M_AY_NOTE 		T128_AY_D_3  , 3 *TEMPO_S00, 05, T128_AY_MAJOR_5, $00			; Rest
					M_AY_NOTE 		T128_AY_D_3  , 1 *TEMPO_S00, 11, T128_AY_MAJOR_5, $00
					M_AY_NOTE 		T128_AY_D_3  , 3 *TEMPO_S00, 05, T128_AY_MAJOR_5, $00			; Rest
					M_AY_NOTE 		T128_AY_D_3  , 1 *TEMPO_S00, 11, T128_AY_MAJOR_5, $00
					M_AY_NOTE 		T128_AY_D_3  , 3 *TEMPO_S00, 05, T128_AY_MAJOR_5, $00			; Rest
					M_AY_END_OF_PATT						

S00_C_Pattern05:	M_AY_NOTE 		T128_AY_A_2  , 1 *TEMPO_S00, 07, T128_AY_NO_APR_ORN, $00			
					M_AY_NOTE 		T128_AY_G_2  , 1 *TEMPO_S00, 07, T128_AY_NO_APR_ORN, $00			
					M_AY_NOTE 		T128_AY_F_S_2, 1 *TEMPO_S00, 07, T128_AY_NO_APR_ORN, $00			
					M_AY_NOTE 		T128_AY_E_2  , 1 *TEMPO_S00, 07, T128_AY_NO_APR_ORN, $00			
					M_AY_NOTE 		T128_AY_D_2  , 1 *TEMPO_S00, 07, T128_AY_NO_APR_ORN, $00			
					M_AY_NOTE 		T128_AY_C_2  , 1 *TEMPO_S00, 07, T128_AY_NO_APR_ORN, $00			
					M_AY_NOTE 		T128_AY_B_1  , 1 *TEMPO_S00, 07, T128_AY_NO_APR_ORN, $00			
					M_AY_NOTE 		T128_AY_A_1  , 1 *TEMPO_S00, 07, T128_AY_NO_APR_ORN, $00			
					M_AY_NOTE 		T128_AY_A_1  , 1 *TEMPO_S00, 07, T128_AY_NO_APR_ORN, $00			
					M_AY_NOTE 		T128_AY_G_1  , 1 *TEMPO_S00, 07, T128_AY_NO_APR_ORN, $00			
					M_AY_NOTE 		T128_AY_F_S_1, 1 *TEMPO_S00, 07, T128_AY_NO_APR_ORN, $00			
					M_AY_NOTE 		T128_AY_E_1  , 1 *TEMPO_S00, 07, T128_AY_NO_APR_ORN, $00			
					M_AY_NOTE 		T128_AY_D_1  , 1 *TEMPO_S00, 07, T128_AY_NO_APR_ORN, $00			
					M_AY_NOTE 		T128_AY_C_1  , 1 *TEMPO_S00, 07, T128_AY_NO_APR_ORN, $00			
					M_AY_NOTE 		T128_AY_B_0  , 1 *TEMPO_S00, 07, T128_AY_NO_APR_ORN, $00			
					M_AY_NOTE 		T128_AY_A_0  , 1 *TEMPO_S00, 07, T128_AY_NO_APR_ORN, $00			
					M_AY_END_OF_PATT
					
S00_C_Pattern06:	M_AY_NOTE 		T128_AY_A_4  , 1 *TEMPO_S00, 07, T128_AY_NO_APR_ORN, $00			
					M_AY_NOTE 		T128_AY_F_S_4, 1 *TEMPO_S00, 07, T128_AY_NO_APR_ORN, $00			
					M_AY_NOTE 		T128_AY_D_4  , 1 *TEMPO_S00, 07, T128_AY_NO_APR_ORN, $00			
					M_AY_NOTE 		T128_AY_B_3  , 1 *TEMPO_S00, 07, T128_AY_NO_APR_ORN, $00			
					M_AY_NOTE 		T128_AY_A_3  , 1 *TEMPO_S00, 07, T128_AY_NO_APR_ORN, $00			
					M_AY_NOTE 		T128_AY_F_S_3, 1 *TEMPO_S00, 07, T128_AY_NO_APR_ORN, $00			
					M_AY_NOTE 		T128_AY_D_3  , 1 *TEMPO_S00, 07, T128_AY_NO_APR_ORN, $00			
					M_AY_NOTE 		T128_AY_B_2  , 1 *TEMPO_S00, 07, T128_AY_NO_APR_ORN, $00			
					M_AY_NOTE 		T128_AY_A_2  , 1 *TEMPO_S00, 07, T128_AY_NO_APR_ORN, $00			
					M_AY_NOTE 		T128_AY_F_S_2, 1 *TEMPO_S00, 07, T128_AY_NO_APR_ORN, $00			
					M_AY_NOTE 		T128_AY_D_2  , 1 *TEMPO_S00, 07, T128_AY_NO_APR_ORN, $00			
					M_AY_NOTE 		T128_AY_B_1  , 1 *TEMPO_S00, 07, T128_AY_NO_APR_ORN, $00			
					M_AY_NOTE 		T128_AY_A_1  , 1 *TEMPO_S00, 07, T128_AY_NO_APR_ORN, $00			
					M_AY_NOTE 		T128_AY_F_S_1, 1 *TEMPO_S00, 07, T128_AY_NO_APR_ORN, $00			
					M_AY_NOTE 		T128_AY_D_1  , 1 *TEMPO_S00, 07, T128_AY_NO_APR_ORN, $00			
					M_AY_NOTE 		T128_AY_B_0  , 1 *TEMPO_S00, 07, T128_AY_NO_APR_ORN, $00			
					M_AY_END_OF_PATT	


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Song 01 (T128_AY_MUSIC_MENU)
;;
;; Main chord progresssion: Cm G D# F (non standard key of Cm: C D D# F G G# B 
;;
;; Channel A = Bassline			Intruments: 	08, 20
;; Channel B = Main theme		Intruments: 	00, 09, 10
;; Channel C = Percussion		Intruments: 	01, 08, 21
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

TEMPO_S01			EQU		T128_AY_TEMPO4

T128_AY_Song01:		defw	Song01Channel_A, Song01Channel_B, Song01Channel_C

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SONG 01: Channel A = Bassline
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Song01Channel_A:	defw	PatternFadeIn_3s
					defw	S01_A_Pattern00, S01_A_Pattern00, S01_A_Pattern00, S01_A_Pattern00		; START (Rest)
					defw	S01_A_Pattern01, S01_A_Pattern01, S01_A_Pattern01, S01_A_Pattern01		; BLOCK 1
					defw	S01_A_Pattern01, S01_A_Pattern01, S01_A_Pattern01, S01_A_Pattern01
					defw	S01_A_Pattern02, S01_A_Pattern02, S01_A_Pattern02, S01_A_Pattern02
					defw	S01_A_Pattern02, S01_A_Pattern02, S01_A_Pattern02, S01_A_Pattern02
					defw	S01_A_Pattern03, S01_A_Pattern03, S01_A_Pattern03, S01_A_Pattern03
					defw	S01_A_Pattern03, S01_A_Pattern03, S01_A_Pattern03, S01_A_Pattern03
					defw	S01_A_Pattern04, S01_A_Pattern04, S01_A_Pattern04, S01_A_Pattern04
					defw	S01_A_Pattern04, S01_A_Pattern04, S01_A_Pattern04, S01_A_Pattern04
					defw	S01_A_Pattern05															; TRANSITION
					defw	S01_A_Pattern06															; TRANSITION
					defw	S01_A_Pattern06, S01_A_Pattern06										; BLOCK 2
					defw	S01_A_Pattern07, S01_A_Pattern07
					defw	S01_A_Pattern08, S01_A_Pattern08
					defw	S01_A_Pattern09, S01_A_Pattern09
					defw	S01_A_Pattern05															; TRANSITION
					defw	S01_A_Pattern01, S01_A_Pattern01, S01_A_Pattern01, S01_A_Pattern01		; BLOCK 3
					defw	S01_A_Pattern01, S01_A_Pattern01, S01_A_Pattern01, S01_A_Pattern01
					defw	S01_A_Pattern02, S01_A_Pattern02, S01_A_Pattern02, S01_A_Pattern02
					defw	S01_A_Pattern02, S01_A_Pattern02, S01_A_Pattern02, S01_A_Pattern02
					defw	S01_A_Pattern03, S01_A_Pattern03, S01_A_Pattern03, S01_A_Pattern03
					defw	S01_A_Pattern03, S01_A_Pattern03, S01_A_Pattern03, S01_A_Pattern03
					defw	S01_A_Pattern04, S01_A_Pattern04, S01_A_Pattern04, S01_A_Pattern04
					defw	S01_A_Pattern04, S01_A_Pattern04, S01_A_Pattern04, S01_A_Pattern04
					defw	S01_A_Pattern01, S01_A_Pattern01, S01_A_Pattern01, S01_A_Pattern01		; TRANSITION
					defw	PatternFadeOut_8s
					defw	S01_A_Pattern01, S01_A_Pattern01, S01_A_Pattern01, S01_A_Pattern01		; BLOCK 1
					defw	S01_A_Pattern01, S01_A_Pattern01, S01_A_Pattern01, S01_A_Pattern01
					defw	S01_A_Pattern02, S01_A_Pattern02, S01_A_Pattern02, S01_A_Pattern02
					defw	S01_A_Pattern02, S01_A_Pattern02, S01_A_Pattern02, S01_A_Pattern02
					M_AY_LOOP_SONG

					
S01_A_Pattern00:	M_AY_NOTE 		T128_AY_B_3  , 24*TEMPO_S01, 05, T128_AY_GLISANDO, $00			; Rest	
					M_AY_END_OF_PATT															

S01_A_Pattern01:	M_AY_NOTE 		T128_AY_C_2  , 4 *TEMPO_S01, 20, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_G_2  , 4 *TEMPO_S01, 20, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_C_3  , 4 *TEMPO_S01, 20, T128_AY_MAJOR, $00
					M_AY_END_OF_PATT						
					
S01_A_Pattern02:	M_AY_NOTE 		T128_AY_G_2  , 4 *TEMPO_S01, 20, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_D_3  , 4 *TEMPO_S01, 20, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_G_3  , 4 *TEMPO_S01, 20, T128_AY_MAJOR, $00
					M_AY_END_OF_PATT						

S01_A_Pattern03:	M_AY_NOTE 		T128_AY_D_S_2, 4 *TEMPO_S01, 20, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_A_S_2, 4 *TEMPO_S01, 20, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_D_S_3, 4 *TEMPO_S01, 20, T128_AY_MAJOR, $00
					M_AY_END_OF_PATT						

S01_A_Pattern04:	M_AY_NOTE 		T128_AY_F_2  , 4 *TEMPO_S01, 20, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_C_3  , 4 *TEMPO_S01, 20, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_F_3  , 4 *TEMPO_S01, 20, T128_AY_MAJOR, $00
					M_AY_END_OF_PATT						
					
S01_A_Pattern05:	M_AY_NOTE 		T128_AY_C_3  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_C_4  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_B_2  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_B_3  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_G_S_2, 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_G_S_3, 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_G_2  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_G_3  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_F_2  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_F_3  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_D_S_2, 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_D_S_3, 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_D_2  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_D_3  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_C_2  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_C_3  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_END_OF_PATT

S01_A_Pattern06:	M_AY_NOTE 		T128_AY_C_2  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_E_2  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_G_2  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_C_3  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_C_2  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_E_2  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_G_2  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_C_3  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_C_2  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_E_2  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_G_2  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_C_3  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_END_OF_PATT						
					
S01_A_Pattern07:	M_AY_NOTE 		T128_AY_G_2  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_B_2  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_D_3  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_G_3  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_G_2  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_B_2  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_D_3  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_G_3  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_G_2  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_B_2  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_D_3  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_G_3  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_END_OF_PATT						

S01_A_Pattern08:	M_AY_NOTE 		T128_AY_D_S_2, 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_A_S_2, 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_D_S_3, 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_D_S_2, 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_A_S_2, 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_D_S_3, 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_D_S_2, 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_A_S_2, 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_D_S_3, 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_D_S_2, 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_A_S_2, 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_D_S_3, 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_END_OF_PATT		

S01_A_Pattern09:	M_AY_NOTE 		T128_AY_F_2  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_C_3  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_F_3  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_F_2  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_C_3  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_F_3  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_F_2  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_C_3  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_F_3  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_F_2  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_C_3  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_F_3  , 2 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_END_OF_PATT						
					
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;					
;
; SONG 01: Channel B = Main theme
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;					
					
Song01Channel_B:	defw	PatternFadeIn_3s
					defw	S01_B_Pattern00, S01_B_Pattern00, S01_B_Pattern00, S01_B_Pattern00		; START (Rest)
					defw	S01_B_Pattern01															; BLOCK 1
					defw	S01_B_Pattern02
					defw	S01_B_Pattern03
					defw	S01_B_Pattern04	
					defw	S01_B_Pattern05															; TRANSITION
					defw	S01_B_Pattern00															; TRANSITION (Rest)		
					defw	S01_B_Pattern07															; BLOCK 2
					defw	S01_B_Pattern08
					defw	S01_B_Pattern09
					defw	S01_B_Pattern10
					defw	S01_B_Pattern05															; TRANSITION
					defw	S01_B_Pattern11															; BLOCK 3
					defw	S01_B_Pattern12
					defw	S01_B_Pattern13
					defw	S01_B_Pattern14			
					defw	S01_B_Pattern15															; TRANSITION				
					defw	PatternFadeOut_8s
					defw	S01_B_Pattern01															; BLOCK 1
					defw	S01_B_Pattern02
					M_AY_LOOP_SONG

					
S01_B_Pattern00:	M_AY_NOTE 		T128_AY_B_3  , 24*TEMPO_S01, 05, T128_AY_GLISANDO, $00			; Rest	
					M_AY_END_OF_PATT										

S01_B_Pattern01:	M_AY_NOTE 		T128_AY_C_4  , 16*TEMPO_S01, 05, T128_AY_GLISANDO, $00			; Rest
					M_AY_NOTE 		T128_AY_C_4  , 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_S_4, 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 12*TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_4  , 4 *TEMPO_S01, 05, T128_AY_GLISANDO, $00			; Rest					
					M_AY_NOTE 		T128_AY_C_4  , 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_S_4, 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 12*TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_4  , 4 *TEMPO_S01, 05, T128_AY_GLISANDO, $00			; Rest					
					M_AY_NOTE 		T128_AY_C_4  , 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_S_4, 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_S_4, 8 *TEMPO_S01, 00, T128_AY_GLISANDO, $00					
					M_AY_NOTE 		T128_AY_G_4  , 8 *TEMPO_S01, 00, T128_AY_GLISANDO, $00					
					M_AY_NOTE 		T128_AY_D_S_4, 8 *TEMPO_S01, 00, T128_AY_GLISANDO, $00					
					M_AY_END_OF_PATT						
					
S01_B_Pattern02:	M_AY_NOTE 		T128_AY_D_4   ,12*TEMPO_S01, 00, T128_AY_GLISANDO, $00		
					M_AY_NOTE 		T128_AY_B_3  , 4 *TEMPO_S01, 05, T128_AY_GLISANDO, $00			; Rest
					M_AY_NOTE 		T128_AY_B_3  , 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_4  , 12*TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_3  , 4 *TEMPO_S01, 05, T128_AY_GLISANDO, $00			; Rest					
					M_AY_NOTE 		T128_AY_B_3  , 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_4  , 12*TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_3  , 4 *TEMPO_S01, 05, T128_AY_GLISANDO, $00			; Rest
					M_AY_NOTE 		T128_AY_B_3  , 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 8 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_4  , 8 *TEMPO_S01, 00, T128_AY_GLISANDO, $00							
					M_AY_NOTE 		T128_AY_D_S_4, 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S01_B_Pattern03:	M_AY_NOTE 		T128_AY_C_4  , 12*TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_S_4, 4 *TEMPO_S01, 05, T128_AY_GLISANDO, $00			; Rest
					M_AY_NOTE 		T128_AY_A_S_4, 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_S_4, 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 12*TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_S_4, 4 *TEMPO_S01, 05, T128_AY_GLISANDO, $00			; Rest					
					M_AY_NOTE 		T128_AY_A_S_4, 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_S_4, 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 12*TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 4 *TEMPO_S01, 05, T128_AY_GLISANDO, $00			; Rest
					M_AY_NOTE 		T128_AY_G_4  , 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_S_4, 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 8 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_S_4, 8 *TEMPO_S01, 00, T128_AY_GLISANDO, $00							
					M_AY_NOTE 		T128_AY_G_S_4, 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S01_B_Pattern04:	M_AY_NOTE 		T128_AY_F_4  , 12*TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_S_4, 4 *TEMPO_S01, 05, T128_AY_GLISANDO, $00			; Rest
					M_AY_NOTE 		T128_AY_G_S_4, 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_4  , 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 12*TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_S_4, 4 *TEMPO_S01, 05, T128_AY_GLISANDO, $00			; Rest					
					M_AY_NOTE 		T128_AY_G_S_4, 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_4  , 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 12*TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 4 *TEMPO_S01, 05, T128_AY_GLISANDO, $00			; Rest
					M_AY_NOTE 		T128_AY_D_4  , 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_S_4, 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 8 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_4  , 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00							
					M_AY_NOTE 		T128_AY_D_S_4, 8 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_END_OF_PATT						
					
S01_B_Pattern05:	M_AY_NOTE 		T128_AY_C_4  , 12*TEMPO_S01, 00, T128_AY_GLISANDO, $00					
					M_AY_NOTE 		T128_AY_B_3  , 20*TEMPO_S01, 05, T128_AY_GLISANDO, $00			; Rest	
					M_AY_END_OF_PATT										
					
S01_B_Pattern06:	M_AY_NOTE 		T128_AY_B_3  , 32*TEMPO_S01, 05, T128_AY_GLISANDO, $00			; Rest	
					M_AY_END_OF_PATT										
					
S01_B_Pattern07:	M_AY_NOTE 		T128_AY_C_4  , 14*TEMPO_S01, 05, T128_AY_OCTAVE  , $00			; Rest		
					M_AY_NOTE 		T128_AY_C_4  , 1 *TEMPO_S01, 00, T128_AY_OCTAVE  , $00
					M_AY_NOTE 		T128_AY_D_S_4, 5 *TEMPO_S01, 00, T128_AY_OCTAVE  , $00
					M_AY_NOTE 		T128_AY_C_4  , 2 *TEMPO_S01, 00, T128_AY_OCTAVE  , $00
					M_AY_NOTE 		T128_AY_A_S_3, 2 *TEMPO_S01, 00, T128_AY_OCTAVE  , $00
					M_AY_NOTE 		T128_AY_C_4  , 8 *TEMPO_S01, 00, T128_AY_OCTAVE  , $00
					M_AY_NOTE 		T128_AY_C_4  , 2 *TEMPO_S01, 09, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S01, 10, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_4  , 2 *TEMPO_S01, 09, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_4  , 1 *TEMPO_S01, 00, T128_AY_OCTAVE  , $00
					M_AY_NOTE 		T128_AY_D_S_4, 5 *TEMPO_S01, 00, T128_AY_OCTAVE  , $00
					M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S01, 00, T128_AY_OCTAVE  , $00
					M_AY_NOTE 		T128_AY_C_4  , 2 *TEMPO_S01, 00, T128_AY_OCTAVE  , $00
					M_AY_END_OF_PATT															
					
S01_B_Pattern08:	M_AY_NOTE 		T128_AY_D_4  , 8 *TEMPO_S01, 00, T128_AY_OCTAVE  , $00
					M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S01, 09, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 2 *TEMPO_S01, 10, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S01, 09, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 1 *TEMPO_S01, 00, T128_AY_OCTAVE  , $00
					M_AY_NOTE 		T128_AY_F_4  , 5 *TEMPO_S01, 00, T128_AY_OCTAVE  , $00
					M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S01, 00, T128_AY_OCTAVE  , $00
					M_AY_NOTE 		T128_AY_B_3  , 2 *TEMPO_S01, 00, T128_AY_OCTAVE  , $00
					M_AY_NOTE 		T128_AY_D_4  , 8 *TEMPO_S01, 00, T128_AY_OCTAVE  , $00
					M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S01, 09, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_E_4  , 2 *TEMPO_S01, 10, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S01, 09, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 1 *TEMPO_S01, 00, T128_AY_OCTAVE  , $00
					M_AY_NOTE 		T128_AY_F_4  , 5 *TEMPO_S01, 00, T128_AY_OCTAVE  , $00
					M_AY_NOTE 		T128_AY_D_S_4, 2 *TEMPO_S01, 00, T128_AY_OCTAVE  , $00
					M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S01, 00, T128_AY_OCTAVE  , $00					
					M_AY_END_OF_PATT										
					
S01_B_Pattern09:	M_AY_NOTE 		T128_AY_C_4  , 8 *TEMPO_S01, 00, T128_AY_OCTAVE  , $00
					M_AY_NOTE 		T128_AY_C_4  , 6 *TEMPO_S01, 05, T128_AY_GLISANDO, $00			; Rest
					M_AY_NOTE 		T128_AY_A_S_4, 1 *TEMPO_S01, 00, T128_AY_OCTAVE  , $00
					M_AY_NOTE 		T128_AY_G_4  , 5 *TEMPO_S01, 00, T128_AY_OCTAVE  , $00
					M_AY_NOTE 		T128_AY_A_S_4, 2 *TEMPO_S01, 00, T128_AY_OCTAVE  , $00
					M_AY_NOTE 		T128_AY_C_5  , 2 *TEMPO_S01, 00, T128_AY_OCTAVE  , $00
					M_AY_NOTE 		T128_AY_G_4  , 8 *TEMPO_S01, 00, T128_AY_OCTAVE  , $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S01, 09, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S01, 10, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S01, 09, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_S_4, 1 *TEMPO_S01, 00, T128_AY_OCTAVE  , $00
					M_AY_NOTE 		T128_AY_G_4  , 5 *TEMPO_S01, 00, T128_AY_OCTAVE  , $00
					M_AY_NOTE 		T128_AY_A_S_4, 2 *TEMPO_S01, 00, T128_AY_OCTAVE  , $00
					M_AY_NOTE 		T128_AY_G_S_4, 2 *TEMPO_S01, 00, T128_AY_OCTAVE  , $00
					M_AY_END_OF_PATT																				
					
S01_B_Pattern10:	M_AY_NOTE 		T128_AY_F_4  , 8 *TEMPO_S01, 00, T128_AY_OCTAVE  , $00
					M_AY_NOTE 		T128_AY_C_4  , 6 *TEMPO_S01, 05, T128_AY_GLISANDO, $00			; Rest
					M_AY_NOTE 		T128_AY_G_S_4, 1 *TEMPO_S01, 00, T128_AY_OCTAVE  , $00
					M_AY_NOTE 		T128_AY_F_4  , 5 *TEMPO_S01, 00, T128_AY_OCTAVE  , $00
					M_AY_NOTE 		T128_AY_A_S_4, 2 *TEMPO_S01, 00, T128_AY_OCTAVE  , $00
					M_AY_NOTE 		T128_AY_G_S_4, 2 *TEMPO_S01, 00, T128_AY_OCTAVE  , $00
					M_AY_NOTE 		T128_AY_F_4  , 8 *TEMPO_S01, 00, T128_AY_OCTAVE  , $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S01, 09, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_4  , 2 *TEMPO_S01, 10, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S01, 09, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_S_4, 1 *TEMPO_S01, 00, T128_AY_OCTAVE  , $00
					M_AY_NOTE 		T128_AY_F_4  , 5 *TEMPO_S01, 00, T128_AY_OCTAVE  , $00
					M_AY_NOTE 		T128_AY_D_S_4, 2 *TEMPO_S01, 00, T128_AY_OCTAVE  , $00
					M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S01, 00, T128_AY_OCTAVE  , $00
					M_AY_END_OF_PATT																				
					
S01_B_Pattern11:	M_AY_NOTE 		T128_AY_C_4  , 48*TEMPO_S01, 05, T128_AY_GLISANDO, $00			; Rest
					M_AY_NOTE 		T128_AY_D_S_4, 16*TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_4  , 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_S_4, 4 *TEMPO_S01, 09, T128_AY_GLISANDO, $00							
					M_AY_NOTE 		T128_AY_G_4  , 16*TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_4  , 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_S_4, 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00				
					M_AY_END_OF_PATT						
					
S01_B_Pattern12:	M_AY_NOTE 		T128_AY_D_4  , 16*TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 2 *TEMPO_S01, 09, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 2 *TEMPO_S01, 10, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S01, 09, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_S_4, 2 *TEMPO_S01, 10, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S01, 09, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_4  , 2 *TEMPO_S01, 10, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_S_4, 2 *TEMPO_S01, 09, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S01, 10, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_4  , 2 *TEMPO_S01, 10, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_3  , 2 *TEMPO_S01, 09, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_S_3, 2 *TEMPO_S01, 10, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_3  , 2 *TEMPO_S01, 09, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_3  , 2 *TEMPO_S01, 10, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_S_3, 2 *TEMPO_S01, 09, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_3  , 4 *TEMPO_S01, 10, T128_AY_GLISANDO, $00					
					M_AY_NOTE 		T128_AY_F_4  , 16*TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_4  , 4 *TEMPO_S01, 09, T128_AY_GLISANDO, $00							
					M_AY_NOTE 		T128_AY_G_S_4, 16*TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_S_4, 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00				
					M_AY_END_OF_PATT		

S01_B_Pattern13:	M_AY_NOTE 		T128_AY_C_4  , 16*TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 2 *TEMPO_S01, 09, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S01, 10, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_S_4, 2 *TEMPO_S01, 09, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S01, 10, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_4  , 2 *TEMPO_S01, 09, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_S_4, 2 *TEMPO_S01, 10, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S01, 09, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_4  , 2 *TEMPO_S01, 10, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_3  , 2 *TEMPO_S01, 10, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_S_3, 2 *TEMPO_S01, 09, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_3  , 2 *TEMPO_S01, 10, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_3  , 2 *TEMPO_S01, 09, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_S_3, 2 *TEMPO_S01, 10, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_3  , 2 *TEMPO_S01, 09, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_3  , 4 *TEMPO_S01, 10, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_S_4, 16*TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_S_4, 4 *TEMPO_S01, 09, T128_AY_GLISANDO, $00							
					M_AY_NOTE 		T128_AY_C_5  , 16*TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_A_S_4, 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_S_4, 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00				
					M_AY_END_OF_PATT					
					
S01_B_Pattern14:	M_AY_NOTE 		T128_AY_F_4  , 16*TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_5  , 2 *TEMPO_S01, 09, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_S_5, 2 *TEMPO_S01, 10, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_5  , 2 *TEMPO_S01, 09, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_5  , 2 *TEMPO_S01, 10, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_4  , 2 *TEMPO_S01, 09, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_S_4, 2 *TEMPO_S01, 10, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_4  , 2 *TEMPO_S01, 09, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_4  , 2 *TEMPO_S01, 10, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_S_4, 2 *TEMPO_S01, 10, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 2 *TEMPO_S01, 09, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_C_4  , 2 *TEMPO_S01, 10, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_B_3  , 2 *TEMPO_S01, 09, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_S_3, 2 *TEMPO_S01, 10, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_3  , 2 *TEMPO_S01, 09, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_3  , 4 *TEMPO_S01, 10, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_4  , 16*TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_G_S_4, 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_4  , 4 *TEMPO_S01, 09, T128_AY_GLISANDO, $00							
					M_AY_NOTE 		T128_AY_A_S_4, 16*TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_F_4  , 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00
					M_AY_NOTE 		T128_AY_D_4  , 4 *TEMPO_S01, 00, T128_AY_GLISANDO, $00		
					M_AY_END_OF_PATT

S01_B_Pattern15:	M_AY_NOTE 		T128_AY_C_4  , 16*TEMPO_S01, 00, T128_AY_GLISANDO, $00					
					M_AY_NOTE 		T128_AY_B_3  , 32*TEMPO_S01, 05, T128_AY_GLISANDO, $00			; Rest	
					M_AY_END_OF_PATT	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;					
;
; SONG 01: Channel C = Percussion
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;					
					
Song01Channel_C:	defw	PatternFadeIn_3s
					defw	S01_C_Pattern01, S01_C_Pattern02, S01_C_Pattern02, S01_C_Pattern02		; START
					defw	S01_C_Pattern02, S01_C_Pattern02, S01_C_Pattern02, S01_C_Pattern02		; BLOCK 1
					defw	S01_C_Pattern02, S01_C_Pattern02, S01_C_Pattern02, S01_C_Pattern02
					defw	S01_C_Pattern02, S01_C_Pattern02, S01_C_Pattern02, S01_C_Pattern02					
					defw	S01_C_Pattern02, S01_C_Pattern02, S01_C_Pattern02, S01_C_Pattern02		
					defw	S01_C_Pattern00															; TRANSITION (Rest)
					defw	S01_C_Pattern05															; TRANSITION
					defw	S01_C_Pattern05, S01_C_Pattern05										; BLOCK 2
					defw	S01_C_Pattern06, S01_C_Pattern06
					defw	S01_C_Pattern07, S01_C_Pattern07
					defw	S01_C_Pattern08, S01_C_Pattern08
					defw	S01_C_Pattern00															; TRANSITION (Rest)
					defw	S01_C_Pattern02, S01_C_Pattern02, S01_C_Pattern02, S01_C_Pattern02		; BLOCK 3
					defw	S01_C_Pattern02, S01_C_Pattern02, S01_C_Pattern02, S01_C_Pattern02
					defw	S01_C_Pattern02, S01_C_Pattern02, S01_C_Pattern02, S01_C_Pattern02					
					defw	S01_C_Pattern02, S01_C_Pattern02, S01_C_Pattern02, S01_C_Pattern02	
					defw	S01_C_Pattern02, S01_C_Pattern02, S01_C_Pattern02, S01_C_Pattern02		; TRANSITION	
					defw	PatternFadeOut_8s
					defw	S01_C_Pattern02, S01_C_Pattern02, S01_C_Pattern02, S01_C_Pattern02		; BLOCK 1					
					defw	S01_C_Pattern02, S01_C_Pattern02, S01_C_Pattern02, S01_C_Pattern02					
					M_AY_LOOP_SONG


S01_C_Pattern00:	M_AY_NOTE 		T128_AY_C_3  , 32*TEMPO_S01, 05, T128_AY_GLISANDO, $0F			; Rest	
					M_AY_END_OF_PATT										
					
S01_C_Pattern01:	M_AY_NOTE 		T128_AY_C_3  , 12*TEMPO_S01, 05, T128_AY_GLISANDO  , $00		; Rest					
					M_AY_NOTE 		T128_AY_C_2  , 4 *TEMPO_S01, 21, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_C_3  , 4 *TEMPO_S01, 05, T128_AY_GLISANDO  , $00		; Rest					
					M_AY_NOTE 		T128_AY_C_2  , 4 *TEMPO_S01, 01, T128_AY_NO_APR_ORN, $0F
					M_AY_END_OF_PATT													

S01_C_Pattern02:	M_AY_NOTE 		T128_AY_C_2  , 4 *TEMPO_S01, 01, T128_AY_NO_APR_ORN, $0F
					M_AY_NOTE 		T128_AY_C_3  , 8 *TEMPO_S01, 05, T128_AY_GLISANDO  , $00		; Rest			
					M_AY_NOTE 		T128_AY_C_2  , 4 *TEMPO_S01, 21, T128_AY_NO_APR_ORN, $00
					M_AY_NOTE 		T128_AY_C_3  , 4 *TEMPO_S01, 05, T128_AY_GLISANDO  , $00		; Rest					
					M_AY_NOTE 		T128_AY_C_2  , 4 *TEMPO_S01, 01, T128_AY_NO_APR_ORN, $0F
					M_AY_END_OF_PATT													
					
S01_C_Pattern03:	M_AY_NOTE 		T128_AY_B_3  , 24*TEMPO_S01, 05, T128_AY_GLISANDO, $00			; Rest	
					M_AY_END_OF_PATT										
					
;S01_C_Pattern04:	M_AY_NOTE 		T128_AY_C_3  , 4 *TEMPO_S01, 01, T128_AY_NO_APR_ORN, $0F
;					M_AY_NOTE 		T128_AY_C_2  , 4 *TEMPO_S01, 21, T128_AY_NO_APR_ORN, $1F
;					M_AY_NOTE 		T128_AY_C_3  , 4 *TEMPO_S01, 01, T128_AY_NO_APR_ORN, $0F
;					M_AY_NOTE 		T128_AY_C_2  , 4 *TEMPO_S01, 21, T128_AY_NO_APR_ORN, $1F
;					M_AY_NOTE 		T128_AY_C_3  , 4 *TEMPO_S01, 01, T128_AY_NO_APR_ORN, $0F
;					M_AY_NOTE 		T128_AY_C_2  , 4 *TEMPO_S01, 21, T128_AY_NO_APR_ORN, $1F
;					M_AY_END_OF_PATT																		

S01_C_Pattern05:	M_AY_NOTE 		T128_AY_C_4  , 4 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_C_5  , 4 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_C_4  , 4 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_C_5  , 4 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_C_4  , 4 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_C_5  , 4 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_END_OF_PATT																		

S01_C_Pattern06:	M_AY_NOTE 		T128_AY_G_4  , 4 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_G_5  , 4 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_G_4  , 4 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_G_5  , 4 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_G_4  , 4 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_G_5  , 4 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_END_OF_PATT																		
					
S01_C_Pattern07:	M_AY_NOTE 		T128_AY_D_S_4, 4 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_D_S_5, 4 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_D_S_4, 4 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_D_S_5, 4 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_D_S_4, 4 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_D_S_5, 4 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_END_OF_PATT																		

S01_C_Pattern08:	M_AY_NOTE 		T128_AY_F_4  , 4 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_F_5  , 4 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_F_4  , 4 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_F_5  , 4 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_F_4  , 4 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_NOTE 		T128_AY_F_5  , 4 *TEMPO_S01, 08, T128_AY_MAJOR, $00
					M_AY_END_OF_PATT																		
					

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;					

					
PUBLIC _END_AY_MUSIC
_END_AY_MUSIC:
					
					
					
					