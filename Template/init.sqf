// INIT /////////////////////////////////////////////////////////////////////////////////////
//
// - Executed Post init on Mision start
// https://community.bistudio.com/wiki/Event_Scripts#init.sqf
//
/////////////////////////////////////////////////////////////////////////////////////////////
missionNamespace setVariable ["canRun", true, true]; //This line sets a variable that will be used by the platoon roster to prevent it running excessively if several people change group at once.
if (isServer) then { nul=[] execvm "scripts\PlatoonRoster.sqf" } //This line tells the server to run the platoon roster script.