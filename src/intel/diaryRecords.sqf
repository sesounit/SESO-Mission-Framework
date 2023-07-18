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
Vehicles/Statics: Tanks, APCs, Trucks, Heavy Machinegun Statics, AT Gun Statics
<br/>
Convoy Itinerary:
<br/>
Convoy Ethel starts at Base Sud and ends at Panzer Barracks. They will move 15 min after entering OBJ Lion<br/>
<br/><br/>
Friendly TO/E
<br/>
Factions: SESO, Allies (SHAEF)
<br/>
Vehicles/Statics: MHQ Matador, Jeeps
<br/>
Indirect Support: x4 Artillery Strikes (12 Flak-36 shells each), x1 Supply Drop (1 Arsenal)
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
1. Reach Charlie squad
<br/>
2. Assault enemy positions towards OBJ Rat, Monster
<br/>
3. Secure 4 POW operatives from OBJ Monster
<br/>
4. Secure 4 POW operatives from OBJ Rat
<br/>
5. Reach the Panzer Barracks
<br/>
6. Secure OBJ Lion
<br/>
7. Setup an ambush for Convoy Ethel
<br/>
8. Destroy Convoy Ethel
<br/>
9. EVAC to OBJ Lion
"
]];

// Mission
private _missionText = player createDiaryRecord ["Diary", ["Missions",
"
1. Rescue POW Operatives from OBJ Rat, Monster
<br/>
2. Secure OBJ Lion
<br/>
3. Deter Convoy Ethel
"
]];

// Situation
private _situationText = player createDiaryRecord ["Diary", ["Situation",
"
BLUF: Rescue POW operatives with Charlie at OBJ Rat, Monster. Capture OBJ Lion for a future FOB.
<br/><br/>
---
<br/><br/>
Our recent success to raid enemy supplies has challenged the Panzerwaffen to occupy our territory. Based off the intel acquired from the “Hüttenhain” truck, among other things, German forces were planning an assault south of the Todt Airfield to encroach on MOB Bell. Command sent Charlie to block their advance but their operation was a failure. Multiple operatives were captured by German forces and held at military structures within OBJ Rat and Monster. You are sent to clean up the mess.
<br/><br/>
Once Charlie is regrouped, they will retake the German-occupied territory while you, Bravo, advance to the Panzer Barracks. Marked as OBJ Lion, the barracks are the primary command center of the Panzerwaffen. Its capture will not only sever the head of the panzers but help establish a new FOB for future operations elsewhere on the island.
<br/><br/>
Regarding Project Hüttenhain, it is a secret weapon currently in developed by the head of the Reich Research Council, Bernhard Rust. The Germans call their weapon Schreies or Screams. OPSCOM believes the weapon’s description is under further layers of ciphers that will take more intel to unearth.
"
]];