/*
* Author: Dildo Sagbag,
*
* Description:
* Creates fire and smoke around a center position. Used in Psychopomp Campaign for setting light around vegetation.
*
* Arguments:
* 0: Center position of the fire <ARRAY>
* 1: Timeout until the fire dies, default 25 seconds <NUMBER>
* 2: Radius of fire, default 150m <NUMBER>
* 3: Life time of individual fire particles, default 5 seconds <NUMBER>
*
* Examples:
* [[100,100]] call SESO_fnc_areaOfFire
* [[5,28], 65] call SESO_fnc_areaOfFire
* [[20,60,100], 25,500] call SESO_fnc_areaOfFire
*
* Public: Yes
*/

params ["_centerPos",["_timeout",25],["_effectSize",150],["_particleLifeTime",5]];

// Fire
private _ps1 = "#particlesource" createVehicle _centerPos;
//_ps1 setParticleParams [
//	["\A3\Data_F\ParticleEffects\Universal\Universal", 16, 10, 32], "", "Billboard",
//	1, _particleLifeTime/2, [0, 0, 0], [0, 0, 0.5], 0, 1, 1, 3, [0.5,1.5],
//	[[1,1,1,0.4], [1,1,1,0.2], [1,1,1,0]],
//	[0.25,1], 1, 1, "", "", _ps1];
_ps1 setParticleClass "BigDestructionFire";
_ps1 setParticleRandom [_particleLifeTime/4, [_effectSize,_effectSize,0], [0.05,0.05,0], 0.4, 0, [0,0,0,0], 0, 0, 0.2];
//_ps1 setParticleFire [1, _effectSize, 1];
_ps1 setDropInterval 0.05;

// Smoke
private _ps2 = "#particlesource" createVehicle _centerPos;
//_ps2 setParticleParams [
//	["\A3\Data_F\ParticleEffects\Universal\Universal", 16, 7, 1, 1], "", "Billboard",
//	1, _particleLifeTime, [0, 0, 1], [0, 0, 1.5], 0, 1, 1, 0.5, [1.75,2,3,4.5], // timerPeriod → size
//	[[1,1,1,0], [1,1,1,0.5], [1,1,1,0.4], [1,1,1,0.2], [1,1,1,0]],
//	[0.5,0.5], 0, 0, "", "", _ps2];
_ps2 setParticleClass "BigDestructionSmoke";
_ps2 setParticleRandom [_particleLifeTime/2, [_effectSize,_effectSize,0], [0.2,0.2,0], 0.4, 0, [0,0,0,0], 0, 0, 0.2];
_ps2 setDropInterval 0.1;


//--- timeout
[_ps1,_ps2,_timeout] spawn {
	scriptName "fn_setFire_timeout_loop";
	params ["_ps1","_ps2","_timeout"];
	
	sleep _timeout;
	deleteVehicle (_ps1);
	deleteVehicle (_ps2);
};