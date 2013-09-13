	
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
		var SceneEditor = new Class({
			initialize: function() {
			
				this.mode = 'scene';
				
				events.connect('editor.mode.destroy', this.destroy.bind(this));
				events.connect('editor.scene.mode.activate', this.activate.bind(this));
				events.connect('editor.scene.mode.deactivate', this.deactivate.bind(this));
				
				this.active = false;
				
				this.init();
			},
			
			init: function() {
				this.window = new Container('data/ui/window.png', vec2(phoenix.resolution.x - 380, 20), vec2(360, 400), 'Scene Editor', 5000, 902);
				this.window.hide(true);
				
				this.createSpriteSelector();
				
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

						var sprbut = buttontemplate;
							sprbut.text = 'sprite';
							sprbut.pos = this.window.pos.add( 20, 60 );
							sprbut.textcolor = color().RGB( 57, 57, 57, 1);
											
				this.spriteButton = new fadeButton( sprbut );
					this.spriteButton.connect(function(){
						this.showSpriteSelector('data/');
					}.bind(this));
					
					events.connect('editor.show.sprites', function(d) {					
						this.showSpriteSelector('data/');
					}.bind(this));
				
						var blpbut = buttontemplate;
							blpbut.text = 'blueprint';
							blpbut.pos = this.window.pos.add( 100, 60 );
							blpbut.textcolor = color().RGB( 57, 57, 57, 1);
							blpbut.image = '';	
											
				this.blueprintButton = new fadeButton( blpbut );				
				
						var entbut = buttontemplate;
							entbut.text = 'entity';
							entbut.pos = this.window.pos.add( 20, 130 );
							entbut.textcolor = color().RGB( 57, 57, 57, 1);
							
				this.entityButton = new fadeButton( entbut );
					this.entityButton.connect(function(){
						Editor.switchmode('entity', {stay:true});
					}.bind(this));
				
						var pthbut = buttontemplate;
							pthbut.text = 'paths';
							pthbut.pos = this.window.pos.add( 100, 130 );
							pthbut.textcolor = color().RGB( 57, 57, 57, 1);
											
				this.pathsButton = new fadeButton( pthbut );
				
						var savebut = buttontemplate;
							savebut.text = 'save';
							savebut.pos = this.window.pos.add( 20, 230 );
							savebut.textcolor = color().RGB( 57, 57, 57, 1);
											
				this.saveButton = new fadeButton( savebut );
				
					this.saveButton.connect(function(){
						if(this.textBox.enabled) {
							var levelname = this.textBox.text;
							if(levelname.length == 0) levelname = game.currentlevel;
							core.echo('\t\t Editor : Saving level : ' + levelname );
							levels.save(levelname,'levels/' + levelname + '/');
							if(game.grid) {
								filesys.save( game.grid.grid, 'levels/' + levelname + '/' + levelname + '.grid.js', true );
							}
							game.saveEntities( levelname );
							this.destroyTextBox();
						} else {
							this.createTextBox();
						}
					}.bind(this));
				
						var loadbut = buttontemplate;
							loadbut .text = 'load';
							loadbut .pos = this.window.pos.add( 100, 230 );
							loadbut .textcolor = color().RGB( 57, 57, 57, 1);
											
				this.loadButton = new fadeButton( loadbut  );
					this.loadButton.connect(function(){
						if(this.textBox.enabled) {
							var levelname = this.textBox.text;
							if(levelname.length == 0) levelname = game.currentlevel;
							core.echo('\t\t Editor : Loading level : ' + levelname );
							game.unload();
							//levels.load( levelname,'levels/' + levelname + '/', function(){} );
							game.loadLevel( levelname, function(){});
							this.destroyTextBox();
							
						} else {
							this.createTextBox();
						}
					}.bind(this));
					
				
						var astbut = buttontemplate;
							astbut.text = 'grids';
							astbut.pos = this.window.pos.add( 180, 130 );
							astbut.textcolor = color().RGB( 57, 57, 57, 1);
											
				this.gridsButton = new fadeButton( astbut );				
					this.gridsButton.connect(function(){						
						Editor.switchmode('grid', {stay:true});
					}.bind(this));								
				
					var colebut = buttontemplate;
							colebut.text = 'collision';
							colebut.pos = this.window.pos.add( 260, 130 );
							colebut.textcolor = color().RGB( 57, 57, 57, 1);
											
				this.editCollisionButton = new fadeButton( colebut );				
					this.editCollisionButton.connect(function(){
						Editor.switchmode('collision', {stay:true});
					}.bind(this));								
				
				this.labelSpawn = new Text('SPAWN', this.window.pos.add(20,40), 0.35, color().RGB(182,178,172,1), 5001, 902);
					this.labelSpawn.hide(250,true);
				this.labelEditors = new Text('EDITORS', this.window.pos.add(20,110), 0.35, color().RGB(182,178,172,1), 5001, 902);
					this.labelEditors.hide(250,true);
				this.labelOptions = new Text('SCENE EDITOR OPTIONS', this.window.pos.add(20,210), 0.35, color().RGB(182,178,172,1), 5001, 902);
					this.labelOptions.hide(250,true);
					
				this.textBox = new cmdline(this.window.pos.add(20, 270) , 320, gamelab.font, 5001);
				this.textBox.disable();
				
				//add some checkboxes for modes at the bottom
				
				this.viewgridcb = new _Checkbox({
					size : vec2(14,14),
					textoffset : vec2(10, 0),
					label : 'show grid',
					hidden : true,
					value : false,
					pos : this.window.pos.add(25, 340),
					onChange : function(val) {
						if(val) {
							if(game.viewgrid) game.viewgrid.show();
						} else {
							if(game.viewgrid) game.viewgrid.hide();
						}
					},
				});
				
				events.connect( 'editor.viewgrid.set', function(e) { this.viewgridcb.set(e.value); }.bind(this) );
				
				this.gridcb = new _Checkbox({
					size : vec2(14,14),
					textoffset : vec2(10, 0),
					label : 'show ai grid',
					hidden : true,
					pos : this.window.pos.add(190, 340),
					onChange : function(val) {
						if(val) {
							editor.showingGrid = true;
							events.fire('editor.grid.showGrid', {});
						} else {
							editor.showingGrid = false;
							events.fire('editor.grid.hideGrid', {});
						}
					},					
				});
				
				this.collisioncb = new _Checkbox({
					size : vec2(14,14),
					textoffset : vec2(10, 0),
					label : 'show collision',
					hidden : true,
					pos : this.window.pos.add(25, 360),
					onChange : function(val) {
						if(val) {
							editor.showingCollision = true;
							events.fire('editor.collision.showCollision', {});
						} else {
							editor.showingCollision = false;
							events.fire('editor.collision.hideCollision', {});
						}
					},							
				});
				
				this.entitycb = new _Checkbox({
					size : vec2(14,14),
					textoffset : vec2(10, 0),
					label : 'show entities',
					hidden : true,
					pos : this.window.pos.add(190, 360),
					onChange : function(val) {
						if(val) {
							editor.showingEntities = true;
							events.fire('editor.entity.showEntities', {});
						} else {
							editor.showingEntities = false;
							events.fire('editor.entity.hideEntities', {});
						}
					},							
				});
			},
			
			createTextBox : function() {
				this.textBox.enable();
				this.textBox.text = '';
			},
			
			destroyTextBox : function() {
				this.textBox.disable();
				this.textBox.text = '';
			},
			
			destroy: function() {
				
			},

			spawnSprite : function(name) {
									
					var s = new sprite(name);
					s.pos = game.mouse;
					s.group = game.groups.objects;
					s.depth = 10;										
					s.flags = {};

						//Add an editor mesh.
					editor.enableDebugMesh( s );
						//Flags for editing a sprite.
					s.editenabled = true;
					s.editorUpdate = editor.itemUpdate.bind(s);
										
						//add it to the list of active sprites.
					levels.current.sprites.push(s);
					
						//store this so we can undo this 
					editor.spawning = s;
					
						//Call the select item function.
					var f = editor.selectItem.bind(s); f();
						//Grab the item so we can move it around.
					editor.moveitem();				
			},
			
			createSpriteSelector: function() {
				this.swindow = new Container('data/ui/window.png', vec2((phoenix.resolution.x/2) - 315, 40), vec2(630, 580), 'Sprite Selector - Click to select an image', 5002, 902);
				this.swindow.hide(true);
				
					this.slist = [];
					var cc = -1; var rr = 0;
					for( var i = 0; i < 12; ++i ) {
					
						var img = 'data/icons/folder.png';// item.substr(5, item.length-5);
						var imgonly = ' add to folder ';//filesys.filename(item, false);
						
						var b = {
							imagename : 'data/icons/spriteback.png',						font: gamelab.font,
							hidden : true,															textoffset : vec2(0,134),
							size: vec2(140,140),												centered: false,
							fontscale : 0.35, 														text: imgonly,
							normalAlpha : 0.5,													depth: 5003,
							group: 902,																fadeSpeed : 250,
							image : img,																imagesize : vec2(112,112),
							imageoffset : vec2(),
						};
						
						cc += 1;
						if(cc > 3) {  cc = 0;  rr += 1;  }
						
						var x = this.swindow.pos.x + 20 + (cc * 150); 
						var y = this.swindow.pos.y + 40 + (rr * 155);
							
							b.pos = vec2(x,y);
							
						var a = new fadeButton(b);
							a.connect( function() {
								//this.spawnSprite(a.text);
								this.closeSpriteSelector();
							}.bind(this));
						this.slist.push(a);
					}

						var b = {
							imagename : 'data/ui/window.png', 
							font: gamelab.font,					hidden : true, 
							textoffset : vec2(0,10),				size: vec2(100,35),
							centered: false, 						fontscale : 0.35, 
							text: 'CANCEL',							normalAlpha : 0.7,
							depth: 5003,	  							group: 902,
							fadeSpeed : 250,						image : '',
							imagesize : vec2(112,112), 		imageoffset : vec2(),
							
							pos : vec2(this.swindow.pos.x + 510, this.swindow.pos.y + 522 ),
						};
						
						this.swindow.cancelbutton = new fadeButton(b);
							this.swindow.cancelbutton.connect(function() {
								this.closeSpriteSelector();
							}.bind(this));
							
							
						this.swindow.folderbox = new cmdline(this.swindow.pos.add(240, 529) , 150, gamelab.font, 5003);
							this.swindow.folderbox.disable();							

						b.text = 'FOLDER';
						b.pos = vec2(this.swindow.pos.x + 400, this.swindow.pos.y + 522 );

						this.swindow.folderbutton = new fadeButton(b);
							this.swindow.folderbutton.connect(function() {
								if( this.swindow.folderbox.text.length ) {
									this.setSpriteSelectorFolder( this.swindow.folderbox.text );	
									this.swindow.folderbox.text = '';
								}
							}.bind(this));

						b.text = '< PAGE ';
						b.pos = vec2(this.swindow.pos.x + 20, this.swindow.pos.y + 522 );
							
						this.swindow.pagebackbutton = new fadeButton(b);
							this.swindow.pagebackbutton.connect(function() {
								
								if(this.swindow.page > 1) {
									this.swindow.page--;
								} else {
									this.swindow.page = this.swindow.pages.length;
								}
								
								this.setSpriteSelectorPage( this.swindow.page );
									
							}.bind(this));
							
						b.text = 'PAGE > ';
						b.pos = vec2(this.swindow.pos.x + 120, this.swindow.pos.y + 522 );
							
						this.swindow.pagenextbutton = new fadeButton(b);
							this.swindow.pagenextbutton.connect(function() {
								
								if(this.swindow.page < this.swindow.pages.length) {
									this.swindow.page++;
								} else {
									this.swindow.page = 1;
								}
								
								this.setSpriteSelectorPage( this.swindow.page );
									
							}.bind(this));
							
			},
			
			showSpriteSelector: function(folder) {
			
				this.swindow.show();
				this.swindow.cancelbutton.show();
				this.swindow.folderbutton.show();
				this.swindow.pagebackbutton.show();
				this.swindow.pagenextbutton.show();
				
					this.swindow.folderbox.enable();
					
				this.setSpriteSelectorFolder(folder);
				
			/*	this.spritelist = filesys.getFileList(project.path(folder));
					//Filter for images only.
				var allowedExt = ['jpg','png','psd'];
				this.spritelist = this.spritelist.filter(function(item,index,arr) {
					var res = false;
					allowedExt.each(function(ext) { 						
						if( filesys.pathext( item ) == ext ) {
							res = true;
						}
					}.bind(this));
					return res;					
				}.bind(this));
				
				if(this.spritelist.length) {
					var cc = -1; var rr = 0;
					this.spritelist.each(function(item, index){
						
					}.bind(this));
					
				} else {
					
						var b = {
								imagename : 'data/ui/window.png',
								font: gamelab.font,
								hidden : false,
								textoffset : vec2(0,60),
								size: vec2(140,140),
								centered: false,
								fontscale : 0.35, 
								text: 'No Images',
								normalAlpha : 1,
								depth: 5003,
								group: 902,
								fadeSpeed : 250,
								image : '',
								imagesize : vec2(112,112),
								imageoffset : vec2(),
								pos : vec2(this.swindow.pos.x + 245, this.swindow.pos.y + 128 ),
							};
						
						var a = new fadeButton(b);
							a.connect(function() {
								this.closeSpriteSelector();
							}.bind(this));
						this.slist.push(a);
				}*/
				
			
			},
			
			setSpriteSelectorPage : function( page ) {
			
				var c = this.swindow.pages.length;
				core.echo(page + ' / ' + c );
				if(page <= c) {
					this.slist.each(function(item, index){
						var pp = this.swindow.pages[page-1];
						var cc = pp.length;
						if(index >= cc) {
							if(!item.hidden) {
								item.hide();
							}
						} else {
							var imgname = this.swindow.pages[page-1][index];
							imgname = project.unpath(imgname);							
							item.imagesprite.texture = phoenix.texture( imgname );
							item.setImageSize();
							item.setText( filesys.filename(imgname, false) );
							item.connect( function() {
								this.spawnSprite(imgname);
								this.closeSpriteSelector();
							}.bind(this));
							
							if(item.hidden) {
								item.show();
								item.enabled = true;
							}

						}

					}.bind(this));
				}
			},
			
			setSpriteSelectorFolder : function(folder) {
			
				core.echo('looking inside ' + folder );
				this.spritelist = filesys.getFileList(project.path(folder));
					//Filter for images only.
				var allowedExt = ['jpg','png','psd'];
				this.spritelist = this.spritelist.filter(function(item,index,arr) {
					var res = false;
					allowedExt.each(function(ext) {
						if( filesys.pathext( item ) == ext ) {
							res = true;
						}
					}.bind(this));
					return res;
				}.bind(this));
				
				this.swindow.pages = [];
				this.swindow.page = 0;
								
				if(this.spritelist.length) {	
					this.swindow.currentfolder = folder;
					var cc = 0;
					var currentpage = [];
					this.spritelist.each(function(item, index){												
						cc += 1;
						if(cc > 12) {							
							cc = 0;
							this.swindow.pages.push(currentpage);
							currentpage = [];
						}
						
						item = item.replace('\\', '/');
						//core.echo('\t\t ' + item);
						currentpage.push( item );
						
					}.bind(this));
					
					if(currentpage.length) {						
						this.swindow.pages.push(currentpage);
					}
					
					core.echo('added ' + this.swindow.pages.length + ' pages. A total image count of ' + this.spritelist.length );
					this.swindow.page = 1;
					this.setSpriteSelectorPage(this.swindow.page);
				}
				
				
			},
			
			closeSpriteSelector: function() {
				if(this.slist) {
					this.slist.each(function(item){
						item.hide();
					});
				}
				
				this.swindow.folderbox.disable();				
				this.swindow.cancelbutton.hide();
				this.swindow.folderbutton.hide();
				this.swindow.pagebackbutton.hide();
				this.swindow.pagenextbutton.hide();
				this.swindow.hide();
			},
			
			activate: function(d) {				
				this.window.show();				
				this.spriteButton.show();
				this.blueprintButton.show();
				this.pathsButton.show();
				this.gridsButton.show();
				this.editCollisionButton.show();
				this.entityButton.show();
				this.saveButton.show();
				this.loadButton.show();
				this.labelSpawn.show();
				this.labelEditors.show();
				this.labelOptions.show();
				
				this.viewgridcb.show();
				this.gridcb.show();
				this.collisioncb.show();
				this.entitycb.show();
				
				
				this.ssdev1 = events.connect('key::up::up',function(){
					core.echo('lolcakes');
					if(editor.selected.length < 2){ editor.selected[0].depth += 1; }  });
				this.ssdev2 = events.connect('key::down::up',function(){ 
					core.echo('lolcakes2');
					if(editor.selected.length < 2){ editor.selected[0].depth -= 1; }  });
				
				if( !d.returning ) {
					if(!this.active) {
						this.active = true;
						editorToggle();						
					} else {
						editor.attachSprites();
					}
				} else {
					editor.attachSprites();
				}
				
			},
			
			deactivate: function(d) {
			
				this.window.hide();
				this.spriteButton.hide();
				this.blueprintButton.hide();
				this.pathsButton.hide();
				this.gridsButton.hide();
				this.editCollisionButton.hide();
				this.entityButton.hide();
				this.saveButton.hide();
				this.loadButton.hide();
				this.labelSpawn.hide();
				this.labelEditors.hide();
				this.labelOptions.hide();
				this.textBox.disable();
				
				events.disconnect( this.ssdev1 );
				events.disconnect( this.ssdev2 );
				
				this.viewgridcb.hide();
				this.gridcb.hide();
				this.collisioncb.hide();
				this.entitycb.hide();				
				
				if(!d.stay) {
					if(this.active) {
						editorToggle();
						this.active = false;
					}
				} else {
					editor.detachSprites();
					editor.detachSprites();
				}
				
				if(d.deactivate) {
					this.active = false;
				}
			},
			
			
				//When spawning a collision node, we first set the editor to 
				//be dragging the object so it can be placed. 
			
			
		});
		
		if(Editor) {
			Editor.modes.push(new SceneEditor());
		}
				
		
		

	
	
	