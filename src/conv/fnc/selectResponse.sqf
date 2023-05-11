/*
Name: selectResponse
Author: IndeedPete
Purpose: Upon response selection, conversation dialog is closed and reopened to show the new conversation based on the selected response.
----------
Parameters:
_this - STRING: Data string which contains the two conversation participants and the response name. Trick to bypass engine limitation in passing additional arguments via dialog EHs. - "['IP_Main', 'IP_Buddy', 'MyFirstConversation']"
*/

private ["_hiddenData", "_first", "_second", "_selectedResponse"];
_hiddenData = call compile _this;

_first = _hiddenData select 0;
_second = _hiddenData select 1;
_selectedResponse = _hiddenData select 2;

call IP_fnc_closeConversation;
[_first, _second, _selectedResponse] spawn IP_fnc_openConversation;