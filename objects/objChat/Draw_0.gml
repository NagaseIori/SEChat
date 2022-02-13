/// @description Insert description here
// You can write your code in this editor

draw_surface(surf, x, y);

var text = "> "+msg_now;

if(global.Focusing == 0) {
	text += cursor;
}

scribble(text)
.blend(global.fr_col, 1.0)
.align(fa_left, fa_top)
.draw(x, y+650);

draw_reset();