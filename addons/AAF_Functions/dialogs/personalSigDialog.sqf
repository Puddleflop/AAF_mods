disableSerialization;
createdialog "aaf_insignia_personal";
waitUntil {!isnull (finddisplay 8401);};


//Populate insignia list.
private _ctrl = (findDisplay 8401) displayctrl 2100;
lbclear _ctrl;
_ctrl lbAdd "None";
_ctrl lbSetData [0,"None"];

//Seeing if they have a current saved sig, if not just get the one they're wearing. Will be used to select it in the list initially.
private _currentInsignia = profilenamespace getvariable ["aaf_var_personalSig",""];
if (_currentInsignia == "") then {_currentInsignia = [player] call BIS_fnc_getUnitInsignia;};

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
private _ctrl = (findDisplay 8401) displayctrl 2100;
private _id = lbCurSel _ctrl;
private _insignia = _ctrl lbData _id;
private _texture = (getText (configfile >> "CfgUnitInsignia" >> _insignia >> "texture"));
((findDisplay 8401) displayctrl 1205) ctrlSetText _texture;

/*
_ctrl = (findDisplay 8401) displayctrl 1205;
private _insignia = _currentInsignia;
private _texture = (getText (configfile >> "CfgUnitInsignia" >> _insignia >> "texture"));
_ctrl ctrlSetText _texture;
*/

//Set Use Role box.
private _useRole = profilenamespace getvariable ["aaf_var_useRoleSig",true];
if _useRole then {
(findDisplay 8401) displayctrl 2801 cbSetChecked true;
} else {
(findDisplay 8401) displayctrl 2801 cbSetChecked false;
};

//Change preview picture.
aaf_dlg_persigPreview = {
disableSerialization;
private _ctrl = (findDisplay 8401) displayctrl 2100;
private _id = lbCurSel _ctrl;
	if (_id == 0) then {
		((findDisplay 8401) displayctrl 2800) cbSetChecked true;
	} else {
		((findDisplay 8401) displayctrl 2800) cbSetChecked false;
	};
private _insignia = _ctrl lbData _id;
private _texture = (getText (configfile >> "CfgUnitInsignia" >> _insignia >> "texture"));
((findDisplay 8401) displayctrl 1205) ctrlSetText _texture;
};

aaf_dlg_persigCheckboxPreview = {
disableSerialization;
private _checked = (_this select 0) select 1;
	if (_checked > 0) then {
		private _ctrl = (findDisplay 8401) displayctrl 2100;
		_ctrl lbSetCurSel 0;
	};
};

aaf_dlg_persigFinish = {
private _useRole = cbChecked ((findDisplay 8401) displayctrl 2801);
private _ctrl = (findDisplay 8401) displayctrl 2100;
private _id = lbCurSel _ctrl;
	if (_id == 0) then {
		profilenamespace setvariable ["aaf_var_personalSig",""];
	} else {
		private _insignia =  _ctrl lbdata _id;
		profilenamespace setvariable ["aaf_var_personalSig",_insignia];
	};

	if _useRole then {
		profilenamespace setvariable ["aaf_var_useRoleSig",true];
	} else {
		profilenamespace setvariable ["aaf_var_useRoleSig",false];
	};

[] call aaf_fnc_setPersonalSig;
closeDialog 1;
};
