// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
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