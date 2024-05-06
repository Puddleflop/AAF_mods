// INIT SERVER //////////////////////////////////////////////////////////////////////////////
//
//	- Executed on the Server at mission start
//  https://community.bistudio.com/wiki/Event_Scripts#initServer.sqf
//
/////////////////////////////////////////////////////////////////////////////////////////////
addMissionEventHandler ["PlayerConnected", {
	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
	"scripts\PlatoonRoster.sqf" remoteExec ["execVM", 2, false];
}]; //This runs whenever players connect to the server and reruns the roster script to try and keep it up to date

addMissionEventHandler ["PlayerDisconnected", {
	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
	"scripts\PlatoonRoster.sqf" remoteExec ["execVM", 2, false];
}]; //This runs whenever players disconnect from the server and reruns the roster script to try and keep it up to date