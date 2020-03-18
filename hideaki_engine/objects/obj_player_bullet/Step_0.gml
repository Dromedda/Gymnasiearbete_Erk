#region Delta Time 

	var delta_t = (delta_time/10000); 	

#endregion

#region Move
	
	x_speed = (bullet_speed * (sign(dir_x))) * delta_t;
	y_speed = (bullet_speed * (sign(dir_y))) * delta_t;

	//check collisions and then apply x_speed to x_coordinate
	if (!place_meeting(x + x_speed, y, obj_collider)) {
		x += x_speed; 	
	} else if (!place_meeting(x + sign(x_speed), y, obj_collider)) {
		x += sign(x_speed); 	
	} else {
		instance_destroy(self); 	
	}
	
	if (!place_meeting(x, y + y_speed, obj_collider)) {
		y += y_speed; 	
	} else if (!place_meeting(x, y + sign(y_speed), obj_collider)) {
		y += sign(y_speed); 	
	} else {
		instance_destroy(self); 	
	}
	

#endregion

#region Particles 

	part_particles_create(global.ps, x, y, global.pt_shoot, 12);

#endregion