class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_postInit));
    };
};
/*
class Extended_Init_EventHandlers {
    class CAManBase {
        class ADDON {
            init = QUOTE(call COMPILE_FILE(XEH_init));
        };
    };
};

class Extended_Respawn_EventHandlers {
    class CAManBase {
        class ADDON {
            respawn = QUOTE(call COMPILE_FILE(XEH_respawn));
        };
    };
};

class Extended_Killed_EventHandlers {
    class CAManBase {
        class ADDON {
            killed = QUOTE(call FUNC(handleKilled));
        };
    };
};
*/
