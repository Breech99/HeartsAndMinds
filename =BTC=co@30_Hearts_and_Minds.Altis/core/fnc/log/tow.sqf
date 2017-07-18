
private _tower = _this;

btc_int_ask_data = nil;
[4,_tower,player] remoteExec ["btc_fnc_int_ask_var", 2];

waitUntil {!(isNil "btc_int_ask_data")};

if (!isNull btc_int_ask_data) exitWith {hint "This vehicle is already attached to another!"};

private _simulation = createVehicle ["Land_PlasticCase_01_medium_F", getPos btc_log_vehicle_selected , [], 0, "CAN_COLLIDE"];
_simulation enableSimulation false;
_simulation setMass 20;
private _pos = getPosASL btc_log_vehicle_selected;
if (((getpos btc_log_vehicle_selected) select 2) < -0.05) then {_pos = [_pos select 0, _pos select 1, (_pos select 2) - ((getpos btc_log_vehicle_selected) select 2)]};
_simulation setPosASL _pos;
_simulation setDir getDir btc_log_vehicle_selected;
_simulation setVectorUp vectorUp btc_log_vehicle_selected;

private _model_rear = ([_tower] call btc_fnc_log_hitch_points) select 1;
private _model_front = ([btc_log_vehicle_selected] call btc_fnc_log_hitch_points) select 0;
private _pos_rear = _tower modelToWorld _model_rear;
private _pos_front = btc_log_vehicle_selected modelToWorld _model_front;
private _relative_pos = _simulation worldToModel _pos_front;

ropeCreate [_tower, _model_rear, _simulation, [_relative_pos select 0, _relative_pos select 1, -0.1], (_pos_front distance _pos_rear) + 0.1];

btc_log_vehicle_selected attachTo [_simulation, [0, 0, 0.2 + abs(((btc_log_vehicle_selected modelToWorld [0,0,0]) select 2) - ((_simulation  modelToWorld [0,0,0]) select 2))]];

_simulation enableSimulation true;

[_tower,"tow",btc_log_vehicle_selected] remoteExec ["btc_fnc_int_change_var", 2];
[btc_log_vehicle_selected,"tow",_tower] remoteExec ["btc_fnc_int_change_var", 2];

_simulation addEventHandler ["RopeBreak", {
	(_this select 0) removeEventHandler ["RopeBreak", _thisEventHandler];
	deleteVehicle (_this select 0);
}];

_tower addEventHandler ["RopeBreak", {
	(_this select 0) removeEventHandler ["RopeBreak", _thisEventHandler];
	(_this select 0) spawn btc_fnc_log_unhook;
	deleteVehicle (_this select 2);
}];