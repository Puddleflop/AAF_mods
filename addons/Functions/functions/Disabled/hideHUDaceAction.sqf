//Hiding HUD elements. There's no one central command, so have to run around and gather the current settings from the mods, save them, load them after disabling the HUD. If there is a problem, it's likely to happen if the player dies or disconnects while hud mode is on.
if !(hasInterface) exitwith {};

if !(player getvariable ["aaf_hudHide",false]) then {
	if (profileNamespace getvariable ["aaf_hudAlreadySaved",false]) then {
		//Saving settings. Putting it inside an if so that if player's default settings are saved if they disconnected while the hud is disabled.
		//ACE
		private _settings = [] call ace_common_fnc_showHud;
		profileNamespace setvariable ["aaf_hudSettings",_settings];
		//TFAR
		profileNamespace setvariable ["aaf_hud_TFAR",[TFAR_VolumeHudTransparency,TFAR_showTransmittingHint,TFAR_showChannelChangedHint]];
		//ShackTacUI
		profileNamespace setvariable ["aaf_STUI_HUD",STHud_UIMode];
		profileNamespace setVariable ["aaf_STGI",(profileNamespace getVariable ["STGI_Enabled", true])];
	};

	//Hiding HUD
	showChat false;
	//ACE
	["hideHud", [false, false, false, false, false, false, false, false]] call ace_common_fnc_showHud;
	//TFAR
	TFAR_VolumeHudTransparency = 1;
	TFAR_showTransmittingHint = false;
	TFAR_showChannelChangedHint = false;
	//ShackTacUI
	STHud_UIMode = 0;
	STGI_Enabled = false;
	STUI_NT_MaxDrawRangeName = 0.2;
	STUI_NT_MaxDrawRangeGroup = 0.2;
	STUI_NT_MaxDrawRangeNameDead = 0.2;
	
	"STUI_Stamina" call STUI_Canvas_Remove;
	
	player setvariable ["aaf_hudHide",true];
	profileNamespace setvariable ["aaf_hudAlreadySaved",true];

} else {
	showChat true;
	//ACE
	private _settings = profileNamespace getvariable ["aaf_hudSettings",[]];
	["hideHud", _settings] call ace_common_fnc_showHud;
	//TFAR
	private _tfarSettings = profileNamespace getvariable ["aaf_hud_TFAR",[0,true,true]];
	TFAR_VolumeHudTransparency = _tfarSettings select 0;
	TFAR_showTransmittingHint = _tfarSettings select 1;
	TFAR_showChannelChangedHint = _tfarSettings select 2;
	//ShackTacUI
	STHud_UIMode = profileNamespace getvariable ["aaf_STUI_HUD",3];
	STGI_Enabled = profileNamespace getvariable ["aaf_STGI",true];
	STUI_NT_MaxDrawRangeName = 40;
	STUI_NT_MaxDrawRangeGroup = 20;
	STUI_NT_MaxDrawRangeNameDead = 3.5;
	"STUI_Stamina" call STUI_Canvas_Add;
	
	player setvariable ["aaf_hudHide",false];
	profileNamespace setvariable ["aaf_hudAlreadySaved",false];
};