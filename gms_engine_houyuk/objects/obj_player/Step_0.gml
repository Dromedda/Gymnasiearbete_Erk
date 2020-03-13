#region Store Keyboard Input

	var key_left = obj_input.kb_left; 
	var key_right = obj_input.kb_right; 
	var key_up = obj_input.kb_up; 
	var key_down = obj_input.kb_down; 
	
	var key_a = obj_input.kb_a; 
	var key_b = obj_input.kb_b; 
	var key_r = obj_input.kb_r; 

#endregion

#region Delta Time

	var delta_t = (delta_time/10000); 	

#endregion

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

#region collisions 

	// check horizontal collisions and then apply x_speed to x_coordinate
	if (!place_meeting(x + x_speed, y, obj_collider)) {
		x += x_speed; 	
	} else if (!place_meeting(x + sign(x_speed), y, obj_collider)) {
		x += sign(x_speed); 	
	} 
	
	// check vertical collisions and then apply y_speed to y_coordinate
	if (!place_meeting(x, y + y_speed, obj_collider)) {
		y += y_speed; 	
	} else if (!place_meeting(x, y + sign(y_speed), obj_collider)) {
		y += sign(y_speed); 	
	}
	
#endregion

#region Dashing	

	

#endregion