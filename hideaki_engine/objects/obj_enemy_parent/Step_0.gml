#region Take Damage

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

#endregion

#region Invincible timer

	if ((invincible) && (invincible_timer >= 1)) {
		invincible_timer--; 	
	} else if (invincible_timer <= 0) {
		invincible = false; 
		invincible_timer = invincible_timer_org; 
	}

#endregion

#region Attack Decider

	if (collision_circle(x, y, attack_detect_radius, obj_player, false, true)) {
		attack_delay--; 
		
		if (attack_delay <= 0) {
			attacking = true; 	
		}
		
	} else {
		attack_delay = attack_delay_org;	
	}

#endregion

#region Attack

	if (attacking) {
		var attack_dir; 
		var px = obj_player.x; 
		var py = obj_player.y; 
		
		attack_dir = point_direction(x, y, px, py);
		
		instance_create_layer(x + lengthdir_x(attack_distance, attack_dir), y + lengthdir_y(attack_distance, attack_dir), "Enemy", obj_enemy_damage_collider);
		
		show_debug_message("Lengthdir_x E Attack = " + string(lengthdir_x(attack_distance, attack_dir)));
		show_debug_message("Lengthdir_y E Attack = " + string(lengthdir_y(attack_distance, attack_dir)));
		
		attack_delay = attack_delay_org; 
		attacking = false; 
		
	}

#endregion

#region Move Towards Player

	if (!invincible) {
			if (collision_circle(x, y, player_detection_radius, obj_player, false, true)) {
				var px = obj_player.x; 
				var py = obj_player.y; 
		
				var move_to = point_direction(x, y, px, py);
		
				x_speed = lengthdir_x(move_speed, move_to);
				y_speed = lengthdir_y(move_speed, move_to);
				
				//check collisions and then apply x_speed to x_coordinate
				if (!place_meeting(x + x_speed, y, obj_collider)) {
					if (!place_meeting(x + x_speed, y, obj_enemy_parent)) {
						x += x_speed; 	
					}
				} else if (!place_meeting(x + sign(x_speed), y, obj_collider)) {
					if (!place_meeting(x + sign(x_speed), y, obj_enemy_parent)) {
						x += sign(x_speed); 	
					}
				} 
	
				if (!place_meeting(x, y + y_speed, obj_collider)) {
					if (!place_meeting(x, y + y_speed, obj_enemy_parent)) {
						y += y_speed; 	
					} 	
				} else if (!place_meeting(x, y + sign(y_speed), obj_collider)) {
					if (!place_meeting(x, y + sign(y_speed), obj_enemy_parent)) {
						y += sign(y_speed); 	
					}
				}
				
				
				
		
			}
	}

#endregion

#region Fucking die

	if (hp <= 0) {
		instance_destroy(self);	
	}

#endregion