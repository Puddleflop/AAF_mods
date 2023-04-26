//"RegisterGroup"
//The reason being holy shit dynamic groups is slow as fuck. Turns out I don't need to register/unregister groups as long as I control before hand that they are definitely registered.
		private _insignia = param [0,"BI",[""]];
		private _useGroup = param [1,true,[true]];
		private _group	= group player;
		private _name = groupid _group;
		private _leader = player;


			// Flag as registered
			_group setVariable ["BIS_dg_reg", true, true];

			// Set the creator of this group
			_group setVariable ["BIS_dg_cre", _leader, true];

			// Set insignia
			_group setVariable ["BIS_dg_ins", _insignia, true];

			// Set lock status, unlocked by default
			_group setVariable ["BIS_dg_pri", false, true];

			// Set unique var
			_group setVariable ["BIS_dg_var", format ["%1_%2_%3", _name, getPlayerUID _leader, time], true];

			// Set the default name of the group
			_group setGroupIdGlobal [_name];
			
			_group setvariable ["aaf_var_useGroup",_useGroup,true];


			// Set insignia for all members of the group
			//Tommo - get the remote exec for personal insignia for group members.
			{
				if (isplayer _x) then {
					[] remoteExec ["aaf_fnc_setPersonalSig",_x,false];
				} else {
					[_x, _insignia] call BIS_fnc_setUnitInsignia;
				};
			} foreach (units _group);
			

