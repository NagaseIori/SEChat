/// @description uuid_array_implode()
function uuid_array_implode(argument0) {
	var s = "", i=0, a = argument0, sep = "-";

	repeat 8 s += a[i++];
	s += sep;

	repeat 4 s += a[i++];
	s += sep;

	repeat 4 s += a[i++];
	s += sep;

	repeat 4 s += a[i++];
	s += sep;

	repeat 12 s += a[i++];

	return s;
}
