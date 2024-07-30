#include "..\script_component.hpp"
/*
	Author: AAF
	Description: AAF_Functions Pre-init Client + Server
	Parameters: none
	Returns: nothing
	Example: none
*/
if (hasIntreface) then {
	if !(canTriggerDynamicSimulation player) then {
		player triggerDynamicSimulation true;
	};
};
