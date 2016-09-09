params [["_doorArr",[]],["_charge",false],["_isChecked",false]];
if (count _doorArr < 1) then { _doorArr = [cursorTarget] call saf_fnc_breachGetTargetDoors; };
private _txt = "";
private _doorStatus = 0;
if(count _doorArr > 0) then {
	private _d = _doorArr select 0;
	private _s = _doorArr select 1;
	{
		_doorStatus = _d getVariable [format ["bis_disabled_%1", _x], 0];
		
		if (_doorStatus == 1 && _charge) then {
			_doorStatus = _d getVariable [format ["saf_var_charge_%1", _x], 0];
		};
	} foreach _s;
};

_doorStatus;