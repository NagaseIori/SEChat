// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function random_string(_length) {
	var dict = "012345678ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz*!@#$%^&()_+-=[]{}:;,.<>?/";
	var length = string_length(dict);
	var ret = "";
	repeat (_length)
		ret+=string_char_at(dict, irandom_range(1, length));
	return ret;
}