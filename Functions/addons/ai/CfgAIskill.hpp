#include "script_component.hpp"

class cfgAiSkill { //Current at 10/03/2024
	aimingAccuracy[] = 	{ 0,0.25,1,0.37 };//0.25 - 0.37
	aimingShake[] = 	{ 0,0.25,1,0.37 };//0.25 - 0.37
	aimingSpeed[] = 	{ 0,0.67,1,0.76 };//0.67 - 0.76
	commanding[] = 		{ 0,0.10,1,1.00 };//0.10 - 1.00
	courage[] = 		{ 0,0.10,1,0.50 };//0.10 - 0.50
	endurance[] = 		{ 0,1.00,1,1.00 };
	general[] =			{ 0,0.00,1,1.00 };//0.00 - 1.00
	reloadSpeed[] = 	{ 0,0.50,1,1.00 };//0.50 - 1.00
	spotDistance[] =	{ 0,0.35,1,0.52 };//0.35 - 0.52
	spotTime[] =		{ 0,0.35,1,0.52 };//0.35 - 0.52
};
/* Skill Notes
	0.00 is Civilien,
	0.25 Insurgents,
	0.50 is Regular,
	0.75 is Professional,
	1 is is SF
*/
