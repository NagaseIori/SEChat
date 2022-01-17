/// @description Check mouse
// You can write your code in this editor

if(mouse_check_button(mb_left)) {
	if(mouse_inbound(x, y, width, height)) {
		if(global.Focusing != id) audio_play_sound(sndSelect, 1, 0);
		global.Focusing = id;
		keyboard_string = contains;
	}
	else if(global.Focusing == id) {
		global.Focusing = 0;
		keyboard_string = objChat.msg_now;
	}
} 