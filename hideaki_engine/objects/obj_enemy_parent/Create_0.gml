#region variables 

	player_melee_dmg = 2; 
	player_shoot_dmg = 3; 
	
	hp = 6;
	
	invincible = false; 
	invincible_timer = 30;
	invincible_timer_org = invincible_timer;
	
	flicker_freq = 2; 
	flicker_timer = flicker_freq;
	
	player_detection_radius = 600; 	
	
	move_speed = 4;
	
	attack_delay = 60; 
	attack_delay_org = attack_delay; 
	attack_detect_radius = (sprite_get_height(spr_enemy_damage_collider) + 32); 
	attacking = true; 
	attack_distance = sprite_get_height(spr_enemy_damage_collider); 

#endregion
