// PLATOON ROSTER ///////////////////////////////////////////////////////////////////////////
//
//Lists all connected players and displays them in their groups while indicating specialists and leaders.
//
//Last update 14/03/24
//
//Changelog: Significant update to make script more... well, Murgos-resistant. Because he has to always rename any section he leads as "_x Death Korps", it broke the old hardcoded values (He's far from the only one but he's a good example for the value of flexibility). The rewrite checks for the presence of standard numerical section designators within the group name and acts as if the rest didn't exist, populating 1-1 as long as that 3 character block appears anywhere in the name. Mission makers will still need to manually edit it if they want to be 3rd platoon for narrative reasons. I was contemplating trying to make it CBA settings to make editing easier but I'm not sure that could be done without losing the flexibility. It'll be something to investigate and if I can then it'll probably be a major rewrite of the entire roster... Again... After the months it took to get it to work the first time... It's FINE, I'm not bitter...
//
//All the hardcoded asset entries have been replaced by 5 dynamic entries for MMs to edit at the top of the script so they don't have to dive into code unless they want to do something more than change the name and description. This halved the script size by removing 31 almost entirely pointless edge cases.
//
//The number of infantry sections have been increased so 1-5 is in the list. If we need more than that, it's a good problem to have.

//ASSET DEFINITIONS /////////////////////////////////////////////////////////////////////////
//
//This section is to let you give fully custom callsigns to assets and have them dynamically show in the roster. Replace the "Spec1" with whatever you set the group's callsign to in group peroperties (EG: HAT1), replace the "Description - Callsign" with whatever you want their title bar to be in the roster (EG:"Heavy Anti-Tank Team - HAT 1"). If you don't change the asset name from the default values then they won't show in the roster so don't worry about leaving things as their defaults if you're not using them. I settled on 5 assets at max because it's highly unlikely we're going to use more. On the off chance it's needed for your mission, give Alias a ping and he'll whip up a custom version to add more.

missionNameSpace getVariable ["canRun", true];
if !(canRun) exitwith {}; //This is a check to see if the roster has been run within the last 10s and to not do it again if so to minimise performance impact if several people connect/disconnect/change groups at once.
missionNamespace setVariable ["canRun", true, true];
//ASSET 1
_s1name = "Spec1"; // In game group name
_s1desc = "Description - Callsign1"; //Short description and full callsign of asset
_asset1 = _s1name;

//ASSET 2
_s2name = "Spec2"; // In game group name
_s2desc = "Description - Callsign2"; //Short description and full callsign of asset
_asset2 = _s2name;

//ASSET 3
_s3name = "Spec3"; // In game group name
_s3desc = "Description - Callsign3"; //Short description and full callsign of asset.
_asset3 = _s3name;

//ASSET 4
_s4name = "Spec4"; // In game group name
_s4desc = "Description - Callsign4"; //Short description and full callsign of asset
_asset4 = _s4name;

//ASSET 5
_s5name = "Spec5"; // In game group name
_s5desc = "Description - Callsign5"; //Short description and full callsign of asset
_asset5 = _s5name;

//This block resets all the variables to empty so updates won't go wonky because they're always starting from a clean slate.
_platrosterfinal = nil;
_platrosterfinal = "";
_WAR = [];
_plt10 = [];
_plt11 = [];
_plt12 = [];
_plt13 = [];
_plt14 = [];
_plt15 = [];
_asset1 = [];
_asset2 = [];
_asset3 = [];
_asset4 = [];
_asset5 = [];
missionNamespace setVariable ["platroster", [], true];  
{
//this block pulls data for group name, player name and special traits from each player
_grpname = groupId (group _x);
_playername = "";
_playerrank = rank _x;
_playermed = _x getVariable ["ace_medical_medicClass",0];
_playerengi = _x getVariable ["ace_isEngineer",0];
_playerEOD = _x getVariable ["ace_isEOD",False];
_playerIcon = "";
_playerID = [_x, false, false] call ace_common_fnc_getName; //3+ months of work and stress trying to get the profileName out of players, turns out ace had a 1 line fucntion for it all along
//_playerZeus = getAssignedCuratorLogic _x;  //This line will check if the player has an attached curator so it can give them the zeus icon in the roster. At the time of writing, I'm making a mission that I intend to play as a section member so there's no zero alpha, I thought MAAAYBE it could be useful to have a zeus indicator in situations like that. Not 100% sure if that has any real value beyond that so it's commented out. Uncomment if you want to use it.

//this block assigns an icon based on the player rank, just to help keep track of who were leadership. Obviously requires mission makers to actually set the ranks correctly...
switch (_playerrank) do
   {
      case "COLONEL": {_playerIcon = "<font color='#fae051' img image='\A3\Ui_f\data\GUI\Cfg\Ranks\colonel_gs.paa' width='16' height='16'/></font>";};
      case "MAJOR": {_playerIcon = "<font color='#fae051' img image='\A3\Ui_f\data\GUI\Cfg\Ranks\major_gs.paa' width='16' height='16'/></font>";};
      case "CAPTAIN": {_playerIcon = "<font color='#fae051' img image='\A3\Ui_f\data\GUI\Cfg\Ranks\captain_gs.paa' width='16' height='16'/></font>";};
      case "LIEUTENANT": {_playerIcon = "<font color='#fae051' img image='\A3\Ui_f\data\GUI\Cfg\Ranks\lieutenant_gs.paa' width='16' height='16'/></font>";};
      case "SERGEANT": {_playerIcon = "<font color='#fae051' img image='\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa' width='16' height='16'/></font>";};
      case "CORPORAL": {_playerIcon = "<font color='#fae051' img image='\A3\Ui_f\data\GUI\Cfg\Ranks\corporal_gs.paa' width='16' height='16'/></font>";};
      default {};
   };

//The following lines check the players for special states such as engineer, EOD or medic and assigns an icon based on skill level so, for example, regular medic and doctor can be displayed differently. To not differentiate, either change the 'img image=' contents so they're both the same image or just set all medics to doctor because they're basically the same with just minor loadout differences anyway.

//if (!isNull _playerZeus) then {_playerIcon = _playerIcon + "<font color='#CCFFFF' img image='a3\modules_f_curator\Data\portraitCurator_ca.paa' width='16' height='16'/></font>"}; //This line will give players with an attached curator the zeus icon in the roster. It's commented out by default for reasons explained above. Uncomment if you want to use it. Be sure to not have this uncommented without the _playerzeus = line above also uncommented or it'll throw errors because it's looking for a variable that doesn't exist.
if (_playermed == 2) then {_playerIcon = _playerIcon + "<font color='#FF3535' img image='\a3\ui_f\data\igui\cfg\simpletasks\types\Heal_ca.paa' width='16' height='16'/></font>"};
if (_playermed == 1) then {_playerIcon = _playerIcon + "<font color='#aa2525' img image='\z\ace\addons\zeus\ui\Icon_Module_Zeus_Medic_ca.paa' width='16' height='16'/></font>"};
if (_playerengi == 2) then {_playerIcon = _playerIcon + "<font color='#777777' img image='\a3\ui_f\data\igui\cfg\simpletasks\types\Use_ca.paa' width='16' height='16'/></font>"};
if (_playerengi == 1) then {_playerIcon = _playerIcon + "<font color='#555555' img image='\z\ace\addons\explosives\UI\Defuse_ca.paa' width='16' height='16'/></font>"};
if (_playerEOD == true) then {_playerIcon = _playerIcon + "<font color='#ffaf3d' img image='\a3\ui_f\data\igui\cfg\simpletasks\types\destroy_ca.paa' width='16' height='16'/></font>"};

_playername = _playerIcon + _playerID;

//This section detects the group name, checks it against the list and adds it to an array of names for the relevant section. It is in the process of being rewritten to be resistant to name change by weirdos who have to have fancy names. The switch now will run without passing the _grpname variable and instead do the checks within the cases. Instead of checking for a specific name, it checks for the presence of a set of characters within the name. Thus the 1-1 roster element will be populated if the group name is "1-1", "1-1 Donkey Fuckers", "Donkey Fuckers 1-1", "Donkey 1-1 Fuckers" and possibly even "Don1-1key Fuckers" but I've not tested that yet. I see no reason why it wouldn't work, just can't conclusively verify it does. You might ask yourself what will happen if you name a section 1-1-1-2-1-3-1-4, what will happen is that you'll be rightly called a dick and told to stop it.
switch (true) do
   {
      case (["Zeus", (_grpname)] call BIS_fnc_inString): {_WAR pushbackUnique _playername};
      case (["1-0", (_grpname)] call BIS_fnc_inString): {_plt10 pushbackUnique _playername};
      case (["1-1", (_grpname)] call BIS_fnc_inString): {_plt11 pushbackUnique _playername};
      case (["1-2", (_grpname)] call BIS_fnc_inString): {_plt12 pushbackUnique _playername};
      case (["1-3", (_grpname)] call BIS_fnc_inString): {_plt13 pushbackUnique _playername};
      case (["1-4", (_grpname)] call BIS_fnc_inString): {_plt14 pushbackUnique _playername};
      case (["1-5", (_grpname)] call BIS_fnc_inString): {_plt14 pushbackUnique _playername};
      case ([_s1name, (_grpname)] call BIS_fnc_inString): {_asset1 pushbackUnique _playername};
      case ([_s2name, (_grpname)] call BIS_fnc_inString): {_asset2 pushbackUnique _playername};
      case ([_s3name, (_grpname)] call BIS_fnc_inString): {_asset3 pushbackUnique _playername};
      case ([_s4name, (_grpname)] call BIS_fnc_inString): {_asset4 pushbackUnique _playername};
      case ([_s5name, (_grpname)] call BIS_fnc_inString): {_asset5 pushbackUnique _playername};
      default {};
   };
} forEach allPlayers; //allPlayers should be used for MP. If you want to test in local multiplayer, change allPlayers to playableUnits and it'll also print out AI names, handy if you want to see what the whole thing will look like at once. Obviously you'll need to have the AI on for that to work. That's controlled in description.ext with the disabledAI setting. Just remember to turn it back off before export so we're not running around with artificial idiots, we have enough trouble with the organic ones.

//This segment is checking if there are any players in each section and ignoring the block if the group is empty so it doesn't print a redundant title. It populates a variable with the names of each player then appends that to the title variable which is then added to the master variable.
if (count _WAR > 0) then {
   _WARRoster = "<font color='#bc9ae1'>Zero Alpha</font><br/>"; 
   _WARGRP = ""; 
   _WARGRP = _WARGRP + (_WAR joinString ",  ");
   _WARRoster = _WARRoster + _WARGRP;
   _WARRoster = _WARRoster + "<br/><br/>";
   _platrosterfinal = _platrosterfinal + _WARRoster;
};

if (count _plt10 > 0) then {
   _One0Roster = "<font color='#e7e7e7'>Platoon Command - 1-0</font><br/>";
   _One0GRP = "";
   _One0GRP = _One0GRP + (_plt10 joinString ",  ");
   _One0Roster = _One0Roster + _One0GRP;
   _One0Roster = _One0Roster + "<br/><br/>";
   _platrosterfinal = _platrosterfinal + _One0Roster;
};

if (count _plt11 > 0) then {
   _One1Roster = "<font color='#f52f2f'>Rifle Section - 1-1</font><br/>";
   _One1GRP = "";
   _One1GRP = _One1GRP + (_plt11 joinString ",  ");
   _One1Roster = _One1Roster + _One1GRP;
   _One1Roster = _One1Roster + "<br/><br/>";
   _platrosterfinal = _platrosterfinal + _One1Roster;
};

if (count _plt12 > 0) then {
   _One2Roster = "<font color='#2f46f5'>Rifle Section - 1-2</font><br/>";
   _One2GRP = "";
   _One2GRP = _One2GRP + (_plt12 joinString ",  ");
   _One2Roster = _One2Roster + _One2GRP;
   _One2Roster = _One2Roster + "<br/><br/>";
   _platrosterfinal = _platrosterfinal + _One2Roster;
};

if (count _plt13 > 0) then {
   _One3Roster = "<font color='#299f15'>Rifle Section - 1-3</font><br/>";
   _One3GRP = "";
   _One3GRP = _One3GRP + (_plt13 joinString ",  ");
   _One3Roster = _One3Roster + _One3GRP;
   _One3Roster = _One3Roster + "<br/><br/>";
   _platrosterfinal = _platrosterfinal + _One3Roster;
};

if (count _plt14 > 0) then {
   _One4Roster = "<font color='#B39900'>Rifle Section - 1-4</font><br/>"; 
   _One4GRP = "";
   _One4GRP = _One4GRP + (_plt14 joinString ",  ");
   _One4Roster = _One4Roster + _One4GRP;
   _One4Roster = _One4Roster + "<br/><br/>";
   _platrosterfinal = _platrosterfinal + _One4Roster;
};

if (count _plt15 > 0) then {
   _One5Roster = "<font color='#B39900'>Rifle Section - 1-5</font><br/>"; 
   _One5GRP = "";
   _One5GRP = _One5GRP + (_plt15 joinString ",  ");
   _One5Roster = _One5Roster + _One5GRP;
   _One5Roster = _One5Roster + "<br/><br/>";
   _platrosterfinal = _platrosterfinal + _One5Roster;
};
if (count _asset1 > 0) then {
   _Ass1Roster = "<font color='#6b9c4e'>"+_s1desc+"</font><br/>"; 
   _Ass1GRP = ""; 
   _ass1GRP = _ass1GRP + (_asset1 joinString ",  ");
   _ass1Roster = _ass1Roster + _ass1GRP;
   _ass1Roster = _ass1Roster + "<br/><br/>";
   _platrosterfinal = _platrosterfinal + _ass1Roster;
};
if (count _asset2 > 0) then {
   _Ass2Roster = "<font color='#179596'>"+_s2desc+"</font><br/>"; 
   _Ass2GRP = ""; 
   _ass2GRP = _ass2GRP + (_asset2 joinString ",  ");
   _ass2Roster = _ass2Roster + _ass2GRP;
   _ass2Roster = _ass2Roster + "<br/><br/>";
   _platrosterfinal = _platrosterfinal + _ass2Roster;
};
if (count _asset3 > 0) then {
   _Ass3Roster = "<font color='#fbc0ba'>"+_s3desc+"</font><br/>"; 
   _Ass3GRP = ""; 
   _ass3GRP = _ass3GRP + (_asset3 joinString ",  ");
   _ass3Roster = _ass3Roster + _ass3GRP;
   _ass3Roster = _ass3Roster + "<br/><br/>";
   _platrosterfinal = _platrosterfinal + _ass3Roster;
};
if (count _asset4 > 0) then {
   _Ass4Roster = "<font color='#ff7800'>"+_s4desc+"</font><br/>"; 
   _Ass4GRP = ""; 
   _ass4GRP = _ass4GRP + (_asset4 joinString ",  ");
   _ass4Roster = _ass4Roster + _ass4GRP;
   _ass4Roster = _ass4Roster + "<br/><br/>";
   _platrosterfinal = _platrosterfinal + _ass4Roster;
};
if (count _asset5 > 0) then {
   _Ass5Roster = "<font color='#c3eeee'>"+_s5desc+"</font><br/>"; 
   _Ass5GRP = ""; 
   _ass5GRP = _ass5GRP + (_asset5 joinString ",  ");
   _ass5Roster = _ass5Roster + _ass5GRP;
   _ass5Roster = _ass5Roster + "<br/><br/>";
   _platrosterfinal = _platrosterfinal + _ass5Roster;
};

//This takes the final variable and makes it public so players can read it.
missionNamespace setVariable ["platroster", _platrosterfinal, true];
publicVariable "platroster"; 

//This block is what actually writes the roster text. It tells the remote client to remove the existing roster to prevent double ups, pulls the contents of the public variable then creates the new diary record with all the names nicely formatted and leaving me no reason to vehemently swear and try to smash down brick walls in fury using the nearest child as a sledgehammer.
[{ 
   _fullroster = "";  
   player removeDiarySubject "PltRoster";  
   _fullroster = missionNamespace getVariable "platroster";  
   player createDiarySubject ["PltRoster","Platoon Roster"];  
   player createDiaryRecord ["PltRoster", ["Platoon Roster", format ["%1",_fullroster]]];  
}] remoteExec ["call",0,true];

sleep 10;
missionNamespace setVariable ["canRun", false, true]; 