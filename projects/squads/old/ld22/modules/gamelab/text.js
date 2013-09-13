var Text = new Class({
		initialize: function(txt, pos, size, col, depth, group, fnt, align) {


			if(size == undefined) size = 1;
			if(col == undefined) col = Color.white;
			if(depth == undefined) depth = 0;
			if(group == undefined) group = 0;
			if(pos == undefined) pos = phoenix.resolution.div(2);			
			if(txt == undefined) txt = '';	
			if(fnt == undefined) fnt = gamelab.font;
			if(align == undefined) align = phoenix.alignleft;
			
			this._pos = pos;
			this._color = col;
			this._size = size;
			this._depth = depth;
			this._group = group;
			this._font = fnt;
			this._align = align;

			this._txt = new TextItem(txt, this._pos);
			this._txt.font = fnt;
			this._txt.align = align;
			this._txt.depth = depth;
			this._txt.group = group;
			this._txt.scale = size;
			this._txt.color = col;			
	
			this.set(txt);
			
		},
		
		drop : function() {
			if(this._txt) {
				this._txt.drop();
				this._txt = null;
			}
		},
		
		pos : function(p) {
			this._txt.pos = p;		
		},
		
		rotate : function(r) {
			this._txt.rotation = r;
		},
		
		set : function(txt) {
			
			this._txt.text = txt;

			return;

			
		},
		
		hide : function(quick) {
			var s = 250;
			if(quick) s = 1;
			this._txt.fade({to:0,time:s});
		},
		
		show: function() {
			this._txt.fade({to:1,time:250});
		},

	});