/// @description Insert description here
// You can write your code in this editor

draw_surface(surf, x, y);

draw_set_font(fZpix14);
draw_set_color(global.fr_col);
draw_set_alpha(1.0);

if(global.Focusing == 0)
	draw_text(x, y+650, "> "+msg_now+cursor);
else
	draw_text(x, y+650, "> "+msg_now);

draw_reset();