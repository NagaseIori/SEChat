/// @description Insert description here
// You can write your code in this editor

image_spr = -1;

// Shader Init
surf = surface_create(1366, 768);
last_radius = 0;
u_size = shader_get_uniform(shd_gaussian_blur, "size");