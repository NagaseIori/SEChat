draw_set_color(c_white);

uni_resolution_hoz = shader_get_uniform(shd_gaussian_horizontal,"resolution");
uni_resolution_vert = shader_get_uniform(shd_gaussian_vertical,"resolution");
var_resolution_x = camera_get_view_width(0);
var_resolution_y = camera_get_view_height(0);

uni_blur_amount_hoz = shader_get_uniform(shd_gaussian_vertical,"blur_amount");
uni_blur_amount_vert = shader_get_uniform(shd_gaussian_horizontal,"blur_amount");
var_blur_amount = 1.0;

shader_enabled = true;
final_surface = surface_create(camera_get_view_width(0), camera_get_view_height(0));

surf = surface_create(camera_get_view_width(0), camera_get_view_height(0));
view_set_surface_id(0, surf);