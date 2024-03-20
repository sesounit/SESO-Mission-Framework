params ["_arty", ["_rounds",3]];

_arty setVehicleAmmo 1;
private _amount = _arty ammo (currentWeapon _arty);
private _ammo = (getArtilleryAmmo [_arty] select 0);


private _eta = -1;

openMap true;

addMissionEventHandler ["MapSingleClick", {
	params ["_units", "_pos", "_alt", "_shift"];
	openMap false;
		[_thisArgs select 0,_thisArgs select 1,_thisArgs select 2,_pos] spawn {
			params ["_arty","_ammo","_rounds","_pos"];
			sleep 5;
			private _eta = floor (_arty getArtilleryETA [_pos, _ammo]);
			systemChat (format ["Fire Target - ETA %1 s", _eta]);

			private _smokePos = [_pos select 0, _pos select 1, ((_pos select 2) + 100)];
			private _redSmoke = createVehicle ["SmokeShellRed", _smokePos, [], 10, "NONE"];

			{
				_x commandArtilleryFire [_pos, _ammo, _rounds];
			}forEach (units (group _arty));
		};
}, [_arty,_ammo,_rounds]];