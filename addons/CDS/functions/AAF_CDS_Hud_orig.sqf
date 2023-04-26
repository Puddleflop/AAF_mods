/* HEADDER
	TPW HUD - Realistic Heads Up Display for Tactical Goggles
	Author: tpw
	Additional code: hypnomatic
	Date: 20190523
	Version: 1.74
	Requires: CBA A3, tpw_core.sqf
	Compatibility: SP, MP client

	Disclaimer: Feel free to use and modify this code, on the proviso that you post back changes and improvements so that everyone can benefit from them, and acknowledge the original author (tpw) in any derivative works.
	THIS SCRIPT WON'T RUN ON DEDICATED SERVERS.
*/

if (isDedicated) exitWith {};
WaitUntil {!isNull FindDisplay 46};

tpw_core_sunangle = 90;//Midday setting ?

AAF_cds_version = "1.74";
AAF_cds_range = [10,1000];//[50,1000];//Min, Max range for Target ID
AAF_cds_colour = [0.85,0.85,0];//ColorYellow

//NEW COLOUR SYSTEM //https://community.bistudio.com/wiki/Arma_3:_CfgMarkerColors
AAF_cds_ColourWest = [0.0,0.3,0.6]; //ColorWEST
AAF_cds_ColourEast = [0.5,0,0]; //ColorEAST
AAF_cds_ColourGuer = [0,0.5,0]; //ColorGUER
AAF_cds_ColourCiv = [0.4,0,0.5]; //ColorCIV
AAF_cds_ColourUnknown = [0.7,0.6,0]; //ColorUNKNOWN
AAF_cds_ColourWhite = [0.,0.1,0.1];//Colour White
AAF_cds_ColourYellow = [0.85,0.85,0];//Colour Yellow
AAF_cds_ColourRed = [0.9,0,0];//ColourRed
AAF_cds_ColourBlue = [0,0,1];//ColourBlue
AAF_cds_ColourGreen = [0,0.8,0]; //ColourGreen
AAF_cds_ColourOrange = [0.85,0.4,0];//ColourOrange

//ICONS DEFINE
AAF_cds_groupicon = "\AAF_CDS\data\3px_diamond.paa";//group
AAF_cds_uniticon = "\AAF_CDS\data\iconMan_ca.paa";//"a3\ui_f\data\Map\VehicleIcons\iconMan_ca.paa";//soldiers
AAF_cds_medicicon = "a3\ui_f\data\Map\VehicleIcons\iconMan_ca.paa";//medics?
AAF_cds_staticicon = "a3\ui_f\data\Map\VehicleIcons\iconStaticMG_ca.paa";//occupied static weapons?

//MAP MARKERS DEFINE
CDS_icon_bloc = "\AAF_CDS\data\bloc.paa";//base location
CDS_icon_eloc = "\AAF_CDS\data\eloc.paa";//enemy location
CDS_icon_floc = "\AAF_CDS\data\floc.paa";//friendly location
CDS_icon_hloc = "\AAF_CDS\data\hloc.paa";
CDS_icon_lzloc = "\AAF_CDS\data\lzloc.paa";//Landingzone
CDS_icon_poiloc = "\AAF_CDS\data\poiloc.paa";//point of interest
CDS_icon_wploc = "\AAF_CDS\data\wploc.paa";//Waypoint

//SETTINGS
AAF_cds_alpha = 0.6; // initial HUD brightness
AAF_cds_asl = [0,0.6,0.456,1]; // ASL   1 = active ( 0 = inactive), 0.4 = X position, 0.4 = Y position, 1 = text size
AAF_cds_azt = [0,0.5,0.452,1]; // AZT - ?
AAF_cds_grd = [1,0.4,0.45,1]; // GRD
AAF_cds_lmt = [1,0.4,0.5,1]; // LMT
AAF_cds_tmp = [1,0.6,0.51,1]; // TMP - ?
AAF_cds_hlt = [0,0.4,0.55,1]; // HLT - Remove

AAF_cds_unit = [2,1,0.25,0.5];//UNITS
//1=simple ( 0=inactive) 2=Full, 1=icon max size, 0.25=icon min size, 0.5=text size (1=same size as HUD text)
AAF_cds_mark = [1,1,2,0.5];//MARKERS

AAF_cds_offset = [0.34,0.26]; // CDS display Offset
AAF_cds_scale = 1; // Scale
AAF_cds_textscale = 1; // Text scale
AAF_cds_vehiclefactor = 2; // Range factor multiplier for vehicle ID, must be positive

// HUD ELEMENT TEXT LAYOUT - make Moveable like DUI??
AAF_cds_asl_txt = "%1<t size='0.5'><br />ASL</t>";
AAF_cds_atl_txt = "%1<t size='0.5'><br />AGL</t>";
AAF_cds_azt_txt = "%1<t size='0.5'><br />AZT %2</t>";
AAF_cds_grd_txt = "%1<t size='0.5'><br />GRD</t>";
AAF_cds_lmt_txt = "%1%2<t size='0.5'><br />LMT</t>";
AAF_cds_tmp_txt = "%1<t size='0.5'><br />TMP</t>";
AAF_cds_hlt_txt = "<t color='%3'>%2<t size='0.5'><br />BPM %1</t></t>";

// INITIAL VARIABLES
AAF_cds_eh = false;
AAF_cds_active = false;//Display On and Off setting - starts off
AAF_cds_fncactive = true; //CDS FUNCTION setting
AAF_cds_params = [AAF_cds_asl,AAF_cds_azt,AAF_cds_grd,AAF_cds_lmt,AAF_cds_tmp,AAF_cds_hlt];
AAF_cds_offset_x = AAF_cds_offset select 0;
AAF_cds_offset_y = AAF_cds_offset select 1;
AAF_cds_minrange = AAF_cds_range select 0;
AAF_cds_maxrange = AAF_cds_range select 1;
AAF_cds_vehiclerange = AAF_cds_maxrange * AAF_cds_vehiclefactor;
AAF_cds_markers = [];
AAF_cds_gogglewearers = [];
AAF_cds_nearunits = [];
AAF_cds_muzvel = 800;
AAF_cds_feh=false;
AAF_cds_nvflag = false;
AAF_cds_nv = false;
tpw_nv_fac = 0;
tpw_nv_brightness = [5,2,1,0.5,0.25,0.125];
AAF_cds_visible = [];
AAF_cds_hidden = [];
AAF_cds_unsure = [];
AAF_cds_restingheartrate = floor (55 + (random 10));
AAF_cds_prevenemies = 0;
AAF_cds_traceactive = 0;
AAF_cds_farunits = [];
AAF_cds_farvehicles = [];
AAF_cds_goggletypes = [
	"G_Goggles_VR",
	"G_Aviator",
	"ADFU_f_face_shield_tactical_shemagh_cap_noble",
	"ADF_Wrap_CDS"
];
AAF_cds_headgeartypes = [
	//"H_HelmetSpecO_blk",
	//"H_HelmetSpecO_ocamo",
	//"H_HelmetLeaderO_oucamo",
	//"H_HelmetLeaderO_ocamo"
];
AAF_cds_tint = -1;//tpw_core_sunangle;
AAF_cds_hideciv = false;
AAF_cds_ping = 0;
AAF_cds_celsius = true;

AAF_cds_fnc_activate = {// ACTIVATE HUD FUNCTIONS
	AAF_cds_shortfunc = []; // functions for the short loop
	AAF_cds_longfunc = []; // functions for the long loop

	if ((AAF_cds_unit select 0) == 2) then {// Full Hud display -- REMOVE
		AAF_cds_longfunc = AAF_cds_longfunc + [AAF_cds_fnc_gogglecheck];
		AAF_cds_longfunc = AAF_cds_longfunc + [AAF_cds_fnc_mapmarkers];

		AAF_cds_shortfunc = AAF_cds_shortfunc + [AAF_cds_fnc_markerscan];
		AAF_cds_shortfunc = AAF_cds_shortfunc + [AAF_cds_fnc_unitscan];
		AAF_cds_shortfunc = AAF_cds_shortfunc + [AAF_cds_fnc_unitprepare];
		AAF_cds_shortfunc = AAF_cds_shortfunc + [AAF_cds_fnc_unitshow];
	};
	// Simplified Hud display -- REMOVE
	/*if ((AAF_cds_unit select 0) == 1) then {
		AAF_cds_longfunc = AAF_cds_longfunc + [AAF_cds_fnc_gogglecheck];
		AAF_cds_shortfunc = AAF_cds_shortfunc + [AAF_cds_fnc_unitscan_simple];
		AAF_cds_shortfunc = AAF_cds_shortfunc + [AAF_cds_fnc_unitshow];
	};*/

	// HUD Components Display
	if ((AAF_cds_asl select 0) == 1) then {
		AAF_cds_shortfunc = AAF_cds_shortfunc + [AAF_cds_fnc_asl];
	};
	if ((AAF_cds_azt select 0) == 1) then {
		AAF_cds_shortfunc = AAF_cds_shortfunc + [AAF_cds_fnc_azt];
	};
	if ((AAF_cds_grd select 0) == 1) then {
		AAF_cds_longfunc = AAF_cds_longfunc + [AAF_cds_fnc_grd];
	};
	if ((AAF_cds_lmt select 0) == 1) then {
		AAF_cds_longfunc = AAF_cds_longfunc + [AAF_cds_fnc_lmt];
	};
	/*if ((AAF_cds_tmp select 0) == 1) then {
		if (!isnil "tpw_fog_active") then {
			waituntil {!isnil "tpw_fog_temp"};
			AAF_cds_longfunc = AAF_cds_longfunc + [AAF_cds_fnc_tmp];
		};
	};*/

	if ((AAF_cds_hlt select 0) == 1) then {
		AAF_cds_longfunc = AAF_cds_longfunc + [AAF_cds_fnc_hlt];
	};


	//AAF_cds_shortfunc = AAF_cds_shortfunc + [AAF_cds_fnc_nv];
};

AAF_cds_fnc_asl = {// ASL -- NEED?
	private ["_asl"];
	if (vehicle player iskindof "air") then {
		_asl = round ((getposatl player) select 2);
		_ctrl_asl ctrlSetStructuredText parseText format [AAF_cds_atl_txt,_asl];
	} else {
		_asl = round ((getposasl player) select 2);
		_ctrl_asl ctrlSetStructuredText parseText format [AAF_cds_asl_txt,_asl];
	};
};

AAF_cds_fnc_azt = {// AZIMUTH -- NEED?
	private ["_azt","_ang","_points","_num","_compass"];
	_azt = (((eyedirection player) select 0) atan2 ((eyedirection player) select 1));
	_ang = _azt;
	if (_azt < 0) then {
		_azt = 360 + _azt;
	};
	_ang = _ang + 11.25;
	if (_ang < 0) then {
		_ang = 360 + _ang;
	};

	_points = ["N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"];
	_num = floor (_ang / 22.5);
	_compass = _points select _num;
	_ctrl_azt ctrlSetStructuredText parseText format [AAF_cds_azt_txt,_compass,round _azt];
};

/*AAF_cds_fnc_brightness = {// ADJUST BRIGHTNESS AND OTHER PARAMETERS -- REMOVE
	_heh = (findDisplay 46) displayAddEventHandler ["keyDown", {_this call AAF_cds_fnc_keydown; false}];
	AAF_cds_lastchange = time;
	AAF_cds_fnc_keydown = {
		private["_ctrl","_key"];
		_key = _this select 1;
		_ctrl = _this select 3;
		_alt = _this select 4;

		// Toggle HUD display ctrl-alt-e - CDSactivate.sqf
		if ((_ctrl) && (_alt) && (_key == 18) && {time > AAF_cds_lastchange}) exitwith {
			player say "readoutclick";
			AAF_cds_lastchange = time + 0.2;
			if (AAF_cds_active) then {
				AAF_cds_active = false;
				player sidechat "HUD disabled";
			} else {
				AAF_cds_active = true;
				player sidechat "HUD enabled";
			};
		};
		if (player getvariable ["AAF_cds_goggles",0] == 0) exitwith {};

		// DISABLED Switch celsius / fahrenheit ctrl-alt-f
		if ((_ctrl) && (_alt) && (_key == 33) && {time > AAF_cds_lastchange}) exitwith {
			player say "readoutclick";
			AAF_cds_lastchange = time + 0.2;
			if (AAF_cds_celsius) then {
				AAF_cds_celsius = false;
				player sidechat "Fahrenheit display";
			} else {
				AAF_cds_celsius = true;
				player sidechat "Celsius display";
			};
		};

		// DISABLED Electrochromic tinting	ctrl-alt-a
		 if ((_ctrl) && (_alt) && (_key == 30) && {time > AAF_cds_lastchange} ) exitwith {
			if (tpw_core_sunangle < 0) exitwith {player sidechat "Electrochromic tinting inactive";};
			player say "readoutclick";
			AAF_cds_lastchange = time + 0.2;
			if (AAF_cds_tint < tpw_core_sunangle + 200) then {
				AAF_cds_tint = AAF_cds_tint + 30;
				setaperture AAF_cds_tint;
			} else {
				setaperture -1;
				AAF_cds_tint = tpw_core_sunangle;
			};
			player sidechat format ["Electrochromic tinting adjust %1",AAF_cds_tint];
		};

		// HUD NV	ctrl-alt-n - CDSnv.sqf
		if ((_ctrl) && (_alt) && (_key == 49) && {time > AAF_cds_lastchange} ) exitwith {
			player say "readoutclick";
			AAF_cds_lastchange = time + 0.2;
			if (AAF_cds_nvflag) then {
				[] call AAF_cds_fnc_nvoff;
				AAF_cds_nvflag = false;
				player sidechat "Colour NV off";
			} else {
				AAF_cds_nvflag = true;
				player sidechat "Colour NV on";
				if ("NVgoggles" in  assignedItems player) then {player unassignItem "NVGoggles"};
				if ("NVGoggles_OPFOR" in  assignedItems player) then {player unassignItem "NVGoggles_OPFOR"};
				if ("NVGoggles_INDEP" in  assignedItems player) then {player unassignItem "NVGoggles_INDEP"};
			};
		};

		// HUD NV BRIGHTNESS	ctrl-alt-b - CDSnvb.sqf
		 if ((_ctrl) && (_alt) && (_key == 48) && {time > AAF_cds_lastchange} && AAF_cds_nvflag) exitwith {
			player say "readoutclick";
			AAF_cds_lastchange = time + 0.2;
			tpw_nv_fac = tpw_nv_fac + 1;
			if (tpw_nv_fac > 5) then {
				tpw_nv_fac = 0;
			};
			player sidechat format ["Colour NV gain adjust %1",tpw_nv_fac];
			player action ["nvGogglesOff", player];
			setaperture (tpw_nv_brightness select tpw_nv_fac);
			AAF_cds_nvgrain = ppEffectCreate ["filmgrain", 2050];
			AAF_cds_nvgrain ppEffectEnable true;
			AAF_cds_nvgrain ppEffectAdjust [1,1,1,0.1,0.1,false];
			AAF_cds_nvgrain ppEffectCommit 0;
			AAF_cds_nvblur = ppEffectCreate ["dynamicblur", 450];
			AAF_cds_nvblur ppEffectEnable true;
			AAF_cds_nvblur ppEffectAdjust [0.2];
			AAF_cds_nvblur ppEffectCommit 0;
			AAF_cds_nv=true;
		};

		// UNIT SCANNING	ctr-alt-u - CDSid.sqf
		 if ((_ctrl) && (_alt) && (_key == 22) && {time > AAF_cds_lastchange} ) exitwith {
			player say "readoutclick";
			AAF_cds_lastchange = time + 0.2;
			private _utype = AAF_cds_unit select 0;
			_utype = _utype + 1;
			if (_utype > 2) then {_utype = 0};
			AAF_cds_unit set [0,_utype];
			switch _utype do {
				case 0: {
					player sidechat "Unit icon display disabled";
				};
				case 1: {
					player sidechat "Simplified unit icon display enabled";
				};
				case 2: {
					player sidechat "Full unit icon display enabled";
				};
			};

			if (AAF_cds_eh) then {
				["tpw_hud", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
				AAF_cds_eh = false;
			};
			[] call AAF_cds_fnc_activate;
			[] call AAF_cds_fnc_reset;
		};

		// HUD Brightness ctrl-alt-h CDShudbright.sqf
		 if ((_ctrl) && (_alt) &&  (_key == 35) && {time > AAF_cds_lastchange}) exitwith {
			player say "readoutclick";
			AAF_cds_lastchange = time + 0.2;
			AAF_cds_alpha = AAF_cds_alpha + 0.1;
			if (AAF_cds_alpha > 1.1) then {
				AAF_cds_alpha = 0;
			};
			player sidechat format ["HUD brightness adjust %1%2",AAF_cds_alpha*100,"%"];
			// Reset HUD for good measure
			[] call AAF_cds_fnc_reset;
		};
	};
};*/

AAF_cds_fnc_displayparams = {// SET DISPLAY PARAMETERS FOR EACH HUD CONTROL
	private ["_display","_param","_ctrl","_xpos","_ypos","_diff","_size","_squadrgb","_friendlyrgb","_enemyrgb"];
	disableSerialization;
	_display = uiNamespace getVariable "AAF_cds_DISPLAY";
	for "_i" from 0 to (count AAF_cds_params - 1) do {
		_param = AAF_cds_params select _i;
		_ctrl = _display displayctrl (100001 + _i);
		_xpos = (_param select 1);
		_ypos = (_param select 2);
		// Scale
		if (_xpos < 0.5) then {
			_diff = 0.5 - _xpos;
			_xpos = 0.5 - (_diff * AAF_cds_scale);
		};
		if (_xpos > 0.5) then {
			_diff = _xpos - 0.5;
			_xpos = 0.5 + (_diff * AAF_cds_scale);
		};
		if (_ypos < 0.5) then {
			_diff = 0.5 - _ypos;
			_ypos = 0.5 - (_diff * AAF_cds_scale);
		};
		if (_ypos > 0.5) then {
			_diff = _ypos - 0.5;
			_ypos = 0.5 + (_diff * AAF_cds_scale);
		};
		// Apply offset
		_xpos = _xpos + AAF_cds_offset_x;
		_ypos = _ypos + AAF_cds_offset_y;
		// Resolution correction
		_xpos = _xpos * safezoneW + safezoneX;
		_ypos = _ypos * safezoneW + safezoneX;
		_size = (_param select 3) * AAF_cds_textscale;
		// Update control
		_ctrl ctrlsetposition [_xpos,_ypos];
		_ctrl ctrlsetscale _size;
		_ctrl ctrlcommit 0;
	};
	AAF_cds_maxiconsize = AAF_cds_unit select 1;
	AAF_cds_miniconsize = AAF_cds_unit select 2;
	AAF_cds_unittextsize = (0.03 / (getResolution select 5)) *(AAF_cds_unit select 3) * AAF_cds_textscale;
};

AAF_cds_fnc_gogglecheck = {// GOGGLES/UAV CHECK - WHO in GROUP CAN GIVE CDS INFORMATION
	private ["_tempgoggles","_ctb"];
	_tempgoggles = [];
	for "_ctb" from 0 to (count (units group player) - 1) do {//players group only
		_unit = (units group player) select _ctb;
		[_unit] call AAF_cds_fnc_goggles;//Do they have CDS?
		if (_unit getvariable ["AAF_cds_goggles",0] == 1) then {
			_tempgoggles set [count _tempgoggles,_unit];
		};
		if (!isnull getconnecteduav _unit) then {//Do they have a UAV?
			_tempgoggles set [count _tempgoggles,(driver getconnecteduav _unit)];
		};
	};
	AAF_cds_gogglewearers = _tempgoggles;
};

AAF_cds_fnc_goggles = {// GOGGLE CHECK - CAN UNIT DISPLAY CDS INFORMATION -- Adjusted to seperate CDS types
	private ["_unit"];
	_unit = _this select 0;
	_items = str assignedItems player;
	if (AAF_cds_active && ((goggles _unit) in AAF_cds_goggletypes) && ("ItemCDS" in _items) ) then {
		_unit setvariable ["AAF_cds_goggles",1];
		Switch (goggles _unit) do {
			case "G_Aviator" : { //pilot
				_unit setvariable ["AAF_cds_markerview",1];
				_unit setvariable ["AAF_cds_unitview",0];
			};
			case "ADFU_f_face_shield_tactical_shemagh_cap_noble" : {
				_unit setvariable ["AAF_cds_markerview",1];
				_unit setvariable ["AAF_cds_unitview",1];
			};
			case "G_Goggles_VR" : { //Command
				_unit setvariable ["AAF_cds_markerview",1];
				_unit setvariable ["AAF_cds_unitview",1];
			};
			default { //safty-net
				_unit setvariable ["AAF_cds_markerview",0];
				_unit setvariable ["AAF_cds_unitview",0];
			};
		};
	} else {
		_unit setvariable ["AAF_cds_goggles",0];
	}
};

AAF_cds_fnc_grd = {// GPS POS
	private ["_grd"];
	_grd = mapGridPosition (position player);
	_ctrl_grd ctrlsetstructuredtext parsetext format [AAF_cds_grd_txt,_grd];
};

/*AAF_cds_fnc_hlt = {// HEALTH - REMOVE - ACE BPM ?
	private ["_hlt","_bpm","_ft","_dm","_factor","_col"];
	if (damage player > 0 || getfatigue player > 0) then
	{
		_hlt = round (100 * (1 - damage player));
		_ft = (getfatigue player); // fatigue
		_dm = (damage player) ^ 2; // damage squared
		_factor = (1 + (3 * _ft) * (1 + _dm)); // heartrate factor
		if (_factor > 3) then {
			_factor = 3;
		};
		_bpm = floor (AAF_cds_restingheartrate * _factor);
	} else {
		_bpm = AAF_cds_restingheartrate;
		_hlt = 100;
	};
	if (isbleeding player) then {
		_col = [1,0,0,AAF_cds_alpha];
		_col = _col call BIS_fnc_colorRGBAtoHTML;
	} else {
		_col = AAF_cds_colour + [AAF_cds_alpha];
		_col = _col call BIS_fnc_colorRGBAtoHTML;
	};

	_ctrl_hlt ctrlsetstructuredtext parsetext format [AAF_cds_hlt_txt,_bpm,_hlt,_col];
};*/

AAF_cds_fnc_lmt = {// TIME
	private ["_h","_m"];
	_h = date select 3;
	_m = date select 4;
	if (_h < 10) then {
		_h = format ["0%1",_h];
	};
	if (_m < 10) then {
		_m = format ["0%1",_m];
	};
	_ctrl_lmt ctrlsetstructuredtext parsetext format [AAF_cds_lmt_txt,_h,_m];
};

AAF_cds_fnc_longloop = {// LONG HUD UPDATE LOOP
	private ["_display","_ctrl_asl","_ctrl_azt","_ctrl_grd","_ctrl_lmt","_ctrl_tmp","_ctrl_hlt","_ctrl_rng","_ctrl_vel"];
	disableSerialization;
	_display = uiNamespace getVariable "AAF_cds_DISPLAY";
	_ctrl_asl = _display displayCtrl 100001;
	_ctrl_azt = _display displayCtrl 100002;
	_ctrl_grd = _display displayCtrl 100003;
	_ctrl_lmt = _display displayCtrl 100004;
	_ctrl_ctr = _display displayCtrl 100005;
	_ctrl_tmp = _display displayCtrl 100006;
	_ctrl_hlt = _display displayCtrl 100007;
	_ctrl_rng = _display displayCtrl 100008;
	_ctrl_vel = _display displayCtrl 100009;

	while {true} do {
		if (AAF_cds_fncactive) then {
			// Update display data
			{
				[] call _x;
			} foreach AAF_cds_longfunc;
		};
		sleep 2.533;
	};
};

AAF_cds_fnc_mapmarkers = {// CHECK FOR PLAYER ADDED MAP MARKERS
	private ["_marker","_markers_temp","_ctd"];
	_markers_temp = [];
	{ _marker = _x;
		if ((!isnil "_marker") && {["!!",markerText _marker] call bis_fnc_instring}) then {
			_markers_temp set [count _markers_temp,_marker];
		};
	} foreach allmapmarkers;
	AAF_cds_markers = _markers_temp;
};

AAF_cds_fnc_markerscan = {// GET MAP MARKER INFO FOR DISPLAY
	private ["_pos","_dist","_scale","_text","_marker","_markerarray_temp","_cte","_colour"];
	_markerarray_temp = [];
	for "_cte" from 0 to (count AAF_cds_markers - 1) do {
		_marker = AAF_cds_markers select _cte;
		if (!isnil "_marker") then {
			_pos = getmarkerpos _marker;
			_dist = format ["%1m",round (player distance _pos)];
			_scale = 1.5;//AAF_cds_maxiconsize - (round (player distance _pos) / 200);//Marker Icon Size
			_text = [markerText _marker, "!!", ""] call CBA_fnc_replace;
			_type = getmarkertype _marker;
			if (_text != "") then {
				_dist = _text + " " + _dist;
			};
			if (_scale < (AAF_cds_miniconsize)) then {//REMOVE as set value makes defunct?
				_scale = AAF_cds_miniconsize;
			};
			if (player distance _pos > AAF_cds_minrange) then {
				_markerarray_temp set [count _markerarray_temp,[_pos,_dist,_scale,_type]];
			};
		};
	};
	AAF_cds_markerarray = _markerarray_temp;
};

AAF_cds_fnc_reset = {// HUD RESET
	("AAF_cds_Layer" call BIS_fnc_rscLayer) cuttext ["","PLAIN",0,false];
	("AAF_cds_Layer" call BIS_fnc_rscLayer) cutRsc ["AAF_cds_DIALOG","PLAIN",0,false];
	if (!isnil "AAF_cds_handle1") then {
		terminate AAF_cds_handle1;
	};
	if (!isnil "AAF_cds_handle2") then {
		terminate AAF_cds_handle2;
	};
	[] call AAF_cds_fnc_displayparams;
	AAF_cds_handle1 = [] spawn AAF_cds_fnc_shortloop;
	AAF_cds_handle2 = [] spawn AAF_cds_fnc_longloop;
};

AAF_cds_fnc_shortloop = {// SHORT HUD UPDATE LOOP
	private ["_display","_ctrl_asl","_ctrl_azt","_ctrl_grd","_ctrl_lmt","_ctrl_tmp","_ctrl_hlt","_ctrl_rng","_ctrl_vel"];

	// GET DISPLAY AND CONTROLS
	disableSerialization;
	_display = uiNamespace getVariable "AAF_cds_DISPLAY";
	_ctrl_asl = _display displayCtrl 100001;
	_ctrl_azt = _display displayCtrl 100002;
	_ctrl_grd = _display displayCtrl 100003;
	_ctrl_lmt = _display displayCtrl 100004;
	_ctrl_ctr = _display displayCtrl 100005;
	_ctrl_tmp = _display displayCtrl 100006;
	_ctrl_hlt = _display displayCtrl 100007;
	_ctrl_rng = _display displayCtrl 100008;
	_ctrl_vel = _display displayCtrl 100009;

	while {true} do {
		[player] call AAF_cds_fnc_goggles;// Player goggle check
		// Only show/update HUD if player wearing tactical goggles and permitted to in external view
		if (player getvariable ["AAF_cds_goggles",0] == 1) then {
			AAF_cds_fncactive = true;
			{// Show HUD
				_x ctrlshow true;
				_x ctrlsettextcolor (AAF_cds_colour + [AAF_cds_alpha]);
			} foreach [_ctrl_asl,_ctrl_azt,_ctrl_grd,_ctrl_lmt,_ctrl_ctr,_ctrl_tmp,_ctrl_hlt,_ctrl_rng,_ctrl_vel];
			{// Update display data
				[] call _x;
			} foreach AAF_cds_shortfunc;
		} else {
			if (AAF_cds_fncactive) then {
				AAF_cds_fncactive = false;
				if (AAF_cds_nv) then {// NV off -- REMOVE
					ppEffectDestroy AAF_cds_nvgrain;
					ppEffectDestroy AAF_cds_nvblur;
					titleCut ["", "BLACK IN", 4];
					setaperture -1;
					AAF_cds_nv=false;
				};
				if (AAF_cds_tint > tpw_core_sunangle) then {// Tint off
					setaperture -1;
					AAF_cds_tint = tpw_core_sunangle;
				};
				{// Hide HUD
					_x ctrlshow false;
				} foreach [_ctrl_asl,_ctrl_azt,_ctrl_grd,_ctrl_lmt,_ctrl_ctr,_ctrl_tmp,_ctrl_hlt,_ctrl_rng,_ctrl_vel];
				if (AAF_cds_eh) then {// Disable unit display - remove PFEH
					["tpw_hud", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
					AAF_cds_eh = false;
				};
			};
		};
		sleep 0.5333;
	};
};

AAF_cds_fnc_tmp = {// TEMPERATURE
	private ["_airtmp"];
	/*_tmp = round tpw_fog_temp;
	if (!AAF_cds_celsius) then {
		_tmp = round(_tmp * 9 / 5 + 32);
	};*/
	/////NEW CODE
	_airTemp = ambientTemperature select 0; //New Bis Function
	_ctrl_tmp ctrlsetstructuredtext parsetext format [AAF_cds_tmp_txt,_airtmp];
};

AAF_cds_fnc_unitscan = {// SCAN FOR INFANTRY AND OCCUPIED STATICS, DETERMINE THEIR COLOUR AND ICON
	private ["_sa","_sb","_sc","_sd","_fr"];
	private _nearunits = (player nearentities [["camanbase"],AAF_cds_maxrange]) select {!(isobjecthidden _x)};
	//Add static weapon scanning
	private _nearstatic = (player nearentities [["staticWeapon"],AAF_cds_maxrange]) select {!(isobjecthidden _x)};
	_nearunits = _nearunits + _nearstatic;//combine
	if (cameraView == "gunner") then {
		private _farunits = ((player nearentities [["camanbase"],AAF_cds_maxrange * 3]) select {!(isobjecthidden _x)}) - _nearunits;
		private _farstatic = ((player nearentities [["staticWeapon"],AAF_cds_maxrange * 3]) select {!(isobjecthidden _x)}) - _nearstatic;
		_nearunits = _nearunits + _nearstatic;//combine
		private _min = ([0,0,0] getdir getCameraViewDirection player) - 2;
		private _max = _min + 4;
		for "_sa" from 0 to (count _farunits - 1) do {
			private _unit = _farunits select _sa;
			private _ang  = [player,_unit] call bis_fnc_dirto;
			if ((_ang > _min) and (_ang < _max)) then {
				if (_unit getvariable["AAF_cds_fartime",0] < time) then {
					AAF_cds_farunits pushback _unit;
				};
				_unit setvariable["AAF_cds_fartime", time + 30]	;
			};
		};
	};
	// Screen old distant stuff out
	AAF_cds_farunits = AAF_cds_farunits select {_x getvariable "AAF_cds_fartime" > time};
	// Combine near and far
	_nearunits = _nearunits + AAF_cds_farunits;
	//Colour and Icon set
	//New Type
	{
		//ICON SET
		if (_x isKindOf "camanbase") then {
			_x setvariable ["AAF_cds_visicon", AAF_cds_uniticon];
		} else {
			_x setvariable ["AAF_cds_visicon", AAF_cds_staticicon];
		};
		//Combat Mode Colour Set
		private _cb = combatBehaviour _x;
		switch _cb do {
			case "AWARE" : { _x setvariable ["AAF_cds_unitrgb",AAF_cds_ColourYellow];
				//systemchat "Aware";
			};
			case "COMBAT" : { _x setvariable ["AAF_cds_unitrgb",AAF_cds_ColourRed];
				//systemchat "Combat";
			};
			default { _x setvariable ["AAF_cds_unitrgb",AAF_cds_ColourWhite];
				//systemchat "Default";
			};
		};
		if ( (group player) == (group _x) ) then {
			_x setvariable ["AAF_cds_unitrgb",AAF_cds_ColourBlue];
		};
	} foreach _nearunits;
	//////////////////////////////////////////////////////////////////////////////////////////////////
	/*{	_fr = side player getfriend side _x;
		if ( _fr < 0.6 ) then {
			_x setvariable ["AAF_cds_unitrgb",AAF_cds_ColourEast];//Hostile
			//_x setvariable ["AAF_cds_visicon", AAF_cds_uniticon];
			if (_x isKindOf "camanbase") then {
				_x setvariable ["AAF_cds_visicon", AAF_cds_uniticon];
			} else {
				_x setvariable ["AAF_cds_visicon", AAF_cds_staticicon];
			};//man vs static
		} else {
			_x setvariable ["AAF_cds_unitrgb",AAF_cds_ColourGuer];//Friendly
			//_x setvariable ["AAF_cds_visicon", AAF_cds_uniticon];
			if (_x isKindOf "camanbase") then {
				_x setvariable ["AAF_cds_visicon", AAF_cds_uniticon];
			} else {
				_x setvariable ["AAF_cds_visicon", AAF_cds_staticicon];
			};
		};
		//Player Group Catch
		if ( (group player) == (group _x) ) then {
			_x setvariable ["AAF_cds_unitrgb",AAF_cds_ColourWest];//Group
			//_x setvariable ["AAF_cds_visicon", AAF_cds_groupicon];
			if (_x isKindOf "camanbase") then {
				_x setvariable ["AAF_cds_visicon", AAF_cds_uniticon];
			} else {
				_x setvariable ["AAF_cds_visicon", AAF_cds_staticicon];
			};
		};
	} foreach _nearunits;*/
	//////////////////////////////////////////////////////////////////////////////////////////////////
	AAF_cds_nearunits = _nearunits;
	//systemchat str AAF_cds_nearunits;//DEBUG - VALID
};

AAF_cds_fnc_unitprepare = {// PREPARE UNITS INFORMATION FOR DISPLAY
	private ["_cth","_cti","_height"];
	// Temp arrays for display
	private _visible_temp = [];
	private _hidden_temp = [];
	private _unsure_temp = [];
	// Assign units to visible/hidden/unsure array
	for "_cth" from 0 to (count AAF_cds_nearunits - 1) do {
		private _unit = AAF_cds_nearunits select _cth;//pick unit in range
		//private _upos = _unit modelToWorldVisual [0,0,0];//set units position
		private _upos = _unit modelToWorldVisualWorld/*modeltoworldVisual*/ (_unit selectionPosition "pilot");//Units face ASL
		if (!isnil "_unit" && {!isnull _unit}) then {
			private _status = "hidden";//unit Hidden until verified as revealed
			////////////////////////////////////////////////////////////////////////////////////////////////
			//Set Icon scale
			private _iscale = linearConversion [AAF_cds_minrange, AAF_cds_maxrange, (player distance _unit), AAF_cds_maxiconsize, AAF_cds_miniconsize, true];
			//Set Icon Height
			//private _iheight = linearConversion [AAF_cds_minrange, AAF_cds_maxrange, (player distance _unit), AAF_cds_maxiheight, AAF_cds_miniheight, true];
			_unit setvariable ["AAF_cds_scale",_iscale];
			//_unit setvariable ["AAF_cds_scale",_iheight];
			////////////////////////////////////////////////////////////////////////////////////////////////
			// Is unit visible to anyone in group wearing tac goggles?
			for "_cti" from 0 to (count AAF_cds_gogglewearers - 1) do {
				private _squadmem = AAF_cds_gogglewearers select _cti;
				private _colour = _unit getvariable ["AAF_cds_unitrgb",[0,0,0]];
				//New and improved?
				if ( player knowsAbout _unit > 0.5 ) exitwith {
					//How long ago was unit last seen by the gogglewearer
					private _tknow = player targetKnowledge _unit;
					private _ttime = (_tknow select 2) + 30;
					if ( _ttime <= time ) exitwith {
						status = "hidden";
						_hidden_temp set [count _hidden_temp, _unit];	//move to hidden units array
					};
					//else Unit Visiable to gogglewearer
					_status = "visible";
					_visible_temp set [count _visible_temp, _unit]; //move to visible units array
					_unit setvariable ["AAF_cds_unitcolour",(_colour + [AAF_cds_alpha])];
					//Distant units that were identified with optics hidden if not using optics
					if (_unit distance player > AAF_cds_maxrange && cameraview != "GUNNER") then {
						_status= "hidden";
						_hidden_temp set [count _hidden_temp, _unit];	// move to hidden units array
					};
				};
			};
		};
	};
	AAF_cds_visible = _visible_temp;
	AAF_cds_hidden = _hidden_temp;
};

AAF_cds_fnc_units = {// UNIT DISPLAY FUNCTION - Draw icons
	for "_ctj" from 0 to (count AAF_cds_markerarray - 1) do {//Show map markers
		if (player getvariable ["AAF_cds_markerview",0] == 0) exitwith {};
		_marker = AAF_cds_markerarray select _ctj;
		_ipos = _marker select 0;
		_dist = _marker select 1;
		_scale = _marker select 2;
		_type = _marker select 3;
		_colour = _marker select 4;
		switch (_type) do {
			case "bloc": {drawIcon3D [CDS_icon_bloc,(AAF_cds_ColourGreen + [AAF_cds_alpha]),_ipos,_scale,_scale,0,_dist,2,AAF_cds_unittextsize,"PuristaSemiBold","Center"];};
			case "eloc": {drawIcon3D [CDS_icon_eloc,(AAF_cds_ColourRed + [AAF_cds_alpha]),_ipos,_scale,_scale,0,_dist,2,AAF_cds_unittextsize,"PuristaSemiBold","Center"];};
			case "floc": {drawIcon3D [CDS_icon_floc,(AAF_cds_ColourBlue + [AAF_cds_alpha]),_ipos,_scale,_scale,0,_dist,2,AAF_cds_unittextsize,"PuristaSemiBold","Center"];};
			case "hloc": {drawIcon3D [CDS_icon_hloc,(AAF_cds_ColourOrange + [AAF_cds_alpha]),_ipos,_scale,_scale,0,_dist,2,AAF_cds_unittextsize,"PuristaSemiBold","Center"];};
			case "lzloc": {drawIcon3D [CDS_icon_lzloc,(AAF_cds_ColourGreen + [AAF_cds_alpha]),_ipos,_scale,_scale,0,_dist,2,AAF_cds_unittextsize,"PuristaSemiBold","Center"];};
			case "poiloc": {drawIcon3D [CDS_icon_poiloc,(AAF_cds_ColourCiv + [AAF_cds_alpha]),_ipos,_scale,_scale,0,_dist,2,AAF_cds_unittextsize,"PuristaSemiBold","Center"];};
			case "wploc": {drawIcon3D [CDS_icon_wploc,(AAF_cds_ColourYellow + [AAF_cds_alpha]),_ipos,_scale,_scale,0,_dist,2,AAF_cds_unittextsize,"PuristaSemiBold","Center"];};
			default {};
		};
	};
	for "_ctj" from 0 to (count AAF_cds_visible - 1) do {//Show spotted Units
		if (player getvariable ["AAF_cds_unitview",0] == 0) exitwith {};
		_unit = AAF_cds_visible select _ctj;
		if (!isnil "_unit" && {!isnull _unit}) then {
			_pos = _unit modelToWorldVisual ((_unit selectionPosition "pilot") vectorAdd [0,0,0.75]);//looks good !
			_xpos = _pos select 0;
			_ypos = _pos select 1;
			_zpos =(_pos select 2); //+ (_unit getvariable "AAF_cds_height");
			// Draw Unit icon
			drawIcon3D [
				(_unit getvariable ["AAF_cds_visicon",""]),
				(_unit getvariable ["AAF_cds_unitcolour",[0,0,0,0]]),
				[_xpos,_ypos,_zpos],
				//_pos,
				(_unit getvariable ["AAF_cds_scale",0]),
				(_unit getvariable ["AAF_cds_scale",0]),
				0,
				"",//(_unit getvariable ["AAF_cds_distance",""]),//text
				2,
				AAF_cds_unittextsize,
				"PuristaSemiBold",
				"center",
				false,
				0,
				0
			];
		};
	};
};

AAF_cds_fnc_unitshow = {// SHOW SCANNED UNITS ON HUD EH CREATOR
	private ["_ctj","_ipos","_pos","_dist","_scale","_xpos","_ypos","_zpos","_marker","_unit"/*,"_predpos"*/];
	if (AAF_cds_eh) exitwith {};
	// Start PFEH
	AAF_cds_eh = true;
	/*if ((AAF_cds_unit select 0) == 1) then { //SIMPLE DISPLAY -- REMOVE
		["tpw_hud","oneachframe",{[] call AAF_cds_fnc_units_simple}] call BIS_fnc_addStackedEventHandler;
	};*/
	if ((AAF_cds_unit select 0) == 2) then {//FULL DISPLAY
		["tpw_hud","oneachframe",{[] call AAF_cds_fnc_units}] call BIS_fnc_addStackedEventHandler;
	};
};

onteamswitch {// TEAM SWITCH -- REMOVE?
	[] call AAF_cds_fnc_reset;
};

// RUN IT
sleep 1;
[] call AAF_cds_fnc_activate;
[] call AAF_fnc_CDShudbright;/*AAF_cds_fnc_brightness;*///EXTERNAL
[] call AAF_cds_fnc_reset;
setaperture -1;
while {true} do {// LOOP TO ENSURE SCRIPT DOESN'T TERMINATE. PERIODICALLY RESET HUD.
	[] call AAF_cds_fnc_reset;
	sleep 59.87;
};
