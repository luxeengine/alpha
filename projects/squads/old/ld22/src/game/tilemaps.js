		
	Game.implement('createTilemaps',  function() {
				
		game.tilemap = new TiledMap(levels.current.tilemappath, game.physics).create(game.groups.objects, 0.2, false);
		
	});