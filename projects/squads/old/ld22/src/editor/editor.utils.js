
	editor.mouse = phoenix.resolution.div(2);
	events.connect( 'onMouseMove', function( e ) {  
	
		editor.mouse = vec2(e); 
		
		if(game.cam) {
			editor.mouse = editor.mouse.add( game.cam.pos );
			editor.mouse = editor.mouse.div( game.cam.zoomAmount );
		}

	});	

	editor.drawrectp = function( r , col, depth, group ) {
	
		var rg = new geometry();

			rg.addVertex( vec2( r.x, r.y ), 					col );  rg.addVertex( vec2( r.x+r.w, r.y ), 			col );  
			rg.addVertex( vec2( r.x+r.w, r.y ), 			col );  rg.addVertex( vec2( r.x+r.w, r.y+r.h ), 	col );  
			rg.addVertex( vec2( r.x+r.w, r.y+r.h ), 	col );  rg.addVertex( vec2( r.x, r.y+r.h ), 			col );  
			rg.addVertex( vec2( r.x, r.y+r.h ), 			col );  rg.addVertex( vec2( r.x, r.y ), 					col );  
			
			
		if(depth != undefined) {
			rg.depth = depth;			
		}
		if(group != undefined) {
			rg.group = group;			
		}
				
		return rg;
	};
	
	editor.drawrect = function( imm, r, col, depth, cross ) {
		
			phoenix.setDepth( depth );
		
			phoenix.drawLine( true, vec2( r.x, r.y ), vec2( r.x+r.w, r.y ), col, col ); //top left to tr 
			phoenix.drawLine( true, vec2( r.x+r.w, r.y ), vec2( r.x+r.w, r.y+r.h ), col, col ); //top right to bottom right 
			phoenix.drawLine( true, vec2( r.x+r.w, r.y+r.h ), vec2( r.x, r.y+r.h ), col, col ); //bottom right to bottom left
			phoenix.drawLine( true, vec2( r.x, r.y+r.h ), vec2( r.x, r.y ), col, col ); //bottom left to top left	
			
			if(cross) {
				phoenix.drawLine( true, vec2( r.x, r.y+r.h ), vec2( r.x+r.w, r.y ), color(col.r, col.g, col.b, 0.2), color(col.r, col.g, col.b, 0.2) ); //bottom left to top right								
				phoenix.drawLine( true, vec2( r.x, r.y ), vec2( r.x+r.w, r.y+r.h ), color(col.r, col.g, col.b, 0.2), color(col.r, col.g, col.b, 0.2) ); //top left to bottom right								
			}
	};	
	
editor.getAABB = function( items ) {
			var points = [];
			items.each(function(item) {
				points.append(item.realbounds());
			});
			
			//core.echo('getting an AABB for ' + points.length + ' verts ' );
			
			var minx = points[0].x; var maxx = points[points.length-1].x; var miny = points[0].y; var maxy = points[points.length-1].y;
				points.each(function(p){
					var g = editor.drawrectp( rect( p.x-3, p.y-3, 6, 6), Color.blue.alpha(1), 400, game.groups.objects ); g.persist = false;
					if(p.x <= minx) { minx = p.x; }   
					if(p.x >= maxx) { maxx = p.x; } 
					if(p.y <= miny) { miny = p.y; }  
					if(p.y >= maxy) { maxy = p.y; }
				});
				
			var theaabb = rect(minx,miny,maxx-minx,maxy-miny);				
			var g = editor.drawrectp( rect( theaabb.center().x-5, theaabb.center().y-5, 10, 10), Color.green.alpha(1), 400, game.groups.objects ); g.persist = false;
			
			
			return theaabb;
}; //getAABB
	
editor.deactivateKeys = function() {
	
		events.disconnect( editor.moveevent );
		events.disconnect( editor.scaleevent );
		events.disconnect( editor.scaleeventy );
		events.disconnect( editor.rotateevent );
		
		events.disconnect( editor.groupevent );
		events.disconnect( editor.duplicateevent );
		events.disconnect( editor.deleteevent );		
		events.disconnect( editor.resetevent );

}; //deactivateKeys
	
editor.activateKeys = function() {
	
	editor.moveevent = events.connect('key::v::down', function() {
		
			if(editor.gui.hover) return;
			if(!editor.selected.length) return;
			
				editor.moveitem(); 				
		});
		
	editor.scaleeventy = events.connect('key::y::down', function(e) {
		
			if(editor.gui.hover) return;
			if(!editor.selected.length) return;
			
			if(editor.mode == editor.modes.scale) {
				if(editor.scalemode != editor.scaling.y) {
						editor.scalemode = editor.scaling.y;
							if(editor.current) {
								if((editor.current.rotation > 45 && editor.current.rotation < 135) || (editor.current.rotation > 225 && editor.current.rotation < 315)) {
									editor.scaleinvert = true;
								} else {
									editor.scaleinvert = false;
								}
							}
				} else {
					editor.scalemode = editor.scaling.both;
				}
			}
		});
		
	editor.scaleevent = events.connect('key::x::down', function(e){ 
			if(editor.gui.hover) return;
			if(!editor.selected.length) return;
			
			if(editor.mode == editor.modes.scale) {

				if(editor.scalemode != editor.scaling.x) {
					editor.scalemode = editor.scaling.x;
						if(editor.current) {
							if((editor.current.rotation > 45 && editor.current.rotation < 135) || (editor.current.rotation > 225 && editor.current.rotation < 315)) {
								editor.scaleinvert = true;
							} else {
								editor.scaleinvert = false;
							}
						} 
				} else {
					editor.scalemode = editor.scaling.both;
				}
				
			} else {
			
				editor.scalemode = editor.scaling.both;
				editor.scaleinvert = false;
				editor.scaleitem();

			}
		});
			
	editor.rotateevent = events.connect('key::c::down', function(){
			if(editor.gui.hover) return;
			
				editor.rotateitem();
		});

	editor.ctrlevent = events.connect('key::ctrl::down', function(e){
		editor.ctrlkey = true;
	})
	editor.ctrlevent = events.connect('key::ctrl::up', function(e){
		editor.ctrlkey = false;
	})
	
	editor.groupevent = events.connect('key::ctrl::g::down', function(e) {
			if(editor.selected.length > 1) {	
				editor.makegroup( editor.selected );
			} else if(editor.selected.length == 1) {
				if(editor.selected[0].isGroup) {
					editor.unmakegroup( editor.selected[0] );
				}
			}
		});
	
	editor.duplicateevent = events.connect('key::d::down', editor.duplicateitem );
	
	editor.deleteevent = events.connect('key::delete::down', editor.deleteitem );
	
	editor.resetevent = events.connect('key::r::down', function(e){
			if(editor.gui.hover) return;
			if(e.shift) {
				game.cam.zoom(1);
				game.cam.pos = vec2(-480,-320);
			}
		});

} //activateKeys

	
	editor.rotationTo = function( pos, target ) {
	
		var theta =  Math.atan2(  target.x - pos.x , target.y - pos.y );
		var r = -(180.0 + (theta *180.0/Math.PI));
		return r ;

	}; //rotation to

editor.drawInfoBars = function(dt) {
	
		var a = phoenix.getDepth();  var b = phoenix.getGroup();	
		phoenix.setDepth(300); phoenix.setGroup(999);
		
				phoenix.drawRectangle(true, rect( 0, 0, phoenix.resolution.x , 35), color(0,0,0,0.5) );
				phoenix.drawRectangle(true, rect( 0, phoenix.resolution.y - 35, phoenix.resolution.x , 35), color(0,0,0,0.4) );				

				var scaleinfo = '';
				
				if(editor.mode == editor.modes.scale) {
					scaleinfo = 'scaling mode : ';
					if(editor.scalemode == editor.scaling.both)
						{ scaleinfo += 'both'; }
					else if(editor.scalemode == editor.scaling.x) 
						{ scaleinfo += 'x'; }
					else if(editor.scalemode == editor.scaling.y) 
						{ scaleinfo += 'y'; }
				}
				
				 var d = gamelab.font.drawText( true, ' selected : ' + editor.selected.length + ' groups : ' + editor.groups.length + '    '  + scaleinfo, vec2(5, phoenix.resolution.y - 25), color(1,1,1,0.8), 0.35, 300, 999 );	
				 
		phoenix.setGroup(b); phoenix.setDepth(a);
}; //drawInfoBars

var editorToggle = function(e){
			
		if(editor.enabled) { 
		
			editor.oldcamzoom = game.cam.zoomAmount;
			editor.oldcampos = game.cam.pos;
			
			editor.detach();
			game.enablecam();
			
		} else { 
			
			game.disablecam();
			
			if( editor.oldcamzoom ) {
				
				game.cam.zoom(editor.oldcamzoom);
				game.cam.pos = editor.oldcampos;
				
			}			
			
			editor.attach(); 			
		}
		
}; //editor toggle