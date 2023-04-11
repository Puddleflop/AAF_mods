#include "script_component.hpp"

[
	"CAManBase",
	"killed",
	{
		_sectionName = format["%1:%2:%3:%4:%5", systemtimeUTC select 0, systemtimeUTC select 1, systemtimeUTC select 2, systemtimeUTC select 3, systemtimeUTC select 4];
		["write", [_sectionName, "Event", "Death"]] call GVAR(database);
	}
] call CBA_fnc_addClassEventHandler;


GVAR(database) = ["new", GVAR(LRMName)] call OO_INIDBI;