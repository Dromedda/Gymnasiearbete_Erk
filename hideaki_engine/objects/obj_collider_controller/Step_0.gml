#region toggle Colliders

	var key_toggle = keyboard_check_pressed(vk_f9);

	if (key_toggle) {
		draw_colliders = !draw_colliders;	
	}

#endregion