#region Gamepad Support

	gp_1 = 0; 

	if (gamepad_is_connected(0)) {
		gp_1 = 0; 	
	} else if (gamepad_is_connected(4)) {
		gp_1 = 4; 	
	}

#endregion

#region Get Dir

	var haxis = gamepad_axis_value(gp_1, gp_axislh);
	var vaxis = gamepad_axis_value(gp_1, gp_axislv);
	lstick_dir = point_direction(0, 0, haxis, vaxis);	

#endregion

#region Get Input

	//Set Deadzone
	gamepad_set_axis_deadzone(gp_1, 0.25); 

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
					
	kb_a =			(keyboard_check_pressed(ord("R")) || 
					(gamepad_button_check_pressed(gp_1, gp_face2))); 

	kb_b =			(keyboard_check_pressed(vk_lshift) || 
					(gamepad_button_check_pressed(gp_1, gp_face3))); 

	kb_c =			((gamepad_button_check_pressed(gp_1, gp_shoulderrb)) ||
					(gamepad_button_check_pressed(gp_1, gp_face1)) ||
					(mouse_check_button_pressed(mb_left)));
								
	kb_aim =		(gamepad_button_check(gp_1, gp_shoulderlb)) ||
					(mouse_check_button(mb_right)); 


#endregion

#region Input Device

	if (keyboard_check(vk_anykey)) {
		key_input = 1; 
		gp_input = 0; 
	} else {
		for (i=gp_face1; i<gp_axisrv; i++){
			if gamepad_button_check(gp_1, i){
				gp_input = 1;
				key_input = 0; 
				exit;
			} else if (gamepad_axis_value(gp_1, i)) {
				gp_input = 1; 
				key_input = 0; 
				exit;
			}
		}
	}
	
	if (gp_input == 1) {
		input_device = "gamepad";
	} else {
		input_device = "keyboard";	
	}
	
	show_debug_message("INPUT DEVICE == " + string(input_device));
	
#endregion