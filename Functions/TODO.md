## Server Monitor - DONE
	Create a Server Monitor function, build into a module or ZEN function
	In Function, have it disable if called/placed twice ?

## Curator group placed event handler - NOT NEEDED
	this addEventHandler [
    	"CuratorObjectPlaced", {
        	params["_curator","_entity"];
        	[west, 0.5, 0.2, 1.0, 0.4] call BIS_fnc_EXP_camp_setSkill
    	};
	];

## Reducer - DONE
	Clean up and optimise code
	Check can be disabled by mission settings - done
	Build in Pre-LRM functionality (unreduce command for saving)
	Disable and check for actual use - done

## Player Gear saving - DONE
	Using vanillia functions - DONE
	Build in a LRM handle to disable when required - CANCELED
	ACE Self Interaction for aaf_fnc_playersave
	Call AAAF_fnc_serverSave by  remoteExec on server

## Dynamic Group Replacer - NOT NEEDED
	IS this needed ?

## Spectate - KEEP FOR NOW
	Keep for now
	Investigate possiable replace with FPAarma's respawn/spectate system in future
	Can remove once th re-insert process is complete

## Group Patches - REMOVE
	Keep, Tidy up and set to assign from group names

## CDS - NOT NEEDED
	AAF_CDS mod
	Change to AAF_Markers?
	Remove all fluff and not needed functionality

## Punish unknown weapon - NOT NEEDED
	https://steamcommunity.com/sharedfiles/filedetails/?id=1549103861
	Should really be player/MM controlled
	Destroyed equiupment instead?

## Debug - DONE
	Keep for all output as to scripts etc working
	aaf_DebugMode

## Hide Hud - REMOVED
	Remove completly not needed or working properly
	If required can add community made option

## Alias Functions - DONE
Head Bug fix
AFK - can do with description.ext on pause script?
Stuck in a rock

## Compress Pre and Post Init - DONE
	postinit_c and postinit_s into AAF_postInit
	preinit_c and preinit_s into AAF_preinit

## Intro compressed and combined - DONE
	intro_c and  intro_s into intro.sqf with checks inside

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////

## Reinsert on respawn - WiP
	Remove from group
	ACE self-interaction to check check for zone
	IF in zone and reinforcements avaliable, move to group leader
	If group leader in combat = Red CDS display - HOT INSERT
	Not in combat - Green CDS display - INSERT - Fade out, teleport to safe spot, Fade in

## Reinforcement/token system - WiP
	https://community.bistudio.com/wiki/Arma_3:_Respawn
	Number of lives per player?
	Coin 'item' system or server side tracker
	Adapting vanillia system inc respawn type
	https://forums.bohemia.net/forums/topic/140011-respawn-ticket-system/?page=2 - Trialed and tested to be working
	Options to respwn on Group respawn, Camp respawn, Vehicle respawn
	Tickets!!
	Wait 3 minuts for new tickets once tickets out?
	Use repawn positions system, group, vehicle, camp
	Keep it to MM choice for when to spawn

## Gear on Death - WiP
	Remove all gear, add 'damaged' gear?
	Destroyed Weapon
	Destroyed Radio
	Damaged Magazine
	Ruined Uniform

## LRM save - WiP
	Markers
	Intact Vehicles
	Destroyed Vehicles
	Destroyed Buildings
	Player Position
	AI Position
	
## Optimisation - TODO
		LRM/Missions would SPAWN post-init
		ACE stle wins out
	Monitor as a RSC display and not a hint ?
	Spawn not call when needing to suspend - IMPORTANT

## Skill setter - WiP
	Postinit Skill setting with [] spawn BIS_fnc_EXP_camp_setSkill
	    https://community.bistudio.com/wiki/BIS_fnc_EXP_camp_setSkill
	Set skills per side?
	- Civ side removed