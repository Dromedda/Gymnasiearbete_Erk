global.pt_shoot = part_type_create(); 

//Color 
var particle_color1 = make_color_rgb(255,255,255); 

//Add Particle Attributes Here!
part_type_shape(global.pt_shoot, pt_shape_pixel);
part_type_size(global.pt_shoot, 6, 6, -0.01, 0);
part_type_color1(global.pt_shoot, particle_color1); 
part_type_life(global.pt_shoot, 14, 16);
part_type_direction(global.pt_shoot, 0, 359, 0, 0); 
part_type_speed(global.pt_shoot, 0.2, 0.4, 0.5, 0.5); 
	