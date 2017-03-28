
_player addEventHandler [ "respawn", {
_player = _this select 0;
[ _player, requester, provider ] call BIS_fnc_addSupportLink;
}];
//["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;//already added to init_player

halo addAction ["<t size='1.5' shadow='2' color='#00ffff'>HALO</t> <img size='3' color='#00ffff' shadow='2' image='\A3\Air_F_Beta\Parachute_01\Data\UI\Portrait_Parachute_01_CA.paa'/>", "call ghst_fnc_halo", [false,1000,60,false], 5, true, true, "","alive _target"];

halo2 addAction ["<t size='1.5' shadow='2' color='#00ffff'>HALO</t> <img size='3' color='#00ffff' shadow='2' image='\A3\Air_F_Beta\Parachute_01\Data\UI\Portrait_Parachute_01_CA.paa'/>", "call ghst_fnc_halo", [false,1000,60,false], 5, true, true, "","alive _target"];
halo2 setObjectTexture [0, "\A3\Characters_F\data\ui\icon_b_parachute_ca.paa"];

if ((typeOf player) == "supportcall_allowed_classname_unit") then  {

player synchronizeObjectsAdd [requestor];
BIS_supp_refresh = TRUE;

player addEventHandler ["GetInMan", {[ _this select 2] execVM "scripts\kp_fuel_consumption.sqf";}];

};
