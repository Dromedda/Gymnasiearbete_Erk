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