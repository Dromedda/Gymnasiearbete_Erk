#region Draw Player "Vectors"

	if (toggle) {
		
		var px = obj_player.x; 		
		var py = obj_player.y; 		
		var px_speed = obj_player.x_speed; 
		var py_speed = obj_player.y_speed; 
		
		//x
		draw_set_color(c_red); 
		draw_line(px, py, px + px_speed, py);	
		
		//y
		draw_set_color(c_blue); 
		draw_line(px, py, px, py + py_speed); 
	}

#endregion