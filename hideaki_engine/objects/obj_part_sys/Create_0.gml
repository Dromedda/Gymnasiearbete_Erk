#region initialize particle system
	
	global.ps = part_system_create(); 

	//Add ALL Particle Scripts Here!
	scr_part_dash();
	scr_part_walk();
	scr_part_shoot();

	//@note Implomentation Example of Particles 
	//part_particles_create(global.ps, x, y, global.pt_example, 1);

#endregion