#include "script_component.hpp"

class Extended_PreStart_EventHandlers {
	class ADDON {
		init = QUOTE(call COMPILE_SCRIPT(XEH_preStart));
	};
};

class Extended_PreInit_EventHandlers {
	class ADDON {
		init = QUOTE(call COMPILE_SCRIPT(XEH_preInit));
	};
	class AAF_PreInit {
		clientinit = QUOTE(call FUNC(ClientPreInit););
	};
};

class Extended_PostInit_EventHandlers {
	class ADDON {
		init = QUOTE(call COMPILE_SCRIPT(XEH_postInit));
	};
	class AAF_PostInit {
		serverinit = QUOTE(call FUNC(ServerPostInit););
		clientinit = QUOTE(call FUNC(ClientPostInit););
	};
};
