// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function chat_file(_str, _id, _type){
	var _hash = "<NULL>";
	objChat.msg_line[objChat.tot_line] = _str;
	objChat.hash_line[objChat.tot_line] = _hash;
	objChat.type_line[objChat.tot_line] = "file";
	objChat.spr_line[objChat.tot_line] = _id;
	objChat.num_line[objChat.tot_line] = _type; // "sent" or "recv"
	objChat.file_line[objChat.tot_line] = shorten_name(_id.file_name, 20);
	objChat.tot_line+=2;
	objChat.below = 0;
	audio_play_sound(sndText, 1, 0);
}