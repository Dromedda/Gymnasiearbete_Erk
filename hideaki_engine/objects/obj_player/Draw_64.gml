#region Draw Ammo
	/*
	var n = 12;

	draw_text(8, n * 1, "Ammo = " + string(ammunition));
	//draw_text(8, n * 2, "Hp = " + string(hp));
	*/
	
	var ammo_scale = 2; 
	var ammo_rot = 0; 
	var ammo_x_base = (24 * ammo_scale);
	var ammo_y_base = (58 * ammo_scale);
	var ammo_x_pos_mult = (12 * ammo_scale); 	

	for (var i = 0; i < ammunition; i++) {
		draw_sprite_ext(spr_player_ammo, -1, ammo_x_base + (ammo_x_pos_mult * i), ammo_y_base, ammo_scale, ammo_scale, ammo_rot, c_white, 1);	
	}


#endregion

#region Draw Stamina

	draw_text(400, 24, "Stamina = " + string(stamina));

#endregion

#region Draw Health

	var heart_scale = 1.6; 
	var heart_rot = 0; 
	var heart_x_base = (24 * heart_scale);
	var heart_y_base = (24 * heart_scale);
	var heart_x_pos_mult = (16 * heart_scale); 	

	for (var i = 0; i < hp; i++) {
		draw_sprite_ext(spr_player_heart, -1, heart_x_base + (heart_x_pos_mult * i), heart_y_base, heart_scale, heart_scale, heart_rot, c_white, 1);	
	}

#endregion
