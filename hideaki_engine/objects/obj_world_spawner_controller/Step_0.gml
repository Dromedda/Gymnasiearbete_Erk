#region Wave

	switch(wave) {
		case 0: //Wave 0 and so on
			melee_amount = 4; 
			shooter_amount = 0; 
			break; 
		
		case 1: 
			melee_amount = 6; 
			shooter_amount = 0; 
			break; 
		
		case 2: 
			melee_amount = 8; 
			shooter_amount = 0; 
			break; 
			
		case 3: 
			melee_amount = 4; 
			shooter_amount = 1; 
			break; 
			
		case 4: 
			melee_amount = 4; 
			shooter_amount = 2;
			break; 
		
		case 5: 
			melee_amount = 6; 
			shooter_amount = 4; 
			break; 
			
		case 6: 
			melee_amount = 8; 
			shooter_amount = 4; 
			break; 
			
		case 7: 
			melee_amount = 8; 
			shooter_amount = 6; 
			break; 
			
		case 8: 
			melee_amount = 10; 
			shooter_amount = 6; 
			break; 
			
		case 9: 
			melee_amount = 10; 
			shooter_amount = 8; 
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
			instance_create_layer(irandom_range(60, (room_width - 60)), irandom_range(60, (room_height - 60)), "Enemy", obj_enemy_melee); 	
		}

		//shooter
		for (var i = 0; i < shooter_amount; i++) {
			instance_create_layer(irandom_range(60, (room_width - 60)), irandom_range(60, (room_height - 60)), "Enemy", obj_enemy_shooter); 	
		}
		
		new_wave = false; 
	}

#endregion