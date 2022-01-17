// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function clear_history() {
	var i;
	fmod_stopchan();
	for(i=0; i<objChat.tot_line;) {
		switch(objChat.type_line[i]) {
			case "image":
				sprite_delete(objChat.spr_line[i]);
				objChat.type_line[i] = undefined;
				i+=objChat.num_line[i]+1;
				break;
			case "text":
				objChat.type_line[i] = undefined;
				i++;
				break;
			case "file":
				objChat.type_line[i] = undefined;
				i+=2;
				break;
			case "music":
				instance_destroy(objChat.spr_line[i]);
				objChat.type_line[i] = undefined;
				i+=objChat.num_line[i];
				break;
			default:
				objChat.type_line[i] = undefined;
				break;
		}
	}
	objChat.tot_line = 0;
	objChat.below = 0;
}