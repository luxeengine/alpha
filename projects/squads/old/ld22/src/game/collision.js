
			Game.implement('createCollision',  function() {
			
					this.collisionBodies = [];
					levels.current.sprites.each(function(item,index) {
						if(item.flags) {
							if(item.flags.collision) {
								item.visible = false;
								var b = this.physics.spawn( item.bounds().center(), item.size.div(2), item.rotation, true, 'box' );
								if(item.flags.gametype) {
									item.type = item.flags.gametype;									
								}
								b.SetUserData(item);
								this.collisionBodies.push(b);
								this.collisions.push( item.realbounds() );
								item.group = game.groups.collision;
								item.depth = 81;
								item.body = b;
							} else if(item.flags.trigger) {
								item.visible = false;
								item.group = game.groups.trigger;
								if(!item.flags.triggername && !item.flags.triggertype) {
									item.flags.triggername = 'trigger0' + index;
									item.flags.triggertype = 'trigger';
								}
								item.depth = 81;
								var b = this.physics.addtrigger( item.flags.triggername , item.flags.triggertype , item.bounds().center(), item.size.div(2), item.rotation, true, 'box' );
								this.collisionBodies.push(b);
								item.body = b;
							} else if(item.flags.light) {
								core.echo( 'adding a light ' + item.flags.range + ' ' + item.flags.color.a );
								this.lights.push( {
										pos : item.pos,
										range : item.flags.range,
										color : color(item.flags.color.r, item.flags.color.r, item.flags.color.g, item.flags.color.a ),
									}
								);
								
								//item.drop();
							}
					} //if it has flags
				}.bind(this));
					
				core.echo(' Added ' + this.collisionBodies.length + ' collision bodies.');
		});