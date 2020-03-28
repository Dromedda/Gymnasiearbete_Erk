#region Duration

	timer--; 
	
	if (timer <= 0) {
		instance_destroy(); 
	}

#endregion

#region draw Colliders

	visible = obj_collider_controller.draw_colliders; 	

#endregion