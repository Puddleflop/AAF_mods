#include "script_component.hpp"
#include "XEH_PREP.sqf"

ADDON = true;

//This will be removed to the AAF Template config file in the future
[
    QGVAR(LRMName),
    "EDITBOX",
    ["LRM Name", "Set the LRM name without spaces"],
    ["LRM Saving", "LRM Settings"],
    "TestLRM",
    1,
	nil
] call CBA_fnc_addSetting;

