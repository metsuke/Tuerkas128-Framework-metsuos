;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; A Y   P L A Y E R   A R P E G G I O S   /   O R N A M E N T S
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


PUBLIC _BEGIN_AY_ORN_ARP
_BEGIN_AY_ORN_ARP


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Arpeggios and ornaments, ranging from 0 to 30; 31=no arp/orn)
;
; Define labels a table for arpeggios and ornaments
; Label T128_AY_NO_APR_ORN is reserved and it must be equal to $1f (no arpeggio/ornament)
;
; Define:
;   - one lanel per arpeggio/ornament
;   - one pointer per arpeggio/ornament in table T128_AY_ArpOrn
;   - Every pointer is an address to a list defining relative semitones in the arpeggio/ornament sequence, ending with $80
;     For instance, the sequence 0, 4, 7, $80 is a major chord relative to the main tone of the current note.
;     Or the sequence, -1, 0, 1, $80 moves from the semitone beloww the current note, to the semitone above the current note.
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

T128_AY_GLISANDO	EQU		0
T128_AY_MAJOR		EQU		1
T128_AY_OCTAVE		EQU		2
T128_AY_MINOR_5		EQU		3
T128_AY_MAJOR_5		EQU		4
T128_AY_MAJOR7_5	EQU		5

T128_AY_NO_APR_ORN	EQU		$1f

T128_AY_ArpOrn:		defw	T128_AY_Glisando, T128_AY_Major, T128_AY_Octave, T128_AY_Minor_5, T128_AY_Major_5, T128_AY_Major7_5

T128_AY_Glisando:	defb	-1, 0, 1, 0, $80
T128_AY_Major:		defb	0, 4, 7, 4, 0, $80
T128_AY_Octave:		defb	0, 12, $80
T128_AY_Minor_5:	defb	0, 4, 7, 12, 0, $80
T128_AY_Major_5:	defb	0, 3, 7, 12, 0, $80
T128_AY_Major7_5:	defb	0, 3, 7, 10, 0, $80

