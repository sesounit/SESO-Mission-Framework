/*
Name: removeConversation
Author: IndeedPete
Purpose: Removes conversation from unit or object, i.e. removes action to start the conversation.
----------
Parameters:
_unit - OBJECT: Unit that the action should be removed from. - MyInterestingConversationPartner
_conversation - STRING: The config entry referring to the desired conversation. - "MyFirstConversation"
*/

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_conversation = [_this, 1, "", [""]] call BIS_fnc_param;

_var = "IP_CONV_OBJ_" + _conversation;
_object = _unit getVariable [_var, objNull];

_addTo = if (!(isNull _object)) then {
	_unit setVariable [_var, nil];
	_object
} else {_unit};

_var = "IP_CONV_" + _conversation;
_id = _addTo getVariable [_var, -1];

if (_id >= 0) then {
	_addTo removeAction _id;
	_addTo setVariable [_var, nil];
};