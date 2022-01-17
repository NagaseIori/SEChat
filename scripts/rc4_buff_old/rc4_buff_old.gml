/**
Encrypt the buffer in-place using RC4.
*/

function rc4_buff_old(buffer, key, offset, length){
	var i, j, k, s, temp, keyLength, pos;
	keyLength = string_byte_length(key);
	for (i = 255; i >= 0; --i) {
	    s[i] = i;
	}
	j = 0;
	k = 0;
	for (i = 0; i <= 255; ++i) {
	    j = (j + s[i] + string_byte_at(key, k)) & ((1<<8)-1);
	    temp = s[i];
	    s[i] = s[j];
	    s[j] = temp;
		k = (k+1==keyLength) ? 0 : k+1;
	}
	i = 0;
	j = 0;
	pos = 0;
	buffer_seek(buffer, buffer_seek_start, offset);
	var currentByte;
	repeat (length) {
	    i = (i+1) & ((1<<8)-1);
	    j = (j+s[i]) & ((1<<8)-1);
	    temp = s[i];
	    s[i] = s[j];
	    s[j] = temp;
	    currentByte = buffer_peek(buffer, buffer_tell(buffer), buffer_u8);
	    buffer_write(buffer, buffer_u8, s[(s[i]+s[j]) & ((1<<8)-1)] ^ currentByte);
	}
	buffer_seek(buffer, buffer_seek_start, offset);
}