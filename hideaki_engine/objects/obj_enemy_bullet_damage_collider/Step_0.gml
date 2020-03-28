#region Move

	x += lengthdir_x(move_speed, dir);
	y += lengthdir_y(move_speed, dir);
	
#endregion

#region Rotate

	image_angle = dir;

#endregion

#region Failsafe

	if (!collision_circle(x, y, 1000, obj_player, false, true)) {
		instance_destroy(self);	
	}
	
	if (place_meeting(x, y, obj_collider)) {
		instance_destroy(self);	
	} else if (place_meeting(x, y, obj_player)) {
		part_particles_create(global.ps, x, y, global.pt_shoot, 256);
	}

#endregion

#region draw Colliders

	visible = obj_collider_controller.draw_colliders; 	

#endregion