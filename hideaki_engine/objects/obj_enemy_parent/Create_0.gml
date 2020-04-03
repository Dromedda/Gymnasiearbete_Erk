#region variables 

	explode_scale = 2; 
	explode_scale_org = explode_scale; 

	player_melee_dmg = 2; 
	player_shoot_dmg = 3; 
	
	x_speed = 0; 
	y_speed = 0; 
	
	hp = 6;
	
	hit_by_player = false; 
	
	draw_telegraph = false; 
	
	invincible = false; 
	invincible_timer = 30;
	invincible_timer_org = invincible_timer;
	
	flicker_freq = 2; 
	flicker_timer = flicker_freq;
	
	player_detection_radius = 600; 	
	
	move_speed = 4;
	
	attack_delay = 36; 
	attack_delay_org = attack_delay; 
	attack_detect_radius = (sprite_get_height(spr_enemy_damage_collider) + 32); 
	attacking = false; 
	attack_distance = sprite_get_height(spr_enemy_damage_collider); 

#endregion

#region Spawn Failsafe

	var rx = sprite_get_width(sprite_index); 
	var ry = sprite_get_height(sprite_index); 

	if ((collision_rectangle(x - (rx/2), y - (ry/2), x + (rx/2), y + (ry/2), obj_enemy_parent, false, true)) || (place_meeting(x,y,obj_collider))) {
		x = irandom_range(60, (room_width - 60)); 
		y = irandom_range(60, (room_height - 60));
	}

#endregion
