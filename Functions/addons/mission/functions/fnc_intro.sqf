#include "..\script_component.hpp"
/*
	Author: AAF
	Description: AAF Intro Function for Server + Client
	Parameters: none
	Returns: nothing
	Example: none
*/

if !(isMultiplayer) exitWith {};
waitUntil {
	time > 1;
};
missionNamespace setVariable ["aaf_intro", true];
if (isServer) then {
	enableDynamicSimulationSystem false;
	[west, "HQ"] sideChat "Combat Data Systems : Initialising";
	[east, "HQ"] sideChat "Combat Data Systems : Initialising";
	[independent, "HQ"] sideChat "Combat Data Systems : Initialising";
	[civilian, "HQ"] sideChat "Combat Data Systems : Initialising";
};
if (hasInterface) then {
	player enableSimulation false;
	[
		player, // Camera Location
		briefingName, // "Operation Nemesis Phase 2",
		50, // (optional) Altitude (in meters)
		25, // (optional) Radius of the circular movement (in meters)
		75, // Viewing angle (in degrees)
		1, // direction of camera movement (0: anti-clockwise, 1: clockwise, default: random)
		[], // iconOptions: Array - Each array in format:
		0, // 0: normal (default), 1: world scenes
		true, // Fade in after completion (default: true)
		30 // Wait time in seconds after the shot has been completed
	] spawn BIS_fnc_establishingShot; // spinning camera
};
for "_i" from 1 to 30 do {
	sleep 1;
};
if (isServer) then {
	enableDynamicSimulationSystem true;
	[west, "HQ"] sideChat "Combat Data Systems : ACTIVE";
	[east, "HQ"] sideChat "Combat Data Systems : ACTIVE";
	[independent, "HQ"] sideChat "Combat Data Systems : ACTIVE";
	[civilian, "HQ"] sideChat "Combat Data Systems : ACTIVE";
};
if (hasInterface) then {
	player enableSimulation true;
};
// HQ moveOut

// OLD SYS////////// //// //// //// ////////////////////////////////////////////////////////////////
/*
// intro_s
	if (isServer) {
		waitUntil {
			time > 10
	};// Wait until mission started ??
		
	aaf_intro = missionNamespace getvariable["aaf_intro", true]// Disabled check
		if (aaf_intro == false) exitWith {
			[west, "HQ"] sideChat "Combat Data Systems : ACTIVE";
		};
		
		[west, "HQ"] sideChat "Hands and feet inside the Bus Ladies and Gents";
	// INTRO // //// //// //// //// //// ///////////////////////////////////////////////////////////////
	enableDynamicSimulationSystem false// Dynasim off
		[west, "HQ"] sideChat "Combat Data Systems : Initialising";
	// systemchat "Server preparing"// debug
		
		for "_i" from 1 to 60 do {
		// 60 second timer
		// systemChat str _i;// debug
			sleep 1;
		};
		
		enableDynamicSimulationSystem true;
		[west, "HQ"] sideChat "Combat Data Systems : ACTIVE";
	// systemchat "Server Prepped !"// debug
		AAF_IntroComplete = true;
		publicVariable "AAF_IntroComplete";
	};
	
// i// //// //// //// //// //// ////////////////////////////////////////////////////////////////////
	if (hasInterface) {
		waitUntil {
			time > 0
	};// Wait until mission started
		if (!isServer && (player != player)) then {
			waitUntil {
				player == player
			};
			waitUntil {
				time > 10
			};
		};
	// exit CONDITIONS////////////////////// ///////////////////////////////////////////////////////////
	aaf_intro = missionNamespace getvariable["aaf_intro", true]// Settings check
		if (aaf_intro == false) exitWith {};
	_adminstate = 0// predefine for sanitys sake
	_adminState = call BIS_fnc_admin// will return 0, 1, 2
	if (_adminState > 0) exitWith {}// if 1 or 2, exit
		
		aaf_introcomplete = missionNamespace getvariable["aaf_introComplete", false];
	if (AAF_introComplete) exitWith {}// if server complete, exit
	// INTRO // //// //// //// //// //// ///////////////////////////////////////////////////////////////
		player enableSimulation false;
	// [west, "HQ"] sideChat "Hands and feet inside the Bus Ladies and Gents";
	[player, // Camera Location
		briefingName// "Operation Nemesis Phase 2",
		50, // (optional) Altitude (in meters)
		25, // (optional) Radius of the circular movement (in meters)
		75, // Viewing angle (in degrees)
		1, // direction of camera movement (0: anti-clockwise, 1: clockwise, default: random)
		[], // iconOptions: Array - Each array in format:
		0, // 0: normal (default), 1: world scenes
		true, // Fade in after completion (default: true)
		60 // Wait time in seconds after the shot has been completed (Since Arma 3 1.81)
	] spawn BIS_fnc_establishingShot// spinning camera
		
		for "_i" from 1 to 60 do {
		// 60 second timer
			sleep 1;
		};
		player enableSimulation true;
	// [west, "HQ"] sideChat "CDS is up, MOVE OUT!";
	// titleText ["CDS is online\nAll Units, MOVE OUT!", "PLAIN DOWN"]; // ??
	};
*/