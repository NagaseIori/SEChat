// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function move_camera(_x, _y){
	objCamera.r_x = camera_get_view_x(view_camera[0]);
	objCamera.r_y = camera_get_view_y(view_camera[0]);
	objCamera.time_n = 0;
	objCamera.aim_x = _x;
	objCamera.aim_y = _y;
	objCamera.status = 1;
}