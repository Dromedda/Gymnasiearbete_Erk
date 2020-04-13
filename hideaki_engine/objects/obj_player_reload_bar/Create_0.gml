#region Match Image Speed

	spr_frames = 7; 
	reload_time = obj_player.reload_time_org; 

	image_speed = ((spr_frames + 1) / (spr_frames%reload_time)/2);
	
	show_debug_message(string(image_speed));
	
#endregion

