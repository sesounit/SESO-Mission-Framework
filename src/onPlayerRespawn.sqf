player enableStamina false;
[player, [missionNamespace, "inventory_var"]] call BIS_fnc_loadInventory;


0 enableChannel true;

//[] call SESO_fnc_immersiveSpawn;

waitUntil {cba_missiontime > 0};

[] call SESO_fnc_replaceBadFace;
