
	Game.implement( 'createPaths' , function() {

			levels.current.paths.each( function( item, index) {
				
				var p = new editpath();
				item.nodes.each(function(nodeitem, nodeindex) {						
					p.addnode( vec2(nodeitem.pos), false, true );
					p.nodes[ p.nodes.length - 1].flags = nodeitem.flags;
				}.bind(this));
				
				p.flags = item.flags;					
				if(this.smoothnodes) {
					p.createSmoothNodes( this.pathsmoothness, this.drawdebug );
				}
				core.echo( ' adding a path - length : ' + p.nodes.length);
				
				var c = color(1,0,0,0.8);
				if(index % 2 == 0) c = color( 0, 1, 0, 0.8 );
				
				if( this.drawdebug ) {
					p.draw(false, true, c );
				}
				
				this.pths.push(p);					
				
			}.bind(this));
		
	});