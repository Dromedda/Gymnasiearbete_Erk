#region Move Camera

	var p_x = obj_player.x;
	var p_y = obj_player.y;

	//this works, don't know why. so im just gonna leave it because it works. 
	//@futureme im sorry :( nvm, i figured it out, i realised im retarded and made the obj_camera.x follow the pos controllers .y insyead of the .x :) im stupid // Yours truly; Past Mentally Challanged Self.
	x += (p_x - x)/4; 
	y += (p_y - y)/4; 

	show_debug_message("camera_pos x = " + string(x));
	show_debug_message("camera_pos y = " + string(y));

#endregion

/*
Boundaries : 
	top left
	506
	288

	top right
	1277	
	288

	bottom left
	512
	896

	bottom right
	1284
	896
*/
