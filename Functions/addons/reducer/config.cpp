#include "script_component.hpp"

class CfgPatches
{
	class ADDON
	{
		name = COMPONENT_NAME;
		author = "AAF";
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"ace_interaction", "ace_zeus", "cba_main"};
		units[] = {};
		weapons[] = {};
	};
};

#include "CfgEventHandlers.hpp"