/// @description Load Image
// You can write your code in this editor
var _nspr = sprite_add(global.bg_img_file, 1, 0, 0, 0, 0);
if(_nspr<0) {
	chat_msg("[ERROR] 背景图片文件读取失败！");
	global.bg_type = 0;
	return;
}
var _cspr = compress_sprite(_nspr, max(1366/sprite_get_width(_nspr), 768/sprite_get_height(_nspr)));
sprite_delete(_nspr);
image_spr = _cspr;
last_radius = 0;
show_debug_message("Background has changed.");