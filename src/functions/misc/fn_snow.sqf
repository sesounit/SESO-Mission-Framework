/*
===================================================================
	File: fn_init.sqf
	Author: Asaayu
	Description: Loads all this stuff needed for the
===================================================================
*/
diag_log "IMW - Waiting for player to be loaded";
diag_log "IMW - Starting immersed weather init";
iwm_allowBreathing = true;
iwm_allowCoughing = true;
iwm_allowSnow = true;
iwm_allowBlizzard = true;
iwm_coughing = false;

imw_restartBreathingScript = {
  while {alive player && !(eyePos player select 2 < 0) && !((speed player) > 25) && diag_fps > 35} do {
    if (iwm_allowBreathing && (vehicle player) isEqualTo player) then {
      if ((getFatigue player) > 0.75 || (getDammage player) > 0.75) then {
        sleep 1 + random 1;
        }else{
        sleep ((5 - (3 * (1 - (getFatigue player)))) + random 2);
        };
      if !(iwm_coughing) then {
            if (cameraView isEqualTo "INTERNAL") then {playSound "IMW_SB_I"}else{player say3D "IMW_SB_E"};
            _breath = "#particlesource" createVehicleLocal (getpos player);
            _breath setParticleParams [["A3\Data_F\ParticleEffects\Universal\Universal", 16, 12, 13,0],"","Billboard",0.5,0.5,[0,0,0],[0, 0.1, -0.1],1, 1.275, 1, 0.2,[0, 0.075,0],[[1,1,1, 0.1], [1,1,1, 0.01], [1,1,1, 0]],[1000],1,0,"","",_breath];
            if ((getFatigue player) > 0.75) then {
                _breath setParticleRandom [4, [0, 0, 0], [0.04, 0.04, 0.04], 0, 0.5, [0, 0, 0, 0.1], 0, 0, 10];
              }else{
                _breath setParticleRandom [2.5, [0, 0, 0], [0.04, 0.04, 0.04], 0, 0.5, [0, 0, 0, 0.1], 0, 0, 10];
              };
            _breath setDropInterval 0.0075;
            _breath attachto [player,[0,0.12,-0.03], "neck"];
            player setRandomLip true;
            if ((speed player) > 5 || (getDammage player) > 0.75) then {
                sleep 0.25;
              }else{
                sleep 0.5;
              };
            player setRandomLip false;
            deletevehicle _breath;
      };
    };
  };
};

//Edited Killzone Kid's inHouse function that not only gets if the player is in cover but also how big that cover is
KK_fnc_inHouse = {
  _house = objNull;
  lineIntersectsSurfaces [
    getPosWorld _this,
    getPosWorld _this vectorAdd [0, 0, 50],
    _this, objNull, true, 1, "GEOM", "NONE"
  ] select 0 params ["","","","_house"];
  if (_house isKindOf "House") exitWith {
    _size = selectMax (boundingBox _house select 1);
    [true,_size]};
  [false,3]
};

imw_escButtons = {
  (findDisplay 46) createDisplay "IMW_EmptyDisplay"; //Allow mouse movement

  _breathing = (findDisplay 5000) ctrlCreate ['RscButton',5500];
  _breathing ctrlSetText 'Immersive Weather - Toggle Breathing';
  _breathing ctrlSetPosition [0.505156 * safezoneW + safezoneX,0.247 * safezoneH + safezoneY,0.134062 * safezoneW,0.099 * safezoneH];
  _breathing ctrlCommit 0;
  _breathing ctrlSetEventHandler["ButtonClick","if (iwm_allowBreathing) then {iwm_allowBreathing = false; systemChat 'IMW - Breathing vapour disabled'}else{iwm_allowBreathing = true; systemChat 'IMW - Breathing vapour enabled'};"];

  _blizzard = (findDisplay 5000) ctrlCreate ['RscButton',5501];
  _blizzard ctrlSetText 'Immersive Weather - Toggle Blizzard';
  _blizzard ctrlSetPosition [0.360781 * safezoneW + safezoneX,0.247 * safezoneH + safezoneY,0.134062 * safezoneW,0.099 * safezoneH];
  _blizzard ctrlCommit 0;
  _blizzard ctrlSetEventHandler["ButtonClick","if (iwm_allowBlizzard) then {iwm_allowBlizzard = false; systemChat 'IMW - Blizzard Particles disabled'}else{iwm_allowBlizzard = true; systemChat 'IMW - Blizzard Particles enabled'};"];

  _snow = (findDisplay 5000) ctrlCreate ['RscButton',5502];
  _snow ctrlSetText 'Immersive Weather - Toggle Snow';
  _snow ctrlSetPosition [0.360781 * safezoneW + safezoneX,0.357 * safezoneH + safezoneY,0.134062 * safezoneW,0.099 * safezoneH];
  _snow ctrlCommit 0;
  _snow ctrlSetEventHandler["ButtonClick","if (iwm_allowSnow) then {iwm_allowSnow = false; systemChat 'IMW - Snow fall disabled'}else{iwm_allowSnow = true; systemChat 'IMW - Snow fall enabled'};"];

  _coughing = (findDisplay 5000) ctrlCreate ['RscButton',5503];
  _coughing ctrlSetText 'Immersive Weather - Toggle Coughing';
  _coughing ctrlSetPosition [0.505156 * safezoneW + safezoneX,0.357 * safezoneH + safezoneY,0.134062 * safezoneW,0.099 * safezoneH];
  _coughing ctrlCommit 0;
  _coughing ctrlSetEventHandler["ButtonClick","if (iwm_allowCoughing) then {iwm_allowCoughing = false; systemChat 'IMW - Coughing disabled'}else{iwm_allowCoughing = true; systemChat 'IMW - Coughing enabled'};"];

  _restartSnow = (findDisplay 5000) ctrlCreate ['RscButton',5504];
  _restartSnow ctrlSetText 'Immersive Weather - Restart Snow';
  _restartSnow ctrlSetPosition [0.360781 * safezoneW + safezoneX,0.467 * safezoneH + safezoneY,0.134062 * safezoneW,0.099 * safezoneH];
  _restartSnow ctrlCommit 0;
  _restartSnow ctrlSetEventHandler["ButtonClick","systemChat 'Restarting Snow fall';deleteVehicle iwm_s; iwm_s = '#particlesource' createVehicleLocal (getPos (vehicle player)); iwm_s setParticleParams [['A3\Data_F\ParticleEffects\Universal\Universal', 16, 12, 8, 1],'','Billboard',1,3,[0,0,5.5],[0,0,-1],1,0.01,0,0.01,[0.05,0.05],[[1,1,1,1]],[0,1],0.2,1.2,'','',vehicle player]; iwm_s setParticleRandom [1.5, [5, 5, 3], [0, 0, 0], 0, 0.035, [0, 0, 0, 0.4], 0, 1, 0 , 1];iwm_s setParticleCircle [4, [0, 0, 0]];iwm_s setDropInterval 0.001;iwm_s attachto [vehicle player,[0,0,3.5]];"];

  _restartBreathing = (findDisplay 5000) ctrlCreate ['RscButton',5505];
  _restartBreathing ctrlSetText 'Immersive Weather - Restart Breathing';
  _restartBreathing ctrlSetPosition [0.505156 * safezoneW + safezoneX,0.467 * safezoneH + safezoneY,0.134062 * safezoneW,0.099 * safezoneH];
  _restartBreathing ctrlCommit 0;
  _restartBreathing ctrlSetEventHandler["ButtonClick","systemChat 'Restarting breathing script'; [] spawn imw_restartBreathingScript;"];

  _close = (findDisplay 5000) ctrlCreate ['RscButton',5504];
  _close ctrlSetText 'Close';
  _close ctrlSetPosition [0.360781 * safezoneW + safezoneX,0.687 * safezoneH + safezoneY,0.273281 * safezoneW,0.022 * safezoneH];
  _close ctrlCommit 0;
  _close ctrlSetEventHandler["ButtonClick","(findDisplay 5000) closeDisplay 0"];
};

imw_playerBreath = {
  if (cameraView isEqualTo "INTERNAL") then {playSound "IMW_SB_I"}else{player say3D "IMW_SB_E"};
  _breath = "#particlesource" createVehicleLocal (getpos player);
  _breath setParticleParams [["A3\Data_F\ParticleEffects\Universal\Universal", 16, 12, 13,0],"","Billboard",0.5,0.5,[0,0,0],[0, 0.1, -0.1],1, 1.275, 1, 0.2,[0, 0.075,0],[[1,1,1, 0.1], [1,1,1, 0.01], [1,1,1, 0]],[1000],1,0,"","",_breath];
  if ((getFatigue player) > 0.75) then {
      _breath setParticleRandom [4, [0, 0, 0], [0.04, 0.04, 0.04], 0, 0.5, [0, 0, 0, 0.1], 0, 0, 10];
    }else{
      _breath setParticleRandom [2.5, [0, 0, 0], [0.04, 0.04, 0.04], 0, 0.5, [0, 0, 0, 0.1], 0, 0, 10];
    };
  _breath setDropInterval 0.0075;
  _breath attachto [player,[0,0.12,-0.03], "neck"];
  player setRandomLip true;
  if ((speed player) > 5 || (getDammage player) > 0.75) then {
      sleep 0.25;
    }else{
      sleep 0.5;
    };
  player setRandomLip false;
  deletevehicle _breath;
};

imw_playerCough = {
  _speed = 0.4;
  playSound "IMW_C";
  iwm_coughing = true;
  if (cameraView isEqualTo "INTERNAL") then {addCamShake [5, 2, 5]};
  {
    _breath = "#particlesource" createVehicleLocal (getpos player);
    _breath setParticleParams [["A3\Data_F\ParticleEffects\Universal\Universal", 16, 12, 13,0],"","Billboard",0.5,0.5,[0,0,0],[0, _speed, -0.1],1, 1.275, 1, 0.2,[0, 0.075,0],[[1,1,1, 0.03], [1,1,1, 0.01], [1,1,1, 0]],[1000],1,0,"","",_breath];
    _breath setParticleRandom [3, [0, 0, 0], [0.04, 0.04, 0.04], 0, 0.5, [0, 0, 0, 0.1], 0, 0, 10];
    _breath setDropInterval 0.003;
    _breath attachto [player,[0,0.12,-0.03], "neck"];
    player setRandomLip true;
    sleep (_x select 0);
    player setRandomLip false;
    deletevehicle _breath;
    sleep (_x select 1);
  } forEach [[0.27,0.11],[0.229,0.112],[0.224,0.112],[0.215,0.146],[0.098,0.263],[0.059,2]];
  iwm_coughing = false;
};

imw_breathAllowed = {
  if !( ["shemag", (headGear player)] call BIS_fnc_inString || ["PilotHelmetFighter", (headGear player)] call BIS_fnc_inString || ["CrewHelmetHeli", (headGear player)] call BIS_fnc_inString) then {
    if !( ["Balaclava", (goggles player)] call BIS_fnc_inString || ["G_Bandanna", (headGear player)] call BIS_fnc_inString ) then {
      true
    }else{false};
  }else{false};
};

diag_log "IMW - Starting breathing script";
uiSleep 1;
//systemChat "IMW - Breathing active.";
[] spawn {
  while {alive player && !(eyePos player select 2 < 0) && !((speed player) > 25) && diag_fps > 35} do {
    if (iwm_allowBreathing && (vehicle player) isEqualTo player && (call imw_breathAllowed)) then {
      if ((getFatigue player) > 0.75 || (getDammage player) > 0.75) then {
        sleep 1 + random 1;
      }else{
        sleep ((5 - (3 * (1 - (getFatigue player)))) + random 2);
      };
      if !(iwm_coughing) then {
        [] spawn imw_playerBreath;
      };
    };
  };
};

diag_log "IMW - Starting coughing script";

uiSleep 1;
//systemChat "IMW - Coughing active.";
[] spawn {
  while {alive player && !(eyePos player select 2 < 0) && !((speed player) > 25) && iwm_allowCoughing && diag_fps > 35} do {
    sleep (15 + random (1.5*60));
    if (iwm_allowCoughing && (vehicle player) isEqualTo player && (call imw_breathAllowed)) then {
      [] spawn imw_playerCough;
    };
  };
};

diag_log "IMW - Starting snow script";
uisleep 1;
[] spawn {

  enableEnvironment false;
  [] spawn {
    while{alive player && !(eyePos player select 2 < 0) } do {
      if (iwm_allowSnow) then {
        if (overcast > 0.5) then {playSound "IMW_SW_H";playSound "IMW_SW_H"}else{playSound "IMW_SW_L";playSound "IMW_SW_L"};
        sleep 40;
      };
    };
  };

  iwm_s = "#particlesource" createVehicleLocal (getPos (vehicle player));
  iwm_s setParticleParams [["A3\Data_F\ParticleEffects\Universal\Universal", 16, 12, 8, 1],"","Billboard",1,3,[0,0,5.5],[0,0,-1],1,0.01,0,0.01,[0.05,0.05],[[1,1,1,1]],[0,1],0.2,1.2,"","",vehicle player];
  iwm_s setParticleRandom [1.5, [5, 5, 3], [0, 0, 0], 0, 0.035, [0, 0, 0, 0.4], 0, 1, 0 , 1];
  iwm_s setParticleCircle [4, [0, 0, 0]];
  iwm_s setDropInterval 0.001;
  iwm_s attachto [vehicle player,[0,0,3.5]];

  while{alive player && !(eyePos player select 2 < 0) } do {
    if (!(iwm_allowSnow) || diag_fps < 35 ) then { iwm_s setDropInterval 0}else{ iwm_s setDropInterval 0.002};
      if ((vehicle player call KK_fnc_inHouse) select 0) then {
          iwm_s setParticleCircle [(vehicle player call KK_fnc_inHouse select 1) + 6, [0, 0, 0]];
          iwm_s setParticleRandom [1.5, [5, 5, -1], [0, 0, 0], 0, 1, [0, 0, 0, 0.4], 0, 1, 0 , 1];
          iwm_s setDropInterval 0.01;
        }else{
          iwm_s setParticleCircle [4, [0, 0, 0]];
          iwm_s setParticleRandom [1.5, [5, 5, 3], [0, 0, 0], 0, 0.035, [0, 0, 0, 0.4], 0, 1, 0 , 1];
          iwm_s setDropInterval 0.0075;
      };
      if (!(iwm_allowSnow) || diag_fps < 35 ) then { iwm_s setDropInterval 0}else{ iwm_s setDropInterval 0.002};
      uisleep 1;
      iwm_s attachto [vehicle player,[0,0,3.5]];
  };
};

uisleep 1;
[] spawn {
  iwm_optionsKeyhandler = (findDisplay 46) displayAddEventHandler ["KeyDown", "if ((_this select 1) isEqualTo 59 && (_this select 2) && (_this select 3)) then { [] spawn imw_escButtons }"];
  if (iwm_optionsKeyhandler isEqualTo -1) then {
    systemChat 'IMW - Options keybind failed to add. Trying Again';
    [] spawn {
      waitUntil{!(isNull (findDisplay 46))};
      iwm_optionsKeyhandler = (findDisplay 46) displayAddEventHandler ["KeyDown", "if ((_this select 1) isEqualTo 59 && (_this select 2) && (_this select 3)) then { [] spawn IMW_fnc_escButtons }"];
      if (iwm_optionsKeyhandler isEqualTo -1) then {
        systemChat 'IMW - Options keybind failed again. Please let Asaayu know!';
      }else{
        systemChat 'IMW - Options keybind (CTRL-SHIFT-F1)';
      };
    };
  }else{
    systemChat 'IMW - Options keybind (CTRL-SHIFT-F1)';
  };

  enableEnvironment false;
  while{true}do{
    imw_blizzard = "#particlesource" createVehicleLocal (getPos (vehicle player));
    imw_blizzard setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 4, [0, 0, 0], [-1, -1, 0], 100, 10.15,7.9, 0.2, [10, 10, 20], [[1, 1, 1, 0.01], [1, 1, 1, 0.2], [1, 1, 1, 0]], [0.08], 1, 0, "", "", vehicle player];
    imw_blizzard setParticleRandom [3, [0, 0, 0], [1, 1, 1], 1, 0.5, [0, 0, 0, 0.2], 0, 1];
    imw_blizzard setParticleCircle [30, [0, 0, 0]];
    imw_blizzard setDropInterval 0.15;
    imw_blizzard attachto [vehicle player,[0,0,3.5]];
    if !(iwm_allowBlizzard) then {imw_blizzard setDropInterval 0}else{imw_blizzard setDropInterval 0.1};
    uisleep 3;
    deleteVehicle imw_blizzard;
  };
};

diag_log "IMW - All scripts loaded successfully";
