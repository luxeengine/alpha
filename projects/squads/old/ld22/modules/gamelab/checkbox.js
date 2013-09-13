var _Checkbox = new Class({
				initialize: function(options) {
				
					if(options.size == undefined) options.size = vec2(17,17);
					if(options.image == undefined) options.image = 'data/ui/checkbox.png';
					if(options.label == undefined) options.label = 'checkbox';
					if(options.textsize == undefined) options.textsize = 0.4;
					if(options.depth == undefined) options.depth = 5001;
					if(options.group == undefined) options.group = 902;
					if(options.textcolor == undefined) options.textcolor = Color.white;
					if(options.pos == undefined) options.pos = vec2(); 
					if(options.spacing == undefined) options.spacing = vec2();
					if(options.textoffset == undefined) options.textoffset = vec2();
					if(options.value == undefined) options.value = false;
					if(options.onChange == undefined) options.onChange = false;
					if(options.fadespeed == undefined) options.fadespeed = 250;
					if(options.hidden == undefined) options.hidden = false;

					this.options = options;
					this.pos = options.pos;
					this.size = options.size;
					
					this.box = new sprite( this.options.image, this.pos, 0, false );
						this.box.size = this.options.size;
						this.box.depth = this.options.depth;
						this.box.group = this.options.group;
						this.box.cells(vec2(18,18));
							if(this.options.value) {
								this.box.frame = 2;								
							} else {
								this.box.frame = 1;
							}
					this.value = this.options.value;
					this.label =  new Text( this.options.label, this.pos.add( this.size.x + this.options.textoffset.x , this.options.textoffset.y), this.options.textsize, this.options.textcolor , this.options.depth+1, this.options.group);
					this.bounds = rect( this.pos.x, this.pos.y, this.box.size.x + gamelab.font.widthOf( this.options.label, this.options.textsize ) + 5 + this.options.textoffset.x, this.box.size.y + 5 + this.options.textoffset.y );
					//this.bounds.draw(false, color(1,0,0,0.5), this.options.depth+1,this.options.group+1);
					this.mme = events.connect( 'onMouseMove', this.onMouseMove.bind(this) );
					this.lce = events.connect( 'mouse::left::down', this.onLeftClick.bind(this) );
					
					if(this.options.hidden) this.hide();
					
				},
				
				show : function() {

					this.label.show();
					this.box.fade({to:1, time:this.options.fadespeed });
					
						this.mme = events.connect( 'onMouseMove', this.onMouseMove.bind(this) );
						this.lce = events.connect( 'mouse::left::down', this.onLeftClick.bind(this) );
										
				},
				
				hide : function() {
					events.disconnect( this.mme );
					events.disconnect( this.lce );
					this.label.hide();
					this.box.fade({to:0, time:1} );
				},
				
				set : function( val, callOnChange ) {
					
					var old = this.value;
					this.onChange( val, this.value );
					this.value = val;
						if(this.value) {
							this.box.frame = 2; 
						} else {
							this.box.frame = 1; 
						}
				},
				
				setLabel : function(t) {
					this.options.label = t;
					this.label.set(t);
					this.bounds = rect( this.pos.x, this.pos.y, this.pos.x + this.box.size.x + gamelab.font.widthOf( this.options.label, this.options.textsize ) + 5, this.box.size.y + 5 );
				},
				
				onMouseMove : function(e) {
					
					var p = vec2(e);

					if(this.bounds.contains(p) ) {
						this.hover = true;
					} else {
						this.hover = false;
					}
				},
				
				onLeftClick : function(e) {
					if(this.hover) {
						this.value = !this.value;
						this.onChange( this.value, !this.value );
						if(this.value) {
							this.box.frame = 2; 
						} else {
							this.box.frame = 1; 
						}
					}
				},
				
				onChange : function(newValue, oldValue) {
					if(this.options.onChange) {
						this.options.onChange(newValue, oldValue);
					}
				},
				
			});