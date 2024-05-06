// MISSION TITLES ///////////////////////////////////////////////////////////////////////////
//
// This is the regular mission title script that prints the name, date and location of the mission as a nice little intro. 
//
/////////////////////////////////////////////////////////////////////////////////////////////

setDate [2035, 07, 06, 12, 00]; //sets the time and date in year, month, day, hour, minute format. Ideal for those mission makers who are anal enough to notice the disconnect between clock time and printed time. I made it for my own use...
[
	[
		["""OPERATION MISSION NAME""","<t align = 'center' shadow = '1' size = '1.5'>%1</t><br/>",10], //Triple quotes around the mission name so it shows a single set of quote marks ingame.
		["LOCATION","<t align = 'center' shadow = '1' size = '0.9'>%1</t><br/>",10], 
		["12:00, July 6th, 2035","<t align = 'center' shadow = '1' size = '0.7'>%1</t>",30]
		]
] spawn BIS_fnc_typeText; //Prints the above text
