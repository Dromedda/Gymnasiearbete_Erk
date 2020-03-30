#region Interaction Key Variable

	var key_interact = obj_input.kb_c;

#endregion

 #region Trigger TextBox	
	
	if (collision_circle(x, y, 64, obj_player, false, true)) {
			can_interact = true;  
			if (my_text_box == noone) && (key_interact) {
				my_text_box = instance_create_layer(0, 0, "TextBoxLayer", obj_textbox); 
				my_text_box.creator = self; 
				my_text_box.voice = voice; 
				my_text_box.text_to_draw = dialogue;
			}
			
		} else {
			can_interact = false; 
			if (my_text_box != noone) {
				instance_destroy(my_text_box); 
				my_text_box = noone; 
			}
		}
		
#endregion