	
		//To implement a new editor mode, 
		//simply add a js file to the folder and handle events here.
		
			//supported events to handle : 
				//editor.mode.destroy
				//editor.mode.save
				//editor.mode.load
				//editor.mode.undo
				//editor.mode.redo
				//editor.*.mode.activate (* being your mode. Like grid mode, editor.grid.mode.enter 
				//editor.*.mode.deactivate ( same )

			//First create a class for your editor.
		var GridEditor = new Class({
			initialize: function() {
			
				this.mode = 'grid';
				this.events = [];
				
				this.events.push( events.connect('editor.mode.destroy', this.destroy.bind(this)) );
				this.events.push( events.connect('editor.grid.mode.activate', this.activate.bind(this)) );
				this.events.push( events.connect('editor.grid.mode.deactivate', this.deactivate.bind(this)) );
				this.events.push( events.connect('editor.grid.showGrid', this.showGrid.bind(this)) );
				this.events.push( events.connect('editor.grid.hideGrid', this.hideGrid.bind(this)) );
				
				this.activeevents = [];
				
				this.init();
			},
			
			init: function() {
			
				this.window = new Container('data/ui/window.png', vec2(phoenix.resolution.x - 380, 20), vec2(360, 200), 'Grid Editor', 5000, 902);
				this.window.hide(true);
				
					//add the editor buttons
				var buttontemplate = {
					imagename : 'data/ui/button.png',
					font: gamelab.font,
					hidden : true,
					textoffset : vec2(0,16),
					size: vec2(76,35),
					centered: false,
					fontscale : 0.35, 
					normalAlpha : 0.9,
					depth: 5001,
					group: 902,
					fadeSpeed : 250
				};
				
						var sb = buttontemplate;
							sb.text = 'scene';
							sb.pos = this.window.pos.add( 20, 60 );
							sb.textcolor = color().RGB( 57, 57, 57, 1);
								
				this.scButton = new fadeButton( sb );
					this.scButton.connect(function(){
						Editor.switchmode('scene', {returning:true});
					}.bind(this));
				
				this.labelEditors = new Text('EDITORS', this.window.pos.add(20,40), 0.35, color().RGB(182,178,172,1), 5001, 902);
					this.labelEditors.hide(250,true);
					
			},
			
			destroy: function() {
				this.events.each(function(item) {
					events.disconnect(item);
				}.bind(this));
			},
			
			activate: function() {
			
				this.window.show();
				this.scButton.show();
				this.labelEditors.show();
				
				this.showGrid();
				this.enableGridEditing();
			},
			
			deactivate: function() {
			
				this.window.hide();
				this.scButton.hide();
				this.labelEditors.hide();
				
				this.disableGridEditing();
				this.hideGrid();

			},
			
			showGrid : function() {
				
				if(!this.gridcreated) {
					if(game.grid) game.grid.draw();
					this.gridcreated = true;
				}
				if(game.grid) game.grid.show();
			},
			
			hideGrid : function() {
				if(!editor.showingGrid) {
					if(game.grid) game.grid.hide();
				}
			},
			
			enableGridEditing : function() {

				this.shiftdown = false;
				this.ctrldown = false;
				this.oldmouse = vec2(-1,-1);
				this.omc = color(1,0,1,0.15);
						
					this.activeevents.push( events.connect('key::leftshift::down', function() { this.shiftdown = true; }.bind(this)) );
					this.activeevents.push( events.connect('key::leftshift::up', function() { this.shiftdown = false; }.bind(this)) );
					this.activeevents.push( events.connect('key::leftctrl::down', function() { this.ctrldown = true; }.bind(this)) );
					this.activeevents.push( events.connect('key::leftctrl::up', function() { this.ctrldown = false; }.bind(this)) );		
					this.activeevents.push( events.connect('onMouseMove', function(e) {
							
								var p = game.mouse;
								if(!this.shiftdown && !this.ctrldown) {
								
										var g = game.grid.vgridAtPos( p );
										if(g) {
											if( !this.oldmouse.equal(g.coord) ) {
											
												if(this.oldmouse.x != -1) {								
													game.grid.vgrid[this.oldmouse.x][this.oldmouse.y].colorize( this.omc );
													game.grid.vgrid[this.oldmouse.x][this.oldmouse.y].col = this.omc;
												}
												
												this.oldmouse = g.coord;
												this.omc = g.col;
												
												g.colorize( color(0,0,0,0.5) );
												g.col = color(0,0,0,0.5);
												
											}
										}
										
								} else if(this.shiftdown) {
									this.oldmouse = vec2(-1,-1);
									game.grid.setBlockedPos( p );
								} else  if(this.ctrldown) {
									this.oldmouse = vec2(-1,-1);
									game.grid.clearBlockedPos( p );
								}
								
							}.bind(this) //onmousemove
						) //connect
					); //push
			},
			
			disableGridEditing : function() {
				this.activeevents.each(function(item) {
					events.disconnect(item);
				}.bind(this));
			},
		});
		
		if(Editor) {
			Editor.modes.push(new GridEditor());
		}
				
		
		

	
	
	