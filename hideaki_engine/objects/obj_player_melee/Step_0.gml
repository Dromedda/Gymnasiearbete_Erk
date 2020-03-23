#region Get Direction

	dir_x = obj_player.melee_dir_x; 
	dir_y = obj_player.melee_dir_y; 

#endregion

#region Follow Player

	if ((dir_x != 0) && (dir_y != 0)) {
		y = obj_player.y + (melee_offset * dir_y);
		x = obj_player.x + (melee_offset * dir_x);
	} 

	if ((dir_y != 0) && (dir_x == 0)) {
		y = obj_player.y + (melee_offset * dir_y);
		x = obj_player.x; 
	}

	if ((dir_x != 0) && (dir_y == 0)) {
		y = obj_player.y;
		x = obj_player.x + (melee_offset * dir_x);	
	}

#endregion

#region Duration

	timer--; 
	
	if (timer <= 0) {
		instance_destroy(); 
	}

#endregion