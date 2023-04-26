private _groupName = tolower (groupid (group player)); //Tolower was to avoid case sensitivity, don't think it's needed anymore.
private _insignia = "";

private _splitGroup = _groupName splitString " ";
if ((count _splitGroup) <= 1) then {
	private _splitName = (_splitGroup select 0) splitString "-";
	if ((count _splitName) <= 1) then {
		//Can assume it's a just a word callsign.
		_insignia = "AAF_"+(_splitGroup select 0);
	} else {
		//Can assume it's just a number, default India.
		_splitName = _splitName joinstring "";
		_insignia = "AAF_India_"+_splitName;
	};
} else {
	//Can assume it's a word + number.
	private _splitName = ((_splitGroup select ((count _splitGroup) - 1)) splitString "-");
	_splitName = _splitName joinstring "";
	_splitGroup = _splitGroup select 0;
	_insignia = "AAF_"+_splitGroup+"_"+_splitName;
};
	
if (_insignia != "") then {
	if (isclass (configFile >> "CfgUnitInsignia" >> _insignia)) then {
	//Yes I know this is an empty if statement and I should feel bad, I just wanted it to be considered first because it's more much likely than the Else being a class, and gonna call the function anyway.
	[_insignia,true] call aaf_fnc_dynGroupsReplacer;
	} else {
		if (isclass (configFile >> "CfgUnitInsignia" >> (_insignia + "_11"))) then {
			_insignia = _insignia+"_11";
			[_insignia,true] call aaf_fnc_dynGroupsReplacer;
		};
	};
};


