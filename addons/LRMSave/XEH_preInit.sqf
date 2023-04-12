#include "script_component.hpp"
#include "XEH_PREP.sqf"


// This will be removed to the AAF Template config file in the future
[
    QGVAR(LRMName),
    "EDITBOX",
    ["LRM Name", "Set the LRM name without spaces."],
    ["LRM Saving", "LRM Settings"],
    "TestLRM",
    1,
	nil
] call CBA_fnc_addSetting;

// Player saving settings
[
    QGVAR(playerSavePosition),
    "CHECKBOX",
    ["Position Saving", "Whether the players position is saved."],
    ["LRM Saving", "Player Settings"],
    true,
    1,
	nil
] call CBA_fnc_addSetting;

ADDON = true;