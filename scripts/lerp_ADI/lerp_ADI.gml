// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function lerp_ADI(_x, _y, _amt){
	return lerp(_x, _y, (cos((_amt+ 1) * pi) / 2.0) + 0.5);
}