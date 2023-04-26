/*/////////////////////////////////////////////////////////////////////////////////////////////////
Author: AAF
Description: AAF Intro Function for Server
Parameters: aaf_intro - mSettings setting
Returns: nothing
Example: none
*//////////////////////////////////////////////////////////////////////////////////////////////////
waituntil {time > 1}; //Wait until mission started ??

aaf_intro = missionNamespace getvariable["aaf_intro",true];//Disabled check
if (aaf_intro == false) exitwith { [west, "HQ"] sideChat "Combat Data Systems : ACTIVE"; };

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
