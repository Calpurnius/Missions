_tank = _this;

_tank addAction ["Play Sabaton", "secret\music3.sqf", _tank, 1, true, false, "", "(vehicle player != player)", 5];
_tank addAction ["Stop Music", {_target say3D "";}, _tank, 1, true, false, "", "(vehicle player != player)", 5];