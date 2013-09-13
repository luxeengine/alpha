 			Game.implement('createGroups',  function() {
			
					this.groups = [];
					levels.current.groups.each(function(group) {
						editor.makegroup( group );
					});

			});