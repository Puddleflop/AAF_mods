///////////////////////////////////////////////////////////////////////////////////////////////////
/*
Author: AAF
Description: Gear loadout handler
Parameters: [_varname,_action]
    0: _varname (string): The name for the loadout to be saved/loaded to the profile namespace.
    1: _action (string): "save" or "load"
Returns: Loadout
Example: none
*/
///////////////////////////////////////////////////////////////////////////////////////////////////
params ["_varname","_action"];

if (_action == "save") then {
    _temploadout = getUnitLoadout player;
	profileNamespace setVariable[_varname,_temploadout];
};

if (_action == "load") then {
	/*if !(isnil "TFAR_fnc_canspeak") then {//TFAR, The load function checks for if the player was carrying a TFAR radio, and if they were, replaces their specific radio with a generic one. Stops a bug where TFAR gets stuck in a loop trying to replace duplicate radios.
		_temploadout = profileNamespace getVariable[_varname,[]];
		_index = (count _temploadout) - 1;
		_saveditems = _temploadout select _index;
		_radio = _saveditems select 2;

		if (isNumber (configfile >> "CfgWeapons" >> _radio >> "tf_radio")) then {
			_radio = getText (configfile >> "CfgWeapons" >> _radio >> "tf_parent");
			_saveditems set [2,_radio];
			_temploadout set [_index,_saveditems];
		};

		player setUnitLoadout _temploadout;
	};*/

	if !(isnil "acre_api_fnc_getCurrentRadioList") then {//ACRE, Sets the old loadout first
		private _temploadout = profileNamespace getVariable[_varname,[]];
		player setUnitLoadout _temploadout;
		private _radioList = [] call acre_api_fnc_getCurrentRadioList;//This command will turn up the old radios in the loadout.
    {
      player removeItem _x;
			private _string = _x splitstring "_";
			player additem ([_string select 0, _string select 1] joinstring "_");
    } foreach _radioList;
	};

	if ((isnil "acre_api_fnc_getCurrentRadioList") && (isnil "TFAR_fnc_canspeak")) then {
		//Just in case neither ACRE or TFAR are enabled.
		private _temploadout = profileNamespace getVariable[_varname,[]];
		player setUnitLoadout _temploadout;
	};
};
