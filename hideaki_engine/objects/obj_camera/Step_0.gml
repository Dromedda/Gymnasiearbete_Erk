#region update camera

	var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0); 
	camera_set_view_mat(obj_camera.camera,vm);

#endregion

#region camera pos 

	x = obj_camera_pos_controller.x; 
	y = obj_camera_pos_controller.y;
	
#endregion

show_debug_message("c_x = " +string(x));
show_debug_message("c_y = " +string(y));