class zen_context_menu_actions
{ // Zen Actions
	// https://zen-mod.github.io/ZEN/#/frameworks/context_menu?id=adding-actions-through-config
	class AAF_Functions
	{
		displayName = "AAF Functions";
		class dynsim_on
		{
			displayName = "Dynamic ON";
			statement = "_hoveredEntity enableDynamicSimulation true;";
			// condition = //group select only, dynSim off only
		};
		class dynsim_off
		{
			displayName = "Dynamic OFF";
			statement = "_hoveredEntity enableDynamicSimulation false;";
			// condition = // group select only, DynaSim on only
		};
		class sim_on
		{
			displayName = "Simulation ON";
			statement = "_hoveredEntity enableSimulationGlobal true;";
			// condition = // group/object select, Simulation off only
		};
		class sim_off
		{
			displayName = "Simulation OFF";
			statement = "_hoveredEntity enableSimulationGlobal false;";
			// condition = // group/object select, Simulatyion on only
		};
		class hidezeus
		{
			displayName = "Hide Zeus";
			statement = "[LOGIC] call zen_modules_fnc_moduleHideZeus";
		};
		class aiSkills
		{
			displayName = "AI Skill Level";
			class aiCivilian
			{
				displayName = "Civilian";
				statement = QUOTE([ARR_2(_objects, _args)] call FUNC(aiSkills));
				condition = "_groups findIf {units _x findIf {!isPlayer _x} != -1} != -1";
				args = 0.00;
			};
			class aiInsurgents
			{
				displayName = "Insurgents";
				statement = QUOTE([ARR_2(_objects, _args)] call FUNC(aiSkillS));
				condition = "_groups findIf {units _x findIf {!isPlayer _x} != -1} != -1";
				args = 0.25;
			};
			class aiRegular
			{
				displayName = "Regular";
				statement = QUOTE([ARR_2(_objects, _args)] call FUNC(aiSkills));
				condition = "_groups findIf {units _x findIf {!isPlayer _x} != -1} != -1";
				args = 0.50;
			};
			class aiProfessional
			{
				displayName = "Professional";
				statement = QUOTE([ARR_2(_objects, _args)] call FUNC(aiSkills));
				condition = "_groups findIf {units _x findIf {!isPlayer _x} != -1} != -1";
				args = 0.75;
			};
			class aiSpecialForces
			{
				displayName = "Special Forces";
				statement = QUOTE([ARR_2(_objects, _args)] call FUNC(aiSkills));
				condition = "_groups findIf {units _x findIf {!isPlayer _x} != -1} != -1";
				args = 1.00;
			};
		};
	};
};