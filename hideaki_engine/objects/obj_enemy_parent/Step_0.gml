#region Take Damage

	//Player Melee
	if (place_meeting(x, y, obj_player_melee)) {
		hp -= player_melee_dmg; 
		instance_destroy(obj_player_melee);
	}
	
	//Player Shooting
	if (place_meeting(x, y, obj_player_bullet)) {
		hp -= player_shoot_dmg;
		part_particles_create(global.ps, x, y, global.pt_shoot, 16);
		instance_destroy(obj_player_bullet)
	}

#endregion

#region Fucking die

	if (hp <= 0) {
		instance_destroy(self);	
	}

#endregion