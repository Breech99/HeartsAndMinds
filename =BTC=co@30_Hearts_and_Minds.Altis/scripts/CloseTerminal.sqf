_object = _this select 0;
_caller = _this select 1;
_id = _this select 2;
_object removeaction _id;
[_object,0] call BIS_fnc_dataTerminalAnimate;
sleep 10;
_openaction = [[_object,["Open","scripts\OpenTerminal.sqf"]],"addAction",true] call BIS_fnc_MP;