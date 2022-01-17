/// @description Insert description here
// You can write your code in this editor

if(status) {
	var _cam = view_camera[0];
	var cam_x = lerp_ADI(r_x, aim_x, time_n/(ani_time*room_speed));
	var cam_y = lerp_ADI(r_y, aim_y, time_n/(ani_time*room_speed));
	camera_set_view_pos(_cam, cam_x, cam_y);
	time_n++;
	if(time_n>ani_time*room_speed) {
		status = 0;
	}
}