params ["_unit"];
private _magazines = magazines _unit;
private _result = false;
{
    if (_x == "rhsusf_m112_mag" || _x == "DemoCharge_Remote_Mag") exitWith {
        _result = true;
    };
} count _magazines;

_result;