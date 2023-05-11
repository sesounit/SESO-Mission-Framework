////////////////////////////////////////////////////////////////////////////////////////
// Set Diary
player setDiarySubjectPicture ["Diary", "a3\ui_f\data\igui\cfg\simpletasks\types\whiteboard_ca.paa"];
// Intel
_intelText = player createDiaryRecord ["Diary", ["Intel",
"
Time: 1944/12/28 0715
<br/>
Weather: Light Rain
<br/>
Fog: Medium
<br/><br/>
Enemy TO/E
<br/>
Factions: Italians, Allies (Britain, United States, Canada)
<br/>
Vehicles/Statics: Tanks, APCs, Trucks, Anti-Air Statics, Artillery Statics, Heavy Machinegun Statics
<br/><br/>
Friendly TO/E
<br/>
Factions: Germans (Wehrmacht, Luftwaffe)
<br/>
Vehicles/Statics: None
<br/>
Fire Support: None
<br/>
Misc. Support: anti-tank mines, anti-infantry mines, TNT charges, anti-tank rocket launchers (in OBJ Sentinel) 
<br/><br/>
"
]];

// Signal
_executionText = player createDiaryRecord ["Diary", ["Signal",
"
LRR Radio: AN/PRC-77
<br/>
SRR Radio: None
<br/>
OPSCOM LRR Frequency: 30Hz
<br/>
BRAVO LRR Frequency: 30Hz
<br/>
Green Smoke: BLUFOR nearby / LZ Marker
<br/>
Red Smoke: OPFOR nearby / TFP marker
<br/>
Yellow Smoke: Mass casualties received
"
]];


// Execution
_executionText = player createDiaryRecord ["Diary", ["Execution",
"
1. Select a drop point within DZ Dog
<br/>
2. Re-group with friendly forces at ORV 1 or other RV
<br/>
3. Attack OBJ Sentinel to recover anti-tank equipment
<br/>
4. Destroy FSBs surrounding OBJ Pizza that could hinder your attack
<br/>
5. Ambush QRF Lion in OBJ Tamer
<br/>
NOTE: QRF Lion will only engage after OBJ Pizza is attacked
<br/>
6. Attack OBJ Pizza to recover the captives and munitions
<br/>
7. Mark a vehicle with the German national flag
<br/>
8. EVAC to FOB Crown with the marked vehicle, passing through the Active Combat Zone
"
]];

// Mission
_missionText = player createDiaryRecord ["Diary", ["Missions",
"
1. Recover captives and munitions from OBJ Pizza to FOB Crown
<br/>
2. Acquire anti-tank equipment from OBJ Sentinel
<br/>
3. Ambush QRF Lion in OBJ Tamer
"
]];

// Situation
_situationText = player createDiaryRecord ["Diary", ["Situation",
"
BLUF: The Gothic Line at Garfagnana has seen unending combat. There are not enough ammunition to serve the 148th Reserve Division from holding the flank. Recover captured men and munitions from Allied-occupied Piazzana to reinforce the Gothic Line.
<br/><br/>
---
<br/><br/>
The Gothic Line has surprisingly holds back the Allies. Germans are huddled in the ruins and mountainsides of the Tuscan Apennines, repelling most Allied advances. However, since the start of Operation Olive, Allies have began poking holes in our defense.
<br/><br/>
The German 14th Army has been reversing Operation Olive with our own attack onto Garfagnana. It is becoming one of the few Axis victories of Italy. The 148th Reserve Division attempt to hold the flanks, yet the amount of combat seen by its forces has depleted most of our munitions.
<br/><br/>
The 14th Army command established the 'Kampgruppe Wolf', made up of Fallschirmjäger or German Paratroopers. Wolf squad is tasked with the requisition of captured forces and munitions in the town of Piazzana. The Luftwaffe will drop you behind enemy lines to wreak havoc, rescue Axis captives, and recover our ammunition. Return to FOB Crown through the Active Combat Zone. If you don our national flag, you will be spared from friendly fire.
<br/><br/>
In order to pull forces away from Piazzana, a diversionary attack will be made west of the main objective. This will pull enemy forces away from their fortified positions while you sneak through the Tuscan wilderness. The attack will last indefinitely until the end of Operation Rosso.
<br/><br/>
Due to the AA FSB located North of Piazzana, you will have to be dropped further away from the main objective. Select a position within DZ Dog as your team's designated drop point. ORV 1 is a designated area with enough light and security to gather.
<br/><br/>
QRF Lion is likely to interrupt your attack on OBJ Pizza as soon as it begins. Use the sappers to setup an ambush in OBJ Tamer. Anti-tank launchers are also dropped in the Allied-held OBJ Sentinel. 
"
]];