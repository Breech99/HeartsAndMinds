///added lines above for JIP and intro///
enableSaving [false,false];
CHVD_allowNoGrass = true;
//Server
call compile preprocessFile "core\fnc\compile.sqf";

if (hasInterface) then {btc_intro_done = call btc_fnc_intro;};

call compile preprocessFile "core\def\mission.sqf";
call compile preprocessFile "define_mod.sqf";
0 = execVM "IgiLoad\IgiLoadInit.sqf";
[] execVM "gvs\gvs_init.sqf";
[] execVM "VCOMAI\init.sqf";
[] execVM "DEP\init.sqf";

if (isServer) then {
	call compile preprocessFile "core\init_server.sqf";
};

call compile preprocessFile "core\init_common.sqf";

if (!isDedicated && hasInterface) then {
	call compile preprocessFile "core\init_player.sqf";
};

if (!isDedicated && !hasInterface) then {
	call compile preprocessFile "core\init_headless.sqf";
};
