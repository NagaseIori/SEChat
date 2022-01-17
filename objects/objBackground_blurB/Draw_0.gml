/// @description Insert description here
// You can write your code in this editor

var vx = camera_get_view_x(view_camera[0]);
var vy = camera_get_view_y(view_camera[0]);

switch(type) {
	case 0:
		draw_set_color(global.bg_col);
		draw_rectangle(0, 0, room_width, room_height, false);
		break;
	case 1:
		if(global.bg_radius) {
			
			surface_set_target(temp_surf);
			draw_clear_alpha(c_white, 1.0);
			shader_set(shd_gaussian_horizontal);
				//shader_set_uniform_f(u_size, sprite_get_width(image_spr), sprite_get_height(image_spr), global.bg_radius);
				shader_set_uniform_f(u_reso_h, sprite_get_width(image_spr), sprite_get_height(image_spr));
				shader_set_uniform_f(u_amt_h, global.bg_radius);
				draw_sprite(image_spr, 0, 0, 0);
			shader_reset();
			surface_reset_target();
			
			shader_set(shd_gaussian_vertical);
				//shader_set_uniform_f(u_size, sprite_get_width(image_spr), sprite_get_height(image_spr), global.bg_radius);
				shader_set_uniform_f(u_reso_v, sprite_get_width(image_spr), sprite_get_height(image_spr));
				shader_set_uniform_f(u_amt_v, global.bg_radius);
				draw_surface(temp_surf, vx, vy);
			shader_reset();
		}
		else
			draw_sprite(image_spr, 0, vx, vy);
		break;
}


draw_reset();