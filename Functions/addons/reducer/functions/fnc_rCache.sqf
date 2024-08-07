#include "..\script_component.hpp"
/*
	Author: F3 + AAF
	Description: Reducer Script group Cache
	Parameters:
	    _group - group to cache
	    _aggressiveness - aggressiveness level
	        1 - disable only non-leaders and non-drivers
	        2 - disable all non-moving units, always exclude vehicle drivers
	        3 - disable all units, incl. group leaders and vehicle drivers
	Returns: true
	Example: none
*/
// LOOP THROUGH THE PASSED units
// We loop through the units of the passed group and disable Simulation for those that are not vehicle drivers and are standing still
params [
	["_group", grpNull, [grpNull]],
	["_aggressiveness", f_var_reducerAggressiveness, [0]]
];
{
	switch (_aggressiveness) do {
		case 1: {
			// 1 - disable only non-leaders and non-drivers OLD VERSION
			if ((count (assignedVehicleRole _x) == 0 || {
				"Driver" != (assignedVehicleRole _x) select 0
			}) && (_x != leader _group)) then {
				_x enableSimulationGlobal false;
				_x hideObjectGlobal true;
			};
		};
		case 2: {
			// 2 - disable all non-moving units, always exclude vehicle drivers
			if (count (assignedVehicleRole _x) == 0 || {
				"Driver" != (assignedVehicleRole _x) select 0
			}) then {
				if ((_x != leader _group) || (_x == leader _group && speed _x == 0)) then {
					_x enableSimulationGlobal false;
					_x hideObjectGlobal true;
				};
			};
		};
		case 3: {
			// 3 - disable all units, incl. group leaders and vehicle drivers
			_x enableSimulationGlobal false;
			_x hideObjectGlobal true;
			if (vehicle _x != _x) then {
				(vehicle _x) hideObjectGlobal true;
			};
		};

		default {
			systemchat format ["aaf_fnc_rCache DBG: f_var_cachingAggressiveness is not an accepted value: %1", f_var_cachingAggressiveness];
		};
	};

	sleep 0.1;
} forEach units _group;

true
