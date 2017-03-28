/*  Copyright 2016 Fluit
    
    This file is part of Dynamic Enemy Population.

    Dynamic Enemy Population is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation version 3 of the License.

    Dynamic Enemy Population is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Dynamic Enemy Population.  If not, see <http://www.gnu.org/licenses/>.
*/
// This file creates all the server functions

dep_fnc_log                     = compile preprocessFileLineNumbers (dep_directory+"functions\log.sqf");
dep_fnc_random_position         = compile preprocessFileLineNumbers (dep_directory+"functions\randommappos.sqf");
dep_fnc_shuffle                 = compile preprocessFileLineNumbers (dep_directory+"functions\shufflearray.sqf");
dep_fnc_outsidesafezone         = compile preprocessFileLineNumbers (dep_directory+"functions\outsidesafezone.sqf");
dep_fnc_createunit              = compile preprocessFileLineNumbers (dep_directory+"functions\createunit.sqf");
dep_fnc_isenterable             = compile preprocessFileLineNumbers (dep_directory+"functions\isenterable.sqf");
dep_fnc_setwaypoints            = compile preprocessFileLineNumbers (dep_directory+"functions\setwaypoints.sqf");
dep_fnc_getwaypoints            = compile preprocessFileLineNumbers (dep_directory+"functions\getwaypoints.sqf");
dep_fnc_findmilitarybuildings   = compile preprocessFileLineNumbers (dep_directory+"functions\findmilitarybuildings.sqf");
dep_fnc_findnearhouses          = compile preprocessFileLineNumbers (dep_directory+"functions\findnearhouses.sqf");
dep_fnc_buildingpositions       = compile preprocessFileLineNumbers (dep_directory+"functions\buildingpositions.sqf");
dep_fnc_vehicledamage           = compile preprocessFileLineNumbers (dep_directory+"functions\vehicledamage.sqf");
dep_fnc_findforests             = compile preprocessFileLineNumbers (dep_directory+"functions\findforests.sqf");
dep_fnc_findpaths               = compile preprocessFileLineNumbers (dep_directory+"functions\findpaths.sqf");
dep_fnc_findroads               = compile preprocessFileLineNumbers (dep_directory+"functions\findroads.sqf");
dep_fnc_nearestroad             = compile preprocessFileLineNumbers (dep_directory+"functions\nearestroad.sqf");
dep_fnc_slopedir                = compile preprocessFileLineNumbers (dep_directory+"functions\slopedirection.sqf");
dep_fnc_restore                 = compile preprocessFileLineNumbers (dep_directory+"functions\restore.sqf");
dep_fnc_activate                = compile preprocessFileLineNumbers (dep_directory+"functions\activate.sqf");
dep_fnc_enemyspawnprotect       = compile preprocessFileLineNumbers (dep_directory+"functions\enemyspawnprotect.sqf");
dep_fnc_towns                   = compile preprocessFileLineNumbers (dep_directory+"functions\towns.sqf");
dep_fnc_airpatrols              = compile preprocessFileLineNumbers (dep_directory+"functions\airpatrols.sqf");
dep_fnc_scriptedspawnpos        = compile preprocessFileLineNumbers (dep_directory+"functions\scriptedspawnpos.sqf");
dep_fnc_update_marker           = compile preprocessFileLineNumbers (dep_directory+"functions\updatemarker.sqf");