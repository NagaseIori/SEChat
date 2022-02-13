
var vx = camera_get_view_x(view_camera[0]);
var vy = camera_get_view_y(view_camera[0]);

switch(global.bg_type) {
	case 0:
		draw_set_color(global.bg_col);
		draw_rectangle(0, 0, room_width, room_height, false);
		break;
	case 1:
		if(!sprite_exists(image_spr)) {
			event_user(0);
			if(!sprite_exists(image_spr)) break;
		}
		if(global.bg_radius) {
			if(global.bg_radius != last_radius) {
				surface_set_target(surf);
				shader_set(shd_gaussian_blur);
					shader_set_uniform_f(u_size, sprite_get_width(image_spr), sprite_get_height(image_spr), global.bg_radius);
					draw_sprite(image_spr, 0, 0, 0);
				shader_reset(); 
				surface_reset_target();
			}
			draw_surface(surf, vx, vy);
			last_radius = global.bg_radius;
		}
		else
			draw_sprite(image_spr, 0, vx, vy);
		break;
}


draw_reset();