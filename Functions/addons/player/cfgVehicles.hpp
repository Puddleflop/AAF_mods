#include "script_component.hpp"

class CfgVehicles {//ACE Self-Interaction Actions
	class Man;
	class CAManBase: Man {
		class ACE_SelfActions {
			class AAF_Actions {
				displayName = "AAF Actions";
				condition = "true";
				exceptions[] = {};
				icon = QPATHTOF(ui\AAF_icon.paa);
				class aaf_afk {
					displayName = "AFK";
					condition = "true";
					exceptions[] = {};
					statement = QUOTE([] call FUNC(afk));
					icon = "\a3\ui_f\data\igui\cfg\simpletasks\types\Use_ca.paa";
				};
				class aaf_stuck {
					displayName = "I'm stuck in a rock!";
					condition = "true";
					exceptions[] = {};
					statement = QUOTE([] call FUNC(moveToSafePosition));
					icon = "\a3\ui_f\data\map\mapcontrol\Rock_CA.paa";
				};
				class aaf_SHBF {
					displayName = "Super Head Bug Fix™";
					condition = "true";
					exceptions[] = {};
					statement = QUOTE([] spawn FUNC(superHeadbugFix));
					icon = "\a3\Ui_F_Curator\Data\CfgMarkers\kia_ca.paa";
				};
			};
		};
	};
	//class Module_F;
	class ModuleEmpty_F;
	class ACE_Module;
	class Logic;
	class Module_F: Logic {
		class EventHandlers;
	};
};
