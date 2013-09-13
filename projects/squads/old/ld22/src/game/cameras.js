		Game.implement('enablecam' , function() {	
		
			this.cam.draggable = false;
			this.cam.zoomable = false;			
			
			this.cam.zoom( this.oldcamzoom );
			this.cam.pos = this.oldcampos;
			
		}); 
		
		Game.implement('disablecam' ,  function() {
		
			this.cam.draggable = true;
			this.cam.zoomable = true;
			this.cam.dragButton = 'right';
			
			this.oldcampos = this.cam.pos;
			this.oldcamzoom = this.cam.zoomAmount;
			
		});