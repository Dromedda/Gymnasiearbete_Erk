#region key progress

	var key_progress = obj_input.kb_c; 

#endregion

#region Check Collisions with player and then check for keypress.

	if (collision_circle(x, y, 64, obj_player, false, true)) {
		if (key_progress) {
			instance_create_layer(0,0,"Controllers", obj_goto_next); 	
		}
	} 

#endregion
