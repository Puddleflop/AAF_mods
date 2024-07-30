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
		init = QUOTE(call FUNC(PreInit););
	};
};

class Extended_PostInit_EventHandlers {
	class ADDON {
		init = QUOTE(call COMPILE_SCRIPT(XEH_postInit));
	};
	class AAF_PostInit {
		init = QUOTE(call FUNC(PostInit););
	};
};
