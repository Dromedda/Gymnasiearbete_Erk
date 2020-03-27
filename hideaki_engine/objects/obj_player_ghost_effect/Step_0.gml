#region Fade out

	image_alpha -= fading_decrement; 

#endregion

#region Fucking Die

	if (image_alpha <= 0) {
		instance_destroy(self); 	
	}

#endregion
