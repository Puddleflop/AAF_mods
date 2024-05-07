if ([player, "ACRE_PRC343"] call acre_api_fnc_hasKindOfRadio) then {
	plr343 = (["ACRE_PRC343"] call acre_api_fnc_getRadioByType);
	Ear343 = [plr343] call acre_api_fnc_getRadioSpatial;
	Chn343 = [plr343] call acre_api_fnc_getRadioChannel;
	Vol343 = [plr343] call acre_api_fnc_getRadioVolume;
}; 
if ([player, "ACRE_PRC152"] call acre_api_fnc_hasKindOfRadio) then {
	plr152 = (["ACRE_PRC152"] call acre_api_fnc_getRadioByType);
	Ear152 = [plr152] call acre_api_fnc_getRadioSpatial;
	Chn152 = [plr152] call acre_api_fnc_getRadioChannel;
	Vol152 = [plr152] call acre_api_fnc_getRadioVolume;
}; 
if ([player, "ACRE_PRC148"] call acre_api_fnc_hasKindOfRadio) then {
	plr148 = (["ACRE_PRC148"] call acre_api_fnc_getRadioByType);
	Ear148 = [plr148] call acre_api_fnc_getRadioSpatial;
	Chn148 = [plr148] call acre_api_fnc_getRadioChannel;
	Vol148 = [plr148] call acre_api_fnc_getRadioVolume;
}; 
if ([player, "ACRE_PRC117F"] call acre_api_fnc_hasKindOfRadio) then {
	plr117F = (["ACRE_PRC117F"] call acre_api_fnc_getRadioByType);
	Ear117F = [plr117F] call acre_api_fnc_getRadioSpatial;
	Chn117F = [plr117F] call acre_api_fnc_getRadioChannel;
	Vol117F = [plr117F] call acre_api_fnc_getRadioVolume;
}; 
if ([player, "ACRE_PRC77"] call acre_api_fnc_hasKindOfRadio) then {
	plr77 = (["ACRE_PRC77"] call acre_api_fnc_getRadioByType);
	Ear77 = [plr77] call acre_api_fnc_getRadioSpatial;
	Chn77 = [plr77] call acre_api_fnc_getRadioChannel;
	Vol77 = [plr77] call acre_api_fnc_getRadioVolume;
}; 
if ([player, "ACRE_BF888S"] call acre_api_fnc_hasKindOfRadio) then {
	plrBF888S = (["ACRE_BF888S"] call acre_api_fnc_getRadioByType);
	EarBF888S = [plrBF888S] call acre_api_fnc_getRadioSpatial;
	ChnBF888S = [plrBF888S] call acre_api_fnc_getRadioChannel;
	VolBF888S = [plrBF888S] call acre_api_fnc_getRadioVolume;
}; 
if ([player, "ACRE_SEM70"] call acre_api_fnc_hasKindOfRadio) then {
	plrSEM70 = (["ACRE_SEM70"] call acre_api_fnc_getRadioByType);
	EarSEM70 = [plrSEM70] call acre_api_fnc_getRadioSpatial;
	ChnSEM70 = [plrSEM70] call acre_api_fnc_getRadioChannel;
	VolSEM70 = [plrSEM70] call acre_api_fnc_getRadioVolume;
}; 
if ([player, "ACRE_SEM52SL"] call acre_api_fnc_hasKindOfRadio) then {
	plrSEM52SL = (["ACRE_SEM52SL"] call acre_api_fnc_getRadioByType);
	EarSEM52SL = [plrSEM52SL] call acre_api_fnc_getRadioSpatial;
	ChnSEM52SL = [plrSEM52SL] call acre_api_fnc_getRadioChannel;
	VolSEM52SL = [plrSEM52SL] call acre_api_fnc_getRadioVolume;
}; 
PLRPTT = [] call acre_api_fnc_getMultiPushToTalkAssignment;
_plrLoc = getPosASL player; 
_plrGear = getUnitLoadout player; 
_plrDir = getDir player;
_medState = [player] call ace_medical_fnc_serializeState;
player hideObjectGlobal true;
cutText [" ", "BLACK OUT", 1];
sleep 1;

removeAllWeapons player;
removeBackpack player;
removeVest player;
removeUniform player;
removeAllAssignedItems player;
setPlayerRespawnTime 0; 
forceRespawn player; 
waitUntil {playerRespawnTime == -1};
_plrCorpse = allDeadMen select {_x distance2D _plrLoc < 3} select 0;
setPlayerRespawnTime 10; 
sleep 1;

player setposasl _plrLoc;
player setDir _plrDir;
player setUnitLoadout _plrGear;
{[player, _medState] call ace_medical_fnc_deserializeState;} call CBA_fnc_directCall;
deleteVehicle _plrCorpse;
player hideObjectGlobal false;
cutText [" ", "BLACK IN", 1];
sleep 1;
if ([player, "ACRE_PRC343"] call acre_api_fnc_hasKindOfRadio) then {
	[plr343, Chn343] call acre_api_fnc_setRadioChannel;
	[plr343, Ear343] call acre_api_fnc_setRadioSpatial;
	[plr343, Vol343] call acre_api_fnc_setRadioVolume;
}; 
if ([player, "ACRE_PRC152"] call acre_api_fnc_hasKindOfRadio) then {
	[plr152, Chn152] call acre_api_fnc_setRadioChannel;
	[plr152, Ear152] call acre_api_fnc_setRadioSpatial;
	[plr152, Vol152] call acre_api_fnc_setRadioVolume;
}; 
if ([player, "ACRE_PRC148"] call acre_api_fnc_hasKindOfRadio) then {
	[plr148, Chn148] call acre_api_fnc_setRadioChannel;
	[plr148, Ear148] call acre_api_fnc_setRadioSpatial;
	[plr148, Vol148] call acre_api_fnc_setRadioVolume;
}; 
if ([player, "ACRE_PRC117F"] call acre_api_fnc_hasKindOfRadio) then {
	[plr117F, Chn117F] call acre_api_fnc_setRadioChannel;
	[plr117F, Ear117F] call acre_api_fnc_setRadioSpatial;
	[plr117F, Vol117F] call acre_api_fnc_setRadioVolume;
}; 
if ([player, "ACRE_PRC77"] call acre_api_fnc_hasKindOfRadio) then {
	[plr77, Chn77] call acre_api_fnc_setRadioChannel;
	[plr77, Ear77] call acre_api_fnc_setRadioSpatial;
	[plr77, Vol77] call acre_api_fnc_setRadioVolume;
}; 
if ([player, "ACRE_BF888S"] call acre_api_fnc_hasKindOfRadio) then {
	[plrBF888S, ChnBF888S] call acre_api_fnc_setRadioChannel;
	[plrBF888S, EarBF888S] call acre_api_fnc_setRadioSpatial;
	[plrBF888S, VolBF888S] call acre_api_fnc_setRadioVolume;
}; 
if ([player, "ACRE_SEM70"] call acre_api_fnc_hasKindOfRadio) then {
	[plrSEM70, ChnSEM70] call acre_api_fnc_setRadioChannel;
	[plrSEM70, EarSEM70] call acre_api_fnc_setRadioSpatial;
	[plrSEM70, VolSEM70] call acre_api_fnc_setRadioVolume;
}; 
if ([player, "ACRE_SEM52SL"] call acre_api_fnc_hasKindOfRadio) then {
	[plrSEM52SL, ChnSEM52SL] call acre_api_fnc_setRadioChannel;
	[plrSEM52SL, EarSEM52SL] call acre_api_fnc_setRadioSpatial;
	[plrSEM52SL, VolSEM52SL] call acre_api_fnc_setRadioVolume;
}; 
[[PLRPTT]] call acre_api_fnc_setMultiPushToTalkAssignment;

//[[PTT343,PTT152,PTT148,PTT117F,PTT77,PTTBF888S,PTTSEM70,PTTSEM52SL]] call acre_api_fnc_setMultiPushToTalkAssignment;
//Radio PTT can change. get/set PTT button with acre_api_fnc_getMultiPushToTalkAssignment / acre_api_fnc_setMultiPushToTalkAssignment 