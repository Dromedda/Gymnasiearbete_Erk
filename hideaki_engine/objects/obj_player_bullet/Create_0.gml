#region Variables

	bullet_speed = 16; 
	
	x_speed = 0; 
	y_speed = 0; 

#endregion

#region Get Direction
	
	dir_x = obj_player.face_dir_x;
	dir_y = obj_player.face_dir_y;
	
	if ((dir_x != 0) && (dir_y != 0)) {
		bullet_speed = bullet_speed * 0.707; 	
	}

#endregion