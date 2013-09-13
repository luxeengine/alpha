
	Game.implement('createNPCs',  function() {
		
			//active list of npcs
		this.npcs = [];
		
		var list = filesys.getFileList( project.path('src/npcs') , 'js' );
		if(list.length) {
			list.each(function(item) {
				
				project.loaded = false;
					var e = exec.json( item );
				project.loaded = true;	
				
					item = project.unpath(item);
					e.path = item;
					game.npcTypes.push( e ) ;
					core.echo( '\t added an npc of type : ' + e.name + ' at ' + item);

			}.bind(this));
		}
		
	});
	
	Game.implement('getNPCByName',  function( name ) {
		var c = this.npcTypes.length;
		for( var i = 0; i < c; ++i ) {
			if(this.npcTypes[i].name == name) return this.npcTypes[i];
		}
		
		return null;
	});
	
	Game.implement( 'updateNPCs' , function(dt) {
		
		if(this.npcs) {
			this.npcs.each(function(item, index) { 
				item.update(dt);
			});
		}
		
	});