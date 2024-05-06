// INIT PLAYER LOCAL ////////////////////////////////////////////////////////////////////////
//
//	- Executed locally when player joins mission (includes both mission start and JIP).
//  https://community.bistudio.com/wiki/Event_Scripts#initPlayerLocal.sqf
//
/////////////////////////////////////////////////////////////////////////////////////////////

//CHECKS/////////////////////////////////////////////////////////////////////////////////////
//private ["_pname"];

if (!hasInterface) exitWith {}; //This is so the scripting doesn't run on a headless client.
waituntil {getplayeruid player != ""};//For uid locked scripts / abilities

//BRIEFING //////////////////////////////////////////////////////////////////////////////////
  [] execVM "briefing\briefing.sqf"; // Standard Briefing - Everyone can see this.

_plrName = vehicleVarName player; //Fetches the variable name of the player's unit.

if (["zeus", (_plrName)] call BIS_fnc_inString) then { //Special briefings, every unit with 'zeus' in their variablename will get it. EG: Zeus1 and Zeus2 would both get it.
  [] execVM "briefing\briefing_secret.sqf";
//  [] execVM "briefing\briefing_air.sqf";
//  [] execVM "briefing\briefing_arm.sqf";
  };

if (["pilot", (_plrName)] call BIS_fnc_inString) then { //Asset specific briefing, every unit with 'pilot' in their variablename will get it.
  [] execVM "briefing\briefing_air.sqf";
  };

if (["crew", (_plrName)] call BIS_fnc_inString) then { //Asset specific briefing, every unit with 'crew' in their variablename will get it.
  [] execVM "briefing\briefing_arm.sqf";
  };

//RADIO AUTO SETUP //////////////////////////////////////////////////////////////////////////
//Selected channel is based on group name, it checks if the name of the group contains the specified characters (eg "1-3") and applies it based on that. The intent is to make it resistant to players who need to change their group name to something dumb. This way a group called "1-3" or a group named "1-3 Donkey Jockeys" will both get the correct radio channel because they both contain "1-3". You may ask yourself what happens if you name a group 1-1-1-2-1-3-1-4, what happens is that I call you a dick. Now includes a check to see if the player HAS a 343 before trying to set it, saves on the errors and means mission makers don't have to remember to remove the code if doing a no-radio mission.
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

//GROUP CHANGE SETUP ///////////////////////////////////////////////////////////////////////
//This command block adds an eventhandler to units to refresh the mission roster if they change groups (like a spare rifleman attaching to 1-0) and sets the radio channel to the correct one. Be sure to keep it consistent with the code above and to comment it out or delete it if you're not using it.

_groupChange = ["group", {
"scripts\PlatoonRoster.sqf" remoteExec ["execVM", 2, false];

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

	if (["1-1", (_grpname)] call BIS_fnc_inString) then {[player, "AAF_INDIA_11"] call BIS_fnc_setUnitInsignia};
	if (["1-2", (_grpname)] call BIS_fnc_inString) then {[player, "AAF_INDIA_12"] call BIS_fnc_setUnitInsignia};
	if (["1-3", (_grpname)] call BIS_fnc_inString) then {[player, "AAF_INDIA_13"] call BIS_fnc_setUnitInsignia};
	if (["1-4", (_grpname)] call BIS_fnc_inString) then {[player, "AAF_INDIA_14"] call BIS_fnc_setUnitInsignia};
	if (["1-5", (_grpname)] call BIS_fnc_inString) then {[player, "AAF_INDIA_15"] call BIS_fnc_setUnitInsignia};
	if (["Angel", (_grpname)] call BIS_fnc_inString) then {[player, "AAF_Angel_11"] call BIS_fnc_setUnitInsignia};
	if (["Ironside", (_grpname)] call BIS_fnc_inString) then {[player, "AAF_Ironside_11"] call BIS_fnc_setUnitInsignia};
	if (["1-0", (_grpname)] call BIS_fnc_inString) then {[player, "AAF_INDIA_10"] call BIS_fnc_setUnitInsignia};
	if (["zeus", (_grpname)] call BIS_fnc_inString) then {[player, "AAF_Zero"] call BIS_fnc_setUnitInsignia};

	}] call CBA_fnc_addPlayerEventHandler; 