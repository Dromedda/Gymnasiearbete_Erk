#region Variables

	//Stats States
	invincible = false; 
	invincible_timer = 30; 
	invincible_timer_org = invincible_timer; 
	
	hit_by_enemy = false; 
	hit_by_enemy_timer = 45; 
	hit_by_enemy_timer_org = hit_by_enemy_timer; 
	
	hp = 6; 
	hp_max = hp; 

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
	
	dashing_x_dir = 0; 
	dashing_y_dir = 0; 
	
	dashing_cooldown = 30; 
	dashing_cooldown_org = dashing_cooldown; 
	
	//shooting
	ammunition = 4; 
	ammunition_max = ammunition;
	reloading = false; 
	reload_time = 90; 
	reload_time_org = reload_time;
	
	//@Todo Might want to imploment later
	shooting_cooldown = 8; 
	shooting_cooldown_org = shooting_cooldown;

	//Melee 
	melee_offset = 32;
	melee_dir_x = 0;
	melee_dir_y = 0;
	melee_dur = 8; 
	melee_dur_org = melee_dur; 
	melee_move_speed_mult = 3; 
	
	stamina = 6; 
	stamina_org = stamina; 
	stamina_regen = 48; 
	stamina_regen_org = stamina_regen; 
	
	//Animation
	face_dir_x = 0; 
	face_dir_y = 0; 
	
	facing_dir_x = 0; 
	facing_dir_y = 0; 
	
	flicker_freq = 8; 
	flicker_timer = flicker_freq;
	
	ghost_frames = 4; 
	ghost_frames_org = ghost_frames; 
	
	explode_scale = 2; 
	explode_scale_org = explode_scale; 
	
	anim_state = "static"; 
	
	//Aim
	cursor_offset = 64;
	cursor_dir = 0; 
	
#endregion