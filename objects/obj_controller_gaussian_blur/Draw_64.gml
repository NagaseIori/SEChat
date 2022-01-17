var_mouse_pos_x = mouse_x - camera_get_view_x(0);
var_mouse_pos_y = mouse_y - camera_get_view_y(0);

//Do horizontal blur first
surface_set_target(final_surface);
draw_clear_alpha(c_white, 1);
/*if shader_enabled */shader_set(shd_gaussian_horizontal);
    shader_set_uniform_f(uni_resolution_hoz, var_resolution_x, var_resolution_y);
    shader_set_uniform_f(uni_blur_amount_hoz, var_blur_amount);
    draw_surface(surf,0,0);
shader_reset();
surface_reset_target();

//Do vertical blur last
if shader_enabled shader_set(shd_gaussian_vertical);
    shader_set_uniform_f(uni_resolution_vert, var_resolution_x, var_resolution_y);
    shader_set_uniform_f(uni_blur_amount_vert, var_blur_amount);
    draw_surface(final_surface,0,0);
shader_reset();

draw_text(0,0,string_hash_to_newline("Real FPS: "+string(fps_real)));
draw_text(0,12,string_hash_to_newline("Blur amount(Q & A to adjust): "+string(var_blur_amount)));

draw_text(0,60,string_hash_to_newline("Spacebar to toggle shader"));
draw_text(0,72,string_hash_to_newline("Escape key to exit"));

