/// @description Insert description here
// You can write your code in this editor

type = 0 // 0 color 1 image
image_spr = undefined;

// Shader Init
u_size = shader_get_uniform(shd_gaussian_blur, "size");
u_reso_h = shader_get_uniform(shd_gaussian_horizontal, "resolution");
u_amt_h = shader_get_uniform(shd_gaussian_horizontal, "blur_amount");
u_reso_v = shader_get_uniform(shd_gaussian_vertical, "resolution");
u_amt_v = shader_get_uniform(shd_gaussian_vertical, "blur_amount");
temp_surf = surface_create(1366, 768);