	Game.implement('createDebugUI' , function() {

			//make the debug overlay 
				this.overlay = new sprite( false, vec2(), 0, false);
				this.overlay.size = phoenix.resolution;
				this.overlay.color = color(0,0,0,0.1);
				this.overlay.group = this.groups.debug;
				this.overlay.depth = this.depths.debug;
				this.overlay.fade(0,999);
				this.overlay.active = false;
			
			events.connect('key::9::down', function(){
				
				if(this.overlay.active) {				
					this.overlay.fade(0, 200);
					this.overlay.active = false;
					phoenix.showDebug(false);
					
				} else {
					this.overlay.active = true;
					this.overlay.fade(0.85, 200);
					phoenix.showDebug(true);
				}
				
			}.bind(this));
		});