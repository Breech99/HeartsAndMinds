disableSerialization;

private ["_ui","_radar","_obj_img","_obj_pic","_arrow","_obj_name","_array_hud","_can_lift","_arrow_up","_arrow_down","_complete","_incomplete","_array","_cargo_array","_cargo_pos","_cargo_x","_cargo_y","_rel_pos","_hud_x","_hud_y","_hud_x_1","_hud_y_1","_name_cargo","_pic_cargo","_cargo_z"];

939996 cutRsc ["btc_log_hud","PLAIN"];
_ui        = uiNamespace getVariable "btc_log_hud";
_radar     = _ui displayCtrl 1001;
_obj_img   = _ui displayCtrl 1002;
_obj_pic   = _ui displayCtrl 1003;
_arrow     = _ui displayCtrl 1004;
_obj_name  = _ui displayCtrl 1005;
_array_hud = [_radar,_obj_img,_obj_pic,_arrow,_obj_name];
{_x ctrlShow true;} foreach _array_hud;_obj_img ctrlShow false;
_can_lift = false;

_arrow_up   = "\A3\ui_f\data\igui\cfg\actions\arrow_up_gs.paa";
_arrow_down = "\A3\ui_f\data\igui\cfg\actions\arrow_down_gs.paa";
_complete   = "\A3\ui_f\data\map\markers\nato\b_unknown.paa";
_incomplete = "\A3\ui_f\data\map\markers\nato\b_unknown.paa";

while {(Alive player && vehicle player != player) && btc_log_hud} do {
	private ["_cargo","_chopper"];
	_chopper = vehicle player;
	_array = [_chopper] call btc_fnc_log_get_liftable;
	_cargo_array = nearestObjects [_chopper, _array, 30];
	if (count _array == 0) then {_cargo_array = [];};
	_cargo_array = _cargo_array - [_chopper];
	if (count _cargo_array > 0 && (typeOf (_cargo_array select 0)) isEqualTo "ACE_friesAnchorBar") then {_cargo_array deleteAt 0;};
	if (count _cargo_array > 0) then {_cargo = _cargo_array select 0;} else {_cargo = objNull;};
	if (({_cargo isKindOf _x} count _array) > 0) then {_can_lift = true;} else {_can_lift = false;};
	if (!isNull _cargo) then {
		_cargo_pos = getPosATL _cargo;
		_rel_pos   = (_chopper) worldToModel _cargo_pos;
		_cargo_x   = _rel_pos select 0;
		_cargo_y   = _rel_pos select 1;
		_cargo_z   = _rel_pos select 2;
		_obj_img ctrlShow true;
		_hud_x   = _cargo_x / 100;
		_hud_y   = 0;
		switch (true) do {
			case (_cargo_y < 0): {_hud_y = (abs _cargo_y) / 100};
			case (_cargo_y > 0): {_hud_y = (0 - _cargo_y) / 100};
		};
		_hud_x_1 = (btc_lift_HUD_x + _hud_x) * safezoneW + safezoneX;;
		_hud_y_1 = (btc_lift_HUD_y + _hud_y) * safezoneH + safezoneY;
		_obj_img ctrlsetposition [_hud_x_1, _hud_y_1];
		_obj_img ctrlCommit 0;
		_pic_cargo = "";
		if (_cargo isKindOf "LandVehicle") then {_pic_cargo = getText (configFile >> "cfgVehicles" >> typeof _cargo >> "picture");} else {_pic_cargo = "";};
		_name_cargo = getText (configFile >> "cfgVehicles" >> typeof _cargo >> "displayName");
		_obj_pic ctrlSetText _pic_cargo;
		if (btc_lifted) then {_obj_name ctrlSetText (format ["[%1 m] ",(round((getpos _cargo select 2) * 10))/10] + _name_cargo);} else {_obj_name ctrlSetText _name_cargo;};

		if ((abs _cargo_z) > (btc_lift_max_h + 3)) then {
			_arrow ctrlSetText _arrow_down;
			_arrow ctrlSetTextColor [1, 0, 0, 1];
		} else {
			if ((abs _cargo_z) > btc_lift_max_h) then {
				_arrow ctrlSetText _arrow_down;
				_arrow ctrlSetTextColor [1, 1, 0, 1];
			};
		};
		if ((abs _cargo_z) < (btc_lift_min_h - 3)) then {
			_arrow ctrlSetText _arrow_up;
			_arrow ctrlSetTextColor [1, 0, 0, 1];
		} else {
			if ((abs _cargo_z) < btc_lift_min_h) then {
				_arrow ctrlSetText _arrow_up;
				_arrow ctrlSetTextColor [1, 1, 0, 1];
			};
		};
		if ((abs _cargo_z) > btc_lift_min_h && (abs _cargo_z) < btc_lift_max_h) then {
			_arrow ctrlSetText _complete;
			_arrow ctrlSetTextColor [0, 1, 0, 1];
		};
		if !(_can_lift) then {
			_arrow ctrlSetText _incomplete;
			_arrow ctrlSetTextColor [1, 0, 0, 1];
		};

	} else {
		_obj_img ctrlShow false;
		_obj_pic ctrlSetText "";
		_obj_name ctrlSetText "";
		_arrow ctrlSetText "";
	};
	sleep 0.1;
};

939996 cutRsc ["Default","PLAIN"];