
	
	Game.implement('createEntities',  function() {
	
		
		var list = filesys.getFileList( project.path('src/entities') , 'js' );
		if(list.length) {
			list.each(function(item) {
				
				project.loaded = false;
					var e = exec.json( item );
				project.loaded = true;	
				
					item = project.unpath(item);
					e.path = item.replace('\\','/');
					game.entityTypes.push( e ) ;
					core.echo( '\t added an entity of type : ' + e.name + ' at ' + item);

			}.bind(this));
		}
		
					this.entities = [];
					//load the .entity file inside the level folder
					var path = 'levels/' + game.currentlevel + '/' + game.currentlevel + '.entities.js';
					var elist = levels.current.entities; //exec.json( path );
					if(elist) {

						elist.each(function(entity) {
							//for each entity, get the type of entity. If it exists, spawn one and call onCreate
							var etype = game.getEntityByName( entity.entitytype );
							if(etype) {

								//first create the sprite 
								var einstance = new etype.classType();

								var pos = vec2(entity.pos);
								var ss = vec2(entity.size);
								var rot = parseFloat(entity.rotation);
								var s = new sprite(einstance.icon);
									s.pos = pos;
									if(ss.x && ss.y) {
										s.size = ss;
									}
									s.rotation = rot;
									s.group = game.groups.entity;
									s.depth = 10;
									s.flags = {
										entity : true,
									};

									s.visible = false;
									s.entity = einstance;									
									s.entity.instance = entity;
									s.entity.base = etype;
									s.entity.instance.properties = entity.properties;

									s.entity.onCreate(s);

									levels.current.sprites.push(s);
									game.entities.push(s);									
									
							} else {
								core.echo('\t\t entity type is unknown ' + entity.entitytype );
							}
						});
					}
				/*	levels.current.sprites.each(function(item,index) {
						if(item.flags) {
							if(item.flags.entity) {
								item.visible = false;
								if(item.entity) {
									core.echo('ENTITY : ' + item.entity.name);
									item.entity.onCreate(item);
								}
							}
						}
					});*/
	});
	
	
	Game.implement('saveEntities',  function( levelname ) {
		var elist = [];
				//build the list to save 
				core.echo(' :: saving ' + game.entities.length + ' entities ')
			game.entities.each(function(item) {
				var ei = item.entity.onSave( item );
				elist.push(ei);
			});
			
		filesys.save( elist, 'levels/' + levelname + '/' + levelname + '.entities.js', true );
	});
	
	Game.implement('getEntityByName',  function( name ) {
		var c = this.entityTypes.length;
		for( var i = 0; i < c; ++i ) {
			if(this.entityTypes[i].name == name) return this.entityTypes[i];
		}
		
		return null;
	});
	
	Game.implement('getEntity',  function(filename) {
		var c = this.entityTypes.length;
		for( var i = 0; i < c; ++i ) {
			core.echo('checking ' + this.entityTypes[i].path);
			if(this.entityTypes[i].path == filename) return this.entityTypes[i];
		}
		
		return null;
	});