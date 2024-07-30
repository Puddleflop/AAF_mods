#include "..\script_component.hpp"
/*Server holds all information and magazinesDetail
	
	Need to verfiy is the srever can handle that ammount of saving
	if not, can players save on disconnect
*/

// Save Function
// Put this into an Eventhander HandleDisconnect for dsiconnect to prevent assholes
// All info saved on server, timed or manual ?
saveMissionProfileNamespace;
_aaf_savegear = (getUnitLoadout player);
missionNamespace setVariable ["aaf_mygear", _aaf_savegear];
systemChat str _aaf_savegear;
saveMissionProfileNamespace;

// load Function
// Loading with error checking
// Blackout screen
if (isMissionProfileNamespaceLoaded) then {
	systemchat "vars loaded";
};
// Check if played here before
player getVariable "aaf_mygear";
systemChat str aaf_mygear;
if (count aaf_mygear > 0) then {
	hint "ping";
	player setUnitLoadout aaf_mygear
}

// Respawn addEventHandler
// -1 token
// spawn Back at base
// Clear player equipemnt and location