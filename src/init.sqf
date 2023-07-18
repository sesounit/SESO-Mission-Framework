// War Crime Detector
[] call SESO_fnc_detectWarCrime;

waitUntil {cba_missiontime > 0};

// Setup Timer
[1500] call SESO_fnc_setupTimer;