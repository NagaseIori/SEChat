// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_reset(){
	draw_set_alpha(1.0);
	draw_set_color(c_black);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	gpu_set_blendmode(bm_normal);
	gpu_set_colorwriteenable(true, true, true, true);
	shader_reset();
}