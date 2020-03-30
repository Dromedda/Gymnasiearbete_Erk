// Inherit the parent event
event_inherited();

#region Face Player

	var p_x = obj_player.x; 
	
	if (p_x < x) {
		image_xscale = -1; 	
	} else if (p_x > x) {
		image_xscale = 1; 	
	}

#endregion