#region Follow Player

	if ((dir_x != 0) && (dir_y != 0)) {
		y = obj_player.y + (melee_offset * dir_y);
	} else {
		x = obj_player.x + (melee_offset * dir_x);
	}

	if ((dir_y != 0) && (dir_x == 0)) {
		y = obj_player.y + (melee_offset * dir_y);
	}

	if ((dir_x != 0) && (dir_y == 0)) {
		x = obj_player.x + (melee_offset * dir_x);	
	}

#endregion

#region Duration

	timer--; 
	
	if (timer <= 0) {
		instance_destroy(); 
	}

#endregion