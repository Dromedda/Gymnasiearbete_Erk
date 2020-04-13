#region Fancy Writing Anim 

	t = (t + increment) mod 360;
	shift = amp * dsin(t);

#endregion

#region Position

	var p_x = obj_player_reload_bar.x; 
	var p_y = obj_player_reload_bar.y; 

	y = ((p_y + v_offset) + shift); 
	x = p_x; 

#endregion

#region Fucking Die

	if (!obj_player.reloading) {
		instance_destroy(self); 	
	}

#endregion