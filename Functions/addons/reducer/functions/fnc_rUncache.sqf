#include "..\script_component.hpp"
/*
	Author: F3 + AAF
	Description: Reducer group Uncache
	Parameters: none
	Returns: nothing
	Example: none
*/
{
	if (speed leader _this > 0 && vehicle _x == _x) then {
		// if the group leader is moving, set his group back in formation
		_x setPosATL [(formationPosition _x) select 0, (formationPosition _x) select 1, 0];
	};
	_x enableSimulationGlobal true;
	_x hideObjectGlobal false;
	if (vehicle _x != _x) then {
		(vehicle _x) hideObjectGlobal falseF
	};
	sleep 0.1;
} forEach units _this;
true