#include "..\script_component.hpp"
/*
	Author: AAF
	Description: AI vehicle re-arm/resupply function
	Parameters: none
	Returns: nothing
	Example: none
*/
while { true } do {
	{
		private "_crew";
		_crew = crew _x;
		if (count _crew > 0) then {
			private "_not_player";
			_not_player = {
				isPlayer _x
			} count _crew == 0;
			if (_not_player) then {
				if (fuel _x < 0.2) then {
					_x setFuel (0.3 + (random 0.5));
				};
				_x setVehicleAmmo 1;
			};
		};
	} forEach vehicles;
	sleep 1200// (100 + (random 900));
};