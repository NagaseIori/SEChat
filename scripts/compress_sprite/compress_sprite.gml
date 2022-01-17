// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function compress_sprite(_spr, _scale){
	var _w = sprite_get_width(_spr);
	var _h = sprite_get_height(_spr);
	_w = ceil(_w*_scale);
	_h = ceil(_h*_scale);
	
	var _surf = surface_create(_w, _h);
	draw_reset();
	surface_set_target(_surf);
	better_scaling_draw_sprite(_spr, 0, 0, 0, _scale, _scale, 0, c_white, 1, 1);
	
	var _rspr = sprite_create_from_surface(_surf, 0, 0, _w, _h, 0, 0, 0, 0);
	
	sprite_delete(_spr);
	surface_reset_target();
	surface_free(_surf);
	
	return _rspr; 
}