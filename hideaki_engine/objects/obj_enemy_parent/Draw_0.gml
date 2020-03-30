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

#region Draw telegraph

	if (draw_telegraph) {
		var spr_height = sprite_get_height(sprite_index); 
		
		draw_sprite_ext(spr_interact, -1, x, y - spr_height, 0.6, 1, 0, c_red, 1); 	
	}

#endregion
