#region Position

	x = obj_player.x;
	y = obj_player.y + 64; 
	
#endregion

#region Text Object

	if (!instance_exists(obj_player_reload_text)) {
		instance_create_layer(x, y - 120, "Player", obj_player_reload_text);
	}	

#endregion


