_heli = _this select 0; 

_heli addAction ["<t color='#CFCFCF'>Open Doors</t>", "doors\Doors.sqf",1,6,false,true,"","(_target  

animationPhase 'door_back_L' == 0) && (_target animationPhase 'door_back_L' == 0)"];  

_heli addAction ["<t color='#CFCFCF'>Close Doors</t>", "doors\Doors.sqf",0,6,false,true,"","(_target  

animationPhase 'door_back_R' == 1) && (_target animationPhase 'door_back_R' == 1)"]; 

sleep 1;