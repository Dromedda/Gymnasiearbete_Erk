#region Reloading 
	
	if (reloading) {
		draw_text(x - 32, y - 48, "RELOADING");
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