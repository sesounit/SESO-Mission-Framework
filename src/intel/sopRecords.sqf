
// Set SOP
player createDiarySubject ["SOP", "SOP", "a3\ui_f\data\igui\cfg\simpletasks\types\armor_ca.paa"];

private _rifleman_weapons = player createDiaryRecord ["SOP", ["Rifleman",
"
The weapons fit for the Rifleman are:
<br/><br/>

<font size='16'> Primary Weapons </font>
<br/>
Assault Rifles (STG-44, etc.)
<br/>
Semi-Auto Rifles (M1 Garand, M1A1 Carbine, Gewehr-42, etc.)
<br/>
Bolt Action Rifles (Springfield, Kar 98k, etc.)
<br/>
<br/><br/>
<font size='16'> Secondary Weapons </font>
<br/>
Pistols (M1911, Luger, Flare Guns)
<br/><br/>
<font size='16'> Launchers </font>
<br/>
None
"
]];

private _engineer_weapons = player createDiaryRecord ["SOP", ["Engineer",
"
The weapons fit for the Engineer are:
<br/><br/>

<font size='16'> Primary Weapons </font>
<br/>
Assault Rifles (STG-44, etc.)
<br/>
Semi-Auto Rifles (M1 Garand, M1A1 Carbine, Gewehr-42, etc.)
<br/>
Bolt Action Rifles (Springfield, Kar 98k, etc.)
<br/>
<br/><br/>
<font size='16'> Secondary Weapons </font>
<br/>
Pistols (M1911, Luger, Flare Guns)
<br/><br/>
<font size='16'> Launchers </font>
<br/>
None
"
]];

private _at_weapons = player createDiaryRecord ["SOP", ["AT Rifleman",
"
The weapons fit for the AT Rifleman are:
<br/><br/>

<font size='16'> Primary Weapons </font>
<br/>
Assault Rifles (STG-44, etc.)
<br/>
Semi-Auto Rifles (M1 Garand, M1A1 Carbine, Gewehr-42, etc.)
<br/>
Bolt Action Rifles (Springfield, Kar 98k, etc.)
<br/>
<br/><br/>
<font size='16'> Secondary Weapons </font>
<br/>
Pistols (M1911, Luger, Flare Guns)
<br/><br/>
<font size='16'> Launchers </font>
<br/>
AT Launcher (Bazooka, Panzerschreck, etc.)
"
]];

private _machinegunner_weapons = player createDiaryRecord ["SOP", ["Machinegunner",
"
The weapons fit for the Machinegunner are:
<br/><br/>

<font size='16'> Primary Weapons </font>
<br/>
Light Machinegun (M1919A6, BAR, MG-42, etc.)
<br/><br/>
<font size='16'> Secondary Weapons </font>
<br/>
Pistols (M1911, Luger, Flare Guns, etc.)
<br/><br/>
<font size='16'> Launchers </font>
<br/>
None
"
]];

private _medic_weapons = player createDiaryRecord ["SOP", ["Medic",
"
The weapons fit for the Medic are:
<br/><br/>

<font size='16'> Primary Weapons </font>
<br/>
Assault Rifles (STG-44, etc.)
<br/>
Semi-Auto Rifles (M1 Garand, M1A1 Carbine, Gewehr-42, etc.)
<br/>
Bolt Action Rifles (Springfield, Kar 98k, etc.)
<br/>
<br/><br/>
<font size='16'> Secondary Weapons </font>
<br/>
Pistols (M1911, Luger, Flare Guns)
<br/><br/>
<font size='16'> Launchers </font>
<br/>
None
"
]];

private _signaller_weapons = player createDiaryRecord ["SOP", ["Signaller",
"
The weapons fit for the Signaller are:
<br/><br/>

<font size='16'> Primary Weapons </font>
<br/>
Assault Rifles (STG-44, etc.)
<br/>
Semi-Auto Rifles (M1 Garand, M1A1 Carbine, Gewehr-42, etc.)
<br/>
Bolt Action Rifles (Springfield, Kar 98k, etc.)
<br/>
<br/><br/>
<font size='16'> Secondary Weapons </font>
<br/>
Pistols (M1911, Luger, Flare Guns)
<br/><br/>
<font size='16'> Launchers </font>
<br/>
None
"
]];

private _leader_weapons = player createDiaryRecord ["SOP", ["Squad/Team Leader",
"
The weapons fit for the roles of Squad Leaders, Team Leaders, and any other Lead roles are:
<br/><br/>

<font size='16'> Primary Weapons </font>
<br/>
Submachine Guns (Sten, Thompson, MP-38, MP-40, PPSh-41 etc.)
<br/>
Assault Rifles (STG-44, etc.)
<br/>
Semi-Auto Rifles (M1 Garand, M1A1 Carbine, Gewehr-42, etc.)
<br/>
Bolt Action Rifles (Springfield, Kar 98k, etc.)
<br/>
<br/><br/>
<font size='16'> Secondary Weapons </font>
<br/>
Pistols
<br/>
<br/><br/>
<font size='16'> Launchers </font>
<br/>
None
"
]];

// Intel
private _sop = player createDiaryRecord ["SOP", ["Standard Operating Procedure",
"
The Standard Operating Procedure (SOP) defines the common behavior that operatives follow during an operation. A host can always make exceptions. Otherwise, the following apply to all operatives regardless of roles.
<br/><br/>

    A) Use the equipment your role would use<br/>
    B) Use the gear provided to you by the host<br/>
    C) Finish combat before resupplying<br/>
    D) As foot infantry, you cannot attach to a tracked/armored vehicles<br/>
    E) Stay within earshot of your leader<br/>
    F) Only leaders can discuss strategy<br/>
    G) Squad leaders and radiomen follow radio etiquette when communicating with the host<br/>
    H) Hold fire unless told otherwise<br/>
    I) During active combat, leave healing to medics<br/>

"
]];