;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; A N I M A T E D   B L O C K S   B I T M A P S
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

T128_GraphicsAB:	defw	AB_Pyre, AB_TorchR, AB_TorchL
					defw	AB_Bush
					defw	AB_BreathR, AB_BreathL, AB_EoloR, AB_EoloL
					defw	AB_Bottle, AB_Ray, AB_Knife, AB_Shield
					defw	AB_WindowShadow
					defw	AB_Ivy1
					defw	AB_StringR, AB_StringL
					defw	AB_Platf1
					defw	AB_FakeWall1L, AB_FakeWall1R
					defw	AB_EyeLBig, AB_EyeLSmall
					defw	AB_EyeRBig, AB_EyeRSmall
					defw	AB_CeilTrap1
					defw	AB_SpikeTop, AB_SpikeTop
					defw	AB_SpikeBot, AB_SpikeBot
					defw	AB_Trap1
					defw	AB_Platf1
					defw	AB_FallingPil
					defw	AB_Creek
					defw	AB_SnakeLeft, AB_SnakeLeftH
					defw	AB_SnakeRight, AB_SnakeRightH
					defw	AB_BreathPlantR
					defw	AB_BreathPlantL
					defw	AB_ArrowDown, AB_ArrowUp, AB_ArrowRight, AB_ArrowLeft
					defw	AB_Trap2
					defw	AB_CeilTrap2, AB_CeilTrap3
					defw	AB_Trap3
					defw	AB_Trap4
					defw	AB_KnifeBL


AB_Pyre:			defw	AB_TorchR - AB_Pyre - 2
					include ".\graphics\AB\tuerkas128_ab_pyre.asm"
AB_TorchR:			defw	AB_TorchL - AB_TorchR - 2
					include ".\graphics\AB\tuerkas128_ab_torchR.asm"
AB_TorchL:			defw	AB_Bush - AB_TorchL - 2
					include ".\graphics\AB\tuerkas128_ab_torchL.asm"
AB_Bush:			defw	AB_BreathR - AB_Bush - 2
					include ".\graphics\AB\tuerkas128_ab_bush.asm"
AB_BreathR:			defw	AB_BreathL - AB_BreathR - 2
					include ".\graphics\AB\tuerkas128_ab_breathR.asm"
AB_BreathL:			defw	AB_EoloR - AB_BreathL - 2
					include ".\graphics\AB\tuerkas128_ab_breathL.asm"					
AB_EoloR:			defw	AB_EoloL - AB_EoloR - 2
					include ".\graphics\AB\tuerkas128_ab_eoloR.asm"										
AB_EoloL:			defw	AB_Bottle - AB_EoloL - 2
					include ".\graphics\AB\tuerkas128_ab_eoloL.asm"										
AB_Bottle:			defw	AB_Ray - AB_Bottle - 2
					include ".\graphics\AB\tuerkas128_ab_bottle.asm"
AB_Ray:				defw	AB_Knife - AB_Ray - 2
					include ".\graphics\AB\tuerkas128_ab_ray.asm"
AB_Knife:			defw	AB_Shield - AB_Knife - 2
					include ".\graphics\AB\tuerkas128_ab_knife.asm"
AB_Shield:			defw	AB_WindowShadow - AB_Shield - 2
					include ".\graphics\AB\tuerkas128_ab_shield.asm"
AB_WindowShadow:	defw	AB_Ivy1 - AB_WindowShadow - 2
					include ".\graphics\AB\tuerkas128_ab_wndw_shadow.asm"
AB_Ivy1:			defw	AB_StringR - AB_Ivy1 - 2
					include ".\graphics\AB\tuerkas128_ab_ivy1.asm"
AB_StringR:			defw	AB_StringL - AB_StringR - 2
					include ".\graphics\AB\tuerkas128_ab_stringR.asm"
AB_StringL:			defw	AB_Platf1 - AB_StringL - 2
					include ".\graphics\AB\tuerkas128_ab_stringL.asm"
AB_Platf1:			defw	AB_FakeWall1L - AB_Platf1 - 2
					include ".\graphics\AB\tuerkas128_ab_platf1.asm"
AB_FakeWall1L:		defw	AB_FakeWall1R - AB_FakeWall1L - 2
					include ".\graphics\AB\tuerkas128_ab_fakewall1L.asm"
AB_FakeWall1R:		defw	AB_EyeLBig - AB_FakeWall1R - 2
					include ".\graphics\AB\tuerkas128_ab_fakewall1R.asm"
AB_EyeLBig:			defw	AB_EyeLSmall - AB_EyeLBig - 2
					include ".\graphics\AB\tuerkas128_ab_eyeLbig.asm"
AB_EyeLSmall:		defw	AB_EyeRBig - AB_EyeLSmall - 2
					include ".\graphics\AB\tuerkas128_ab_eyeLsmall.asm"
AB_EyeRBig:			defw	AB_EyeRSmall - AB_EyeRBig - 2
					include ".\graphics\AB\tuerkas128_ab_eyeRbig.asm"
AB_EyeRSmall:		defw	AB_CeilTrap1 - AB_EyeRSmall - 2
					include ".\graphics\AB\tuerkas128_ab_eyeRsmall.asm"
AB_CeilTrap1:		defw	AB_SpikeTop - AB_CeilTrap1 - 2
					include ".\graphics\AB\tuerkas128_ab_ceiltrap1.asm"
AB_SpikeTop:		defw	AB_SpikeBot - AB_SpikeTop - 2
					include ".\graphics\AB\tuerkas128_ab_spiketop.asm"
AB_SpikeBot:		defw	AB_Trap1 - AB_SpikeBot - 2
					include ".\graphics\AB\tuerkas128_ab_spikebot.asm"
AB_Trap1:			defw	AB_FallingPil - AB_Trap1 - 2
					include ".\graphics\AB\tuerkas128_ab_trap1.asm"
AB_FallingPil:		defw	AB_Creek - AB_FallingPil - 2
					include ".\graphics\AB\tuerkas128_ab_fallingpil.asm"
AB_Creek:			defw	AB_SnakeLeft - AB_Creek - 2
					include ".\graphics\AB\tuerkas128_ab_creek.asm"
AB_SnakeLeft:		defw	AB_SnakeLeftH - AB_SnakeLeft - 2
					include ".\graphics\AB\tuerkas128_ab_snakeleft.asm"
AB_SnakeLeftH:		defw	AB_SnakeRight - AB_SnakeLeftH - 2
					include ".\graphics\AB\tuerkas128_ab_snakelefth.asm"
AB_SnakeRight:		defw	AB_SnakeRightH - AB_SnakeRight - 2
					include ".\graphics\AB\tuerkas128_ab_snakeright.asm"
AB_SnakeRightH:		defw	AB_BreathPlantL - AB_SnakeRightH - 2
					include ".\graphics\AB\tuerkas128_ab_snakerighth.asm"
AB_BreathPlantR:	defw	AB_BreathPlantL - AB_BreathPlantR - 2
					include ".\graphics\AB\tuerkas128_ab_breathplantR.asm"
AB_BreathPlantL:	defw	AB_ArrowDown - AB_BreathPlantL - 2
					include ".\graphics\AB\tuerkas128_ab_breathplantL.asm"
AB_ArrowDown:		defw	AB_ArrowUp - AB_ArrowDown - 2
					include ".\graphics\AB\tuerkas128_ab_arrowdown.asm"
AB_ArrowUp:			defw	AB_ArrowRight - AB_ArrowUp - 2
					include ".\graphics\AB\tuerkas128_ab_arrowup.asm"
AB_ArrowRight:		defw	AB_ArrowLeft - AB_ArrowRight - 2
					include ".\graphics\AB\tuerkas128_ab_arrowright.asm"
AB_ArrowLeft:		defw	AB_Trap2 - AB_ArrowLeft - 2
					include ".\graphics\AB\tuerkas128_ab_arrowleft.asm"
AB_Trap2:			defw	AB_CeilTrap2 - AB_Trap2 - 2
					include ".\graphics\AB\tuerkas128_ab_trap2.asm"
AB_CeilTrap2:		defw	AB_CeilTrap3 - AB_CeilTrap2 - 2
					include ".\graphics\AB\tuerkas128_ab_ceiltrap2.asm"
AB_CeilTrap3:		defw	AB_Trap3 - AB_CeilTrap3 - 2
					include ".\graphics\AB\tuerkas128_ab_ceiltrap3.asm"
AB_Trap3:			defw	AB_Trap4 - AB_Trap3 - 2
					include ".\graphics\AB\tuerkas128_ab_trap3.asm"
AB_Trap4:			defw	AB_KnifeBL - AB_Trap4 - 2
					include ".\graphics\AB\tuerkas128_ab_trap4.asm"
AB_KnifeBL:			defw	AB_END - AB_KnifeBL - 2
					include ".\graphics\AB\tuerkas128_ab_knifebl.asm"
AB_END: 					