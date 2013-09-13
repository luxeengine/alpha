	
	levels = {};
	levels.current = {};
	levels.current.loaded = false;
	levels.current.sprites = [];
	levels.current.paths = [];
	levels.current.entities = [];
	levels.current.groups = [];
			
	levels.getspritedata = function( item ) {
			//There is an exclusion range for sprites groups
		if( !(item.group > 900 && item.group < 1000) ) {
				//Ask this item for its details.
			var o = item.serialise();
					o.flags ={};
					//Save a false so it loads as a polygon
				if(o.texture == 'Untitled') o.texture = false;			
				
			switch ( item.group ) {
				case game.groups.collision :
					o.flags.collision = true;
					o.type = 'collision';
				break;
				
				case game.groups.trigger :
					o.flags.trigger = true;
					o.type = 'trigger';
					if(item.flags) {
						o.flags.triggername = item.flags.triggername;
						o.flags.triggertype = item.flags.triggertype;
					}
				break;
				
				case game.groups.entity :
					o.type = 'entity';	
					o.flags.entity = true;
				break;
			};
			
			if(item.flags) {
					for(var pr in item.flags) {
						if(item.flags.hasOwnProperty(pr)) {
							if(pr != 'collision' && pr != 'trigger' && pr != 'entity') {
								o.flags[pr] = item.flags[pr];
							}
						}
					}
			}
			
			return o;
		}
		
		
	};
	
	levels.getgroup = function(group) {
		var items = [];
		
		group.items.each(function(item, index) {
			if(item.isGroup) {
				items.push( levels.getgroup( item ) );
			} else {				
				items.push( levels.getspritedata( item ) );
			}
		});
		
		return {
			type:'group',
			pos : { x:group.pos.x, y:group.pos.y },
			rotation : group.rotation, 
			size : { x:group.size.x, y:group.size.y },
			properties : group.properties,
			items : items
		};
	};
	
	levels.savegroup = function(group,index) {

		core.echo('\t new group ' + index );
		return levels.getgroup(group);				
	};
	
	levels.save = function( name, path ) {
	
			var list = [];
			var collisions = [];
			var entities = [];
			var paths = [];
			var groups = [];
			var gindex = 0;
			
				levels.current.sprites.each( function(item, index) {
					
						if(item.isrootgroup) {
							var o = levels.savegroup(item, gindex);						
							groups.push(o);
						} else if(!item.inGroup) {
							var o = levels.getspritedata( item );
							if(o) {
								switch(item.group) {
									case game.groups.collision:
									case game.groups.trigger:
										collisions.push( o );
									break;
									case game.groups.entity:
										entities.push(o);
									break;
									default: 
										list.push(o);
									break;
								};
							}
						}
				});
				
				game.pths.each(function(item,index) {
					paths.push( { 
						type : 'path', 
						flags : {  },
						nodes : item.serialise(),
					});
				});
				
			var rname = name;
			if(path) {
				rname = path + name;
			}
			
			var filedir = project.location + 'levels/' + name;
			if(!filesys.exists(filedir)) {
				var b = filesys.createdir(filedir);
			}  
			
			filesys.save( list , rname + '.level.js', true);
			filesys.save( entities , rname + '.entities.js', true);
			filesys.save( collisions , rname + '.collisions.js', true);
			filesys.save( paths , rname + '.paths.js', true);
			filesys.save( groups , rname + '.groups.js', true);

	};
	
	levels.unload = function() {
			//remove all current sprites if we are loading a level.
			var rem = [];
			var ccc = levels.current.sprites.length;
			var sss = phoenix.sprites.length;
			levels.current.sprites.each( function(item, index) {
					var iind = phoenix.sprites.indexOf(item);
					if(iind != -1) {
						phoenix.sprites.remove(iind);
					}
					item.drop(true);
			});
			
			delete levels.current.paths;
			delete levels.current.entities;
			
			levels.current.sprites = [];
			levels.current.paths = [];
			levels.current.entities = [];
			levels.current.collisions = [];
			
			core.echo( 'Cleaned up level, phoenix.sprites had : ' + sss + ' now has : ' + phoenix.sprites.length + ' while ' + ccc + ' level sprites were removed'  );
			delete rem;
			
			levels.current.loaded = false;
	};
	
	levels.addSprite = function( item, inGroup ) {
			if(inGroup == undefined) inGroup = false;
			if(item.texture == 'Untitled') item.texture = false;
			var s = new sprite( item.texture, vec2(item.pos), item.rotation );
				s.size = vec2(item.size);
				s.depth = item.depth;
				s.group = item.group;
				s.color = color( item.col.r, item.col.g, item.col.b, item.col.a );
				s.flags = item.flags;
				s.inGroup = inGroup;
				
				if(item.children) {
					item.children.each( function( ch, ci ) {
						s.addchild( levels.addSprite(ch), true );
					});
				}
				
				levels.current.sprites.push(s);				
				
			return s;
	},
	
	levels.loadgroup = function(group) {
		
		var groupsitems = [];
		group.items.each(function(item) {
		
			if(item.type == 'group') {
				groupsitems.push(levels.loadgroup( item ));
			} else {
				if(item.type == 'sprite') {
					groupsitems.push( levels.addSprite( item ) );
				} else  if(item.type == 'collision') {
					groupsitems( levels.addSprite( item ) );
				} else if(item.type == 'trigger') {
					groupsitems( levels.addSprite( item ) );
				} else if(item.type == 'entity') {					
					levels.current.entities.push(item);					
				}
			}
		});
		
		return groupsitems;
	};
	
	levels.load = function( name, path, oncomplete ) {
		
		levels.unload();
		
		var rname = name;
		if(path) {
			rname = path + name;
		}
		
		var ldata = exec.json( rname + '.level.js' );
		var cdata = exec.json( rname + '.collisions.js' );
		var edata = exec.json( rname + '.entities.js' );
		var pdata = exec.json( rname + '.paths.js' );
		var gdata = exec.json( rname + '.groups.js' );
		levels.current.tilemappath = rname + '.tilemap.tmx' ;
		
		if(ldata) {
			ldata.each(function(item,index) {
				if(item.type == 'sprite') {
					levels.addSprite( item );
				} 
			});
		} else {
			core.echo('level ' + name + ' has no level/sprite data');
		}
		
		if(cdata) {
			cdata.each(function(item,index) {
				if(item) {
					if(item.type == 'collision') {
						levels.addSprite( item );
					} else if(item.type == 'trigger') {
						levels.addSprite( item );
					} 
				}
			});
		} else {
			core.echo('level ' + name + ' has no collision/trigger data');
		}
		
		if(edata) {
			edata.each(function(item,index) {
				if(item.type == 'entity') {
					levels.current.entities.push(item);
				} 
			});
		} else {
			core.echo('level ' + name + ' has no entity data');
		}
		
		if(pdata) {
			pdata.each(function(item,index) {
				if(item.type == 'path') {
					levels.current.paths.push(item);
				} 
			});
		} else {
			core.echo('level ' + name + ' has no entity data');
		}
		
		if(gdata) {
			gdata.each(function(item,index) {
				//levels.current.groups.push( levels.loadgroup(item) );
			});
		} else {
			core.echo('level ' + name + ' has no group data');
		}		
		
		core.echo('\t :: level loaded, added ' + levels.current.sprites.length + ' sprites ' );
		levels.current.loaded = true;
		oncomplete();
	};