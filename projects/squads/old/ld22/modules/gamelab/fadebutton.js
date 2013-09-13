
fadeButton = new Class({

	initialize : function( button ) {
				
		var t = button;
		button = {
				imagename : 'button.png',
				pos : vec2(100, 100),
				normalAlpha : 0.5,
				hoverAlpha : 1.0,
				fadeSpeed : 50.0,
				image : '',
				imageoffset : vec2(),
				imagesize : vec2(16,16),
				text : 'button',
				fontname : 'days',
				textoffset : vec2(0, 4),
				padding : vec2(15,0),
				fontscale : 0.6,
				centered : true,
				depth: 3000, 
				group:905,
		};		
		
		Object.append( button, t );
		
		this.button = button;
		this.connected = false;
		this.callback = null;
		this.rect = rect();
		this.hover = false;
		if( button.fontname && !button.font) {
			if(filesys.pathext( button.fontname ) == button.fontname) {
				button.fontname += '.fnt';
			}
			this.font = new font(button.fontname);

		 } else {
			this.font = button.font;
		}
		
		this.textoffset = button.textoffset;
		this.fontscale = button.fontscale;
		this.fadelow = button.normalAlpha == undefined ? 0.5 : button.normalAlpha;
		this.fadehigh = button.hoverAlpha == undefined ? 1.0 : button.hoverAlpha;
		this.fadespeed = button.fadeSpeed == undefined ? 1.0 : button.fadeSpeed;
		this.event = null;
		this.mouse = vec2(phoenix.resolution).divide(2);
		this.enabled = button.enabled == undefined ? true : button.enabled;
		this.hidden =  button.hidden == undefined ? false : button.hidden;
		
		this.md = false;
		
		if(button.imagename != undefined) {
			var d, g;
			
			if(button.pos == undefined) this.pos = vec2(); else this.pos = button.pos;
			this._pos = this.pos;
			if(button.group == undefined) g = 905; else g = button.group;
			if(button.depth == undefined) d = 200; else d = button.depth;
						
			this.sprite = new sprite( button.imagename, this.pos, 0, button.centered == true ? true : false, true, d, g );
			this.sprite.fadespeed = this.fadespeed;
			if( !button.imagename ) {
				this.sprite.geom.enabled = false;
			}
			
			if(this.font) {
				if(!button.size) {
					this.sprite.size = vec2( this.font.widthOf(button.text, this.fontscale) + button.padding.x, this.font.height(this.fontscale) + button.padding.y);
				} else {
					this.sprite.size = button.size;
				}
			}

			this.rect = this.sprite._rect();//rect(this.pos.x, this.pos.y, this.sprite.size.x, this.sprite.size.y);			
			
			if(button.text && typeOf(button.text) == 'string') {	
			
				if(button.textcolor == undefined) {
					button.textcolor = color(1,1,1);
				} 

				if(!this.font) {
					this.textgeom = phoenix.drawText(false, button.text, vec2(this.rect.x + 4 + ((this.rect.w/2)-6*button.text.length) , this.rect.y + 13), button.textcolor);
				} else {	
					var p;
					
					if(!button.centered) {
						this.textoffsetx = ( (this.sprite.size.x/2) - (this.font.widthOf(button.text, this.fontscale)/2));
						p = vec2( this.pos.x + this.textoffsetx, this.pos.y + this.textoffset.y  );
					} else {
						this.textoffsetx = (this.font.widthOf(button.text, this.fontscale)/2);
						p = vec2( this.pos.x - this.textoffsetx, this.pos.y + this.textoffset.y - (this.font.height(this.fontsize)/2) );
					}
					
					this.textgeom = this.font.drawText( false, button.text, p , button.textcolor, this.fontscale  );
					this.textsprite = new sprite();
					this.textsprite.pos = p;					
					this.textsprite.geom = this.textgeom;					
					this.textsprite.color = button.textcolor;
					this.textsprite.fade({to:this.fadelow, time:this.fadespeed});
					this.textsprite.fadespeed = this.fadespeed;
					this.textsprite.depth = d+0.01; this.textsprite.group = g;					
				}
				
				this.text = button.text;
				
				if(button.image.length) {	
					this.imagesprite = new sprite( button.image, this.sprite.pos.add(this.sprite.size.x/2,this.sprite.size.y/2).add(button.imageoffset), 0 );
					this.imagesprite.size = button.imagesize;
					this.imagesprite.depth = d+0.01;
					this.imagesprite.group = g;
				}
				
				if( button.hidden) { 
					this.sprite.fade({to:0,time:1});
					this.textsprite.fade({to:0,time:1});
					if(this.imagesprite) this.imagesprite.fade({to:0,time:1});
				} else {
					this.sprite.fade({to:this.fadelow, time:100});
				}
				
			}
			
			this.__defineGetter__("pos", function(){ return this._pos; }.bind(this));
			this.__defineSetter__("pos", function(val){	this.setpos(val); });
						
		}
		
		this.uuid = core.getuuid();
		events.connect(this.uuid + '::tick', this.update.bind(this));
		this.mdev = events.connect('mouse::left::down', this.mouseDown.bind(this));
		this.muev = events.connect('mouse::left::up', this.mouseUp.bind(this));
		this.mmev = events.connect('onMouseMove', this.mouseMove.bind(this));
		this.updev = core.time.schedule(this.uuid + '::tick', 16, {}, true, true);
	},
	
	setImageSize : function() {
		if(this.imagesprite) {
			var s = vec2(this.imagesprite.texture.width, this.imagesprite.texture.height)
			//if the image is smaller in both directions, just set the size. 
			if(s.x < this.button.imagesize.x && s.y < this.button.imagesize.y) {
				this.imagesprite.size = s ;
				this.imagesprite.srcrect = rect(0,0,s.x,s.y);				
			} else {
					//if this is wider than it is tall
				if(s.x > s.y) {
					var ratio = s.y/s.x;
					var ns = vec2( this.button.imagesize.x, this.button.imagesize.y * ratio );
					this.imagesprite.size = ns ;
					this.imagesprite.srcrect = rect( 0, 0, s.x, s.y);		
				} else {
					var ratio = s.x/s.y;
					var ns = vec2( this.button.imagesize.x * ratio, this.button.imagesize.x );
					this.imagesprite.size = ns ;
					this.imagesprite.srcrect = rect( 0, 0, s.x, s.y);		
				}
			}
		}
	},
	
	setText : function(t) {
	
		this.textsprite.geom.drop();
		
		this.text = t;
		
		var p;
		if(!this.button.centered) {
			p = vec2( this.pos.x +( (this.sprite.size.x/2) - (this.font.widthOf(t, this.fontscale)/2)), this.pos.y + this.textoffset.y  );
		} else {
			p = vec2( this.pos.x - (this.font.widthOf(t, this.fontscale)/2), this.pos.y + this.textoffset.y - (this.font.height(this.fontsize)/2) );
		}	
		
		this.textgeom = this.font.drawText( false, t, p , this.button.textcolor, this.fontscale  );
		this.textsprite.geom = this.textgeom;					
		this.textsprite.color = this.button.textcolor.alpha(this.fadelow);
		this.textsprite.fadespeed = this.fadespeed;
		this.textsprite.fade(this.fadelow, this.fadespeed);		
		this.textsprite.depth = this.sprite.depth + 0.01; this.textsprite.group = this.sprite.group;			
	},
	
	setpos : function(posp) {
		
		this._pos = posp;
		this.sprite.pos = posp;
		this.rect = this.sprite._rect();
		
		var p;
		if(!this.button.centered) {
			this.textoffsetx = ( (this.sprite.size.x/2) - (this.font.widthOf(this.button.text, this.fontscale)/2));
			//p = vec2( this.pos.x + this.textoffset, this.pos.y + this.textoffset.y  );
		} else {
			this.textoffsetx = (this.font.widthOf(this.button.text, this.fontscale)/2);
			p = vec2( this.pos.x - this.textoffsetx, this.pos.y + this.textoffset.y - (this.font.height(this.fontsize)/2) );
		}
		
		this.textsprite.pos = p;
		if(this.imagesprite) {
			this.imagesprite.pos = posp;
		}
		
		
	},
	
	show : function() {
	
		this.mdev = events.connect('mouse::left::down', this.mouseDown.bind(this));
		this.mmev = events.connect('onMouseMove', this.mouseMove.bind(this));
		this.muev = events.connect('mouse::left::up', this.mouseUp.bind(this));
		this.updev = core.time.schedule(this.uuid + '::tick', 33, {}, true, true);
		
		if(this.wasEnabled != undefined) {
			this.enabled = this.wasEnabled;
		}
		
		this.textsprite.fade( {to:this.fadelow, time:this.fadespeed} );
		this.sprite.fade( {to:this.fadelow, time:this.fadespeed} );
		if(this.imagesprite) this.imagesprite.fade( {to:this.fadelow, time:this.fadespeed} );
		this.hidden = false;
	},

	hide : function() {
		events.disconnect( this.mdev );
		events.disconnect( this.muev );
		events.disconnect( this.mmev );
		time.unschedule( this.updev );
		this.wasEnabled = this.enabled;
		this.enabled = false;
		this.textsprite.fade( {to:0 , time:this.fadespeed} );
		this.sprite.fade( {to:0 , time:this.fadespeed} );
		if(this.imagesprite) this.imagesprite.fade( {to:0 , time:this.fadespeed} );
		this.hidden = true;
	},
	
	hidec : function() {
		this.wasEnabled = this.enabled;
		this.enabled = false;
		this.textsprite.fade( {to:0 ,time: 1} );
		this.sprite.fade( {to:0 ,time: 1} );
		this.hidden = true;
	},	
	
	drop : function() {
		this.hide();
		if(this.sprite) {
			this.sprite.drop();
		}
		if(this.imagesprite) {
			this.imagesprite.drop();
		}
		if(this.textsprite) {
			this.textsprite.drop();
		}
	},
	
	toggle : function() {
		if(this.hidden) {
			this.show();
		} else {
			this.hide();
		}
	},

	update : function() {
	
	if(!this.enabled) return;
	if(this.hidden) return;
	
		if( this.rect.contains( this.mouse ) ) {
			this.hover = true;
			if(this.sprite) {
				this.sprite.fade({to:this.fadehigh, time:this.fadespeed});
				if(this.textsprite) {
					this.textsprite.fade({to:this.fadehigh, time:this.fadespeed});					
				}
				if(this.imagesprite) {
					this.imagesprite.fade({to:this.fadehigh, time:this.fadespeed});					
				}
			}
		} else { 
			if(this.hover) {
				this.hover = false;
				if(this.sprite) {
					this.sprite.fade({to:this.fadelow, time:this.fadespeed});
					if(this.textsprite) {
						this.textsprite.fade({to:this.fadelow, time:this.fadespeed});
					}
					if(this.imagesprite) {
						this.imagesprite.fade({to:this.fadelow, time:this.fadespeed});					
					}
				}
			}
		}
	},	
	
	mouseMove : function(e) {
	
		if(!this.enabled) return;
		
		this.mouse = vec2(e);
	},
	
	mouseUp : function(e) {
		this.md = false;
	},
	
	mouseDown : function(e) {
		
		if(!this.enabled) return;
		if(this.md) return;
		
			this.md = true;
		
		if(this.hover) {
			if(this.connected && this.callback != null) {
				if(typeOf(this.callback) == 'function') {
					this.callback();
				}
			} else if(this.connected && this.event != null) {
				events.fire(this.event, {});
			}
		}
	},
	
	connect : function( f1 ) {
		
		if(typeOf(f1) == 'string') {
			this.event = f1;
		} else if(typeOf(f1) == 'function') {
			this.callback = f1;
		}
		
		this.connected = true;
		
		return this;
	}
	
});
	
	


	
	
	
	
	