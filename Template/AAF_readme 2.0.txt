   -AAF Mission Template Notes 2.0.0-
     Date of last change: 05/05/24

The old functions has been rewritten to shift several settings into the editor to reduce the amount of time you spend tabbing out of the game to make a small change. The template has been extensively rewritten, all of the files have been heavily edited to have a consistent appearance across all files and they now have things like a descriptive header which also has links to the BI wiki for the relevant file for further reading if needed. Seriously, I spent a good 10 minutes making sure all of the header title borders were the same width because I'm too anal not to. I've also tried my best to make them human readable with comments explaining what each bit does, the previous versions definitely had all the information but had a distinct "By programmers, for programmers" feel.

A new panel in addon options now replaces almost all of the functions that were previously defined in MSETTINGS/MSETTINGSSET. The only exception is mission name/description and author name which are now done in description.ext, as a consequence the 2 msettings files are dead and gone! 

Within several scripts there are sections that are optional and which you can uncomment if you wish to use them. Comments in scripts are done one of two ways:
   // denotes a single line comment that ends as soon as it hits the carriage return. Good for disabling single commands.
   /* denotes the start of a multi-line comment. These are good for commenting out a larger block of code. It continues after a carriage return.
   In order to close the multi-line comment use */


-NEW FEATURES-

   INTERACTIONS
   The self interacts for AFK, Stuck In A Rock and Super Headbug Fix have been added to functions for all infantry units so they're always available.

   AFK has been rewritten slightly to guarantee safety of the AFK unit. Because ACE damage is scripted, some elements like explosions can sometimes bypass the damage disable so disabling damage isn't sufficient. Now it unsims the player, sets captive, hides them and teleports them 50m underground so they're completely untouchable. To cover the rather abrupt transition that looks like you've been hammered into the ground, the screen now blacks out while AFK. Coming back raises you 50m, releases captive, unhides, resims and fades in.
   As before, the systemchat tells people when it's been used so people conveniently going in and out of AFK as artillery lands will still be exposed as cheating bastards. Oh and AFK is now a toggle rather than 2 separate actions, just select AFK again when you're AFK and it'll UnAFK you.

   Technically the other 2 have also been rewritten a bit but there's no noticeable difference, just efficiency improvements. There were customised icons but they sucked so they're back to the old ones. I might make non-sucky ones at some point and perhaps even spend more than 20 minutes on them next time.

   PLATOON ROSTER
   The platoon roster has been drastically rewritten, improved in functionality and is half the number of lines it was before. It's set to run automatically and will populate the roster based on the regular numerical designations being present within group names. This means you can have groups called '1-1', '1-1 Bastard Squad' or whatever you like and as long as 1-1 appears somewhere in the name, they'll be listed under 1-1 in the roster. 
   There are also now 5 dynamic roles at the top of the roster script that lets mission makers name assets or teams whatever the hell they like and not break the roster script. More details are available in comments within the script (in the scripts folder if that wasn't obvious).
   The roster also differentiates between skill levels of specialists so medic/doctor get different icons as do engineer/advanced engineer. EOD role icon has been added. A zeus role icon has also been added but commented out by default because I can't decide if it's useful.

   TITLES
   The mission title script (also in the scripts folder) that I generally use has had a bit of a tidy up and has some comments on how to use it. It's by no means compulsory, just there if you want it. Once I've finished the rewrite of the movie credits style intro I've used a few times, I'll add that too.

   SKILL SETTER
   We now have a functional and kind of nifty skill changer to set the skill of an AI group to one of 5 presets: Civvies, Insurgents, Regular, Professional and Special Forces. Right click the group flag in Zeus, go to AAF Functions then AI Skill Level and pick one of the presets and suddenly those spetsnaz guys are just cosplaying civilians or that angry civilian with a pistol is revealed to be a former navy seal turned cook who's been pushed too far! 
   These skill levels go 0%, 25%, 50%, 75% and 100% but don't think that 0% means brain dead or that 100% is 360noscope aimbots. We've set minimum and maximum skill boundaries so their derived skill will be never be higher or lower than those boundaries. It's kinda complicated and I only half understand it but it's kinda something like that maybe perhaps. Just don't panic at 0% or 100%, okay? SF will still kick our arses which is kind of the point, if you want useless rebels that feel like civs have picked up a gun then civvies is the setting for you. By default, all units will be set as Regulars.
   There is also a global AI skill level selection. By default it will use whatever values there are in the editor so if you tweak skills of units in the editor it'll leave them alone. If you want everyone to be an insurgent then you can select insurgent from the dropdown in the panel and it'll apply that skill to all units on startup. Note that it's ALL units regardless of what they are in the editor, if you have a gaggle of civs and 2 sections of SF, you need to manually alter the SF units in mission.

   I'd like to add the skill level selection to the group properties but I've not worked out how to change those panels yet so if it happens, it'll be a while.

   RADIO AUTO-SETTER
   The ACRE 343 radio setting script is now built into the template so you don't have to faff about setting it up and I don't have to set my digital radio channel myself like it's the bloody dark ages! The system is built only around the 343 as the name implies.
      It first runs in initPlayerLocal.sqf which also has a detailed description on how it works and how to change it. It's in a group changed eventhandler so if people join a different section, it updates their radio channels. 
      It's also in onPlayerRespawn because the radios are removed and replaced as part of the respawn process. 

   INSIGNIA AUTO-SETTER
   In the same way as the radio setter, units will now get the correct AAF group insignias based on group name.

   MONITOR
   The mission performance monitor has been added to functions so you don't have to find the code on discord anymore! Run it locally in the execute code module with: [4] call aaf_fnc_monitor (the number is the update timer, don't set it under 4 or things go a little odd or outright cause an error)


-CBA OPTIONS-
A new panel has been added to addon options: AAF Settings. This contains as lot of the things you had access to in mSettings and is now just a basic checkbox to enable or disable.

   AAF MISSION
   This should always be ticked. It's a global enable for all the AAF Functions, if it's unticked then it'll cause errors so have it on. It's there to prevent Functions stuff running in things like the main menu background which is technically a mission that's obviously not designed for functions.

   DEBUG MODE
   This shows a lot of systemchats showing what scripts are doing. It's obviously not useful for gameplay but can be useful for testing. Any AAF scripts present and future that have the debug flag built in will output data to show script progress.

   AAF Intro Enable
   Controls the rotating camera and initial unsimulated state at the start of a mission. Recommended to have it on but the option exists in case it's necessary.

   Loadout Save
   This saves the loadout of units when they spawn in so they respawn with customised loadouts. Recommended to have it on unless you're doing something like re-gearing units with scripts called in onplayerrespawn.

   AAF AI Reducer
   Controls the reducer system and can turn it off completely if necessary. Recommended to have it on unless you have a very specific reason that you need everything fully simulated. "I don't like reducer" isn't a good reason but "Reducer breaks the mission if its on" is a good reason.

   AAF AI Difficulty
   This is the default AI skill level selection that will be applied to ALL AI units on the map. No change from Editor Values is the default so you can tweak things in the editor and it'll leave the values alone, if you do nothing then they'll effectively be regulars. 


-WiP-

As a preview of things coming sooner or later: 

   AAF Zone Reducer
   We're working on a system where you can set up tailored reducer areas based on triggers so you can have some refinement of when things activate. The intent is to make them 3 dimensional so you can have large areas that aren't activated by aircraft flying over because you've set the trigger height at 20m.

   AAF Player/Server Save
   You know all that talk of LRMs that older members wax lyrical about? We've made the proof of concept for a new system that is embarrassingly simple with a single command added 18 months ago that we just never noticed. Turns out we don't need to worry about player profile corruption from writing too much data to it or faffing about setting up external databases. There's now just a command to create a file the same as the base game campaign saving does...


-RESPAWN SPECTATOR USE-
   To enable the spectator functionality, place the following in a trigger that is activated by "Any Player":  [TV] call aaf_fnc_addSpectate

   'TV' is the variable name of the object that the spectator interaction will be attached to. It doesn't matter what the object is, I just made it a TV one day and it stuck but it can be a radio, a chair, a can of beans, anything. Just don't pick anything like a vehicle that can be moved.


-MISSION OPTIMISATION-

   With your Reducer range set appropriately, we can use transport vehicles and helos to RTB after each objective or they can be used to travel between objectives. Don't have everything packed so tightly together otherwise everything will be constantly Simulated.

   Take the time to set dress pieces and flavour as simple objects. Are the things you're putting down purely visual things that will never be damaged or interacted with? Simple object them and they'll take up a lot fewer resources. Objects you need players to interact with such as buildings to open doors or boxes to access the inventory need simulation enabled.

   Remember, vehicles use a LOT of cycles just existing, no matter the simulation state. Aim for infantry missions with limited vehicle support to handle player counts. Tanks are like ice cream, a lovely treat but not a main meal. At least not if you want to live...


-BRIEFINGS-

   The way that briefings are assigned has been rewritten to be less fiddly. If you look in initplayerlocal.sqf, you'll see this line: 
   
      _plrName = vehicleVarName player;
   
   This pulls the variable name of the player's unit and checks it for the text in the briefing assignment:
   
      if (["pilot", (_plrName)] call BIS_fnc_inString) then {
      [] execVM "briefing\briefing_air.sqf";
      };

   If the word "pilot" appears anywhere in the player's variablename, it'll tell the player to load the briefing_air.sqf to give them the special pilot briefing item. This will apply if the variablename is pilot, pilot1, THEGREATPILOTTO, DropThePilotTryMyBalloon, anything. If it sees pilot, you get the extra briefing.
   
   By default, it checks for Zeus, Pilot and Crew, these are just text so can be changed at will. The check isn't case sensitive so no need to stress about raNdom capitaLs.
   
   The actual briefing files are the same as in Template 1.9 so can be used the same way or even directly copied if you're updating a Template 1.9 mission.


-REDUCER-
   Reducer functions as an ersatz caching system to improve performance by limiting the amount of active AI. It hides and disables simulation on everything but the group leader/vehicle driver then teleports them back to formation, unhides and resimulates them when the players get within activation range.

   As listed above, there is now a checkbox to disable the entire reducer system. This is only to be used if you're 100% certain that your mission will run with good performance without it. It's there for special requirements rather than because you don't like reducer.

   The Reducer distance is the group Dynamic Simulation range set in your mission settings, it only checks once every 30 seconds so if players get in range 10 seconds after the last check, it'll not activate for another 20 seconds so build a bit of padding space in to be safe.
   If your Dynamic Simulation range is set to 5000m and we never see them over 800m, what's the 4200m extra range for? It's just going to waste performance and make your mission run slower.
   Set the range as low as is practical, take the time to look around your AO and try to judge the longest practical distance the players will see the enemy and set the dynamic simulation distance 1-200m longer than that to catch edge cases. I've found a good balance is 800m-1000m for infantry, 1000m-1500m for vehicles but that can go down to 500m for missions with heavy fog or in thick jungles where your sightlines are lucky to be more than 50m. Conversely, something as open as Takistan sometimes benefits from a longer range.

   Try to only disable reducer when groups absolutely HAVE to be always simulated. Things like air defence is an example of a good reason, a garrison in a town on the other side of the map is an example of a bad reason.

   In order to disable reducer for a group, place this in the init box of the GROUP (NOT the units):  this setVariable ["f_cacheExcl", true, true];
   (This may become a checkbox in group properties at some point in the future)


-REMOVALS-
   HUD Hider is gone, no longer will you have to live with the spectre of accidentally hitting F10 and the mod randomly deciding to never give you your HUD back. Alternatives were sought to potentially have in the optionals but I didn't find anything that looked promising.

   mSettings/mSettingsSet have been killed off since everything they did is now done by a combination of behind the scenes functions and ingame settings. 

   The old insignia changer has gone the way of the dodo, it was an awfully inefficient script, no wonder it broke stuff. It was really, REALLY bad. Bad in the "You press the button and the light comes on, the fact that it sets the rest of the house on fire at random isn't the point, the light comes on!" type of bad.


-SUGGESTION-
   If you're going to go into mission making properly, you'd really benefit from a text editor that can highlight code properly. If you're reading this in notepad then you're doing it wrong. Grab something like Notepad++ or VSCode and get the SQF addons for them, they'll vastly improve your understanding of basic code just because it colours stuff like text in quotes, variables, comments and commands in different colours so it's a lot easier to read. The fact it also highlights the other end of a bracket pair is also a major help.


                                 -TLDR- 
                                   or 
   'HOW DO I DO ALL THIS STUFF NOW ALIAS, YOU ENDLESSLY MEDDLING BASTARD??'

Set mission title/description/author in description.ext.
Name your sections so they have the usual 1-1 to 1-5 somewhere in their names
Open settings\addon options\AAF Settings and ensure the following are ticked: AAF Mission, AAF Intro Enable, Loadout Save and AAF AI Reducer.
Do spectator and briefings as usual.
In Zeus, right click unit flags and open AAF Functions\AI Skill Level to set skills.
If you don't know something, ASK!
