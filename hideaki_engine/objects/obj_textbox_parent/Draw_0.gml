#region Draw Question Mark when near Player

	if (collision_circle(x, y, 64, obj_player, false, true)) {
		draw_sprite(spr_interact, -1, x, y - 32);	
	}

#endregion

#region Draw Self

	draw_self();

#endregion