#region Take Damage

	if (!invincible) {
		//Player Melee
		if (place_meeting(x, y, obj_player_melee)) {
			hp -= player_melee_dmg; 
			instance_destroy(obj_player_melee);
			invincible = true; 
		}
	
		//Player Shooting
		if (place_meeting(x, y, obj_player_bullet)) {
			hp -= player_shoot_dmg;
			part_particles_create(global.ps, x, y, global.pt_shoot, 16);
			instance_destroy(obj_player_bullet);
			invincible = true;
		}
	} 

#endregion

#region Invincible timer

	if ((invincible) && (invincible_timer >= 1)) {
		invincible_timer--; 	
	} else if (invincible_timer <= 0) {
		invincible = false; 
		invincible_timer = invincible_timer_org; 
	}

#endregion

#region Fucking die

	if (hp <= 0) {
		instance_destroy(self);	
	}

#endregion