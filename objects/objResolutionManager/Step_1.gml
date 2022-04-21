
var nw = window_get_width();
var nh = window_get_height();

with(all) {
	if(!variable_instance_exists(id, "rel_x")) {
		rel_x = x/nw;
		rel_y = y/nh;
	}
}

if(nw != disize_w || nh != disize_h) {
	surface_resize(application_surface, nw, nh);
	// view_set_wport(0, nw);
	// view_set_hport(0, nh);
	camera_set_view_size(view_camera[0], nw, nh);
	display_set_gui_size(nw, nh);
	with(objBackground) {
		if(sprite_exists(image_spr))
			sprite_delete(image_spr);
	}
	objChat._chat_resize();
	with(all) {
		x = rel_x * nw;
		y = rel_y * nh;
	}
	
	disize_h = nh;
	disize_w = nw;
}
