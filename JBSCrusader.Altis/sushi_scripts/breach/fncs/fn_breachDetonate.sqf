private _arr = _this select 3;
private _c4 = _arr select 0;
private _doorArr = _arr select 1;
private _b = _doorArr select 0;
private _s = _doorArr select 1;
/*
drop [
["\A3\data_f\ParticleEffects\Universal\Universal",16,2,32], 
"","Billboard", 1,(0.3 + random 0.1),
[0, 1,1],
[0, 0, 0],
0, 2, 1, 5,
[0.7,1.3],
[[1, 1, 1, -2],[1, 1, 1, -2],[1, 1, 1, -1],[1, 0.5, 1, -0]],
[5], 
1, 0, "", "", 
_c4];
*/
[getPos _c4] remoteExec ["SAF_fnc_breachStun"];
"SmallSecondary" createVehicle position _c4;
deleteVehicle _c4;
if (getDammage _b > 0.4) then {_b setDammage 0.4};
[_b,_s,true] spawn SAF_fnc_breachOpenDoor;
