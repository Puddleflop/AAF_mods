/*/////////////////////////////////////////////////////////////////////////////////////////////////
Author: AAF
Description: AAF Intro Function for Server + Client
Parameters: aaf_intro
Returns: nothing
Example: none
*//////////////////////////////////////////////////////////////////////////////////////////////////
//non-Multiplayer disable
if !(isMultiplayer) exitwith {};
waituntil {time > 1};//Wait until mission started
aaf_intro = missionNamespace getvariable["aaf_intro",false];//Get aaf_intro
if (isServer) then {
	enableDynamicSimulationSystem false;//Dynasim off just in case
	[west, "HQ"] sideChat "Combat Data Systems : Initialising";//Intro message
	[east, "HQ"] sideChat "Combat Data Systems : Initialising";//Intro message
	[independent, "HQ"] sideChat "Combat Data Systems : Initialising";//Intro message
};
if (hasInterface) then {
	player enableSimulation false;
	[
		player, //Camera Location
		briefingName,//"Operation Nemesis Phase 2",
		50, //(optional) Altitude (in meters)
		25, // (optional) Radius of the circular movement (in meters)
		75, //Viewing angle (in degrees)
		1, //Direction of camera movement (0: anti-clockwise, 1: clockwise, default: random)
		[], //iconOptions: Array - Each array in format:
		0, //0: normal (default), 1: world scenes
		true, //Fade in after completion (default: true)
		30 // Wait time in seconds after the shot has been completed
	] spawn BIS_fnc_establishingShot;//spinning camera
};
for "_i" from 1 to 30 do { //30 second timer
	sleep 1;
};
if (isServer) then {
	enableDynamicSimulationSystem true;
	AAF_IntroComplete = true;
};
if (hasInterface) then {
	player enableSimulation true;
};
//HQ Moveout
[west, "HQ"] sideChat "Combat Data Systems : ACTIVE";
[east, "HQ"] sideChat "Combat Data Systems : ACTIVE";
[independent, "HQ"] sideChat "Combat Data Systems : ACTIVE";

//OLD SYSTEM //////////////////////////////////////////////////////////////////////////////////////
/*
//intro_s
if (isServer) {
	waituntil {time > 10}; //Wait until mission started ??

	aaf_intro = missionNamespace getvariable["aaf_intro",true];//Disabled check
	if (aaf_intro == false) exitwith { [west, "HQ"] sideChat "Combat Data Systems : ACTIVE"; };

	[west, "HQ"] sideChat "Hands and feet inside the Bus Ladies and Gents";
	//INTRO BEGIN /////////////////////////////////////////////////////////////////////////////////////
	enableDynamicSimulationSystem false;//Dynasim off
	[west, "HQ"] sideChat "Combat Data Systems : Initialising";
	//systemchat "Server preparing";//debug

	for "_i" from 1 to 60 do { //60 second timer
		//systemChat str _i; //debug
		sleep 1;
	};

	enableDynamicSimulationSystem true;
	[west, "HQ"] sideChat "Combat Data Systems : ACTIVE";
	//systemchat "Server Prepped !";//debug
	AAF_IntroComplete = true;
	publicVariable "AAF_IntroComplete";
};

//intro_c//////////////////////////////////////////////////////////////////////////////////////////
if (hasInterface) {
	waituntil {time > 0}; //Wait until mission started
	if (!isServer && (player != player)) then {
		waitUntil { player == player };
		waitUntil { time > 10 };
	};
	//EXIT CONDITIONS /////////////////////////////////////////////////////////////////////////////////
	aaf_intro = missionNamespace getvariable["aaf_intro",true];//Settings check
	if (aaf_intro == false) exitwith {};
	_adminstate = 0;//predefine for sanitys sake
	_adminState = call BIS_fnc_admin;//will return 0, 1, 2
	if (_adminState > 0) exitwith {};//if 1 or 2, exit

	aaf_introcomplete = missionNamespace getvariable["aaf_introComplete",false];
	if (AAF_introComplete) exitwith {};//if server complete, exit
	//INTRO BEGIN /////////////////////////////////////////////////////////////////////////////////////
	player enableSimulation false;
	//[west, "HQ"] sideChat "Hands and feet inside the Bus Ladies and Gents";
	[	player, //Camera Location
		briefingName,//"Operation Nemesis Phase 2",
		50, //(optional) Altitude (in meters)
		25, // (optional) Radius of the circular movement (in meters)
		75, //Viewing angle (in degrees)
		1, //Direction of camera movement (0: anti-clockwise, 1: clockwise, default: random)
		[], //iconOptions: Array - Each array in format:
		0, //0: normal (default), 1: world scenes
		true, //Fade in after completion (default: true)
		60 // Wait time in seconds after the shot has been completed (Since Arma 3 1.81)
	] spawn BIS_fnc_establishingShot;//spinning camera

	for "_i" from 1 to 60 do { //60 second timer
		sleep 1;
	};
	player enableSimulation true;
	//[west, "HQ"] sideChat "CDS is up, MOVE OUT!";
	//titleText ["CDS is online\nAll Units, MOVE OUT!", "PLAIN DOWN"]; // ??
};
*/