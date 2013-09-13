
	var Container = new Class({
		initialize: function( image, pos, size, title, depth, group ) {
			//a container will hold other items inside it. It will have its own view so that it can scroll easily.
			//items inside this will forfeit their group to be able to be contained.. So, maybe that sucks later.
			if(depth == undefined) depth = 600;
			if(group == undefined) group = 902;
			this._depth = depth;
			this._group = group;
			this._pos = pos;
			this.fontsize = 0.35;
			
				//slice positions specified in texture space 
				this.slice = {
						tl : vec2( 40, 40 ),
						tm : vec2( size.x - 80, 40 ),
						tr : vec2( 40, 40 ),
						
						ml : vec2( 40,  size.y - 80 ),
						mm : vec2( size.x - 80, size.y - 80 ),
						mr : vec2( 40,  size.y - 80 ),
						
						bl : vec2( 40, 40 ),
						bm : vec2( size.x - 80, 40 ),
						br : vec2( 40, 40 ),
						
					};
				// tl tm tr
				// ml mm mr
				// bl bm br
				
			this._size = size;
				
			if(image != undefined) {
				this.sprites = [];
				
				var s = new sprite(image, pos, 0, false );  s.size = this.slice.tl ; s.depth = depth;
						s.srcrect = rect( 0, 0, this.slice.tl.x, this.slice.tl.y );
					this.sprites.push(s);
						var p1 = pos.add(this.slice.tl);
				s = new sprite(image,  vec2(p1.x, pos.y), 0, false );  s.size = this.slice.tm ;  s.depth = depth;					
						s.srcrect = rect( this.slice.tl.x, 0, s.texture.width-this.slice.mr.x-this.slice.ml.x, this.slice.tr.y );
					this.sprites.push(s);
						var p3 = pos.add(this.slice.tl.add(this.slice.tm));
				s = new sprite(image, vec2(p3.x, pos.y), 0, false );  s.size = this.slice.tr ; s.depth = depth;					
						s.srcrect = rect( s.texture.width-this.slice.tr.x, 0, this.slice.tr.x, this.slice.tr.y );
					this.sprites.push(s);
				
					var p0 = vec2(pos.x, pos.y+ this.slice.tl.y);
				var s = new sprite(image, p0 , 0, false );  s.size = this.slice.ml ; s.depth = depth;
						s.srcrect = rect( 0, this.slice.tl.y, this.slice.ml.x, s.texture.height-this.slice.bl.y-this.slice.tl.y );
					this.sprites.push(s);
						var p1 = p0.add(this.slice.ml);
				s = new sprite(image,  vec2(p1.x, p0.y), 0, false );  s.size = this.slice.mm ;  s.depth = depth;					
						s.srcrect = rect( this.slice.ml.x, this.slice.tl.y, s.texture.width-this.slice.ml.x-this.slice.mr.x, s.texture.height-this.slice.bl.y-this.slice.tl.y );
					this.sprites.push(s);
						var p3 = p0.add(this.slice.ml.add(this.slice.mm));
				s = new sprite(image, vec2(p3.x, p0.y), 0, false );  s.size = this.slice.mr ;  s.depth = depth;
						s.srcrect = rect( s.texture.width-this.slice.ml.x, this.slice.tl.y, this.slice.mr.x, s.texture.height-this.slice.bl.y-this.slice.tl.y );
					this.sprites.push(s);
				
					var p0 = vec2(pos.x, pos.y+ this.slice.tl.y + this.slice.ml.y);
				var s = new sprite(image, p0 , 0, false );  s.size = this.slice.bl ;  s.depth = depth;
						s.srcrect = rect( 0, s.texture.height-this.slice.bl.y, this.slice.bl.x, this.slice.bl.y );
					this.sprites.push(s);
						var p1 = p0.add(this.slice.bl);
				s = new sprite(image,  vec2(p1.x, p0.y), 0, false );  s.size = this.slice.bm ;  s.depth = depth;					
						s.srcrect = rect( this.slice.bl.x, s.texture.height-this.slice.bm.y, s.texture.width-this.slice.br.x-this.slice.bl.x, this.slice.bl.y );
					this.sprites.push(s);
						var p3 = p0.add(this.slice.bl.add(this.slice.bm));
				s = new sprite(image, vec2(p3.x, p0.y), 0, false );  s.size = this.slice.br ; s.depth = depth;
						s.srcrect = rect( s.texture.width-this.slice.br.x, s.texture.height-this.slice.br.y, this.slice.br.x, this.slice.br.y );
					this.sprites.push(s);
				
				this.sprites.each(function(item,index) {
					item.group = 902;
				});
				
				
			}

				//add some properties to control this window
			this.__defineGetter__("pos", function(){ return this._pos; });
			this.__defineSetter__("pos", function(val){ 
							
					//get the difference to the new position
				var diff = this.pos.subtract(val);
				this._pos = val;
				this.sprites.each(function(item,index){
					item.pos = item.pos.subtract( diff );
				}.bind(this));
				this.title.pos = this.title.pos.subtract(diff) ;
			});
			
				//add some properties to control this window
			this.__defineGetter__("depth", function(){ return this._depth; });
			this.__defineSetter__("depth", function(val){ 
					//get the difference to the new position
				this._depth = val;
				this.sprites.each(function(item,index){
					item.depth = this._depth;
				}.bind(this));
				this.title.depth = this._depth + 1;
			});
			
			this.__defineGetter__("group", function(){ return this._group; });
			this.__defineSetter__("group", function(val){ 
					//get the difference to the new position
				this._group = val;
				this.sprites.each(function(item,index){
					item.group = this._group;
				}.bind(this));
			});
			
			this.__defineGetter__("color", function(){ return this.sprites[0].color; });
			this.__defineSetter__("color", function(val){ 
				this.sprites.each(function(item,index){
					item.color = val;
				}.bind(this));
			});

			this.__defineGetter__("size", function(){ return this._size; });
			this.__defineSetter__("size", function(val){ 
				//345 need a new y and
				//147 need a new x , and 258 need to move left
				if(val.x != this.size.x) {
				
					var o = (this.slice.tl.x+this.slice.tr.x);					
					var newx = val.x-o;
					var ox = this.size.x - o;
					var diffx = ox - newx;
					
					if(newx < 0) newx = 0;
					
					this.sprites[1].size = vec2(newx, this.sprites[1].size.y);
					this.sprites[4].size = vec2(newx, this.sprites[4].size.y);
					this.sprites[7].size = vec2(newx, this.sprites[7].size.y);
											
						var diff = vec2( diffx, 0 );
						
					this.sprites[2].pos = this.sprites[2].pos.subtract(diff);
					this.sprites[5].pos = this.sprites[5].pos.subtract(diff);
					this.sprites[8].pos = this.sprites[8].pos.subtract(diff);
					
				}
				
				if(val.y != this.size.y) {
				
					var o = (this.slice.tl.y+this.slice.bl.y);					
					var newy = val.y-o;
					var oy = this.size.y - o;
					var diffy = oy - newy;
					
					if(newy < 0) newy = 0;
					
					this.sprites[3].size = vec2(this.sprites[3].size.x, newy);
					this.sprites[4].size = vec2(this.sprites[4].size.x, newy);
					this.sprites[5].size = vec2(this.sprites[5].size.x, newy);
					
						var diff = vec2( 0, diffy );
						
					this.sprites[6].pos = this.sprites[6].pos.subtract(diff);
					this.sprites[7].pos = this.sprites[7].pos.subtract(diff);
					this.sprites[8].pos = this.sprites[8].pos.subtract(diff);
					
				}
				
					var minx = (this.slice.tl.x+this.slice.tr.x);
				if(val.x < minx) val.x = minx;
					var miny = (this.slice.tl.y+this.slice.bl.y)
				if(val.y < miny) val.y = miny;
				
				this._size = val;
				
			});
			
			
			if(title) {
				var p = this._pos.add( ((this._size.x / 2)-(gamelab.font.widthOf(title, this.fontsize)/2)) , 18 );
				this.titlegeom = gamelab.font.drawText( false, title, p, color(1,1,1,0.8), this.fontsize, this._depth + 1, 902 );
				this.title = new sprite(); this.title.geom.drop(); 
					this.title.geom = this.titlegeom; 
					this.title.pos = p; 
					this.title.size = vec2( gamelab.font.widthOf(title, this.fontsize), 20 ); 
			}
			
			                              
		},
		
		setTitle : function(newtitle) {
			this.titlegeom.drop();
			this.title.geom.drop();
			var p = this._pos.add( ((this._size.x / 2)-(gamelab.font.widthOf(newtitle, this.fontsize)/2)) , 18 );
				this.titlegeom = gamelab.font.drawText( false, newtitle, p, color(1,1,1,0.8), this.fontsize, this._depth + 1, 902 );				
					this.title.pos = p; 
					this.title.size = vec2( gamelab.font.widthOf(newtitle, this.fontsize), 20 ); 
					this.title.geom = this.titlegeom; 
		},
		
		
		hide : function(quick) {
			 var speed = 250; 
			 if(quick) speed = 1;
			 this.title.fade({to:0,time:speed});
			this.sprites.each(function(item) {
				item.fade({to:0,time:speed});
			}.bind(this));
		}, 
		
		show : function(quick){
			 var speed = 250; 
			 if(quick) speed = 999;
			 this.title.fade({to:1,time:speed});
			this.sprites.each(function(item) {
				item.fade({to:1,time:speed});
			}.bind(this));
		}
		
	});