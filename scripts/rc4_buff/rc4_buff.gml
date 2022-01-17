// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function rc4_buff(_a, _b, _c, _d){
	return rc4_buff_ext(buffer_get_address(_a), _b, _c, _d);
}