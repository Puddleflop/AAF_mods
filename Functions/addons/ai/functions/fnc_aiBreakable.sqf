#include "..\script_component.hpp"
/*
	Author: AAF
	Description: AI equipment breaking on death eventhandler
	Parameters: none
	Returns: nothing
	Example: none
*/

breaking = missionNamespace getVariable "aaf_breakable";

switch (breaking) {
	
}

"All Equipment" : forEach unit weapons;
unit magazines;
uniform unit;
"Weapons only" :
"Ammunition Only" :
default :
