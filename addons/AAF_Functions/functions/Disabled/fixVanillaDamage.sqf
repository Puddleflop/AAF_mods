
if !(hasInterface) exitwith {};

private _openWounds = player getVariable ["ace_medical_openwounds", []];
private _blockLegs = false;
private _blockHands = false;
private _outcome = "";

//Each open wound is recorded in an array. ["dunno", "dunno", body part number, number of open wounds, bloodloss from woundtype]
//dunno, dunno is probably something pointing out the size & type of wounds, as like wounds are cumulative.
//Note that when a wound is bandaged, only the number of open wounds of that type changes. i.e if the fourth element of an open wound array is 0, it means all wounds of that size/type on that limb is bandaged. If it read 1 there would be one unbandaged wound, 2 for two wounds, etc.
//Note that partial wounds are accounted for, iirc they're 0.35 of a normal wound.
//Note bleed rate to stop fix vanilla damage was selected by perusing the ace medical config.cpp for bleedrates, and picking over roughly what wounds should stop people moving. Medium avulsion/cut was the breakpoint. Minor velocity wounds are unforuntately over this but we can put up with it.

//When testing, player sethit ["legs",1]; and player sethit ["hands",1]; are extremely useful.

{
	_x params ["", "", "_bodyPart", "_numOpenWounds", "_bloodLoss"];
	
	if ((_bodyPart == 2) || (_bodyPart == 3)) then {
		//If number of unbandaged wounds on that limb/type * bleedrate >= 0.02 then block
		if ((_numOpenWounds * _bloodLoss) >= 0.02) then {
			_blockHands = true;	
		};
	};
		
	if (_bodyPart >= 4) then {
		if ((_numOpenWounds * _bloodLoss) >= 0.02) then {
			_blockLegs = true;	
		};
	};

} foreach _openWounds;

if !_blockHands then {player sethit ["hands",0];};
if !_blockLegs then {player sethit ["legs",0];};

if (_blockHands && _blocklegs) then {_outcome = "wounds"};
if (_blockHands && !_blocklegs) then {_outcome = "arm wounds"};
if (!_blockHands && _blockLegs) then {_outcome = "leg wounds"};

if (_outcome == "") then {
_outcome = "Vanilla damage resolved";
} else {
_outcome = format ["Your %1 are too severe to fix, bandage first.",_outcome];
};

[_outcome, false, 5, 0] call ace_common_fnc_displayText;
