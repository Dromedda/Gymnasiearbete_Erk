#region Startup

	if (init) {
		group = irandom_range(1, 2);		
		init = false; 
	}

	if (room == rm_test) {		
		if (group == 1) {
			if ((!audio_is_playing(snd_background_main_1)) && (!audio_is_playing(snd_background_intro_1))) {
				if (!startup) {	
					music_random_decider = random_range(0, 10); 
					if (((music_random_decider <= 3) && (!startup_prev)) || (main_count >= 4)) {
						startup = true; 
						play_main = false; 
						main_count = 0; 
					} else {
						play_main = true; 
						startup = false; 
						main_count += 1; 
					}
				}
			}	
		
			if (startup) {
				if ((!audio_is_playing(snd_background_main_1)) && (!audio_is_playing(snd_background_intro_1))) {
					audio_play_sound(snd_background_intro_1, 2, false); 	
					startup_prev = true; 
					startup = false; 
				}
			}
		
			if (play_main) {
				if ((!audio_is_playing(snd_background_main_1)) && (!audio_is_playing(snd_background_intro_1))) {
					audio_play_sound(snd_background_main_1, 2, false); 	
					startup_prev = false;
				}
			}
		} else if (group == 2) {
			if ((!audio_is_playing(snd_background_main_2)) && (!audio_is_playing(snd_background_intro_2))) {
				if (!startup) {	
					music_random_decider = random_range(0, 10); 
					if (((music_random_decider <= 3) && (!startup_prev)) || (main_count >= 4)) {
						startup = true; 
						play_main = false; 
						main_count = 0; 
					} else {
						play_main = true; 
						startup = false; 
						main_count += 1; 
					}
				}
			}	
		
			if (startup) {
				if ((!audio_is_playing(snd_background_main_2)) && (!audio_is_playing(snd_background_intro_2))) {
					audio_play_sound(snd_background_intro_2, 2, false); 	
					startup_prev = true; 
					startup = false; 
				}
			}
		
			if (play_main) {
				if ((!audio_is_playing(snd_background_main_2)) && (!audio_is_playing(snd_background_intro_2))) {
					audio_play_sound(snd_background_main_2, 2, false); 	
					startup_prev = false;
				}
			}
		}
	
	}
	
	switch(group) {
		case 1: 
			if (audio_is_playing(snd_background_intro_2)) {
				audio_stop_sound(snd_background_intro_2); 		
			}
			if (audio_is_playing(snd_background_main_2)) {
				audio_stop_sound(snd_background_main_2); 		
			}
			break; 
		case 2: 
			if (audio_is_playing(snd_background_intro_1)) {
				audio_stop_sound(snd_background_intro_1); 		
			}
			if (audio_is_playing(snd_background_main_1)) {
				audio_stop_sound(snd_background_main_1); 		
			}
			break; 
	}
	
	if (stop_music == true) {
		audio_stop_all();
		stop_music = false; 
	}
	
#endregion