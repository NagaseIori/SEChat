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
