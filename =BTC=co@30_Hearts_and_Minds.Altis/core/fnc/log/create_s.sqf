private "_obj";
_obj = _this createVehicle [getpos btc_create_object_point select 0,getpos btc_create_object_point select 1,0];
btc_log_obj_created = btc_log_obj_created + [_obj];
btc_curator addCuratorEditableObjects [[_obj], false];

if ((_this select 0 == "B_CargoNet_01_ammo_F") || (_this select 0 == "Box_NATO_AmmoVeh_F")) then	{
		_obj setMass 500;
	};
if ((_this select 0 == btc_supplies_mat) || (_this select 0 == btc_fob_mat)) then {
		_obj setMass 2000;
	};