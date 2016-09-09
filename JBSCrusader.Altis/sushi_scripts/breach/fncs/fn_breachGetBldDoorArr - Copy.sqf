private _bldg = typeOf  (_this select 0);
private _ActArray = [];
private _GarbageArray = [];

private _cfgBldg = (configFile >> "cfgVehicles" >> _bldg );
private _act = (_cfgBldg >> "UserActions");
if (count _act > 0) then {
	private ["_j"];
	for "_j" from 0 to ((Count _act) - 1) do {
		private _cfgDisplay = getText (_act select _j >> "displayName");
		private _cfgPosition = getText (_act select _j >> "position");
		private _cfgStatement = getText (_act select _j >> "statement");
		_ActArray set [_j,[_cfgDisplay,_cfgPosition,_cfgStatement]];
	};	
};

_ActArray;
