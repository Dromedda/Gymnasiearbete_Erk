#region Move
	
	x_speed += lengthdir_x(bullet_speed, dir);
	y_speed += lengthdir_y(bullet_speed, dir);

	//check collisions and then apply x_speed to x_coordinate
	if (!place_meeting(x + x_speed, y, obj_collider)) {
		x += x_speed; 	
	} else if (!place_meeting(x + sign(x_speed), y, obj_collider)) {
		x += sign(x_speed); 	
	} else {
		part_particles_create(global.ps, x, y, global.pt_shoot, 12);
		instance_destroy(self); 	
	}
	
	if (!place_meeting(x, y + y_speed, obj_collider)) {
		y += y_speed; 	
	} else if (!place_meeting(x, y + sign(y_speed), obj_collider)) {
		y += sign(y_speed); 	
	} else {
		part_particles_create(global.ps, x, y, global.pt_shoot, 12);
		instance_destroy(self); 	
	}
	

#endregion

#region Particles

	if (particle_delay != noone) {
		if (!particle_delay <= 0) {
			particle_delay--; 
		} else {
			part_particles_create(global.ps, x, y, global.pt_shoot, 12);	
			particle_delay = noone; 
		}
	}
	
	part_particles_create(global.ps, x, y, global.pt_shoot, 4);
	
#endregion

#region draw Colliders

	visible = obj_collider_controller.draw_colliders; 	

#endregion
