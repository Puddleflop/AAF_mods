#include "script_component.hpp"

class CfgPatches
{
	class ADDON
	{
		name = COMPONENT_NAME;
		author = "AAF";
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"ace_interaction", "ace_zeus", "cba_main", "zen_context_menu"};
		units[] = {};
		weapons[] = {};
	};
};

#include "CfgEventHandlers.hpp"
#include "CfgSurfaces.hpp" //AI prove fix
#include "CfgAIskill.hpp"  //AI Skill levels
#include "CfgZenActions.hpp" //AI Context Menu Actions