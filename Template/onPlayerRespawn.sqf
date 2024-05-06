// ON PLAYER RESPAWN ////////////////////////////////////////////////////////////////////////
//
// - Executed locally when player respawns
//	https://community.bistudio.com/wiki/Event_Scripts#onPlayerRespawn.sqf
//
/////////////////////////////////////////////////////////////////////////////////////////////

//RADIO AUTO SETUP///////////////////////////////////////////////////////////////////////////
/*
	See notes in initplayerlocal, exactly the same code.
*/
//RADIO AUTO SETUP //////////////////////////////////////////////////////////////////////////
//Selected channel is based on group name, it checks if the name of the group contains the specified characters (eg "1-3") and applies it based on that. The intent is to make it resistant to players who need to change their group name to something dumb. This way a group called "1-3" or a group named "1-3 Donkey Jockeys" will both get the correct radio channel because they both contain "1-3". You may ask yourself what happens if you name a group 1-1-1-2-1-3-1-4, what happens is that I call you a dick. The radio setter has a check built in to see if the player has a 343 befoire trying to set it, saves on the errors and means mission makers don't have to remember to remove the code if doing a no-radio mission
_grpname = groupId (group player);
waitUntil { ([] call acre_api_fnc_isInitialized) };
if ([player, "ACRE_PRC343"] call acre_api_fnc_hasKindOfRadio) then { 
	if (["1-1", (_grpname)] call BIS_fnc_inString) then {[(["ACRE_PRC343"] call acre_api_fnc_getRadioByType), 1] call acre_api_fnc_setRadioChannel; titleText ["<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><t color='#99FF99' size='1.5'>Your 343 radio has been auto-set to channel 1.<br/>Another innovation from AliasTech!</t>","PLAIN", 1,true,true];};
	if (["1-2", (_grpname)] call BIS_fnc_inString) then {[(["ACRE_PRC343"] call acre_api_fnc_getRadioByType), 2] call acre_api_fnc_setRadioChannel; titleText ["<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><t color='#99FF99' size='1.5'>Your 343 radio has been auto-set to channel 2.<br/>Another innovation from AliasTech!</t>","PLAIN", 1,true,true];};
	if (["1-3", (_grpname)] call BIS_fnc_inString) then {[(["ACRE_PRC343"] call acre_api_fnc_getRadioByType), 3] call acre_api_fnc_setRadioChannel; titleText ["<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><t color='#99FF99' size='1.5'>Your 343 radio has been auto-set to channel 3.<br/>Another innovation from AliasTech!</t>","PLAIN", 1,true,true];};
	if (["1-4", (_grpname)] call BIS_fnc_inString) then {[(["ACRE_PRC343"] call acre_api_fnc_getRadioByType), 4] call acre_api_fnc_setRadioChannel; titleText ["<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><t color='#99FF99' size='1.5'>Your 343 radio has been auto-set to channel 4.<br/>Another innovation from AliasTech!</t>","PLAIN", 1,true,true];};
	if (["1-5", (_grpname)] call BIS_fnc_inString) then {[(["ACRE_PRC343"] call acre_api_fnc_getRadioByType), 5] call acre_api_fnc_setRadioChannel; titleText ["<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><t color='#99FF99' size='1.5'>Your 343 radio has been auto-set to channel 5.<br/>Another innovation from AliasTech!</t>","PLAIN", 1,true,true];};
	if (["Angel", (_grpname)] call BIS_fnc_inString) then {[(["ACRE_PRC343"] call acre_api_fnc_getRadioByType),7] call acre_api_fnc_setRadioChannel; titleText ["<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><t color='#99FF99' size='1.5'>Your 343 radio has been auto-set to channel 7.<br/>Another innovation from AliasTech!</t>","PLAIN", 1,true,true];};
	if (["Ironside", (_grpname)] call BIS_fnc_inString) then {[(["ACRE_PRC343"] call acre_api_fnc_getRadioByType),8] call acre_api_fnc_setRadioChannel; titleText ["<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><t color='#99FF99' size='1.5'>Your 343 radio has been auto-set to channel 8.<br/>Another innovation from AliasTech!</t>","PLAIN", 1,true,true];};
	if (["1-0", (_grpname)] call BIS_fnc_inString) then {[(["ACRE_PRC343"] call acre_api_fnc_getRadioByType), 9] call acre_api_fnc_setRadioChannel; titleText ["<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><t color='#99FF99' size='1.5'>Your 343 radio has been auto-set to channel 9.<br/>Another innovation from AliasTech!</t>","PLAIN", 1,true,true];};
	if (["zeus", (_grpname)] call BIS_fnc_inString) then {[(["ACRE_PRC343"] call acre_api_fnc_getRadioByType), 9] call acre_api_fnc_setRadioChannel; titleText ["<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><t color='#99FF99' size='1.5'>Your 343 radio has been auto-set to channel 9.<br/>Another innovation from AliasTech!</t>","PLAIN", 1,true,true];};
};

//INSIGNIA AUTO SETUP //////////////////////////////////////////////////////////////////////
//Applies the group-relevant AAF squad insignia. Insignia is based on the group name using the same mechanics as the radio setter above. The only reason I've separated them is to give mission makers easier control over whether they want the group patches active. Like the radio setter, the code will also run within onPlayerRespawn and initServer so if you change it in one place then you will need to change it in all of them to ensure consistency.

	if (["1-1", (_grpname)] call BIS_fnc_inString) then {[player, "AAF_INDIA_11"] call BIS_fnc_setUnitInsignia};
	if (["1-2", (_grpname)] call BIS_fnc_inString) then {[player, "AAF_INDIA_12"] call BIS_fnc_setUnitInsignia};
	if (["1-3", (_grpname)] call BIS_fnc_inString) then {[player, "AAF_INDIA_13"] call BIS_fnc_setUnitInsignia};
	if (["1-4", (_grpname)] call BIS_fnc_inString) then {[player, "AAF_INDIA_14"] call BIS_fnc_setUnitInsignia};
	if (["1-5", (_grpname)] call BIS_fnc_inString) then {[player, "AAF_INDIA_15"] call BIS_fnc_setUnitInsignia};
	if (["Angel", (_grpname)] call BIS_fnc_inString) then {[player, "AAF_Angel_11"] call BIS_fnc_setUnitInsignia};
	if (["Ironside", (_grpname)] call BIS_fnc_inString) then {[player, "AAF_Ironside_11"] call BIS_fnc_setUnitInsignia};
	if (["1-0", (_grpname)] call BIS_fnc_inString) then {[player, "AAF_INDIA_10"] call BIS_fnc_setUnitInsignia};
	if (["zeus", (_grpname)] call BIS_fnc_inString) then {[player, "AAF_Zero"] call BIS_fnc_setUnitInsignia};
