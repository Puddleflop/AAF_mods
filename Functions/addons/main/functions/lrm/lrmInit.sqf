// Purpose: To be the start of the lrm scripting, to determine if a player has played in this mission before and either load that previous save or start them from scratch and then call the saveloop.
//missionProfileNamespace - https://community.bistudio.com/wiki/saveMissionProfileNamespace
//missionGroup = "MyMissionCollectionName"; MMs define in description.ext for an lrm series

if (isMissionProfileNamespaceLoaded) then {//I'v been here before
	if (hasInterface) then {//Do player stuff
		//Load Player save
		missionNamespace getVariable {"lrm_gear", nil};
		player setUnitLoadout lrm_gear
		missionNamespace getVariable {"lrm_location", nil};
		player setPosATL lrm_location
		missionNamespace getVariable {"lrm_group", nil};
		player join lrm_group
		//Start Player save Loop
		while (true) do {
			_lrm_gearS = getunitloadout player;
			missionNamespace setVariable [lrm_gear, _lrm_gearS, false];
			_lrm_locationS = getPosATL player;
			missionNamespace setVariable [lrm_location, _lrm_locationS, false];
			_lrm_groupS = group player;
			missionNamespace setVariable [lrm_group, _lrm_groupS, false];
			saveMissionProfileNamespace;//Save it for future use
			private _time = time + 300;
			waitUntil {time >= _time};
		};
	};
	if (isDedicated) then {//Do Server stuff
		//Load Server save
		//Start Server save Loop
	};
} else {//This is a new land
	if (hasInterface) then {//Do player Stuff
		while (true) do {//Start Player save Loop
			_lrm_gearS = getunitloadout player;
			missionNamespace setVariable [lrm_gear, _lrm_gearS, false];
			_lrm_locationS = getPosATL player;
			missionNamespace setVariable [lrm_location, _lrm_locationS, false];
			_lrm_groupS = group player;
			missionNamespace setVariable [lrm_group, _lrm_groupS, false];
			saveMissionProfileNamespace;//Save it for future use
			private _time = time + 300;
			waitUntil {time >= _time};
		};
	};
	if (isDedicated) then {//Do Server stuff
		//Start Server save Loop
	};
};


missionProfileNameSpace will NOT Load unless already created, so it wont exist if there is no save.
No need to check for a save manually then




if ((profileNamespace getvariable ["lrm_mission_name","nothing"]) == lrm_mission_name)
    then {
	hintSilent "LRM data found. Please wait while loading.";
	[lrm_fnc_load, [], 10] call CBA_fnc_waitAndExecute;
	sleep 10;
	hintSilent "";}

	else {
	profileNamespace setvariable ["lrm_mission_name",lrm_mission_name];
    ["LRM_Initial_Loadout","save"] call aaf_fnc_gear; //Save their initial loadout for respawning.
	call lrm_fnc_saveloop;};

//Checks if there is a saved lrm_mission_name that matches the current mission name (i.e. have they played in this mission before), if yes, it starts the load function. If no it sets the mission name and starts the save loop. I'll need to flesh this init out with setting things like max amount of lives etc.


///////////////////////////////////////////////////////////////////////////////////////////////////
//NEW WAY//////////////////////////////////////////////////////////////////////////////////////////
/*
//MissionProfileNameSpace is preloaded upon mission load IF it exists
//missionGroup = "MyMissionCollectionName"; MMs define in description.ext for an lrm series

With this system, 'isMissionProfileNamespaceLoaded' will tell us a lrm mission has been played before 
The file will only exist (return true) if saved. 

//All missionProfileNamespace variables to be saved with lrm_ prefix 

lrm_missionGroup = description.ext missionGroup value (if it exists)  -NEEDED ??
lrm_missionName = missionName - NEEDED ??

lrm_loadOut = getunitloadout array 
lrm_location = getposASL, stance 
lrm_status = ACE status 

//lrm_saveLoop will write; lrm_loadOut, lrm_location and lrm_status.


//CODE CONCEPT ////////////////////////////////////////////////////////////////////////////////////
if !(aaf_Lrm) then exitwith {}; //LRM settings check 

if (lrm_missionGroup == missionGroup) then _lrmLoad else _lrmStart //played LRM series before
	exitwith {spawn AAF_fnc_lrmxxxx};

if lrm_missionName == missionName then _lrmLoad else _lrmStart //Check if played LRM before 
	exitwith {spawn AAF_fnc_lrmxxxx};

//CODE OPTIMISED //////////////////////////////////////////////////////////////////////////////////
if !(aaf_Lrm) then exitwith {}; //LRM settings check 

-good- if (lrm_missionGroup == missionGroup) || (lrm_missionName == missionName) then {
-better- if (lrmload) then {
-best- if (isMissionProfileNamespaceLoaded) then { 

	exitwith { [] spawn aaf_fnc_lrmLoad }; //load save
} else {
	exitwith { [] spawn aaf_fnc_lrmStart }; //new save
};

//LRM FUNCTIONS ///////////////////////////////////////////////////////////////////////////////////
If (_lrmStart)
	call aaf_fnc_lrmSave //write new save data
	exitwith {spawn aaf_fnc_lrmSaveloop} //start lrmLoop schedualed 

If(_lrmLoad)
	call aaf_fnc_lrmLoad //Load existing save data
	exitwith {spawn aaf_fnc_lrmSaveloop} //start lrmLoop schedualed

*/