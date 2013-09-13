	
	Game.implement( 'bindTriggers' , function() {
			
			events.connect('level::trigger::enter', function(e) {
				
				if(e.othertype == 'player') {
					this.activetrigger = e;
				}

			}.bind(this));
			
			events.connect('level::trigger::leave', function(e){
				
				this.activetrigger = false;

			}.bind(this));
			
		});