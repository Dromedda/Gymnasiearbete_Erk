#region Check collisions with player

	if (place_meeting(x, y, obj_player)) {
		if (obj_player.hp < obj_player.hp_max) {
			obj_player.hp += health_increase; 	
			instance_destroy(self);
		}
	}

#endregion