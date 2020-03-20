#region Variables

	//Stats States
	invincible = false; 
	hit_by_enemy = false; 
	hit_by_enemy_timer = 15; 
	hit_by_enemy_timer_org = hit_by_enemy_timer; 
	
	hp = 6; 

	//Movement
	move_speed = 6; 
	move_speed_org = move_speed;
	move_speed_diag = move_speed * 0.707; 
	
	x_speed = 0; 
	y_speed = 0; 
	
	state = "normal";
	
	//Dashing
	dashing_speed = 12; 
	dashing_duration = 8; 
	dashing_duration_org = dashing_duration; 
	
	dashing_cooldown = 30; 
	dashing_cooldown_org = dashing_cooldown; 
	
	//shooting
	ammunition = 2; 
	ammunition_max = ammunition;
	reloading = false; 
	reload_time = 90; 
	reload_time_org = reload_time;
	
	//@Todo Might want to imploment later
	shooting_cooldown = 8; 
	shooting_cooldown_org = shooting_cooldown;

	//Melee 
	melee_offset = 32;
	melee_dir = 0;
	
	//Animation
	face_dir_x = 0; 
	face_dir_y = 0; 
	
	flicker_freq = 8; 
	flicker_timer = flicker_freq;
	
#endregion