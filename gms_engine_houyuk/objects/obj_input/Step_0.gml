#region Gamepad Support

	gp_1 = 0; 

	if (gamepad_is_connected(0)) {
		gp_1 = 0; 	
	} else if (gamepad_is_connected(4)) {
		gp_1 = 4; 	
	}
	
	gamepad_set_axis_deadzone(gp_1, 0.3); 

#endregion

#region Get Input

	kb_up =			(keyboard_check(ord("W")) ||
					(gamepad_button_check(gp_1, gp_padu)) ||
					((gamepad_axis_value(gp_1, gp_axislv)) < 0)); 

	kb_down =		(keyboard_check(ord("S")) ||
					(gamepad_button_check(gp_1, gp_padd)) ||
					((gamepad_axis_value(gp_1, gp_axislv)) > 0)); 
					
	kb_left =		(keyboard_check(ord("A")) ||
					(gamepad_button_check(gp_1, gp_padl)) ||
					((gamepad_axis_value(gp_1, gp_axislh)) < 0)); 
	
	kb_right =		(keyboard_check(ord("D")) ||
					(gamepad_button_check(gp_1, gp_padr)) ||
					((gamepad_axis_value(gp_1, gp_axislh)) > 0)); 
					
	kb_a =			(keyboard_check_pressed(ord("L")) || 
					(gamepad_button_check_pressed(gp_1, gp_face1))); 

	kb_b =			(keyboard_check_pressed(ord("K")) || 
					(gamepad_button_check_pressed(gp_1, gp_face3)));
					
	kb_a =			(keyboard_check_pressed(ord("J")) || 
					(gamepad_button_check_pressed(gp_1, gp_shoulderrb))); 

#endregion