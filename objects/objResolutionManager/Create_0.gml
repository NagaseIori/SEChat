disize_w = window_get_width();
disize_h = window_get_height();

resizing = false;

default_size_w = disize_w;
default_size_h = disize_h;

var nw = default_size_w;
var nh = default_size_h;

with(all) {
	rel_x = x/nw;
	rel_y = y/nh;
}

with(objCamera) {
	cam_rel_x = camera_get_view_x(view_camera[0])/nw;
	cam_rel_y = camera_get_view_y(view_camera[0])/nh;
}