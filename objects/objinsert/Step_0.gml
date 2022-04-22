/// @description Insert description here
// You can write your code in this editor

if(!surface_exists(surf)) {
	surf = surface_create(width, height);
} 

if(global.Focusing == id) {
	alpha = 1.0;
	if(mouse_check_button_pressed(mb_right)) {
		keyboard_string = clipboard_get_text();
	}
	if(only_number)
		keyboard_string = string_digits(keyboard_string);
		
	if(string_length(keyboard_string)>max_length)
		keyboard_string = contains;
	else
		contains = keyboard_string;
	
}
else {
	alpha = 0.7;
}

if(abs(n_alpha-alpha)>0.6*6/room_speed) n_alpha += sign(alpha-n_alpha)*0.6*6/room_speed;



timing ++;