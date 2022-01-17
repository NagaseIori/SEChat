// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function chat_msg(_str){
	if(!instance_exists(objChat)) return;
	var _hash;
	if(argument_count==2)
		_hash = argument[1];
	else
		_hash = "<NULL>";
	objChat.msg_line[objChat.tot_line] = _str;
	objChat.hash_line[objChat.tot_line] = _hash;
	objChat.type_line[objChat.tot_line] = "text";
	objChat.spr_line[objChat.tot_line] = undefined;
	objChat.tot_line++;
	objChat.below = 0;
	audio_play_sound(sndText, 1, 0);
}