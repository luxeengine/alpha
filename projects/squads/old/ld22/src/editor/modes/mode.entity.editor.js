	
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
		var EntityEditor = new Class({
		
			initialize: function() {
			
				this.mode = 'entity';
				this.events = [];
				
				this.events.push( events.connect('editor.mode.destroy', this.destroy.bind(this)) );
				this.events.push( events.connect('editor.entity.mode.activate', this.activate.bind(this)) );
				this.events.push( events.connect('editor.entity.mode.deactivate', this.deactivate.bind(this)) );
				this.events.push( events.connect('editor.entity.showEntities', this.showEntities.bind(this)) );
				this.events.push( events.connect('editor.entity.hideEntities', this.hideEntities.bind(this)) );
				
				this.init();
			},
			
			init: function() {
			
				this.window = new Window( 'Entity Editor' , rect( phoenix.resolution.x - 370, 40, 360, 200 ), false, false, false );	
				this.window.close();
				
				this.spawnbut = new Button( this.window, 'Spawn Entity', rect(10, 10, 120, 40) );
				this.backbutton = new Button( this.window, 'close', rect(10, 130, 120, 30) );
				
					this.backbutton.connect('click', function() {
						Editor.switchmode('scene', {returning:true});
					}.bind(this));
				
					this.spawnbut.connect('click', function() {
						this.showSpawnList();
					}.bind(this));
				
				this.spawnwindow = new Window( 'Select entity to spawn' , rect(100,90,250,294), false, false );				
				this.spawnwindow.close();
				
					var cb = new Button( this.spawnwindow, 'Cancel', rect( 10, 230, 80, 20 ) );
					var ob = new Button( this.spawnwindow, 'Spawn', rect( 145, 230, 80, 20 ) );
					this.spawnlist = new Listbox(this.spawnwindow,rect( 10, 20, 218, 200 ), true);
					this.selected = null;
					
						//connect the select for listbox
					this.spawnlist.connect('select', function(e) {
						this.selected = e;
					}.bind(this));
					
						//connect the cancel button
					cb.connect('click', function(e){
						this.spawnwindow.close();
					}.bind(this));

						//connect the spawn button
					ob.connect('click', function(e) {
						core.echo( this.selected.index );
						var target = this.entitylist[this.selected.index];
						target = project.unpath(target);
						this.spawnEntity( target );
						this.spawnwindow.close();
					}.bind(this));
					
					
			},
			
			showSpawnList : function() {
				this.spawnwindow.show();
				this.spawnlist.clear();
					//get a list of files in this folder 
				var entitylist = filesys.getFileList('projects/ld22/src/entities/','js');					
				this.entitylist = [];
				entitylist.each(function(item) {
					item = item.replace('\\','/');
					item = './' + item;
						this.entitylist.push(item);
					item = item.substr(2, item.length - 2);
					item = item.replace('projects/ld22/src/entities/','');
					item = filesys.stripext(item);
					this.spawnlist.addItem(item);
				}.bind(this));
			},
			
			spawnEntity : function(f) {
				var entity = game.getEntity( f );
					if(entity) {

						var einstance = new entity.classType();
						
						var s = new sprite(einstance.icon);
						s.pos = game.mouse;
						s.group = game.groups.entity;
						s.depth = 10;
						s.flags = {
							entity : true,
						};
						
						s.entity = einstance;
						s.entity._onCreate( s, false );
						s.entity.instance = s.entity.onSave(s);
						s.entity.base = entity;
							
							//Add an editor mesh.
						editor.enableDebugMesh( s );
							//Flags for editing a sprite.
						s.editenabled = true;
						s.editorUpdate = editor.itemUpdate.bind(s);

							//add it to the list of active sprites.
						levels.current.sprites.push(s);
						game.entities.push(s);
						
							//store so we can remove this
						editor.spawning = s;
						
							//Call the select item function.
						var f = editor.selectItem.bind(s); f();
							//Grab the item so we can move it around.
						editor.moveitem();	
					
					} else {	
							core.echo('for some reason this entity wasn\'t added to the game. ' + f);
						return;
					}
			},
			
			showEntities : function() {

				levels.current.sprites.each(function(item,index) {
					if(item.flags) {
						if(item.flags.entity ) {
							item.visible = true;
							if(item.entity) {
								item.entity.onShow(item);
							}
						}
					}
				});
				
			},
			
			hideEntities : function() {
				if(!editor.showingEntities) {
					levels.current.sprites.each(function(item,index) {
						if(item.flags) {
							if(item.flags.entity ) {
								item.visible = false;
								if(item.entity) {
									item.entity.onHide(item);
								}								
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
				
				editor.attachEntities();
				this.showEntities();
			},
			
			deactivate: function() {
			
				this.window.close();				
				editor.detachEntities();
				this.hideEntities();
			},
			
		});
		
		if(Editor) {
			Editor.modes.push(new EntityEditor());
		}
				
		
		

	
	
	