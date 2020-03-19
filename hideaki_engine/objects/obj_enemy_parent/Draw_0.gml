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

#region Draw Attack Distance
	
	draw_circle(x, y, attack_detect_radius, true);

#endregion