;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; S P R I T E S   B I T M A P S
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

T128_GraphicsSPR:	defw	SPR_Skeleton, SPR_Cyclop, SPR_Minotaurus
					defw	SPR_Vortex
					defw	SPR_Square
					defw	SPR_Ball
					defw	SPR_Mouth, SPR_MouthDOWN
					defw	SPR_Blade, SPR_BladeIN
					defw	SPR_WingL, SPR_WingL
					defw	SPR_Screw
					defw	SPR_WlkBullet
					defw	SPR_EnmyDeath01
					defw	SPR_Debris01
					defw	SPR_Discobolus, SPR_Sphinx
					defw	SPR_Satyr
					defw	SPR_WlkBulletL2, SPR_WlkBulletL2, SPR_WlkBullet
					defw	SPR_CrabBody, SPR_CrabEyes, SPR_CrabClaws
					defw	SPR_BullyBody, SPR_BullyEyes, SPR_BullyHorns
					defw	SPR_JmprBullet
					defw	SPR_Puf1Char
					defw	SPR_Coin
					defw	SPR_Pegasus
					defw	SPR_EyeBulletDD, SPR_EyeBulletDDfire, SPR_EyeBulletDD, SPR_EyeBulletDDfire
					defw	SPR_Falling1
					defw	SPR_Knife
					defw	SPR_FrogBody, SPR_FrogEyes, SPR_FrogBelly
					defw	SPR_Graia
					defw	SPR_MormoLeft, SPR_MormoRight, SPR_MormoEye
					defw	SPR_Dwarf					
					defw	SPR_EnmyDeath02
					defw	SPR_Dead
					defw	SPR_PortalGlass
					defw	SPR_Fish, SPR_FishBack, SPR_FishEye

SPR_Skeleton:		defw	SPR_Cyclop - SPR_Skeleton - 2
					include ".\graphics\SPR\tuerkas128_spr_skeleton.asm"
SPR_Cyclop:			defw	SPR_Minotaurus - SPR_Cyclop - 2
					include ".\graphics\SPR\tuerkas128_spr_cyclop.asm"
SPR_Minotaurus:		defw	SPR_Vortex - SPR_Minotaurus - 2
					include ".\graphics\SPR\tuerkas128_spr_minotaurus.asm"
SPR_Vortex:			defw	SPR_Square - SPR_Vortex - 2
					include ".\graphics\SPR\tuerkas128_spr_vortex.asm"					
SPR_Square:			defw	SPR_Ball - SPR_Square - 2
					include ".\graphics\SPR\tuerkas128_spr_square.asm"
SPR_Ball:			defw	SPR_Mouth - SPR_Ball - 2
					include ".\graphics\SPR\tuerkas128_spr_ball.asm"
SPR_Mouth:			defw	SPR_MouthDOWN - SPR_Mouth - 2
					include ".\graphics\SPR\tuerkas128_spr_mouth.asm"					
SPR_MouthDOWN:		defw	SPR_Blade - SPR_MouthDOWN - 2
					include ".\graphics\SPR\tuerkas128_spr_mouthDOWN.asm"					
SPR_Blade:			defw	SPR_BladeIN - SPR_Blade - 2
					include ".\graphics\SPR\tuerkas128_spr_blade.asm"					
SPR_BladeIN:		defw	SPR_WingL - SPR_BladeIN - 2
					include ".\graphics\SPR\tuerkas128_spr_bladeIN.asm"					
SPR_WingL:			defw	SPR_Screw - SPR_WingL - 2
					include ".\graphics\SPR\tuerkas128_spr_wingL.asm"					
SPR_Screw:			defw	SPR_WlkBullet - SPR_Screw - 2
					include ".\graphics\SPR\tuerkas128_spr_screw.asm"					
SPR_WlkBullet:		defw	SPR_EnmyDeath01 - SPR_WlkBullet - 2
					include ".\graphics\SPR\tuerkas128_spr_wlkbullet.asm"					
SPR_EnmyDeath01:	defw	SPR_Debris01 - SPR_EnmyDeath01 - 2
					include ".\graphics\SPR\tuerkas128_spr_enmydeath01.asm"					
SPR_Debris01:		defw	SPR_Discobolus - SPR_Debris01 - 2
					include ".\graphics\SPR\tuerkas128_spr_debris01.asm"
SPR_Discobolus:		defw	SPR_Sphinx - SPR_Discobolus - 2
					include ".\graphics\SPR\tuerkas128_spr_discobolus.asm"
SPR_Sphinx:			defw	SPR_Satyr - SPR_Sphinx - 2
					include ".\graphics\SPR\tuerkas128_spr_sphinx.asm"
SPR_Satyr:			defw	SPR_WlkBulletL2 - SPR_Satyr - 2
					include ".\graphics\SPR\tuerkas128_spr_satyr.asm"
SPR_WlkBulletL2		defw	SPR_CrabBody - SPR_WlkBulletL2 - 2
					include ".\graphics\SPR\tuerkas128_spr_wlkbullet2.asm"					
SPR_CrabBody		defw	SPR_CrabEyes - SPR_CrabBody - 2
					include ".\graphics\SPR\tuerkas128_spr_crabbody.asm"					
SPR_CrabEyes		defw	SPR_CrabClaws - SPR_CrabEyes - 2
					include ".\graphics\SPR\tuerkas128_spr_crabeyes.asm"					
SPR_CrabClaws		defw	SPR_BullyBody - SPR_CrabClaws - 2
					include ".\graphics\SPR\tuerkas128_spr_crabclaws.asm"
SPR_BullyBody		defw	SPR_BullyEyes - SPR_BullyBody - 2
					include ".\graphics\SPR\tuerkas128_spr_bullybody.asm"
SPR_BullyEyes		defw	SPR_BullyHorns - SPR_BullyEyes - 2
					include ".\graphics\SPR\tuerkas128_spr_bullyeyes.asm"
SPR_BullyHorns		defw	SPR_JmprBullet - SPR_BullyHorns - 2
					include ".\graphics\SPR\tuerkas128_spr_bullyhorns.asm"
SPR_JmprBullet		defw	SPR_Puf1Char - SPR_JmprBullet - 2
					include ".\graphics\SPR\tuerkas128_spr_jmprbullet.asm"
SPR_Puf1Char		defw	SPR_Coin - SPR_Puf1Char - 2
					include ".\graphics\SPR\tuerkas128_spr_puf1char.asm"
SPR_Coin			defw	SPR_Pegasus - SPR_Coin - 2
					include ".\graphics\SPR\tuerkas128_spr_coin.asm"
SPR_Pegasus			defw	SPR_EyeBulletDD - SPR_Pegasus - 2
					include ".\graphics\SPR\tuerkas128_spr_pegasus.asm"
SPR_EyeBulletDD		defw	SPR_EyeBulletDDfire - SPR_EyeBulletDD - 2
					include ".\graphics\SPR\tuerkas128_spr_eyebulletDD.asm"
SPR_EyeBulletDDfire	defw	SPR_Falling1 - SPR_EyeBulletDDfire - 2
					include ".\graphics\SPR\tuerkas128_spr_eyebulletDDfire.asm"
SPR_Falling1		defw	SPR_Knife - SPR_Falling1 - 2
					include ".\graphics\SPR\tuerkas128_spr_falling1.asm"
SPR_Knife			defw	SPR_FrogBody - SPR_Knife - 2
					include ".\graphics\SPR\tuerkas128_spr_knife.asm"
SPR_FrogBody		defw	SPR_FrogEyes - SPR_FrogBody - 2
					include ".\graphics\SPR\tuerkas128_spr_frogbody.asm"
SPR_FrogEyes		defw	SPR_FrogBelly - SPR_FrogEyes - 2
					include ".\graphics\SPR\tuerkas128_spr_frogeyes.asm"
SPR_FrogBelly		defw	SPR_Graia - SPR_FrogBelly - 2
					include ".\graphics\SPR\tuerkas128_spr_frogbelly.asm"
SPR_Graia			defw	SPR_MormoLeft - SPR_Graia - 2
					include ".\graphics\SPR\tuerkas128_spr_graia.asm"
SPR_MormoLeft		defw	SPR_MormoRight - SPR_MormoLeft - 2
					include ".\graphics\SPR\tuerkas128_spr_mormoleft.asm"
SPR_MormoRight		defw	SPR_MormoEye - SPR_MormoRight - 2
					include ".\graphics\SPR\tuerkas128_spr_mormoright.asm"
SPR_MormoEye		defw	SPR_Dwarf - SPR_MormoEye - 2
					include ".\graphics\SPR\tuerkas128_spr_mormoeye.asm"
SPR_Dwarf			defw	SPR_EnmyDeath02 - SPR_Dwarf - 2
					include ".\graphics\SPR\tuerkas128_spr_dwarf.asm"
SPR_EnmyDeath02		defw	SPR_Dead - SPR_EnmyDeath02 - 2
					include ".\graphics\SPR\tuerkas128_spr_enmydeath02.asm"
SPR_Dead			defw	SPR_PortalGlass - SPR_Dead - 2
					include ".\graphics\SPR\tuerkas128_spr_dead.asm"
SPR_PortalGlass		defw	SPR_Fish - SPR_PortalGlass - 2
					include ".\graphics\SPR\tuerkas128_spr_portalglass.asm"
SPR_Fish			defw	SPR_FishBack - SPR_Fish - 2
					include ".\graphics\SPR\tuerkas128_spr_fish.asm"
SPR_FishBack		defw	SPR_FishEye - SPR_FishBack - 2
					include ".\graphics\SPR\tuerkas128_spr_fishback.asm"
SPR_FishEye			defw	SPR_END - SPR_FishEye - 2
					include ".\graphics\SPR\tuerkas128_spr_fisheye.asm"
SPR_END:
