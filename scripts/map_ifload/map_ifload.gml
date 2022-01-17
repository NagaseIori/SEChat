// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function map_ifload(_map, _key, _val){
	if(ds_map_exists(_map, _key))
		return _map[? _key];
	return _val;
}