private _useGroup = (group player) getvariable ["aaf_var_useGroup",true];
private _personalSig = profilenamespace getvariable ["aaf_var_personalSig",""];
private _useRoleSig = profilenamespace getvariable ["aaf_var_useRoleSig",true];
private _roleSig = "";

//_usegroup is an override set by group leader to force group members to use the same sig.
if _useGroup then {_personalSig = ""};
if ([player] call ace_common_fnc_isEngineer) then {_roleSig = "AAF_ENGINEERING"};
if ([player,2] call ace_medical_fnc_isMedic) then {_roleSig = "AAF_MEDICAL"};

if (_personalSig == "") then {
	//No personal sig.
	if (_rolesig != "") then {
		//Has no personal but has a specialist role.
		[player,_rolesig] call BIS_fnc_setUnitInsignia;
	} else {
		//Has no personal, no specialist, this is a catch in case their specialist role is taken away during the mission.
		private _groupSig = (group player) getvariable "BIS_dg_ins";
		[player,_groupSig] call BIS_fnc_setUnitInsignia;
	};
} else {
	//Has a personal sig.
	if (_roleSig == "") then {
		//has personal sig & no role sig.
		[player,_personalSig] call BIS_fnc_setUnitInsignia;
	} else {
	//Has both, work out which to use.
		if _useRoleSig then {
			[player,_rolesig] call BIS_fnc_setUnitInsignia;
		} else {
			[player,_personalSig] call BIS_fnc_setUnitInsignia;
		};

	};
};
