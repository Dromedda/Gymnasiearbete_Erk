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
