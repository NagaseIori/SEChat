/// @description Check mouse
// You can write your code in this editor

if(mouse_check_button_pressed(mb_left)) {
	if(mouse_inbound(x, y, width, height)) {
		n_alpha = 0.7;
		button_trigger(bar_id);
	}
} 

if(mouse_inbound(x, y, width, height)) {
	//if(alpha!=0.9)
	//	audio_play_sound(sndSelect, 1, 0);
	alpha = 1.0;
}
else
	alpha = 0.7;