private _pos = [player, 1, 20, 8, 0, 20, 0] call BIS_fnc_findSafePos;
//[centred on player, min dist 1m, max dist 20m, 8m from objects, cannot be in water, max gradient 20 deg, doesn't have to be at shore]
_user = profilename;
_announce = _user + " has used AAF_Stuck";
player setpos _pos;
_announce remoteExec ["systemchat", 0, false];