	
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
		var CollisionEditor = new Class({
			initialize: function() {
			
				this.mode = 'collision';
				this.events = [];
				
				this.events.push( events.connect('editor.mode.destroy', this.destroy.bind(this)) );
				this.events.push( events.connect('editor.collision.mode.activate', this.activate.bind(this)) );
				this.events.push( events.connect('editor.collision.mode.deactivate', this.deactivate.bind(this)) );
				this.events.push( events.connect('editor.collision.showCollision', this.showCollisionShapes.bind(this)) );
				this.events.push( events.connect('editor.collision.hideCollision', this.hideCollisionShapes.bind(this)) );
				
				this.init();
			},
			
			init: function() {
				this.window = new Container('data/ui/window.png', vec2(phoenix.resolution.x - 380, 20), vec2(360, 200), 'Collision Editor', 5000, 902);
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
						
						
				var colbut = buttontemplate;
					colbut.text = 'collision';
					colbut.pos = this.window.pos.add( 20, 60 );
					colbut.textcolor = color().RGB( 57, 57, 57, 1);
					
				this.collisionButton = new fadeButton( colbut );
					this.collisionButton.connect( function() {
						this.spawnCollision();
					}.bind(this));				
					
						var trbut = buttontemplate;
							trbut.text = 'trigger';
							trbut.pos = this.window.pos.add( 100, 60 );
							trbut.textcolor = color().RGB( 57, 57, 57, 1);
											
				this.triggerButton = new fadeButton( trbut );			
					this.triggerButton.connect( function() {
						this.spawnTrigger();
					}.bind(this));						
				
						var scnbut = buttontemplate;
							scnbut.text = 'scene';
							scnbut.pos = this.window.pos.add( 20, 130 );
							scnbut.textcolor = color().RGB( 57, 57, 57, 1);
								
				this.sceneButton = new fadeButton( scnbut );
					this.sceneButton.connect(function(){
						Editor.switchmode('scene', {returning:true});
					}.bind(this));
				
				this.labelEditors = new Text('BACK', this.window.pos.add(20,110), 0.35, color().RGB(182,178,172,1), 5001, 902);
					this.labelEditors.hide(250,true);
					
				this.labelSpawn = new Text('SPAWN', this.window.pos.add(20,40), 0.35, color().RGB(182,178,172,1), 5001, 902);
					this.labelSpawn.hide(250,true);
					
					
			},
			
			showCollisionShapes : function() {

				levels.current.sprites.each(function(item,index) {
					if(item.flags) {
						if(item.flags.collision || item.flags.trigger) {
							item.visible = true;
						}
					}
				});
				
			},
			
			hideCollisionShapes : function() {
				if(!editor.showingCollision) { 
					levels.current.sprites.each(function(item,index) {
						if(item.flags) {
							if(item.flags.collision || item.flags.trigger) {
								item.visible = false;
							}
						}
					});
				}
			},
			
			
			
			destroy: function() {
				this.events.each(function(item) {
					events.disconnect(item);
				}.bind(this));
			},
			
			activate: function(d) {
				
				this.window.show();
				this.sceneButton.show();
				this.collisionButton.show();
				this.triggerButton.show();				
				this.labelEditors.show();
				this.labelSpawn.show();
				
				editor.attachCollision();
				this.showCollisionShapes();
				
				if(d.spawn) {
					this.spawnCollision();
				}
			},
			
			deactivate: function() {
				this.window.hide();
				this.sceneButton.hide();
				this.collisionButton.hide();
				this.triggerButton.hide();				
				this.labelEditors.hide();
				this.labelSpawn.hide();
				
				editor.detachCollision();
				this.hideCollisionShapes();
			},
			
			spawnCollision : function() {

				
				var s = new sprite(false);
				
					s.pos = game.mouse;
					s.size = vec2(100, 100) ;
					s.color = color(1,0,0,0.2);
					s.group = game.groups.collision;
					s.depth = 81;
					s.body = game.physics.spawn( s.bounds().center(), s.size.div(2), s.rotation, true, 'box' );
					
					s.flags = {};
					s.flags.collision = true;

						//Add an editor mesh.
					editor.enableDebugMesh( s );
						//Flags for editing a sprite.
					s.editenabled = true;
					s.editorUpdate = editor.itemUpdate.bind(s);
										
						//add it to the list of active sprites.
					levels.current.sprites.push(s);
					
						//store this to remove it 
					editor.spawning = s;
						//Call the select item function.
					var f = editor.selectItem.bind(s); f();
						//Grab the item so we can move it around.
					editor.moveitem();
			},
			
			spawnTrigger : function() {

				
				var s = new sprite(false);
				
					s.pos = game.mouse;
					s.size = vec2(100, 100) ;
					s.color = color(0,1,0,0.2);
					s.group = game.groups.trigger;
					s.depth = 400;					
					
					s.flags = {};
					s.flags.trigger = true;
					s.flags.triggername = 'defaultTrigger';
					s.flags.triggertype = 'default';
					
					s.body = game.physics.addtrigger( s.flags.triggername, s.flags.triggertype, s.bounds().center(), s.size.div(2), s.rotation, true, 'box'  );

						//Add an editor mesh.
					editor.enableDebugMesh( s );
						//Flags for editing a sprite.
					s.editenabled = true;
					s.editorUpdate = editor.itemUpdate.bind(s);
										
						//add it to the list of active sprites.
					levels.current.sprites.push(s);
					
						//store so we can destroy it
					editor.spawning = s;
					
						//Call the select item function.
					var f = editor.selectItem.bind(s); f();
						//Grab the item so we can move it around.
					editor.moveitem();
			},
			
		});
		
		if(Editor) {
			Editor.modes.push(new CollisionEditor());
		}
				
		
		

	
	
	