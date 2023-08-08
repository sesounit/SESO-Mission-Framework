//if (isServer) then {
//    [] spawn compileScript ["src\init_server.sqf"];
//};

//[] spawn compileScript ["src\init_common.sqf"];

if (!isDedicated && hasInterface) then {
    [] spawn compileScript ["src\init_player.sqf"];
};

//if (!isDedicated && !hasInterface) then {
//    [] call compileScript ["src\init_headless.sqf"];
//};