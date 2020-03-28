#region Variables

	fading_decrement = 0.05; 

#endregion

#region Set Image Index and image speed and image x scale

	image_index = obj_player.image_index; 
	image_speed = 0; 
	image_xscale = obj_player.image_xscale; 
	sprite_index = obj_player.sprite_index; 

#endregion

#region Limit Amount

	if (!instance_number(self) > 10) {
		instance_destroy(self);
	}

#endregion