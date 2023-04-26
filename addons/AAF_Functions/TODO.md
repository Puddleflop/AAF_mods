## Server Monitor DONE
Create a Server Monitor function, build into a module or ZEN function
In Function, have it disable if called/placed twice ?

## Skill setter DONE
Postinit Skill setting with [] call BIS_fnc_EXP_camp_setSkill
    https://community.bistudio.com/wiki/BIS_fnc_EXP_camp_setSkill

## Curator group placed event handler DONE
this addEventHandler[
    "CuratorObjectPlaced", {
        params["_curator","_entity"];
        [west, 0.5, 0.2, 1.0, 0.4] call BIS_fnc_EXP_camp_setSkill
    };
];
Also build and try Lambs difficulty CFG changes ?

## Reducer
Clean up and optimise code
Check can be disabled by mission settings
Build in Pre-LRM functionality (unreduce command for saving)

## AI vehicle resupply
    Check if needed ?
    LRM basis AI vehicle resupply

## Group Cleaner
    Keep

## Player Gear saving
    Keep
    Build in LRM handle to disable

## Dynamic Group Replacer
    Keep

## Spectate
    Keep for now
	Educate in how ACE spectate works ?

## Group Patches
    Keep

## CDS
    Add into functions, Keep debug functionality
	Keeping seperate

## Punish unknown weapon
    https://steamcommunity.com/sharedfiles/filedetails/?id=1549103861
    Needed or not?
    Should really be player/MM controlled

## Debug
Not really needed, remove from Template + functions

## Hide Hud DISABLED
Remove completly not needed or working properly

## LRM DISABLED
Remove Complatly for LRMini

## LRM Checking to auto disable things
if  (aaf_LRMsave_on = true) then {};