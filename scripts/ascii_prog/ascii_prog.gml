// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ascii_prog(_prog, _length){
	var _progl = ceil(_length*_prog);
	var ret = "[";
	var i;
	for(i=0; i<_progl; i++)
		ret+="#";
	for(i=0; i<_length-_progl; i++)
		ret+="_";
	ret+="]  "+string(_prog*100)+"%";
	return ret;
}