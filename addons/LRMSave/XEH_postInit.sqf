#include "script_component.hpp"

[] call FUNC(myFunction);

[
	"CAManBase",
	"killed",
	{
		_sectionName = DATE;
		["write", [_sectionName, "Event", "Death"]] call GVAR(database);
	}
] call CBA_fnc_addClassEventHandler;

[
	"CAManBase",
	"killed",
	{
		_sectionName = DATE;
		[GVAR(database),_sectionName] call FUNC(player_save);
	}
] call CBA_fnc_addClassEventHandler;


GVAR(database) = ["new", GVAR(LRMName)] call OO_INIDBI;