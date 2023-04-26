//Combined with a CFGpatch to stop the Curator's owner variable from being wiped on mission start.
//I think when a Zeus disconnects, the next player to connect gets their Zeus module somehow. I wonder if it's admin tools Zeus because no one is reporting it in the LRM?
//I think maybe the variable _owner isn't always broadcast? Maybe it's not broadcast in time?
//The error happened in acid's mission, the player had no vehiclevarname, the zeus module had no owner. What the fuck. Might be timing?
//Even after the error, in a mission where there's on zeus slot, the Zeus still had access to his slot while the person with the error also had access????????
//TODO: Set up something to make it return in a few seconds if owner is ""
//TODO: Cleanup. It's getting unwiedly with error checking.


waituntil {time > 5}; 
waitUntil {!isNull (findDisplay 46)};
sleep 5; //Not sure if this is needed I'm just trying to make sure the owner variable is broadcast.

private _playerUID = getPlayerUID player;
private _playerObj = vehicleVarName player;
if (_playerObj == "") then {_playerObj = "random "+ (str (random 300))};
//To avoid unnamed player objects getting Zeus if owner isn't sent in time.

{ 
	private _owner = _x getvariable ["owner",""];
			
	if ((_owner == _playerUID) || (_owner == _playerObj)) then {
		[_x] remoteExec ["unassignCurator",2,false]; 
		sleep 4; 
		[player,_x] remoteExec ["assignCurator",2,false];
		sleep 2;
		//Check to make sure it worked.
		if ((getAssignedCuratorUnit _x) == player) then { 
			Systemchat "JIP Zeus good to go.";
			diag_log "AAF log: AAF_fnc_JIPZeusAssign";
			diag_log format ["%1: %2","_playerUID",_playerUID];
			diag_log format ["%1: %2","_playerObj",_playerObj];
			diag_log format ["%1: %2","player",player];
			diag_log format ["%1: %2","_owner",_owner];
			diag_log format ["%1: %2","Zeus module",_x];
			
		} else {
			[] spawn aaf_fnc_JIPZeusAssign;
			//Probably a more elegant way to loop this but I'm retarded so nah.
		};
	};
} foreach allcurators;
