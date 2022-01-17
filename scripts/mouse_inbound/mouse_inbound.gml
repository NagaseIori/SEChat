// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function mouse_inbound(_x, _y, _width, _height){
	var _mx = mouse_x, _my = mouse_y;
	return _mx>=_x && _mx<=_x+_width && _my>=_y && _my<=_y+_height;
}