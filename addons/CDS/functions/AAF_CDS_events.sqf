if (isDedicated) exitwith {};
#include "\a3\editor_f\Data\Scripts\dikCodes.h"
///////////////////////////////////////////////////////////////////////////////////////////////////
/*[
Modname ,
ActionID ,
Display Name ,
Key Down ,
Key Up ,
[DIK_C, [true, true, false]]		//The keybinding data in the format [DIK, [shift, ctrl, alt]]
] call CBA_fnc_addKeybind */
///////////////////////////////////////////////////////////////////////////////////////////////////
[
	"AAF Combat Data Systems",
	"CDS_Act",
	"C.D.S. Activate",
	{call AAF_fnc_CDSactivate;},
	"",
	[DIK_E, [true, true, false]]
] call CBA_fnc_addKeybind;
///////////////////////////////////////////////////////////////////////////////////////////////////
[ //Brightness
"AAF Combat Data Systems",
"CDS_hudB",
"C.D.S. Brightness",
{call AAF_fnc_CDShudbright;},
"",
[DIK_H, [true, true, false]]
] call CBA_fnc_addKeybind;
///////////////////////////////////////////////////////////////////////////////////////////////////
/*[ //Unit Scanning
	"AAF Combat Data Systems",
	"CDS_id",
	"C.D.S. ID Scanning Process",
	{call AAF_fnc_CDSid;},
	"",
	[DIK_U, [true, true, false]]
] call CBA_fnc_addKeybind;*/
///////////////////////////////////////////////////////////////////////////////////////////////////
/*[ //nightvision Activate
	"AAF Combat Data Systems",
	"CDS_nv",
	"C.D.S. NV Activate",
	{call AAF_fnc_CDSnv;},
	"",
	[DIK_N, [true, true, false]]
] call CBA_fnc_addKeybind;*/
///////////////////////////////////////////////////////////////////////////////////////////////////
/*[ //nightvision Brightness
	"AAF Combat Data Systems",
	"CDS_nvb",
	"C.D.S. NV Brightness",
	{call AAF_fnc_CDSnvb;},
	"",
	[DIK_B, [true, true, false]]
] call CBA_fnc_addKeybind;*/
///////////////////////////////////////////////////////////////////////////////////////////////////
/*[ //Night vision Trace
	"AAF Combat Data Systems",
	"CDS_nvt",
	"C.D.S. NV Trace",
	{call AAF_fnc_CDStrace;},
	"",
	[DIK_T, [true, true, false]]
] call CBA_fnc_addKeybind;*/
///////////////////////////////////////////////////////////////////////////////////////////////////
/*[ //Unit Scanning
	"AAF Combat Data Systems",
	"CDS_us",
	"C.D.S. Unit Scanning",
	{call AAF_fnc_CDSuscan;},
	"",
	[DIK_U, [true, true, false]]
] call CBA_fnc_addKeybind;*/
///////////////////////////////////////////////////////////////////////////////////////////////////
/*[ //BluForce Tracker
	"AAF Combat Data Systems",
	"CDS_BFT",
	"Bluforce Tracker",
	{ execVM "\AAF_CDS\QS_icons.sqf"; },
	"",
	[DIK_C, [true, true, false]]
] call CBA_fnc_addKeybind;*/
///////////////////////////////////////////////////////////////////////////////////////////////////
