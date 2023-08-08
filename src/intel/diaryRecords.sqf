////////////////////////////////////////////////////////////////////////////////////////
// Set Diary
player setDiarySubjectPicture ["Diary", "a3\ui_f\data\igui\cfg\simpletasks\types\whiteboard_ca.paa"];
// Intel
private _intelText = player createDiaryRecord ["Diary", ["Intel",
"
Time: 1945/02/22 0830
<br/>
Weather: Clear
<br/>
Fog: Clear
<br/><br/>
Enemy TO/E
<br/>
Factions: Germans (Waffen SS)
<br/>
Vehicles/Statics: APCs, Trucks, Heavy Machinegun Statics, AA Gun Statics, AT Gun Statics
<br/>
<br/><br/>
Friendly TO/E
<br/>
Factions: SESO, Allies (SHAEF)
<br/>
Vehicles/Statics: MHQ Matador, Jeeps, Red Fuel Truck
<br/>
Indirect Support: x1 Supply Drop (1 Arsenal)
<br/>
"
]];

// Signal
private _signalText = player createDiaryRecord ["Diary", ["Signal",
"
LRR Radio: AN/PRC-152
<br/>
SRR Radio: None
<br/>
OPSCOM LRR Channel: 1
<br/>
BRAVO LRR Channel: 1
<br/>
Green Smoke/Flare: BLUFOR nearby / LZ Marker
<br/>
Red Smoke/Flare: OPFOR nearby / TFP marker
<br/>
Purple Smoke/Flare: Mass casualties received
"
]];


// Execution
private _executionText = player createDiaryRecord ["Diary", ["Execution",
"
1. Secure OBJ Leningrad
<br/>
2. Reach OBJ Grouse
<br/>
3. Secure OBJ Grouse
<br/>
4. Plant explosives on the red fuel truck
<br/>
5. Position the red fuel truck on top of the bridge
<br/>
6. Detonate the explosives to destroy the bridge.
<br/>
7. EVAC to FOB Lion
"
]];

// Mission
private _missionText = player createDiaryRecord ["Diary", ["Missions",
"
1. Secure OBJ Leningrad
<br/>
2. Secure OBJ Grouse
<br/>
3. Destroy the bridge at OBJ Pegasus
"
]];

// Situation
private _situationText = player createDiaryRecord ["Diary", ["Situation",
"
BLUF: Destroy the bridge at OBJ Pegasus.
<br/><br/>
---
<br/><br/>
Panzer Barracks, a future home for Bravo squad, has proved useful. According to our intel, most German forces are housed in Base Sud. They receive supply from headquaters in the north due to the railroad.
<br/><br/>
You will need to eliminate this railroad in OBJ Pegasus using the fuel truck you acquired earlier. Wrap it with explosives and set it to blow in OBJ Pegasus.
<br/><br/>
"
]];