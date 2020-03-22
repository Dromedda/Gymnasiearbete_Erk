#region Set Font

	draw_set_font(fnt_standard);

#endregion

#region Draw

	if (toggle) {
		var n = 16; 
		
		draw_text(n, n * 1, "f1 = Toggle Debugger")	;
		draw_text(n, n * 2, "f2 = Restart Room")	;
	}

#endregion