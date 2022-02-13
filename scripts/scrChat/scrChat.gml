/*
    scrChat
    Most functions are related to objChat.
    The part to send messages to the frontend.
*/

///@description An image message.
function chat_img(_str, _spr){
	var _hash;
	_hash = "<NULL>";
	objChat.msg_line[objChat.tot_line] = _str;
	objChat.hash_line[objChat.tot_line] = _hash;
	objChat.type_line[objChat.tot_line] = "image";
	
	var _nsep = objChat.sep;
	var _gscale = min(_nsep*global.img_lines/sprite_get_height(_spr), 1000/sprite_get_width(_spr), 1.0);
	var _rline = ceil(sprite_get_height(_spr)*_gscale/_nsep)+1;
	
	objChat.spr_line[objChat.tot_line] = compress_sprite(_spr, _gscale);
	objChat.num_line[objChat.tot_line] = _rline;
	objChat.tot_line+=1+_rline;
	objChat.below = 0;
	audio_play_sound(sndText, 1, 0);
}

///@description A text message.
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

///@description A file transfer message.
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

///@description A music player message.
function chat_music(_str, _file, _autoplay){
	if(global.fmod_state == 0) return;
	var _inst = instance_create_depth(0, 0, -1, objMusicPlayer);
	_inst.sound_index = FMODGMS_Snd_LoadStream(_file);
	_inst.sound_name = filename_name(_file);
	_file = filename_name(_file);
	_inst.rainbow = rainbow_judge(_file);
	if((!global.fmod_is_playing || global.fmod_is_paused) && _autoplay) {
		if(global.fmod_is_paused) fmod_stopchan();
		global.fmod_is_playing = 1;
		global.fmod_is_paused = 0;
		global.fmod_sound_index = _inst.sound_index;
		FMODGMS_Snd_PlaySound(_inst.sound_index, global.fmod_channel);
	}
	var _rline = ceil(150/objChat.sep)+1;
	objChat.msg_line[objChat.tot_line] = _str;
	objChat.type_line[objChat.tot_line] = "music";
	objChat.spr_line[objChat.tot_line] = _inst;
	objChat.num_line[objChat.tot_line] = _rline;
	objChat.tot_line+=_rline;
	objChat.below = 0;
	audio_play_sound(sndText, 1, 0);
}