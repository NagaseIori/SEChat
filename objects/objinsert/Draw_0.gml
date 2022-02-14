 /// @description Insert description here
// You can write your code in this editor

draw_surface(surf, x, y);

// draw ID
if(show_bar_id) {
	scribble("[b]"+(bar_name!="null"?bar_name:bar_id))
	.blend(global.fr_col, 1.0)
	.align(fa_left, fa_middle)
	.draw(x, y-height/2);
}