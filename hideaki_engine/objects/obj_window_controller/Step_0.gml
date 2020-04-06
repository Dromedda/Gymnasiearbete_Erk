#region Fullscreen toggle

	var fullscreen_toggle_key = keyboard_check_pressed(vk_f11); 

	if (fullscreen_toggle_key) {
		fullscreen_toggle = !fullscreen_toggle; 	
	}
	
	window_set_fullscreen(fullscreen_toggle);

#endregion

#region Lock Mouse To the window

		if (window_get_fullscreen()) {
			window_mouse_set(clamp(window_mouse_get_x(),0,window_get_width()),clamp(window_mouse_get_y(),0,window_get_height()))
		}
	
#endregion