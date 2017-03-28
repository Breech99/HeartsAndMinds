//[[this,["Open","scripts\OpenTerminal.sqf"]],"addAction",true] call BIS_fnc_MP;

_object = _this select 0;
_caller = _this select 1;
_id = _this select 2;
_object removeaction _id;
[_object,3] call BIS_fnc_dataTerminalAnimate;
sleep 2;
with uiNamespace do {
     disableserialization; //thank you so much tankbuster
    _object setObjectTexture [0,"a3\map_altis_scenes_f\Video\previewVideo.ogv"]; 
    1100 cutRsc ["RscMissionScreen","PLAIN"];
    _scr = BIS_RscMissionScreen displayCtrl 1100;
    _scr ctrlSetPosition [-10,-10,0,0];
    _scr ctrlSetText "a3\map_altis_scenes_f\Video\previewVideo.ogv";
    _scr ctrlAddEventHandler ["VideoStopped", {
        (uiNamespace getVariable "BIS_RscMissionScreen") closeDisplay 1;
    }];
    _scr ctrlCommit 0;
};
sleep 10;
_closeaction = [[_object,["Close","scripts\CloseTerminal.sqf"]],"addAction",true] call BIS_fnc_MP;