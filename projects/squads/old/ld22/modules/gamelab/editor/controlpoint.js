	var controlPoint = Class({
	
		initialize : function(pos, size, col, selcol ,depth) {	
		
				if(pos == undefined) pos = vec2();
				if(size == undefined) size = vec2(15,15);
				if(col == undefined) col = color(0,0,0,1);
				if(selcol == undefined) selcol = Color.red.alpha(1);
				if(depth == undefined) depth = 0;
				
				//create the sprites to maintain the geometry
			this.normalcolor = col;
			this.selectedcolor = selcol;
			this.active = true;
				
				this.boundingbox = new sprite();
				this.controlbox = new sprite();
				this.boundingbox.geom.drop();
				this.controlbox.geom.drop();
			
				//create the geometry 
				var bbr = rect().aroundPoint( pos, size );
				var cbr = rect().aroundPoint( pos, size.mul(0.90) );
				
			var bb = phoenix.drawrect( bbr, col, 'lines' );
			var cb = phoenix.drawrectft( cbr, col );
				
				this.boundingbox.geom = bb;

				this.boundingbox.pos = pos;
				this.boundingbox.size = size;					
				this.boundingbox.depth = depth;
				this.boundingbox.group = 901;
				this.boundingbox.color = col;
				
				this.controlbox.geom = cb;
				this.controlbox.size = vec2(cbr.w, cbr.h);
				this.controlbox.pos = pos;					
				this.controlbox.depth = depth;
				this.controlbox.group = 901;
				this.controlbox.color = color(col.r,col.g,col.b,0.41);
				
				this.controlbox.fade( {to:0.4, time:1} );
				
			this.hovered = false;
			this.selected = false;
				
			this.__defineGetter__("pos", function(){ return this.boundingbox.pos; });
			this.__defineSetter__("pos", function(val){
				this.boundingbox.pos = val;
				this.controlbox.pos = val;
			}.bind(this));
			
			this.__defineGetter__("rotation", function(){ return this.boundingbox.rotation; });
			this.__defineSetter__("rotation", function(val){
				this.boundingbox.rotation = val;
				this.controlbox.rotation = val;
			}.bind(this));
			
			this.__defineGetter__("color", function(){ return this.controlbox.color; });
			this.__defineSetter__("color", function(val){
				this.controlbox.color = val;
			}.bind(this));
				
			this.draggable = true;
			this.pos = pos;
				
				//add the mouse handling events 
			
			this.mlce = events.connect('mouse::left::down', this.leftclick.bind(this));
			this.mlce2 = events.connect('mouse::left::up', this.unleftclick.bind(this));
			this.mrce = events.connect('mouse::right::down', this.rightclick.bind(this));
			this.mme = events.connect('onMouseMove', this.mousemove.bind(this));
		},
				
		hide : function() {
			this.active = false;
			this.boundingbox.visible = false;
			this.controlbox.visible = false;
			events.disconnect( this.mlce );
			events.disconnect( this.mlce2 );
			events.disconnect( this.mrce );
			events.disconnect( this.mme );			
		},
		
		show : function() {
			if(!this.active) {
				this.active = true;
				this.boundingbox.visible = true;
				this.controlbox.visible = true;	
				this.mlce = events.connect('mouse::left::down', this.leftclick.bind(this));
				this.mlce2 = events.connect('mouse::left::up', this.unleftclick.bind(this));
				this.mrce = events.connect('mouse::right::down', this.rightclick.bind(this));
				this.mme = events.connect('onMouseMove', this.mousemove.bind(this));			
			}
		},
		
		drop : function() {
			this.boundingbox.drop();
			this.controlbox.drop();
			events.disconnect( this.mlce );
			events.disconnect( this.mlce2 );
			events.disconnect( this.mrce );
			events.disconnect( this.mme );
		},
		
		unleftclick : function(e) {
			if(this.dragging && this.draggable) {
				this.dragging = false;
				if(this.dragComplete) {
					this.dragComplete(vec2(e));
				}
			}
		},
		
		deselect : function() {
			this.selected = false;
			this.color = color(this.normalcolor.r, this.normalcolor.g, this.normalcolor.b, 0.4);
		},
		
		select : function() {
			this.selected = true;
			this.color = this.selectedcolor;
		},
		
		leftclick : function(e) {
			if(this.hovered) {
			
					//set the dragging flags				
				if(this.draggable) {
					this.dragging = true;
					this.dragstart = this.boundingbox.pos;
				}
				
				var doclick = function(e){
					if(!this.dragging) {
						if(this.selected) {
							this.deselect();
							if(this.onLeftClick) {
								this.onLeftClick( e )
							}
						} else  {
							this.select();
							if(this.onLeftClick) {
								this.onLeftClick( e )
							}
						}
					}
				}.bind(this);
				
				doclick.delay(50);
			}
		},
		
		rightclick : function(e) {
		
		},
		
		mousemove : function(e) {
								
			e = game.mouse;
			
			if(editor) {
				if(editor.enabled) {
					e = editor.mouse;
				}
			}			
			
			if( !e ) e = mouse;
			
				//maintain the color changing and activation of this item 
			if( this.boundingbox.contains( e ) ) {
				this.hovered = true;
				this.controlbox.fade( {to:1, time:100} );
				if(this.onHovered) {
					this.onHovered();
				}
			} else {
				if(this.hovered) {
					this.hovered = false;	
					if(!this.selected) {
						this.controlbox.fade( {to:0.4, time:100} );
					}
					if(this.onLeave) {
						this.onLeave();
					}					
				}
			}
			
				//maintain the dragging position
			if(this.dragging) {
				this.pos = e;
				if(this.onDragged) {
					this.onDragged(e);
				}				
			}

		},
		
		freeze : function() {
		
		},
		
		unfreeze: function(){
		
		},
		
	});