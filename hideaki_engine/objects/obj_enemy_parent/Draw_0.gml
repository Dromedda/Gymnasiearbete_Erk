#region Flicker when hit

	if (!invincible) {
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

	if ((hit_by_player) || (keyboard_check_pressed(vk_f7))) {
		
		explode_scale *= .90; 
		
		if (explode_scale > 0.1) {
			draw_sprite_ext(sprite_index, image_index, x, y, explode_scale, explode_scale, 0, c_white, 1); 	
		}
	} else if (explode_scale != explode_scale_org) {
		explode_scale = explode_scale_org;
	}	

#endregion

#region Draw telegraph

	if (draw_telegraph) {
		var spr_height = sprite_get_height(sprite_index); 
		
		draw_sprite_ext(spr_interact, -1, x, y - spr_height, 0.6, 1, 0, c_red, 1); 	
	}

#endregion
