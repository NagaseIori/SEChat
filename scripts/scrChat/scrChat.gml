/*
    scrChat
    Most functions are related to objChat.
    The part to send messages to the frontend.
*/

///@description An image message.
function chat_img(_snd, _spr){
	with(objChat) {
		var _nsep = objChat.sep;
		var _gscale = min(_nsep*global.img_lines/sprite_get_height(_spr), 1000/sprite_get_width(_spr), 1.0);
		var _rline = ceil(sprite_get_height(_spr)*_gscale/_nsep)+1;
		msg_line[tot_line] = "";
		type_line[tot_line] = "image";
		spr_line[tot_line] = compress_sprite(_spr, _gscale);
		sender_line[tot_line] = _snd;
		num_line[tot_line] = _rline;
		tot_line += _rline;
		aim_below = 0;
		below += _rline;
	}
	audio_play_sound(sndText, 1, 0);
}

///@description A text message.
function chat_msg(_str, _snd=""){
	if(!instance_exists(objChat)) return;
	with(objChat) {
		msg_line[tot_line] = _str;
		type_line[tot_line] = "text";
		sender_line[tot_line] = _snd;
		tot_line ++;
		below += 1;
		aim_below = 0;
	}
	audio_play_sound(sndText, 1, 0);
}

///@description A file transfer message.
function chat_file(_snd, _id, _type){
	with(objChat) {
		msg_line[tot_line] = "";
		type_line[tot_line] = "file";
		spr_line[tot_line] = _id;
		sender_line[tot_line] = _snd;
		num_line[tot_line] = _type;
		file_line[tot_line] = shorten_name(_id.file_name, 20);
		tot_line += 2;
		aim_below = 0;
		below += 2;
	}
	audio_play_sound(sndText, 1, 0);
}

///@description A music player message.
function chat_music(_snd, _file, _autoplay){
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
	with(objChat) {
		msg_line[tot_line] = "";
		type_line[tot_line] = "music";
		sender_line[tot_line] = _snd;
		num_line[tot_line] = _rline;
		spr_line[tot_line] = _inst;
		tot_line += _rline;
		aim_below = 0;
		below += _rline;
	}
	// objChat.msg_line[objChat.tot_line] = _str;
	// objChat.type_line[objChat.tot_line] = "music";
	// objChat.spr_line[objChat.tot_line] = _inst;
	// objChat.num_line[objChat.tot_line] = _rline;
	// objChat.tot_line+=_rline;
	// objChat.aim_below = 0;
	// objChat.below += _rline;
	audio_play_sound(sndText, 1, 0);
}