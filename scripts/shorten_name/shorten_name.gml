// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function shorten_name(_str, _limit){
	if(string_length(_str)<=_limit) return _str;
	else return string_copy(_str, 1, _limit)+"...";
}