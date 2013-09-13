
	var Entity = new Class({
		initialize: function() {
			this.type = 'entity';
			this.name = '';
			this.icon = 'data/icons/entity.png';
			this.pos = vec2();
			this.id = core.getuuid();
		},
		
		_onSave : function( item ) {

			var o = { 
				type : this.type,
				entitytype : this.name, 
				pos : { x: item.pos.x, y: item.pos.y } , 
				size : { x: item.size.x, y: item.size.y }, 
				rotation : item.rotation, 
			};
			
			if(item.entity.instance) {
				if(item.entity.instance.properties) {
					o.properties = item.entity.instance.properties;
				} else {
					o.properties = item.entity.properties;
				}
			} else {
				o.properties = item.entity.properties;
			}
			
			for(var pp in o.properties) {
				if(o.properties.hasOwnProperty(pp)) {
					var v = o.properties[pp];
					var f = parseFloat(v);
					if( !isNaN(f) ) {
						v = f;
					}
					
					if(v == 'true') {
						v = true;
					} else if(v == 'false') {
						v = false;
					}
					
					o.properties[pp] = v;
				}
			}
			
			return o;
		},
		
		_onShow : function( item ) {
			this.label.show();
		},
		
		_onDrop : function() {
			this.label.drop();
			var ind = game.entities.indexOf(this);
				game.entities.remove(ind);
		},
		
		_onHide : function( item ) {
			this.label.hide();
		},
		
		_onMove : function( item ) {
		
			var w = gamelab.font.widthOf( this.name , 0.5 )/2;
			var p = item.pos.subtract( w , 12 );			
			this.label.pos( p );
			
		},
		
		_onRotate : function( item ) {
		
			//this.label.rotate( item.rotation );
			
		},
		
		_onCreate : function( item, hide ) {

			if(this.label) return;			
			if(hide == undefined) hide = true;
			this.label = new Text(this.name, item.pos.subtract( gamelab.font.widthOf( this.name ,0.5)/2, 12)  , 0.5, color().RGB(0,0,0,1), item.depth+0.1,  item.group );
			if(hide) {	
				this.label.hide();
			}
		},
		
		onDrop : function(){
			this._onDrop();
		},

		onMove : function( item ) {
			this._onMove(item);
		},

		onRotate : function( item ) {
			this._onRotate(item);
		},

		onShow : function(item) {
			this._onShow(item);
		},

		onHide : function(item) {
			this._onHide(item);
		},

		onSave : function(item) {
			return this._onSave( item );
		},

	});