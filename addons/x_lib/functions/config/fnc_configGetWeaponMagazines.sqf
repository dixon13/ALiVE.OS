#include <\x\alive\addons\x_lib\script_component.hpp>
SCRIPT(configGetWeaponMagazines);

/* ----------------------------------------------------------------------------
Function: ALIVE_fnc_configGetWeaponMagazines

Description:
Get magazines from config for a weapon class

Parameters:
String - weapon class name

Returns:
Array of magazine types

Examples:
(begin example)
// get weapon magazines
_result = "missiles_DAGR" call ALIVE_fnc_configGetWeaponMagazines;
(end)

See Also:

Author:
denisko.redisko (denvdmj)
---------------------------------------------------------------------------- */

private _weapon = configFile >> "CfgWeapons" >> _this;
private _result = [];
{
    _result = _result + getArray ((if (_x == "this") then { _weapon } else { _weapon >> _x }) >> "magazines");
} count getArray (_weapon >> "muzzles");

_result