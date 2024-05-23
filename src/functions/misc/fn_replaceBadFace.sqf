
#include "..\script_component.hpp"

#define ALLOWED_FACES ["PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03","WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_09","WhiteHead_10","WhiteHead_11","WhiteHead_12","WhiteHead_13","WhiteHead_14","WhiteHead_15","WhiteHead_16","WhiteHead_17","WhiteHead_18","WhiteHead_19","WhiteHead_20","WhiteHead_21","WhiteHead_22","WhiteHead_23","WhiteHead_24","WhiteHead_25","WhiteHead_26","WhiteHead_27","WhiteHead_28","WhiteHead_29","WhiteHead_30","WhiteHead_31","WhiteHead_32","AfricanHead_01","AfricanHead_02","AfricanHead_03","GreekHead_A3_01","GreekHead_A3_02","GreekHead_A3_03","GreekHead_A3_04","GreekHead_A3_05","GreekHead_A3_06","GreekHead_A3_07","GreekHead_A3_08","GreekHead_A3_09","GreekHead_A3_10","GreekHead_A3_11","GreekHead_A3_12","GreekHead_A3_13","GreekHead_A3_14","AsianHead_A3_01","AsianHead_A3_02","AsianHead_A3_03","AsianHead_A3_04","AsianHead_A3_05","AsianHead_A3_06","AsianHead_A3_07","TanoanHead_A3_01","TanoanHead_A3_02","TanoanHead_A3_03","TanoanHead_A3_04","TanoanHead_A3_05","TanoanHead_A3_06","TanoanHead_A3_07","TanoanHead_A3_08","LivonianHead_1","LivonianHead_2","LivonianHead_3","LivonianHead_4","LivonianHead_5","LivonianHead_6","LivonianHead_7","LivonianHead_8","LivonianHead_9","LivonianHead_10","RussianHead_1","RussianHead_2","RussianHead_3","RussianHead_4"]

if !(hasInterface) exitWith {systemChat "Need to be run in player local"};


if ( ((face player) isEqualTo "Custom") OR ((face player) isEqualTo "Default") ) then {
	private _oldFace = (face player);
	[player, selectRandom ALLOWED_FACES] remoteExec ["setFace", 0, true];
	diag_log format ["Changed invalid %1 face to %2", (face player), _oldFace];
};