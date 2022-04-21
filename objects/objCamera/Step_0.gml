
var _cam = view_camera[0];
var _spd = lerp_spd*STD_FPS/room_speed; // Standardize the lerp speed.
r_x = lerp(r_x, aim_x, _spd);
r_y = lerp(r_y, aim_y, _spd);
var _nw = objResolutionManager.disize_w;
var _nh = objResolutionManager.disize_h;
camera_set_view_pos(_cam, r_x*_nw, r_y*_nh);