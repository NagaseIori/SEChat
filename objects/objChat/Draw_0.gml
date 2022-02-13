
draw_surface(surf, x, y);

var text = "> "+msg_now;

if(global.Focusing == 0) {
	text += cursor;
}

scribble(text)
.starting_format(CN_FONT, global.fr_col)
.align(fa_left, fa_top)
.draw(x, y+650);

draw_reset();