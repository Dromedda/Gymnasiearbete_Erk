#region setup camera

	camera = camera_create();

	cam_w = 1024; 
	cam_h = 576;
	
	cx = x; 
	cy = y;

	var vm = matrix_build_lookat (x, y, -10, x, y, 0, 0, 1, 0);

	//Determine Resolution and camera type
	var pm = matrix_build_projection_ortho(cam_w, cam_h, 1, 10000);

	camera_set_view_mat(camera,vm);
	camera_set_proj_mat(camera,pm);

	view_camera[0] = camera;

#endregion
