//Inline, do not include script_component.hpp

[QGVAR(player_killed), {
    params ["_unit"];
    _uid = getPlayerUID _unit;
    ["KILLED", _uid, player] call ALIVE_fnc_createProfilesFromPlayers;
}] call CBA_fnc_addEventHandler;

[QGVAR(player_respawn), {
    params ["_unit"];
    _uid = getPlayerUID player;
    ["RESPAWN", _uid, player] call ALIVE_fnc_createProfilesFromPlayers;
}] call CBA_fnc_addEventHandler;

if(hasInterface && local player) then {
    diag_log format["ALiVE Profile System - sys_profile - Can Suspend in PostInit: %1", canSuspend];
    waituntil {!isnil QMOD(PROFILE)};

    player addEventHandler ["killed", {
        [] spawn {
            //_uid = getPlayerUID player;
            //["server","PS",[["KILLED",_uid,player],{call ALIVE_fnc_createProfilesFromPlayers}]] call ALiVE_fnc_BUS;
            [QGVAR(player_killed), [player]] call CBA_fnc_serverEvent;
        };
    }];
    player addEventHandler ["respawn", {
        []spawn {
            // wait for player
            waitUntil {sleep 0.3; alive player};
            waitUntil {sleep 0.3; (getPlayerUID player) != ""};

            /*_uid = getPlayerUID player;
            ["server","PS",[["RESPAWN",_uid,player],{call ALIVE_fnc_createProfilesFromPlayers}]] call ALiVE_fnc_BUS;
            */
            [QGVAR(player_respawn), [player]] call CBA_fnc_serverEvent;
        };
    }];
};
