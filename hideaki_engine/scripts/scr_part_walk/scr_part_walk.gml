global.pt_player_walk = part_type_create(); 

//Color 
var particle_color1 = make_color_rgb(139, 172, 15); 

//Add Particle Attributes Here!
part_type_shape(global.pt_player_walk, pt_shape_pixel);
part_type_size(global.pt_player_walk, 4, 8, -0.01, 0);
part_type_color1(global.pt_player_walk, particle_color1); 
part_type_life(global.pt_player_walk, 14, 16); 
part_type_direction(global.pt_player_walk, 0, 359, 0, 0); 
part_type_speed(global.pt_player_walk, 0.2, 0.4, 0.5, 0.5); 
