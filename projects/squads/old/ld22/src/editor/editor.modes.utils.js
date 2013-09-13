	editor.toggleGrid = function() {
		if(game.viewgrid.visible) {
			if(game.viewgrid) game.viewgrid.hide();
			events.fire('editor.viewgrid.set', { value : false });
		} else {					
			if(game.viewgrid) game.viewgrid.show();
			events.fire('editor.viewgrid.set', { value : true });
		}
	}

		