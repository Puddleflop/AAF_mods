/*/////////////////////////////////////////////////////////////////////////////////////////////////
Author: F3 + AAF
Description: Reducer Script Group Uncacher
Parameters: none
Returns: nothing
Example: none
*//////////////////////////////////////////////////////////////////////////////////////////////////
{
	//_x allowDamage false;//safety ??
		if (speed leader _this > 0 && vehicle _x == _x) then {// If the group leader is moving, set his group back in formation
				_x setPosATL [(formationPosition _x) select 0, (formationPosition _x) select 1, 0];
	};
	_x enableSimulationGlobal true;//move THEN enablesim
	_x hideObjectGlobal false;
	//_x allowDamage false;//safety ??
	if (vehicle _x != _x) then {(vehicle _x) hideObjectGlobal false};
	sleep 0.1;
} forEach units _this;
true
