 /// @description Insert description here
// You can write your code in this editor

draw_surface(surf, x, y);

// draw ID
if(show_bar_id) {
	draw_set_color(global.fr_col);
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	draw_text(x, y-height/2, bar_id);
}