// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
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