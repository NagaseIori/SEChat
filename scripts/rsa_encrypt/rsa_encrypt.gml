// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function rsa_encrypt(_buff, _pubfile){
	var _exedir = working_directory + "openssl_x86\\bin\\openssl.exe";
	var _input = working_directory + "temp1";
	var _output = working_directory + "temp_res1";
	var _pubkey = working_directory + _pubfile;
	//var _ppubkey = add_pref(_pubkey);
	buffer_save(_buff, add_pref(_input));
	
	if(!file_exists(_pubkey)) {
		show_error("System: PUBLIC KEY NOT FOUND.", true);
		return -1;
	}
	
	// openssl rsautl -encrypt -in input.file -inkey pubkey.pem -pubin -out output.file
	 show_debug_message(add_quote(_exedir) + "rsautl -encrypt -in "+
					add_quote(_input) + "-inkey " + add_quote(_pubkey) + "-pubin -out " +
					add_quote(_output));
	execute_shell(add_quote(_exedir) + "rsautl -encrypt -in "+
					add_quote(_input) + "-inkey " + add_quote(_pubkey) + "-pubin -out " +
					add_quote(_output), true);
	
	if(!file_exists(_output)) {
		show_error("System: RSA ENCRYPTION FAILED.", true);
		return -1;
	}
	
	var _buf = buffer_load(add_pref(_output));
	if(buffer_get_size(_buf)==0) {
		show_error("System: RSA ENCRYPTION FAILED. (BUF)", true);
	}
	file_delete(_input);
	file_delete(_output);
	return _buf;
}