player enableStamina false;
[player, [missionNamespace, "inventory_var"]] call BIS_fnc_loadInventory;

//[] call SESO_fnc_immersiveSpawn;

waitUntil {time > 0};
//[] call SESO_fnc_dressPlayer;