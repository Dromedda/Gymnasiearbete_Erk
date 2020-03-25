#region Store Keyboard Input

	var key_left = obj_input.kb_left; 
	var key_right = obj_input.kb_right; 
	var key_up = obj_input.kb_up; 
	var key_down = obj_input.kb_down; 
	
	var key_a = obj_input.kb_a; 
	var key_b = obj_input.kb_b; 
	var key_c = obj_input.kb_c;
	
	var key_aim = obj_input.kb_aim; 
	
#endregion

#region Delta Time

	var delta_t = (delta_time/10000); 	

#endregion

#region Stamina

	if ((state != "melee") && (stamina != stamina_org)) {	
		stamina_regen--; 
		if (stamina_regen <= 0) {
			stamina += 1; 
			stamina_regen = stamina_regen_org; 
		}
	}

#endregion

/*
	State Machine For Player
	STATES AVAILIBLE:
		"normal" 
		"dashing"
		
*/
switch(state) {

	case "normal": 
	
		#region Movement

			var move_dir_x = key_right - key_left; 
			var move_dir_y = key_down - key_up; 
	
			var move_diag = (move_dir_x != 0) && (move_dir_y != 0); 

			if (move_diag) {
				move_speed = move_speed_diag; 
			} else {
				move_speed = move_speed_org; 	
			}
	
			x_speed = (move_speed * move_dir_x) * delta_t;
			y_speed = (move_speed * move_dir_y) * delta_t;

		#endregion	
		
		#region Facing Direction
		
			face_dir_x = sign(x_speed);
			face_dir_y = sign(y_speed);
			
			if (x_speed > 0) {
				facing_dir_x = 1; 	
			} else if (x_speed < 0) {
				facing_dir_x = -1; 	
			}
			
			if (y_speed > 0) {
				facing_dir_y = 1; 	
			} else if (y_speed < 0) {
				facing_dir_y = -1;	
			}
		
		#endregion
		
		#region Dashing
		
			if ((key_b) && (dashing_cooldown == 0) && ((x_speed != 0) || (y_speed != 0))) {
				part_particles_create(global.ps, x, y, global.pt_player_dash, 16);
				state = "dashing"; 	
			}
			
			if (dashing_duration < dashing_duration_org) {
				dashing_cooldown++;  	
			} 
			
			if (dashing_cooldown >= dashing_cooldown_org) {
				dashing_cooldown = 0; 
				dashing_duration = dashing_duration_org; 
			}
		
		#endregion
		
		#region Melee
			
			//@Todo Player Needs Stamina to use Melee
			/*
			if (key_c) {
				if (!instance_exists(obj_player_melee)) {
					instance_create_layer(x + (melee_offset * face_dir_x), y + (melee_offset * face_dir_y), "Player", obj_player_melee);	
				} else {
					instance_destroy(obj_player_melee);
					instance_create_layer(x + (melee_offset * face_dir_x), y + (melee_offset * face_dir_y), "Player", obj_player_melee);
				}
			}
			*/
			
			if ((key_c) && (stamina >= 1)) {
				stamina--; 
				
				melee_dir_x = move_dir_x; 
				melee_dir_y = move_dir_y;
				
				instance_create_layer(x + (melee_offset * facing_dir_x), y + (melee_offset * facing_dir_y), "Player", obj_player_melee);
				state = "melee"; 	
			}
			
			show_debug_message("Melee_dir_x = " + string(melee_dir_x));
			show_debug_message("Melee_dir_y = " + string(melee_dir_y));
			
		
		#endregion
		
		#region Shooting 
		
			if (key_aim) {
				state = "shooting"; 	
			}
		
		#endregion
		
		#region Reloading 
		
			if ((key_a) && (ammunition < ammunition_max)) {
				reloading = true; 	
			}
		
		#endregion
		
	break;  
	
	case "dashing": 
	
		#region Invincible
	
			invincible = true; 

		#endregion
		
		#region Duration
		
			//Reduce Duration each frame.
			if (dashing_duration >= 1) {
				dashing_duration--; 
			} else { 
				part_particles_create(global.ps, x, y, global.pt_player_dash, 32);
				invincible = false; 
				state = "normal"; 
			} 
		
		#endregion
		
		#region Move Player
		
			x_speed = ((dashing_speed * sign(face_dir_x)) * delta_t); 
			y_speed = ((dashing_speed * sign(face_dir_y)) * delta_t); 
		
		#endregion
	
	break; 
	
	case "shooting": 
	
		face_dir_x = key_right - key_left;
		face_dir_y = key_down - key_up;
		
		//Facing Dir
		if (face_dir_x < 0) {
			facing_dir_x = -1; 
		} else if (face_dir_x > 0) {
			facing_dir_x = 1; 	
		}
	
		//Make player Stationary
		x_speed = 0; 
		y_speed = 0; 	
		
		//Check Ammunition and cooldown
		if (shooting_cooldown >= 1) {
			shooting_cooldown--; 	
		}
		
		if ((ammunition >= 1) && (key_c) && (!reloading)) {
			if ((face_dir_x != 0) || (face_dir_y != 0)) {
				if (shooting_cooldown <= 0) {
					if (ammunition >= 2) {
						shooting_cooldown = shooting_cooldown_org;
					}
					ammunition--; 
					instance_create_layer(x, y, "Player", obj_player_bullet);
				} 
			}
		} else if (ammunition < 1) {
			reloading = true; 
		}
		
		// if Aim button is let go return to "Normal"
		if (!key_aim) {
			state = "normal"; 	
		}
		
	break; 
	
	case "melee": 
	
		if (melee_dur >= 1) {
			x_speed = ((move_speed * melee_move_speed_mult) * melee_dir_x);	
			y_speed = ((move_speed * melee_move_speed_mult) * melee_dir_y);	
			melee_dur--; 
		} else {
			melee_dur = melee_dur_org; 
			state = "normal"; 
		}
		
		show_debug_message("MELEE"); 
		show_debug_message(melee_dur)
		
	
	break; 
	
}

#region Reloading Gun

	if (reloading) {
		reload_time--; 
			
		if (reload_time <= 0) {
			reloading = false; 
			reload_time = reload_time_org; 
			ammunition = ammunition_max;
		}	
	}

#endregion


#region collisions 

	//check collisions and then apply x_speed to x_coordinate
	if (!place_meeting(x + x_speed, y, obj_collider)) {
		x += x_speed; 	
	} else if (!place_meeting(x + sign(x_speed), y, obj_collider)) {
		x += sign(x_speed); 	
	} 
	
	if (!place_meeting(x, y + y_speed, obj_collider)) {
		y += y_speed; 	
	} else if (!place_meeting(x, y + sign(y_speed), obj_collider)) {
		y += sign(y_speed); 	
	}
	
#endregion	

#region Fucking Die

	/*
	if (!hit_by_enemy) {
		if (place_meeting(x, y, obj_enemy_damage_collider)) {
			var enemy_collider = instance_nearest(x, y, obj_enemy_damage_collider);
		
			hp -= enemy_collider.dmg;
		
			hit_by_enemy = true; 
		
		}
	}
	*/
	
	if (hit_by_enemy) {
		hit_by_enemy_timer--; 
		
		if (hit_by_enemy_timer <= 0) {
			hit_by_enemy = false; 
			hit_by_enemy_timer = hit_by_enemy_timer_org;
		}
	} else {
		if (place_meeting(x, y, obj_enemy_damage_collider)) {
			var enemy_collider = instance_nearest(x, y, obj_enemy_damage_collider);
		
			hp -= enemy_collider.dmg;
			
			instance_destroy(enemy_collider);
		
			hit_by_enemy = true; 
		
		}
	}
	
	if (hp <= 0) {
		obj_music_controller.stop_music = true; 
		room_restart(); //@todo Change Later so that you instead goto a death screen and then back to main menu.	
	}

#endregion

#region Animation

	#region Flip Sprite
		
		if (facing_dir_x != 0) {
			image_xscale = facing_dir_x;
		}
		
	#endregion
	
	#region Decide Animation
	
		if ((x_speed != 0) || (y_speed != 0)) {
			anim_state = "run"; 	
		} else if ((x_speed == 0) && (y_speed == 0)) {
			anim_state = "idle"; 	
		} else {
			anim_state = "static"; 	
		}
	
	#endregion
	
	#region State Machine
	
		switch(anim_state) {
			case "static": 
				sprite_index = spr_player_static;
				break; 
			
			case "idle": 
				sprite_index = spr_player_idle; 
				break; 
			
			case "run": 
				sprite_index = spr_player_run;
				break; 
			
			default: 
				sprite_index = spr_player_static; 
				break; 
		}
	
	#endregion


#endregion