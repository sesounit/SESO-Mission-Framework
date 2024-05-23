/*
 * Author: Dildo Sagbag
 * Replaces common items with other cooler items
 *
 * Example:
 * call SESO_fnc_ItemReplace
 *
 * Public: No
 */


#include "..\script_component.hpp"
#define FAK "ACE_splint", \
"ACE_tourniquet", \
COMMA_10("ACE_packingBandage"), \
"ACE_painkillers" \

if (ace_medical_treatment_convertItems == 2) then {

    ["FirstAidKit", [ FAK ]] call ace_common_fnc_registerItemReplacement;

    ["Medikit", [
        FAK,
        COMMA_10("ACE_elasticBandage"),
        COMMA_5("ACE_elasticBandage"),
        COMMA_2("ACE_bloodIV_500"),
        "ACE_splint",
        "ACE_tourniquet",
        "ACE_adenosine",
        "ACE_epinephrine",
        COMMA_2("ACE_morphine"),
        "ACE_surgicalKit",
        "ACE_personalAidKit"
    ]] call ace_common_fnc_registerItemReplacement;

};