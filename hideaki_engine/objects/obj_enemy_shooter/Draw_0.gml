// Inherit the parent event
event_inherited();

#region Draw Line Between Self and player

	if (collision_circle(x, y, player_detection_radius, obj_player, false, true)) {
		if (attack_delay < (attack_delay_org/3)) {
			draw_set_color(c_red);	
		} else {
			draw_set_color(c_white);	
		}
		
		draw_line(x, y, obj_player.x, obj_player.y);
	}

#endregion
