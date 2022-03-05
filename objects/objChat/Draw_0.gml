
draw_surface(surf, x, y);

var text = "> "+msg_now;
var ntext = "";
for(var i=1, j=string_length(text); i<=j; i++) {
	switch(string_char_at(text, i)) {
		case "[":
			ntext += "[b][[";
			break;
		case "]":
			ntext += "][/]";
			break;
		default:
			ntext+=string_char_at(text, i);
	}
	
}
text=ntext;

if(global.Focusing == 0) {
	text += cursor;
}

scribble(text)
.starting_format(CN_FONT, global.fr_col)
.align(fa_left, fa_top)
.draw(x, y+650);

draw_reset();