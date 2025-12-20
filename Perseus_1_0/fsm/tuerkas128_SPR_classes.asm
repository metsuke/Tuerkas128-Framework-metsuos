;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; S P R I T E   C L A S S E S
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


SPR_CHILD_			EQU		0
SPR_ClassWalker		EQU		1
SPR_ClassCycle		EQU		2
SPR_ClassWlkBullet	EQU		3
SPR_ClassDebris		EQU		4
SPR_ClassStatue		EQU		5
SPR_ClassJumper		EQU		6
SPR_ClassJmprBullet	EQU		7
SPR_ClassSimpleAnim	EQU		8
SPR_ClassCoin		EQU		9 
SPR_ClassProjectile	EQU		10
SPR_ClassKnife		EQU		11
SPR_ClassDead		EQU		12
SPR_ClassDummy		EQU		13


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; FSM routines for every sprite class
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SPR_FSM_Routines	defw	SPR_FSM_CHILD_, SPR_FSM_Walker, SPR_FSM_Cycle, SPR_FSM_WlkBullet, SPR_FSM_Debris
					defw	SPR_FSM_Statue, SPR_FSM_Jumper, SPR_FSM_JmprBullet, SPR_FSM_SimpleAnim, SPR_FSM_Coin
					defw	SPR_FSM_Projectile, SPR_FSM_Knife, SPR_FSM_Dead, SPR_FSM_Dummy


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; InitState and InitState2 routines for every sprite class
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SPR_FSM_ISRoutines	defw	SPR_FSM_CHILD_IS, SPR_FSM_WalkerIS, SPR_FSM_CycleIS, SPR_FSM_WlkBulletIS, SPR_FSM_DebrisIS
					defw	SPR_FSM_StatueIS, SPR_FSM_JumperIS, SPR_FSM_JmprBulletIS, SPR_FSM_SimpleAnimIS, SPR_FSM_CoinIS
					defw	SPR_FSM_ProjectileIS, SPR_FSM_KnifeIS, SPR_FSM_DeadIS, SPR_FSM_DummyIS
					
SPR_FSM_IS2Routines	defw	SPR_FSM_CHILD_IS2, SPR_FSM_WalkerIS2, SPR_FSM_CycleIS2, SPR_FSM_WlkBulletIS2, SPR_FSM_DebrisIS2
					defw	SPR_FSM_StatueIS2, SPR_FSM_JumperIS2, SPR_FSM_JmprBulletIS2, SPR_FSM_SimpleAnimIS2, SPR_FSM_CoinIS2
					defw	SPR_FSM_ProjectileIS2, SPR_FSM_KnifeIS2, SPR_FSM_DeadIS2, SPR_FSM_DummyIS2