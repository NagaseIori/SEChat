// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function load_settings(){
	var _map = ds_map_create();
	var _file = file_text_open_read("settings.ini");
	if(_file<0) return;
	_map = json_decode(file_text_read_string(_file));
	file_text_close(_file);
	room_speed = _map[? "FPS"];
	global.user_name = _map[? "name"];
	global.local_port = _map[? "loc_port"];
	global.pri_key = _map[? "pri_key"];
	global.serv_addr = _map[? "serv_addr"];
	global.serv_port = _map[? "serv_port"];
	global.wheel_speed = _map[? "whl_spd"];
	global.fr_col = map_ifload(_map, "fr_col", global.fr_col);
	if(ds_map_exists(_map, "bg_col"))
		global.bg_col = _map[? "bg_col"];
	if(ds_map_exists(_map, "bg_type"))
		global.bg_type = _map[? "bg_type"];
	if(ds_map_exists(_map, "bg_radius"))
		global.bg_radius = _map[? "bg_radius"];
	if(ds_map_exists(_map, "bg_file"))
		global.bg_img_file = _map[? "bg_file"];
	if(ds_map_exists(_map, "load_file"))
		global.bg_img_file = _map[? "bg_file"];
	global.img_lines = map_ifload(_map, "img_lines", global.img_lines);
	
	ds_map_destroy(_map);
}