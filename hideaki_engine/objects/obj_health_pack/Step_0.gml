#region Check collisions with player

	if (collision_circle(x, y, 64, obj_player, false, true)) {
		if (obj_player.hp < obj_player.hp_max) {
			obj_player.hp += health_increase; 	
			instance_destroy(self);
		}
	}

#endregion