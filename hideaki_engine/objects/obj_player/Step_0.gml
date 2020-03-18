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
		
		#endregion
		
		#region Dashing
		
			if ((key_b) && (dashing_cooldown == 0)) {
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
		
		#region Shooting 
		
			if (key_aim) {
				state = "shooting"; 	
			}
		
		#endregion
		
	break;  
	
	case "dashing": 
		
		#region Duration
		
			//Reduce Duration each frame.
			if (dashing_duration >= 1) {
				dashing_duration--; 
			} else { 
				part_particles_create(global.ps, x, y, global.pt_player_dash, 32);
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
	
		//Make player Stationary
		x_speed = 0; 
		y_speed = 0; 
		
		//Check Ammunition
		if ((ammunition >= 1) && (key_c)) {
			if ((face_dir_x != 0) || (face_dir_y != 0)) {
				ammunition--; 
				instance_create_layer(x, y, "Player", obj_player_bullet);
			}
		} else if (ammunition < 1) {
			reloading = true; 
		}
		
		// if Aim button is let go return to "Normal"
		if (!key_aim) {
			state = "normal"; 	
		}
		
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