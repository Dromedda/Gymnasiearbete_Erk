#region Wave

	switch(wave) {
		case 0: //Wave 0 and so on
			melee_amount = 4; 
			shooter_amount = 0; 
			bigboy_amount = 0; 
			break; 
		
		case 1: 
			melee_amount = 6; 
			shooter_amount = 0;
			bigboy_amount = 0;
			break; 
		
		case 2: 
			melee_amount = 8; 
			shooter_amount = 0;
			bigboy_amount = 0;
			break; 
			
		case 3: 
			melee_amount = 4; 
			shooter_amount = 1;
			bigboy_amount = 0;
			break; 
			
		case 4: 
			melee_amount = 4; 
			shooter_amount = 2;
			bigboy_amount = 0;
			break; 
		
		case 5: 
			melee_amount = 6; 
			shooter_amount = 4;
			bigboy_amount = 1;
			break; 
			
		case 6: 
			melee_amount = 8; 
			shooter_amount = 4; 
			bigboy_amount = 1;
			break; 
			
		case 7: 
			melee_amount = 8; 
			shooter_amount = 6;
			bigboy_amount = 1;
			break; 
			
		case 8: 
			melee_amount = 10; 
			shooter_amount = 6;
			bigboy_amount = 2;
			break; 
			
		case 9: 
			melee_amount = 10; 
			shooter_amount = 8;
			bigboy_amount = 2;
			break; 	
			
		case 10: 
			melee_amount = 6; 
			shooter_amount = 10; 
			shooter_attack_delay = 40;
			bigboy_amount = 3;
			break; 
	}
	
#endregion

#region New Wave

	if (!instance_exists(obj_enemy_parent)) { 
		new_wave = true; 	
	}

#endregion

#region Create Enemies

	if (new_wave) {
		wave += 1;
		
		//Set Player Stamina to max every new wave. 
		obj_player.stamina = obj_player.stamina_org; 
		
		//Health packs
		if (obj_player.hp < obj_player.hp_max) {
			var rr = random(1);  
			if (rr < healthpack_chance) {
				instance_create_layer(irandom_range(60, (room_width - 60)), irandom_range(60, (room_height - 60)), "Player", obj_health_pack);
				
				var reh = irandom_range(1, 3); 
				if (obj_player.hp < (obj_player.hp_max/2)) {
					for (var i = 0; i < reh; i++) {				
						instance_create_layer(irandom_range(60, (room_width - 60)), irandom_range(60, (room_height - 60)), "Player", obj_health_pack); 			
					}
				}
			}
		}
		
		//Melee
		for (var i = 0; i < melee_amount; i++) {
			var melee = instance_create_layer(irandom_range(60, (room_width - 60)), irandom_range(60, (room_height - 60)), "Enemy", obj_enemy_melee); 	
			if (melee_attack_delay != undefined) { melee.attack_delay = melee_attack_delay; }
		}

		//shooter
		for (var i = 0; i < bigboy_amount; i++) {
			var shooter = instance_create_layer(irandom_range(60, (room_width - 60)), irandom_range(60, (room_height - 60)), "Enemy", obj_enemy_shooter); 	
			if (shooter_attack_delay != undefined) { shooter.attack_delay = shooter_attack_delay; } 
		}
		
		//Big Boy
		for (var i = 0; i < shooter_amount; i++) {
			var bigboy = instance_create_layer(irandom_range(60, (room_width - 60)), irandom_range(60, (room_height - 60)), "Enemy", obj_enemy_bigboy); 	
			if (bigboy_attack_delay != undefined) { bigboy.attack_delay = shooter_attack_delay; } 
		}
		
		new_wave = false; 
	}

#endregion