	editor.attachCollision = function() {
		levels.current.sprites.each(function(item,index) {
			if( !(item.group > 900 && item.group < 1000) ) {
				if(item.flags) {
					if(((item.flags.collision) || (item.flags.trigger)) && (!item.inGroup)) {
						editor.enableDebugMesh( item );
						item.editenabled = true;
						item.editorUpdate = editor.itemUpdate.bind(item);
					}
				}
			}
		});
	}
	
	editor.detachCollision = function() {
		levels.current.sprites.each(function(item,index) {
			if( !(item.group > 900 && item.group < 1000) ) {
				if(item.flags) {
					if((item.flags.collision) || (item.flags.trigger)) {
						if(item.editenabled && !item.inGroup) {							
							editor.removeDebugMesh( item );
							item.editorUpdate = null;
							item.editenabled = false;
						}
					}
				}
			}
		});	
	}
	
	editor.attachSprites = function() {
			//Inject the functions the editor uses into each sprite in the scene
		levels.current.sprites.each(function(item,index) {
			if( !(item.group > 900 && item.group < 1000) ) {
				if(item.flags) {
					if(!item.flags.collision && !item.flags.trigger && !item.flags.entity && (!item.inGroup)) {
						editor.enableDebugMesh( item );
						item.editenabled = true;
						item.editorUpdate = editor.itemUpdate.bind(item);
					}
				}
			}
		});
	}
	
	editor.detachSprites = function() {
		levels.current.sprites.each(function(item,index) {
			if( !(item.group > 900 && item.group < 1000) ) {
				if(item.flags) {
					if(!item.flags.collision && !item.flags.trigger && !item.flags.entity && (!item.inGroup)) {
							if(item.editenabled) {
								editor.removeDebugMesh( item );
								item.editorUpdate = null;
								item.editenabled = false;
							}
					}
				}
			}
		});	
	}
	
	editor.attachEntities = function() {
			//Inject the functions the editor uses into each sprite in the scene
		levels.current.sprites.each(function(item,index) {
			if( !(item.group > 900 && item.group < 1000) ) {
				if(item.flags) {
					if(item.flags.entity && (!item.inGroup)) {
						editor.enableDebugMesh( item );
						item.editenabled = true;
						item.editorUpdate = editor.itemUpdate.bind(item);
					}
				}
			}
		});
	}
	
	editor.detachEntities = function() {
		levels.current.sprites.each(function(item,index) {
			if( !(item.group > 900 && item.group < 1000) ) {
				if(item.flags) {
					if(item.flags.entity && (!item.inGroup)) {
							if(item.editenabled) {
								editor.removeDebugMesh( item );
								item.editorUpdate = null;
								item.editenabled = false;
							}
					}
				}
			}
		});	
	}	

	