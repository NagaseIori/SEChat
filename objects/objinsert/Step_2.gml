/// @description Draw on surface
// You can write your code in this editor

surface_set_target(surf);
draw_set_alpha(n_alpha);

// draw rectangle input bar
draw_set_color(global.fr_col);
draw_rectangle(0, 0, width, height, false);

// draw text
draw_set_color(global.bg_col);
if(transparent) {
	draw_set_alpha(1.0);
	gpu_set_blendmode_ext(bm_zero, bm_inv_src_alpha);
	gpu_set_colorwriteenable(false, false, false, true);
}
scribble(contains+(global.Focusing == id? cursor : ""))
.align(fa_left, fa_middle)
.draw(3, height/2);

draw_reset();
surface_reset_target();