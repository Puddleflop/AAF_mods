/*Server holds all information and magazinesDetail

Need to verfiy is the srever can handle that ammount of saving
If not, can players save on disconnect
*/

//Save Function
//Put this into an Eventhander HandleDisconnect for dsiconnect to prevent assholes
//All info saved on server, timed or manual ?
saveMissionProfileNamespace;//Create file if not already done
_aaf_savegear = (getunitLoadout player);//get laodout
missionNamespace setVariable ["aaf_mygear", _aaf_savegear];//save loadout
systemchat str _aaf_savegear;//DEBUG
saveMissionProfileNamespace;//Save file


//Load Function
//Loading with error checking
//Blackout screen
if (isMissionProfileNamespaceLoaded) then {systemchat "vars loaded"};//Check if played here before
player getVariable "aaf_mygear";//Load save
systemchat str aaf_mygear;//DEBUG
if (count aaf_mygear > 0) then {hint "ping"; player setUnitLoadout aaf_mygear};//Apply save

//Respawn addEventHandler
//-1 token
//Spawn Back at base
//Clear player equipemnt and location