	
	modules.use('gamelab.editor.controlpoint', true, true);
		
	var  editor = {};
	editor.gui = {};
	editor.selected = [];
	editor.groups = [];
	
	 exec('src/editor/editor.utils');
	 exec('src/editor/editor.undo');
	 exec('src/editor/editor.properties');
	 exec('src/editor/editor.attach.types');
	 exec('src/editor/editor.modes.utils');
	 exec('src/editor/editor.groups.js');
	 
	editor.modes = { 
		none : 1, 		//editor is doing nothing, with nothing selected
		move : 2, 		//editor is moving objects 
		scale : 3, 		//editor is scaling objects
		rotate : 4, 		//editor is rotating objects 
		select : 5,		//editor has objects selected 
	};	 
	
	editor.scaling = {
		both : 0, 
		x : 1,
		y : 2
	};	
	
	editor.colorbounds = color(0.5,0.5,0.5,1);
	editor.colorhover = Color.red;
	editor.colorselect = color().RGB( 255, 51, 44, 0.5);	
	
	editor.mode = editor.modes.none;
	editor.scalemode = editor.scaling.both;

		/*
			This applies itself onto any object that can 
			be updated in the scene. All items if they have
			this function set on the instance will call this.
		*/
	editor.itemUpdate = function(dt) {			
				
		var r = this.bounds(); 
		
		if(r.contains(editor.mouse)) {
			if(!this.debugmesh.enabled) {
				this.debugmesh.showbounds();
			}
		} else {
			if(this.debugmesh.enabled && !this.selected) {
				this.debugmesh.hidebounds();
			}
		}		
		
	};
	
editor.deselectAll = function() {
	
		editor.gui.window.close();
		
		if(editor.mode == editor.modes.select) {			
			if(editor.selected) {
				if(editor.selected.length) {
					editor.selected.each(function(item){
						item.selected = false;
						if(item.debugmesh) {
							if(item.debugmesh.handle) {
								item.debugmesh.handle.deselect();
							}
						}
					});
					editor.selected = [];
				}
			}
		} else {
			editor.mode = editor.modes.select;
		}
		
	}	
	
editor._selectItem = function( item ) {
		(function() { editor.selectItem.bind(item); })();
	};
	
editor.selectItem = function() {	
			
		editor.mode = editor.modes.select;
	
		if(this.selected && !editor.spawning) {
			this.selected = false;
			var ind = editor.selected.indexOf(this);
			if(ind != -1) editor.selected.remove(ind);
		} else {
			this.selected = true;
			editor.selected.push(this);
		}
			
			//Hide any property gui's relating to these.
		if(editor.selected.length == 1) {
			//editor.current = editor.selected[0];
				//if( !editor.selected[0].entity ) {
				//	if(editor.gui.window) {
				//		editor.gui.window.close();
				//	}
				//} else {				
					editor.showProperties( editor.selected[0] );
				//}
		} else {
			editor.gui.window.close();
		}
				
	};
	
	editor.enableDebugMesh = function( item ) {
		
		if(!item || item == undefined) return;
		
		item.debugmesh = {};

			//add bounds, and inner bounds
		var r = item.bounds();
		var c = r.center();
		var rs = r.mul( 0.09 ); 
		var ie = r.mul( 0.1 );
		var rr = rect().aroundPoint( c, vec2(rs.w, rs.h) );
		var r2 = rect().aroundPoint( c, vec2(ie.w, ie.h) );
		
		item.debugmesh.bounds = {};
		item.debugmesh.bounds.geom = editor.drawrectp( r , editor.colorbounds, 998 );
		item.debugmesh.bounds.geom.mode = 'lines';
		
		if(item) {
			item.debugmesh.bounds.geom.group = item.group;
		}
		
		item.debugmesh.bounds.pos = item.pos;
		item.debugmesh.bounds.rot = 0;
		item.debugmesh.bounds.size = item.size;
	
		item.debugmesh.handle = new controlPoint(r.center(), vec2(20,20), editor.colorbounds, null, 998 );
		item.debugmesh.handle.draggable = false;
		item.debugmesh.handle.onHovered = function() {
			this.debugmesh.bounds.geom.colorize( editor.colorhover );
			editor.hovered = true;
		}.bind(item);
		item.debugmesh.handle.onLeave = function() {
			if(!this.debugmesh.handle.selected) {
				this.debugmesh.bounds.geom.colorize(  editor.colorbounds );
			}
			editor.hovered = false;
		}.bind(item);
		item.debugmesh.handle.onLeftClick = editor.selectItem.bind( item );

			//a control over the whole mesh
		item.debugmesh.hidebounds = function() {
			item.debugmesh.enabled = false;
			item.debugmesh.bounds.geom.enabled = false;
		};
		
		item.debugmesh.showbounds = function() {
			item.debugmesh.enabled = true;
			item.debugmesh.bounds.geom.enabled = true;
		};
				//a control over the whole mesh
		item.debugmesh.hide = function() {
			item.debugmesh.enabled = false;
			item.debugmesh.bounds.geom.enabled = false;
		};
		
		item.debugmesh.show = function() {
			item.debugmesh.enabled = true;
			item.debugmesh.bounds.geom.enabled = true;
		};
		
		item.debugmesh.position = function( newpos ) {
			item.debugmesh.bounds.pos = phoenix.geometry.position( item.debugmesh.bounds.pos, newpos, item.debugmesh.bounds.geom);
			item.debugmesh.handle.pos = newpos;
		};
		
		item.debugmesh.size = function( size ) {
				//delete the old geometry 
			item.debugmesh.bounds.geom.drop();
				delete item.debugmesh.bounds.geom;

					//create new geometry the right size and rotation, and position it correctly.
				var r = rect(item.debugmesh.bounds.pos.x-((size.x)/2), item.debugmesh.bounds.pos.y-((size.y)/2), size.x, size.y);
				var c = r.center();				
				var rs = r.mul( 0.09 ); 
				var ie = r.mul( 0.1 );
				var rr = rect().aroundPoint( c, vec2(rs.w, rs.h) );
				var r2 = rect().aroundPoint( c, vec2(ie.w, ie.h) );
				
			item.debugmesh.bounds.geom = editor.drawrectp( r , color(1,0,0,1), 998 );						
			item.debugmesh.bounds.geom.group = item.group;		
			item.debugmesh.bounds.geom.mode = 'lines';		
			
					//reset the rotation so it rotates 
				item.debugmesh.bounds.rot = 0;
				
			item.debugmesh.rotate( item.rotation );
			item.debugmesh.position( item.pos );
			
		};
		
		item.debugmesh.rotate = function( rotdeg, reset  ) {
			item.debugmesh.bounds.rot = phoenix.geometry.rotation( item.debugmesh.bounds.pos, item.debugmesh.bounds.rot, rotdeg, item.debugmesh.bounds.geom);
			item.debugmesh.handle.rotation = rotdeg;
		};
		
		//finally, set the flags and hide the mesh 
			item.debugmesh.hidebounds();
		item.debugmesh.rotate( item.rotation );
	};
	
	editor.removeDebugMesh = function(item) {
		if(!item.debugmesh) return;
				// delete the old geometry 
			item.debugmesh.bounds.geom.drop();
				delete item.debugmesh.bounds.geom;
			item.debugmesh.handle.drop();
			delete item.debugmesh.handle;
		delete item.debugmesh;
	};
	
	editor.attach = function(  ) {
		if(!editor.enabled)  {
				
				//enable the editor
			editor.enable();
			
			editor.updateevent = events.connect('onUpdate', function(e) {
				editor.update( e.dt );
			});
			
			if(!editor.gui.window) {
				editor.creategui();
			}
		
				//create the help text if it doesnt exist
			if(!editor.helptext) {
				editor.helptext = new Text( 'editor enabled      x:scale | v:move | c:rotate | mousewheel:zoom | right mouse drag:move camera ', vec2(5,5), 0.48, color(1,1,1,0.8), 300, 999 );
			} else {
				editor.helptext.show();
			}
			
				//attach to sprites by default.
			editor.attachSprites();
		}
	};
	
	editor.detach = function( object ) {
	
		if(editor.enabled) {
				
				//first cancel any actions 
			editor.cancelaction();
				//cleanup text
			editor.helptext.hide();
			
				//detach all types of nodes
			editor.detachCollision();
			editor.detachSprites();
			editor.detachEntities();
				
				//disable			
			editor.disable();
			
			events.disconnect( editor.updateevent );
			
		} 
	}; //detach	
	
	editor.enable = function() {
	
		editor.selected = [];
		editor.activateKeys();
		editor.enabled = true;
	};
	
	editor.disable = function() {
				
		editor.selected = [];
		editor.deactivateKeys();
		editor.enabled = false;

	};

	editor.update = function( dt ) {
	
		if(editor.enabled) {
		
			//draw some information bars on top.
			editor.drawInfoBars(dt);
		
				//first update the current state of the editing
			editor.updatemode(dt);
		
				//then update any visual changes to the editing 
			levels.current.sprites.each(function(item,index) {
				if(item.editorUpdate) {
					item.editorUpdate(dt);
				}
			});
			
		} //editor enabled
	};
	
	editor.updatemode = function(dt) {
		
		if(editor.selected.length) {
		
			if(editor.mode == editor.modes.move) {
//moving 			
				editor.selected.each(function(item) {
					if(item.isGroup) {
						editor.groupmove( item );
					} else {
						editor.itemmove( item );
					}
				});
			} else if( editor.mode == editor.modes.rotate) {
//rotation			
						var sgp = editor.drawrectp(editor.aabb, color(1,0,0,1), 400, game.groups.objects );
						sgp.mode = 'lines'; sgp.persist = false;  
						var aabb = editor.getAABB( editor.selected ); var sgp1 = editor.drawrectp(aabb, color(0,1,0,1), 400, game.groups.objects );
						sgp1.mode = 'lines'; sgp1.persist = false;
				var rotcenter = editor.aabb.center();
					
				editor.selected.each(function(item) {
					if(item.isGroup) {
						editor.grouprotate( item );
					} else {
						editor.itemrotate( item, rotcenter );
					}
				});
				
			} else if( editor.mode == editor.modes.scale) {
//scaling	
						var sgp = editor.drawrectp(editor.aabb, color(1,0,0,1), 400, game.groups.objects );
						sgp.mode = 'lines'; sgp.persist = false;  
						var aabb = editor.getAABB( editor.selected ); var sgp1 = editor.drawrectp(aabb, color(0,1,0,1), 400, game.groups.objects );
						sgp1.mode = 'lines'; sgp1.persist = false;
						
				var scalecenter = editor.aabb.center();
				
				editor.selected.each(function(item) {
					if(item.isGroup) {
						editor.groupscale( item );
					} else {
						editor.itemscale( item, scalecenter );
					}
					
				});
			}
		}
		
	};
	
	editor.itemrotate = function(item, center) {
	
			//Rotate
			if(center) {
			
				var r = editor.rotationstart;
				var rr = editor.rotationTo( center, editor.mouse ) - r;
				rr = rr + item.state.rotatestart;
				var np = item._setRotation( rr, center );
				
				if(item.debugmesh) { item.debugmesh.position( item.pos ); }
				if(item.entity) {  item.entity.onMove(item); }
				if(item.body) { game.physics.bodysetpos( item.body, item.pos ); }
				
			} else {

				item.rotateFacing(editor.mouse, -item.state.rotateoffset);

			}
			
			if(item.debugmesh) {
				item.debugmesh.rotate( item.rotation );
			}
		
			//Rotate the entity
		if(item.entity) {  
			item.entity.onRotate(item); 
		}
			//Rotate the physics body with it
		if(item.body) { 
			game.physics.bodysetrotation( item.body, item.rotation ); 			
		}
		
	}
	
	editor.itemmove = function(item)  {
				//Move the item according to its mouse difference.
			var 	diff = editor.mouse.directionTo( item.state.movestart );
					diff = diff.add(item.state.moveoffset);
					item.pos = item.state.movestart.add(diff);
					if(item.debugmesh) {
						item.debugmesh.position( item.pos );	
					}
					if(item.entity) {  item.entity.onMove(item); }
				//Move physics body with it
			if(item.body) { game.physics.bodysetpos( item.body, item.pos ); }
			
	};
	
	editor.itemscale = function(item, center)  {
		
		if(center) {
			var diff = editor.mouse.distanceTo( center );
			diff = diff / item.state.scalesize;
			if(editor.scalemode == editor.scaling.both) {
				var osize = vec2(item.state.scalessize);
				item.size = item.state.scalessize.mul( diff );
				var dd = (diff - 1.0);
				var nsd = item.state.scalestart.subtract(center).mul(dd);
				item.pos = item.state.scalestart.add(nsd);
			} else if(editor.scalemode == editor.scaling.x) {
				var osize = vec2(item.state.scalessize);
				item.size = item.state.scalessize.mul( vec2(diff,1) );
				var dd = (diff - 1.0);
				var nsd = item.state.scalestart.subtract(center).mul(dd);
				item.pos = item.state.scalestart.add(nsd);
			} else if(editor.scalemode == editor.scaling.y) {
				var osize = vec2(item.state.scalessize);
				item.size = item.state.scalessize.mul( vec2(1,diff) );
				var dd = (diff - 1.0);
				var nsd = item.state.scalestart.subtract(center).mul(dd);
				item.pos = item.state.scalestart.add(nsd);
			}
			
			if(item.debugmesh) {
				item.debugmesh.size( item.size );
			}
			
		} else {
				//Get the scaling amount
			var diff = editor.mouse.distanceTo( item.state.scalestart );
			diff = diff / item.state.scalesize;
						if(editor.scalemode == editor.scaling.both) {
							item.size = item.state.scalessize.mul( diff );
						} else {
							if( editor.scaleinvert == false ) {
								if( editor.scalemode == editor.scaling.x ) {
									item.size = vec2( item.state.scalessize.x * diff, item.state.scalessize.y );	
								}	else if( editor.scalemode == editor.scaling.y ) {
									item.size = vec2( item.state.scalessize.x , item.state.scalessize.y * diff );
								}
							} else {
								if( editor.scalemode == editor.scaling.y ) {
									item.size = vec2( item.state.scalessize.x * diff, item.state.scalessize.y );	
								}	else if( editor.scalemode == editor.scaling.x ) {
									item.size = vec2( item.state.scalessize.x , item.state.scalessize.y * diff );
								}
							}
						}
				
				//Update the debug meshes
				if(item.debugmesh) {
					item.debugmesh.size( item.size );
				}
					
				//Scale the physics as well.
			if(item.body) {	game.physics.bodysetsize( item.body, item.size.div(2) ); 	}
			
		}
	};

	editor.stopaction = function() {
		if(editor.gui.hover) return;
		if(!editor.hovered) {
			
			if(editor.selected.length) {
				if(editor.mode == editor.modes.select) {
					editor.deselectAll();
				} else {
					editor.mode = editor.modes.select;
				
					if(editor.spawning) {
						if(editor.spawning.entity) {
							editor.spawning.entity.onCreate( editor.spawning );
						}
						editor.spawning = false;
					}
					
				}
			} else {
				
			} //nothing selected
		} else {

		}
	} //stop action
	
	editor.cancelaction = function() {

		if(editor.mode != editor.modes.select && editor.mode != editor.modes.none) {
		
			if(editor.spawning) {
				editor.deleteitem( editor.spawning );	
				editor.spawning = false;			
				core.echo('cancelled spawning');
				return;
			}

			var lastmode = editor.mode;
			editor.mode = editor.modes.select;				
			switch(lastmode) {
			
				case editor.modes.move :
				
					if(editor.selected.length) {
						editor.selected.each(function(item) {
							if(item.isGroup) { 								
								editor.unsetgroupmovestate( item ); 
							} else {
								item.pos = item.state.movestart;
								if(item.debugmesh) item.debugmesh.position( item.pos );
								if(item.entity) { item.entity.onMove(item); }
								if(item.body) { game.physics.bodysetpos( item.body, item.pos ); }
							}
						});
					}
					
				break;

				case editor.modes.rotate :
						
					if(editor.selected.length) {
						editor.selected.each(function(item) {
							if(item.isGroup) {
								editor.unsetgrouprotatestate( item );
							} else {
								item.rotation = item.state.rotatestart;
								item.pos = item.state.rotatepos;
								
								if(item.debugmesh) {
									item.debugmesh.rotate( item.rotation );
									item.debugmesh.position( item.pos );
								}
								if(item.entity) {  
									item.entity.onRotate(item); 
									item.entity.onMove(item); 
								}
								if(item.body) { 
									game.physics.bodysetpos( item.body, item.pos ); 
									game.physics.bodysetrotation( item.body, item.rotation );
								}
							}
						});
					} //selected count?
					
				break;
				
				case editor.modes.scale :
				
					if(editor.selected.length) {
							editor.selected.each(function(item) {
								if(item.isGroup) {
									editor.unsetgroupscalestate( item );
								} else {
									item.size = item.state.scalessize;
									item.pos = item.state.scalestart;
									
									if(item.debugmesh) {
										item.debugmesh.size( item.size );
										item.debugmesh.position( item.pos );
									}
									if(item.entity) {  
										item.entity.onMove(item); 
									}
									if(item.body) { 
										game.physics.bodysetpos( item.body, item.pos ); 
										game.physics.bodysetsize( item.body, item.size.div(2) );
									}
								}
							});
						} //selected count?
						
				break;				
			}

		} else {			
			if(editor.spawning) {
				editor.deleteitem( editor.spawning );	
				editor.spawning = false;				
			}
		}
	};
	
	events.connect( 'mouse::right::down', function( e ) {
		
		if(editor.mode != editor.modes.select) {
			editor.cancelaction();
		} 
		
	});
	
	events.connect( 'mouse::left::down', function( e ) {
		if(!editor.gui.hover) {
			editor.stopaction();
		}
	});

	editor.moveitem = function() {

		if(editor.selected.length) {
		
			editor.mode = editor.modes.move;

			editor.selected.each(function(item) {
			
				if(item.isGroup) {
					editor.setgroupmovestate(item);
				} else {			
					item.state = {
						movestart : item.pos,
						moveoffset : item.pos.subtract(editor.mouse)
					};
				}
				
			});
		} else {
			
		}
	};
	
	editor.scaleitem = function() {
		
		if(editor.selected.length) {
		
			editor.aabb = editor.getAABB( editor.selected );
			editor.scalestart = editor.mouse.distanceTo( editor.aabb.center() );
			editor.mode = editor.modes.scale;
			
			editor.selected.each(function(item) {
				if(item.isGroup) {
					editor.setgroupscalestate( item );
				} else {	
					item.state = {
						scalestart : item.pos,
						scalesize : editor.mouse.distanceTo( editor.aabb.center() ),
						scalessize : item.size,
					};
				}
			});
		}
		
	};
	
	editor.rotateitem = function() {
	
		if(editor.selected.length) {
		
			editor.aabb = editor.getAABB( editor.selected );
			editor.mode = editor.modes.rotate;
			editor.rotationstart = editor.rotationTo( editor.aabb.center(), editor.mouse );
			
			editor.selected.each(function(item) {
				if(item.isGroup) {
					editor.setgrouprotatestate( item );
				} else {
					item.state = {
						rotatestart : item.rotation,
						rotatepos : item.pos,
					};
				}
			});
		} //if any selected 
	};
	
	editor._deleteitem = function( item ) {
		item.editorUpdate = null;
		if(item.debugmesh) {  editor.removeDebugMesh( item ); }
		if(item.body) {
			var ind = game.collisionBodies.indexOf(item.body);
			if(ind != -1) game.collisionBodies.remove(ind);
			game.physics.world.DestroyBody( item.body );
		}
			//remove the sprite 
		var ind = levels.current.sprites.indexOf( item );
		if(ind != -1)  levels.current.sprites.remove( ind );
		
			//remove the entity 
		if(item.entity) {
			item.entity.onDrop();
		}
		
		item.drop();	
	};
	
	editor.deleteitem = function() {
	
		if(editor.gui.hover) return;
		if(editor.selected.length) {			
			
			editor.selected.each(function(item) {
				if(item.isGroup) {
					editor.groupdelete(item);
				} else {
					editor._deleteitem(item);
				}
			});

			editor.deselectAll();
		}
	};
	
	editor._duplicateitem = function( item, ingroup ) {
				var s = item.duplicate();
					s.flags = item.flags;
					editor.enableDebugMesh( s );
					s.editenabled = true;
					s.editorUpdate = editor.itemUpdate.bind(s);
						//set up collision flags if any
					if(s.flags.collision) {
						var b = game.physics.spawn( s.bounds().center(), s.size.div(2), s.rotation, true, 'box' );
						game.collisionBodies.push(b);
						game.collisions.push( s.realbounds() );
						s.body = b;
					}
					
					if(item.entity) {
						var etype = item.entity.base;
						var einstance = new etype.classType();
							s.entity = einstance;									
							s.entity.base = etype;
							s.entity.instance = Object.clone(item.entity.instance);							
							s.entity.instance.properties = Object.clone(item.entity.instance.properties);
							s.entity._onCreate( s, false );
						game.entities.push(s);
					}

					levels.current.sprites.push(s);
					
						item.selected = false;
			
					if(!ingroup) {
						var f = editor.selectItem.bind(s); f();
					} else {
						return s;
					}
	};
			
	editor.duplicateitem = function() {
		if(editor.gui.hover) return;
		
		if(editor.selected.length) {
			
			editor.oldsel = editor.selected;
			editor.deselectAll();
			editor.oldsel.each(function(item) {
				if(item.isGroup) {
					var g = editor.groupduplicate(item);
					var f = editor.selectItem.bind(g); f();
				} else {
					editor._duplicateitem(item);
				}
			});
			
			editor.oldsel = [];
			editor.moveitem();
			
		}
	};
	
	
	
	
