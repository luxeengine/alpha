		
	Game.implement( 'initEditing' , function() {
			events.connect( 'key::5::down', function(){ core.reload(); });
			events.connect( 'key::2::down', function(){  });
			events.connect( 'key::t::down', function(){
				if(!editor.enabled) {
					var s = new sprite(false);
						s.pos = phoenix.resolution.div(2);
						s.size = vec2(100, 100) ;
						s.color = color(0,1,0,0.3);
						s.depth = 400;
						s.group = game.groups.trigger;
						s.body = this.physics.spawn( s.bounds().center(), s.size.div(2), s.rotation, true, 'circle', false, true );
				}
			}.bind(this));
			events.connect( 'key::l::down', function(){
				if(!editor.enabled) {
					var s = new sprite('data/iconlight.png');
						s.pos = game.mouse;
						s.size = vec2(48, 48) ;
						s.color = color(1,1,1,1);
						s.depth = 2000;
						s.group = game.groups.light;
					s.flags = {};
					s.flags.color = color(0,0,0,0.8);
					s.flags.range = 500;
				}
			}.bind(this));
			events.connect( 'key::p::down', function(){
				if(currentpath) {
					currentpath.stopmesh();
						this.pths.push(currentpath);
					currentpath = false;
				}
				currentpath = new editpath( );
				currentpath.startmesh();				
			}.bind(this));				
			events.connect('mouse::right::down', function() {
				if(currentpath) {
					currentpath.stopmesh();
						this.pths.push(currentpath);
					currentpath = false;
				}
			}.bind(this));		
			events.connect('key::m::down', function(e){
				if(editor.enabled) return;
				if(game.mapmode) {
					game.oldcamzoom = game.cam.zoomAmount;
					game.oldcampos = game.cam.pos;
					game.mapmode = false;
					game.enablecam();
				} else {
					game.disablecam();
					if( game.oldcamzoom ) {
						game.cam.zoom( game.oldcamzoom );
						game.cam.pos = game.oldcampos;
					}			
					game.mapmode = true;
				}
			});	
			
		});