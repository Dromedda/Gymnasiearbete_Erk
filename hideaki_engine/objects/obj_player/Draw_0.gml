#region Set Font

	draw_set_font(fnt_standard);

#endregion

#region Reloading 
	
	if (reloading) { 
		instance_create_layer(x, y - 54, "Player", obj_player_reload_bar);
	} else if (instance_exists(obj_player_reload_bar)) {
		instance_destroy(obj_player_reload_bar);
	}	
	
#endregion

#region Flicker when hit

	if (!hit_by_enemy) {
		draw_self();
	} else {
		flicker_timer--; 
		if (flicker_timer <= 0) {
			draw_self();	
			flicker_timer = flicker_freq; 
		} 
	}
	
#endregion

#region Explode When hit

	if ((hit_by_enemy) || (keyboard_check_pressed(vk_f7))) {
		
		explode_scale *= .85; 
		
		if (explode_scale > 0.05) {
			draw_sprite_ext(sprite_index, image_index, x, y, explode_scale, explode_scale, 0, c_white, 1); 	
		}
	} else if (explode_scale != explode_scale_org) {
		explode_scale = explode_scale_org;
	}	

#endregion

#region Stamina Bar

	var s_bar_width = 32; 
	var s_bar_height = 4; 
	var s_bar_outline_colour = c_white; 
	var s_bar_fill_colour = c_aqua;
	var s_bar_y_offset = 32; 

	//draw_healthbar(x - 32, y + 32, x + 32, y + 28, stamina, c_black, c_lime, c_aqua, 0, true, false); 

	draw_set_color(c_black); 
	draw_rectangle(x - (s_bar_width/2), y + s_bar_y_offset, x + (s_bar_width/2), y + (s_bar_y_offset - s_bar_height), false);

	draw_set_color(s_bar_outline_colour); 
	draw_rectangle(x - (s_bar_width/2), y + s_bar_y_offset, x + (s_bar_width/2), y + (s_bar_y_offset - s_bar_height), true);
	
	draw_set_color(s_bar_fill_colour);
	draw_rectangle(x - (s_bar_width/2), y + s_bar_y_offset, (x - (s_bar_width/2)) + (s_bar_width * (stamina/stamina_org)), y + (s_bar_y_offset - s_bar_height), false);
	
#endregion

#region Cursor

	//Check if player is aiming. 
	if (state == "shooting") {
		var cursor_x = 0; 
		var cursor_y = 0; 
		
		if (obj_input.input_device == "gamepad") {
			cursor_x = x + lengthdir_x(cursor_offset, cursor_dir); 
			cursor_y = y + lengthdir_y(cursor_offset, cursor_dir); 
		} else if (obj_input.input_device == "keyboard") {
			cursor_x = mouse_x;
			cursor_y = mouse_y;
		}
		draw_sprite(spr_player_aim_cursor, -1, cursor_x, cursor_y);	
	} else if (obj_input.input_device == "keyboard") {
		draw_sprite(spr_player_aim_cursor, -1, mouse_x, mouse_y);		
	}

#endregion
