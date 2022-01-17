// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function save_settings(){
	var _map = ds_map_create();
	_map[? "FPS"] = room_speed;
	_map[? "name"] = global.user_name;
	_map[? "loc_port"] = global.local_port;
	_map[? "pri_key"] = global.pri_key;
	_map[? "serv_addr"] = global.serv_addr;
	_map[? "serv_port"] = global.serv_port;
	_map[? "whl_spd"] = global.wheel_speed;
	_map[? "fr_col"] = global.fr_col;
	_map[? "bg_col"] = global.bg_col;
	_map[? "bg_type"] = global.bg_type;
	_map[? "bg_file"] = global.bg_img_file;
	_map[? "bg_radius"] = global.bg_radius;
	_map[? "img_lines"] = global.img_lines;
	
	var _file = file_text_open_write("settings.ini");
	file_text_write_string(_file, json_encode(_map));
	file_text_close(_file);
	
	ds_map_destroy(_map);
}