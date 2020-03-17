global.pt_player_dash = part_type_create(); 

//Color 
var particle_color1 = make_color_rgb(255, 255, 255); 

//Add Particle Attributes Here!
part_type_shape(global.pt_player_dash, pt_shape_pixel);
part_type_size(global.pt_player_dash, 4, 8, -0.01, 0);
part_type_color1(global.pt_player_dash, particle_color1); 
part_type_life(global.pt_player_dash, 14, 16); 
part_type_direction(global.pt_player_dash, 0, 359, 0, 0); 
part_type_speed(global.pt_player_dash, 0.2, 0.4, 0.5, 0.5); 
