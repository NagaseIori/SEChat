/// @description  dec_to_hex(dec)
/// @param dec
function dec_to_hex(argument0) {
	//
	//  Returns a string of hexadecimal digits (4 bits each)
	//  representing the given decimal integer. Hexadecimal
	//  strings are padded to byte-sized pairs of digits.
	//
	//      dec         non-negative integer, real
	//
	/// GMLscripts.com/license
	// has been adapted
    var dec, hex, h, byte, hi, lo;
    dec = argument0;
    if (dec) hex = "" else hex="0";
    h = "0123456789ABCDEF";
    while (dec) {
        byte = dec & 255;
        hi = string_char_at(h, byte div 16 + 1);
        lo = string_char_at(h, byte mod 16 + 1);
        hex = iff(hi!="0", hi, "") + lo + hex;
        dec = dec >> 8;
    }
    return hex;
}

function map_ifload(_map, _key, _val){
	if(ds_map_exists(_map, _key))
		return _map[? _key];
	return _val;
}

function rainbow_judge(_str){
	if(string_count("NEO", _str)==2 && string_count("SKY", _str)==1 && string_count("MAP", _str)==1)
		return 1;
	if(string_count("虹色", _str)==1 && (string_count("Passions", _str)==1 || string_count("passions", _str)==1))
		return 1;
}

function iff(argument0, argument1, argument2) {
	if argument0 return argument1 return argument2
}

function lerp_ADI(_x, _y, _amt){
	return lerp(_x, _y, (cos((_amt+ 1) * pi) / 2.0) + 0.5);
}

function lerp_OSI(_x, _y, _amt){
	return lerp(_x, _y, (_amt-1) * (_amt-1) * ((2+ 1) *( _amt-1) + 2)+1);
}

/// @description  hmac_sha1( key, string )
/// @param  key
/// @param  string 
function hmac_sha1(argument0, argument1) {
	//  
	//  Implementation of the HMAC algorithm using the SHA1 hash function.
	//  This algorithm is typically used for web authorisation, especially
	//  when using the OAuth standard.
	//  
	//      key          encryption key, string
	//      string       plaintext to encrypt, string
	//  
	/// GMLscripts.com/license

	{
	    var key = argument0;
	    var str = argument1;
    
	    //Create reference string for decimal hex value look-up (because of GM's
	    //silly string indexing, this reference returns N+1)
	    var hexRef = "0123456789abcdef";
      
	    //Create buffers to hold our data. We use buffers rather than strings because
	    //0x00 - the NULL character in ASCII - typically terminates a string and may
	    //cause weirdness.
	    var buf_key      = buffer_create( 64, buffer_fixed, 1 );
    
	    //64-bytes of padding and then enough room for the string
	    var buf_innerPad = buffer_create( 64 + string_length( str ), buffer_fixed, 1 );
    
	    //NB - Using 84 here - SHA1 returns 20 bytes of data and we append that to
	    //64-bytes of padding
	    var buf_outerPad = buffer_create( 84, buffer_fixed, 1 );
    
	    if ( string_length( key ) > 64 ) {
    
	        //If the key is longer than SHA1's block size, we hash the key and use
	        //that instead.
	        var sha = sha1_string_utf8( key );
        
	        //Since SHA1 returns a hex *string*, we need to turn that into 8-bit bytes.
	        for( var n = 1; n <= 40; n += 2 ) buffer_write( buf_key, buffer_u8,
	            string_pos( string_char_at( sha, n+1 ), hexRef )
	        + ( string_pos( string_char_at( sha, n ), hexRef ) * 16 ) - 17 );
        
	    } else {
        
	        //If the key is smaller than SHA1's block size, just use the key. Since
	        //we're in a 64 byte buffer, it automatically pads with 0x00
	        buffer_write( buf_key, buffer_text, key );
	    }
    
	    for( var n = 0; n < 64; n++ ) {
	        var keyVal = buffer_peek( buf_key, n, buffer_u8 );
        
	        //Bitwise XOR between the inner/outer padding and the key
	        buffer_poke( buf_innerPad, n, buffer_u8, $36 ^ keyVal );
	        buffer_poke( buf_outerPad, n, buffer_u8, $5C ^ keyVal );
	    }
    
	    //Seek to the end of the padding  for both the inner and outer pads
	    buffer_seek( buf_innerPad, buffer_seek_start, 64 );
	    buffer_seek( buf_outerPad, buffer_seek_start, 64 );
    
	    //Append the string to encrypt
	    buffer_write( buf_innerPad, buffer_text, str );
    
	    //Apply SHA1 to (innerPad + string)
	    var sha = buffer_sha1( buf_innerPad, 0, buffer_tell( buf_innerPad ) );
    
	    //Turn the SHA1 output into bytes and append this to the outer pad
	    for( var n = 1; n <= 40; n += 2 ) buffer_write( buf_outerPad, buffer_u8,
	        string_pos( string_char_at( sha, n+1 ), hexRef )
	    + ( string_pos( string_char_at( sha, n ), hexRef ) * 16 ) - 17 );
    
	    //Apply SHA1 to (outerPad + result)
	    var result = buffer_sha1( buf_outerPad, 0, buffer_tell( buf_outerPad ) );
    
	    buffer_delete( buf_key );
	    buffer_delete( buf_innerPad );
	    buffer_delete( buf_outerPad );
    
	    return result;
	}
}

function mouse_inbound(_x, _y, _width, _height){
	var _mx = mouse_x, _my = mouse_y;
	return _mx>=_x && _mx<=_x+_width && _my>=_y && _my<=_y+_height;
}

function move_camera(_x, _y){
	objCamera.r_x = camera_get_view_x(view_camera[0])/window_get_width();
	objCamera.r_y = camera_get_view_y(view_camera[0])/window_get_height();
	objCamera.aim_x = _x;
	objCamera.aim_y = 0;
	objCamera.status = 1;
}

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

function draw_reset(){
	draw_set_alpha(1.0);
	draw_set_color(c_black);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	gpu_set_blendmode(bm_normal);
	gpu_set_colorwriteenable(true, true, true, true);
	shader_reset();
}

function compress_sprite(_spr, _scale){
	var _w = sprite_get_width(_spr);
	var _h = sprite_get_height(_spr);
	_w = ceil(_w*_scale);
	_h = ceil(_h*_scale);
	
	var _surf = surface_create(_w, _h);
	draw_clear_alpha(c_black, 0);
	draw_reset();
	surface_set_target(_surf);
	better_scaling_draw_sprite(_spr, 0, 0, 0, _scale, _scale, 0, c_white, 1, 1);
	
	var _rspr = sprite_create_from_surface(_surf, 0, 0, _w, _h, 0, 0, 0, 0);
	
	sprite_delete(_spr);
	surface_reset_target();
	surface_free(_surf);
	
	return _rspr; 
}

function shorten_name(_str, _limit){
	if(string_length(_str)<=_limit) return _str;
	else return string_copy(_str, 1, _limit)+"...";
}

function rc4_buff(_a, _b, _c, _d){
	return rc4_buff_ext(buffer_get_address(_a), _b, _c, _d);
}

function random_string(_length) {
	randomize();
	var dict = "012345678ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
	var length = string_length(dict);
	var ret = "";
	repeat (_length)
		ret+=string_char_at(dict, irandom_range(1, length));
	return ret;
}

/// Fix Windows' API problem.
function add_quote(_str){
	return "\"" + _str + "\" ";
}
function add_pref(_str){
	return "\\\\?\\" + _str;
}

/// Music player related.
function fmod_stopchan(){
	FMODGMS_Chan_StopChannel(global.fmod_channel);
	global.fmod_is_paused = 0;
	global.fmod_is_playing = 0;
	global.fmod_sound_index = -1;
}
function shift_hue() {
	// Shifts the hue using modular arithmetic
	{
	    hue_shift = (hue_shift + argument[0]) mod 256;
	    draw_set_color(make_color_hsv((hue+hue_shift) mod 256,128,255));
	}
}

// by @yellowafterlife
function string_split(_string, _delimiter) {
	var s = argument[0], d = argument[1];
	
	if(!variable_global_exists("string_split_list"))
		global.string_split_list = ds_list_create();
	
	var rl = global.string_split_list;
	var p = string_pos(d, s), o = 1;
	var dl = string_length(d);
	ds_list_clear(rl);
	if (dl) while (p) {
	    ds_list_add(rl, string_copy(s, o, p - o));
	    o = p + dl;
	    p = string_pos_ext(d, s, o);
	}
	ds_list_add(rl, string_delete(s, 1, o - 1));
	// create an array and store results:
	var rn = ds_list_size(rl);
	var rw = array_create(rn);
	for (p = 0; p < rn; p++) rw[p] = rl[|p];
	return rw;
}

function absolute_pos_x(_x) {
	return _x * display_get_gui_width();
}

function absolute_pos_y(_y) {
	return _y * display_get_gui_height();
}
