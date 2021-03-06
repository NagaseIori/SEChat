
#macro STD_FPS 120
#macro CN_FONT "fSYH14"
#macro CN_FONT_BOLD "fSYH14b"

room_speed = display_get_frequency();
global.m_bar = ds_map_create();
global.user_name = "你的名字是...";
global.local_port = 1234;
global.client = undefined;
global.m_file = ds_map_create();
global.m_file_recv = ds_map_create();
global.pri_key = "-";
global.rc4_key = random_string(128);
global.UUID = uuid_generate();
global.cli_UUID = "";
global.serv_port = "";
global.serv_addr = "";
global.wheel_speed = 5;
global.bg_col = $000000		// Background Color
global.fr_col = $000000		// Front Color
global.bg_radius = 10;		// Bg Blur Radius
global.bg_type = 1;			// Bg type: 0 color 1 image
global.bg_img_file = "background.png";
global.fmod_state = 1;
global.img_lines = 10;

load_settings();

window_set_caption("SEChat Alpha v220421");

// Create Downloads Directory
if(!directory_exists(program_directory + "Downloads"))
	directory_create(program_directory + "Downloads");

// RSA Init
if(!rsa_check())
	rsa_generate_key(1024);

// Networking Init
network_set_config(network_config_connect_timeout, 3000);

// FMODGMS Init
if(FMODGMS_Util_Handshake() != "FMODGMS is working.") {
	chat_msg("[Error] FMODGMS 没有被正确加载。部分功能无法正常运作。", "System");
	global.fmod_state = 0;
}
else {
	FMODGMS_Sys_Create();
	FMODGMS_Sys_Initialize(32);
	FMODGMS_FFT_Init(128);
	global.fmod_numbins = FMODGMS_FFT_Get_NumBins();
	global.fmod_channel = FMODGMS_Chan_CreateChannel();
	global.fmod_is_playing = false;
	global.fmod_is_paused = false;
	global.fmod_sound_index = -1;
}

// Font init
scribble_font_set_default(CN_FONT);
scribble_font_set_style_family(CN_FONT, CN_FONT_BOLD, CN_FONT_BOLD, CN_FONT_BOLD);

room_goto(Room1);

