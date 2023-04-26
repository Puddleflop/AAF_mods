disableSerialization;

//Must be leader.
if (player != (leader (group player))) exitwith {
["You are not the group leader, can't set insignia.", false, 5, 0] call ace_common_fnc_displayText;
};

//Catch to make sure the group is registered before doing this.
private _BIDynGroupReg = (group player) getvariable ["BIS_dg_reg",false];
if !_BIDynGroupReg exitwith {
["Press U and create a group before setting insignia.", false, 5, 0] call ace_common_fnc_displayText;
};


createdialog "aaf_insignia_group";
waitUntil {!isnull (finddisplay 8402);};


//Populate insignia list.
private _ctrl = (findDisplay 8402) displayctrl 2100;
lbclear _ctrl;

//Getting inital group sig to select it when populating list.
private _currentInsignia = (group player) getvariable ["BIS_dg_ins",""];

//Populating list.
private _count = count (configfile >> "CfgUnitInsignia");
for "_x" from 0 to (_count-1) do
{
	private _insignia = ((configfile >> "CfgUnitInsignia") select _x);

	if (isclass _insignia) then {
		private _class = configName _insignia;
		_ctrl lbAdd (getText (configfile >> "CfgUnitInsignia" >> _class >> "displayName"));
		_ctrl lbSetData[(lbSize _ctrl)-1, _class];
		_picture = (getText (configfile >> "CfgUnitInsignia" >> _class >> "texture"));
		_ctrl lbSetPicture[(lbSize _ctrl)-1,_picture];
		//If it matches current, select it.
		if (_class == _currentInsignia) then {
			_ctrl lbSetCurSel ((lbSize _ctrl)-1);
		};
	};
};

//Set intial preview
_ctrl = (findDisplay 8402) displayctrl 1205;
private _texture = (getText (configfile >> "CfgUnitInsignia" >> _currentInsignia >> "texture"));
_ctrl ctrlSetText _texture;

private _useGroup = (group player) getvariable ["aaf_var_useGroup",true];
if _useGroup then {
(findDisplay 8402) displayctrl 2800 cbSetChecked true;
} else {
(findDisplay 8402) displayctrl 2800 cbSetChecked false;
};

//Change preview picture.
aaf_dlg_groupSigPreview = {
disableSerialization;
private _ctrl = (findDisplay 8402) displayctrl 2100;
private _id = lbCurSel _ctrl;

private _insignia = _ctrl lbData _id;
private _texture = (getText (configfile >> "CfgUnitInsignia" >> _insignia >> "texture"));
((findDisplay 8402) displayctrl 1205) ctrlSetText _texture;
};


aaf_dlg_groupSigFinish = {
if (player != (leader (group player))) exitwith {
["You are no longer the group leader, can't set insignia.", false, 5, 0] call ace_common_fnc_displayText;
};
private _ctrl = (findDisplay 8402) displayctrl 2100;
private _id = lbCurSel _ctrl;
private _insignia =  _ctrl lbdata _id;
private _useGroup = cbChecked ((findDisplay 8402) displayctrl 2800);
[_insignia,_useGroup] call aaf_fnc_dynGroupsReplacer;
	closeDialog 1;
};
