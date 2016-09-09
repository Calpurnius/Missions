/*
Author: Jmaster[SHG]
created for SpearheadGaming @ spearheadgaming.net

Script Usage:
in the init file of the crate/object you want to give the arsenal option put this:
[this,[<teamleader1 variablename>,<teamleader2 variablename>,etc.]] call <ScriptVariableAssigned>;
The scriptVariables are assigned Below. Don't change them unless you know what you are doing.


*/





















SHG_createAviationCrate = compile preprocessFileLineNumbers "SHG_arsenalSystem\scripts\AviationCrate.sqf";
SHG_createSFCrate = compile preprocessFileLineNumbers "SHG_arsenalSystem\scripts\SFCrate.sqf";
SHG_createLightInfCrate = compile preprocessFileLineNumbers "SHG_arsenalSystem\scripts\LightInfCrate.sqf";
SHG_createMechCrate = compile preprocessFileLineNumbers "SHG_arsenalSystem\scripts\MechCrate.sqf";
SHG_createMedicalCrate = compile preprocessFileLineNumbers "SHG_arsenalSystem\scripts\MedicalCrate.sqf";