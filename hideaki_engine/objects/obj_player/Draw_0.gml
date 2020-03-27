#region Set Font

	draw_set_font(fnt_standard);

#endregion

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

