params [["_doorArr",[]]];
if (count _doorArr < 1) then { _doorArr = [cursorTarget] call saf_fnc_breachGetTargetDoors; };
private _txt = "";
private _doorStatus = 0;

if(count _doorArr > 0) then {
	private _d = _doorArr select 0;
	private _s = _doorArr select 1;
	{
			_doorStatus = _d getVariable [format ["saf_var_checked_%1", _x], 0];
	} foreach _s;
};

_doorStatus;