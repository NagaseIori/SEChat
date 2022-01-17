/// @description Detect if in chat screen
// You can write your code in this editor

if(!in_chat) {
	instance_deactivate_object(id);
	return;
}
else in_chat = false;


var _surf = objChat.surf, _rx = x-objChat.x, _ry = y-objChat.y;

surface_set_target(_surf);
if(surface_exists(surf))
	draw_surface(surf, _rx, _ry);
surface_reset_target();
