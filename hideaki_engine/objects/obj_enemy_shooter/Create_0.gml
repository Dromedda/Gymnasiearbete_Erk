#region variables 

	event_inherited();

	player_melee_dmg = 2; 
	player_shoot_dmg = 3; 
	
	hp = 3;
	
	invincible = false; 
	invincible_timer = 30;
	invincible_timer_org = invincible_timer;
	
	flicker_freq = 2; 
	flicker_timer = flicker_freq;
	
	player_detection_radius = 400; 	
	
	move_speed = 3;
	
	attack_delay = 90; 
	attack_delay_org = attack_delay; 
	attack_detect_radius = 400; 
	attacking = false; 
	attack_distance = sprite_get_height(spr_enemy_damage_collider); 

#endregion
