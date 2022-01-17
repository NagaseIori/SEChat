// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function rsa_decrypt(_buff){
	var _exedir = working_directory + "openssl_x86\\bin\\openssl.exe";
	var _input = working_directory + "temp1";
	var _output = working_directory + "temp_res1";
	var _key = working_directory + "key.pem";
	//var _ppubkey = add_pref(_pubkey);
	buffer_save(_buff, add_pref(_input));
	
	if(!file_exists(_key)) {
		show_error("System: PRIVATE KEY NOT FOUND."+string(buffer_get_size(_buff)), true);
		return -1;
	}
	
	// openssl rsautl -decrypt -in input.file -inkey key.pem -out output.file
	 show_debug_message(add_quote(_exedir) + "rsautl -decrypt -in "+
					add_quote(_input) + "-inkey " + add_quote(_key) + "-out " +
					add_quote(_output));
	execute_shell(add_quote(_exedir) + "rsautl -decrypt -in "+
					add_quote(_input) + "-inkey " + add_quote(_key) + "-out " +
					add_quote(_output), true);
	
	if(!file_exists(_output)) {
		show_error("System: RSA DECRYPTION FAILED."+string(buffer_get_size(_buff)), true);
		return -1;
	}
	
	var _buf = buffer_load(add_pref(_output));
	file_delete(_input);
	file_delete(_output);
	return _buf;
}