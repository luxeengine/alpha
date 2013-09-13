editor.grouprotate = function( group, rot ) {
			
			var rotcenter ;
			if(rot) { 
				rotcenter = rot; 
			} else {
				rotcenter = group.aabb.center();
			}
			group.items.each(function(item) {
				if(item.isGroup) {
					editor.grouprotate( item, rotcenter );
				} else {						
					editor.itemrotate( item, rotcenter );
				}
			});
			
			var aabb = editor.getAABB( group.items );
			group.size = vec2(aabb.w, aabb.h);
			group.pos = aabb.center();
			if(group.debugmesh) {
				group.debugmesh.size( group.size );
				group.debugmesh.position( group.pos );
			}
		};
		
editor.groupscale = function( group, sca ) {
			
			var scalecenter ;
			if(sca) { 
				scalecenter = sca; 
			} else {
				scalecenter = group.aabb.center();
			}
			group.items.each(function(item) {
				if(item.isGroup) {
					editor.groupscale( item, scalecenter );
				} else {						
					editor.itemscale( item, scalecenter );
				}
			});
			
			var aabb = editor.getAABB( group.items );
			group.size = vec2(aabb.w, aabb.h);
			group.pos = aabb.center();
			if(group.debugmesh) {
				group.debugmesh.size( group.size );
				group.debugmesh.position( group.pos );
			}
		};
		
editor.groupmove = function( group ) {

			group.items.each(function(item) {
				if(item.isGroup) {
					editor.groupmove( item );
				} else {
					editor.itemmove( item );
				}
			});

				group.aabb = editor.getAABB( group.items );
				
			editor.itemmove( group );
};

editor.groupdelete = function( group ) {

			group.items.each(function(item) {
				if(item.isGroup) {
					editor.groupdelete( item );
				} else {
					editor._deleteitem( item );
				}
			});

			editor._deleteitem(group);
};

editor.groupduplicate = function( group ) {
			
			var newitems = [];
			group.items.each(function(item) {
				if(item.isGroup) {
					editor.groupduplicate( item );
				} else {
					newitems.push( editor._duplicateitem( item, true ) );
				}
			});

			return editor.makegroup( newitems, true );
};

editor.unmakegroup = function( group ) {
			//add handles back to children
			
			var ind = editor.groups.indexOf(group);
			if(ind != -1) {
				editor.groups.remove(ind);
				group.isrootgroup = false;
			}
			
			var ind2 = levels.current.sprites.indexOf(group);
			if(ind2 != -1) {
				levels.current.sprites.remove(ind2);
			}
			
			group.items.each(function(item) {
				editor.enableDebugMesh( item );
				item.editenabled = true;
				item.editorUpdate = editor.itemUpdate.bind(item);
				item.inGroup = false;
				if(item.isGroup) {
					item.isrootgroup = true;
					editor.groups.push(item);
				}
			});
			
			if(group.debugmesh) {
				editor.removeDebugMesh( group );
			}
				group.editorUpdate = null;
				group.editenabled = false;						
				
			group.items.empty();
			group.drop();
			delete group;
			
			editor.deselectAll();
			
}; //unmakegroup

editor.makegroup = function( items, copy ) {
			
			var grp = new sprite( false );
				grp.color = Color.blue.alpha(0.2);
				grp.items = [];
			
				//unhook
			items.each(function(item) {
				//remove the bounds. 
					if(item.debugmesh) {
						if(item.debugmesh.handle) {
							item.debugmesh.handle.deselect();
						}
					} 
					editor.removeDebugMesh( item );
					item.editorUpdate = null;
					item.editenabled = false;
					item.inGroup = true;
				//remove from the root list cos its a child now
					var ind = editor.groups.indexOf(item);
					if(ind != -1) { editor.groups.remove(ind); item.isrootgroup = false; }
				//add the items to the group 
					grp.items.push( item );							
			});
			
				//hook a new bounds
			var aabb = editor.getAABB( grp.items );	
				grp.aabb = aabb;
				grp.size = vec2( aabb.w, aabb.h );
				grp.pos = aabb.center();
				grp.group = game.groups.objects;
				grp.depth = 400;
				grp.isGroup = true;
				
					editor.enableDebugMesh( grp );
					grp.editenabled = true;
					grp.editorUpdate = editor.itemUpdate.bind(grp);
					grp.isrootgroup = true;
					editor.groups.push(grp);
					levels.current.sprites.push(grp);
					
				if(!copy) {
					editor.deselectAll();
				}
			return grp;
}; //makegroup

editor.setgroupscalestate = function( group ) {
	
	group.state = {	
		scalestart : group.pos,
		scalesize : editor.mouse.distanceTo( editor.aabb.center() ),
		scalessize : group.size,
	};
	
	group.items.each(function(item) {
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
}; //setgroupscalestate

editor.unsetgroupscalestate = function( group ) {
									
			group.size = group.state.scalessize;
			group.pos = group.state.scalestart;
			if(group.debugmesh) {
				group.debugmesh.size( group.size );
				group.debugmesh.rotate( group.rotation );
			}
			
			group.items.each(function(item) {
				if(item.isGroup) {
					editor.unsetgroupscalestate( item );					
				} else {
					item.size = item.state.scalessize;
					item.pos = item.state.scalestart;
					
						if(item.entity) { 
							item.entity.onMove(item); 
						}
						if(item.body) { 
							game.physics.bodysetpos( item.body, item.pos ); 
							game.physics.bodysetsize( item.body, item.size.div(2) );
						}
						if(item.debugmesh) {
							item.debugmesh.position( item.pos );
							item.debugmesh.size( item.size );
						}
										
				}
			});
			
			group.aabb = editor.getAABB( group.items );	
}; //unsetgroupscalestate

editor.setgrouprotatestate = function( group ) {
	
	group.state = {	
		rotatestart : group.rotation,
		rotatepos : group.pos,
		rotateoffset : group.rotationTo(editor.mouse),
	};
	
	group.items.each(function(item) {
			if(item.isGroup) {
				editor.setgrouprotatestate( item );
			} else {
				item.state = {
					rotatestart : item.rotation,
					rotatepos : item.pos,
					rotateoffset : item.rotationTo(editor.mouse),
				};
			}
	});
}; //setgrouprotatestate

editor.unsetgrouprotatestate = function( group ) {
									
			
			group.pos = group.state.rotatepos;
			
			
			group.items.each(function(item) {
				if(item.isGroup) {
					editor.unsetgrouprotatestate( item );					
				} else {
					item.rotation = item.state.rotatestart;
					item.pos = item.state.rotatepos;
					
						if(item.entity) { 
							item.entity.onMove(item); 
							item.entity.onRotate(item); 
						}
						if(item.body) { 
							game.physics.bodysetpos( item.body, item.pos ); 
							game.physics.bodysetrotation( item.body, item.rotation );
						}
						if(item.debugmesh) {
							item.debugmesh.position( item.pos );
							item.debugmesh.rotate( item.rotation );
						}
										
				}
			});
			
			group.aabb = editor.getAABB( group.items );	
			group.size = vec2(group.aabb.w, group.aabb.h);
			group.pos = group.aabb.center();
			group.rotation = group.state.rotatestart;
			if(group.debugmesh) {
				group.debugmesh.position( group.pos );
				group.debugmesh.rotate( group.rotation );
				group.debugmesh.size( group.size );
			}
}; //unsetgrouprotatestate
	
editor.setgroupmovestate = function( group ) {
		
		group.state = {
			movestart : group.pos,
			moveoffset : group.pos.subtract(editor.mouse)
		};
		
		group.items.each(function(item) {
			if(item.isGroup) {
				editor.setgroupmovestate( item );
			} else {
				item.state = {
					movestart : item.pos,
					moveoffset : item.pos.subtract(editor.mouse)
				};
			}
		});
}; //setgroupmovestate
	
editor.unsetgroupmovestate = function( group ) {

			group.pos = group.state.movestart;
			if(group.debugmesh) group.debugmesh.position( group.pos );
			
			
			group.items.each(function(item) {
				if(item.isGroup) {
					editor.unsetgroupmovestate( item );
					
				} else {
					item.pos = item.state.movestart;	
						if(item.debugmesh) item.debugmesh.position( item.pos );
						if(item.entity) { item.entity.onMove(item); }
						if(item.body) { game.physics.bodysetpos( item.body, item.pos ); }
				}
			});
			
			group.aabb = editor.getAABB( group.items );	
}; //unsetgroupmovestate