#region Toggle

	if (keyboard_check_pressed(vk_f1)) {
		toggle = !toggle; 	
	}

#endregion

//Universal On
if (toggle) {
	
	#region Room Restart
	
		if (keyboard_check_pressed(vk_f2)) {
			room_restart(); 
		}
	
	#endregion
	
}

#region enemies alive

	show_debug_message("There are " + string(instance_number(obj_enemy_parent)) + " Enemies Alive"); 
	
#endregion

#region Skip wave

	if (keyboard_check_pressed(vk_ralt)) {
		instance_destroy(obj_enemy_parent);
	}

#endregion