
	modules.use('.textitem',true,true);
	modules.use('gamelab.text',true,true);
	modules.use('gamelab.editor.container', true, true);
	modules.use('gamelab.checkbox', true, true);	
	modules.use('gamelab.fadebutton', true, true);
	modules.use('gamelab.itemselect', true, true);
	modules.use('Box2D.Box2D', true, true);
	modules.use('gamelab.physics', true, true);
	
	var bg;
	core.global.game = {};

	Math.lerp = function(from, to, value) {
	        if (value < 0.0)
	            return from;
	        else if (value > 1.0)
	            return to;
	        return (to - from) * value + from;
	};

	Math.unclampedLerp = function(from,to,value) {
		return (1.0 - value)*from + value*to;
	}

	events.connect('key::escape::down', function(){ core.exit() });

	var Menu = new Class({
		
		initialize : function() {

			this.controllers = [];
			var spacing = 0.85;
			this.active = true;
			for(var i = 0; i < 4; ++i) {				
				var img = new sprite('data/controller.png');
				var x = (phoenix.resolution.div(2).x - ((img.size.x * 3)*spacing)/2) + ((img.size.x*spacing) * i);
				img.pos = vec2(x, phoenix.resolution.y - (phoenix.resolution.y * 0.18));
				img.alpha = 0.25;
				this.controllers.push(img);
			}

				//swap sides
			var tmp = this.controllers[2];
			this.controllers[2] = this.controllers[1];
			this.controllers[1] = tmp;			

			for(var i = 0; i < 4; ++i ) {
									

				if((i % 2) == 0) {
					game.players[i].team = 1;
				} else {
					game.players[i].team = 2;
				}

				game.players[0].teammate = game.players[2];
				game.players[2].teammate = game.players[0];
				game.players[1].teammate = game.players[3];
				game.players[3].teammate = game.players[1];

				if(game.players[i].team == 2) {
					//core.echo('setting player ' + i  + ' to red')
					game.players[i].flag.color = color().RGB(208,20,20,1);
					game.players[i].healthbar.color =  color().RGB(208,20,20,1);
					//game.players[i].marker.color = color().RGB(208,20,20,1);		
					//color().RGB(80,173,238,1);		  color().RGB(208,20,20,1);	
				} else {
					//core.echo('setting player ' + i  + ' to blue')
					game.players[i].flag.color = color().RGB(80,173,238,1);
					game.players[i].healthbar.color =  color().RGB(80,173,238,1);
					//game.players[i].marker.color = color().RGB(80,173,238,1);
				}
			}

				this.resetPlayerPositions();

			var mid = phoenix.resolution.x/2;
			var x1 = (mid - game.font.widthOf('TEAM ONE')) - 20;
			var x2 = mid + 45;
			var yy = (phoenix.resolution.y - (phoenix.resolution.y * 0.18)) - 140;

			this.teamone = new TextItem( 'TEAM', vec2(x1,yy) );		
			this.teamone.group = game.groups.ignore;
			this.teamone.depth = 1;

			this.teamone_one = new TextItem( '    ONE', vec2(x1,yy) );		
			this.teamone_one.group = game.groups.ignore;
			this.teamone_one.color = color().RGB(80,173,238,1);
			this.teamone_one.depth = 1;

			this.teamtwo = new TextItem( 'TEAM', vec2(x2,yy) );		
			this.teamtwo.group = game.groups.ignore;
			this.teamtwo.depth = 1;

			this.teamtwo_two = new TextItem( '    TWO', vec2(x2,yy) );		
			this.teamtwo_two.group = game.groups.ignore;
			this.teamtwo_two.color = color().RGB(208,20,20,1);
			this.teamtwo_two.depth = 1;		
			
			this.split = phoenix.drawLine(false, vec2(mid, 0), vec2(mid , phoenix.resolution.y - (phoenix.resolution.y * 0.18) ), color(1,1,1,0.2), color(1,1,1,0.0));	
			this.split.group = game.groups.ignore;
						
			this.status = new TextItem('waiting for players', vec2( mid, yy + 220) )
			this.status.scale = 0.5;
			this.status.depth = 1; this.status.align = 1;
			this.status.group = game.groups.ignore;

		},

		resetPlayerPositions : function() {
			game.players.each(function(item,index){
				item.setpos( this.controllers[index].pos.subtract( vec2(-8,60) )); 					
			}.bind(this))

		},

		readyChanged : function( gamepad, state ) {
			if(state) {								
				game.players[gamepad].sprite.anim.set('revived').play();
				time.schedule(500,false, function() {
					game.players[gamepad].sprite.anim.set('idle').play();
				}.bind(this));
				game.players[gamepad].flag.rotation = 0;
				game.players[gamepad].spriteweapon.texture = game.players[gamepad].weaponimages[ game.players[gamepad].weapon.imgindex ];
				game.players[gamepad].spriteweapon.depth = game.players[gamepad].sprite.depth + 1;
				game.players[gamepad].dead = false;
				game.players[gamepad].canmove = true;				
				game.players[gamepad].playing = true;
				game.players[gamepad].marker.visible = true;
				game.players[gamepad].body.SetActive(true);
				//game.physics.bodystatic(game.players[gamepad].body, true );
			} else {
				game.players[gamepad].flag.rotation = 20;
				game.players[gamepad].spriteweapon.texture = game.players[gamepad].weaponimages[4];
				game.players[gamepad].spriteweapon.depth  = game.players[gamepad].sprite.depth - 1;
				game.players[gamepad].sprite.anim.set('diedie').play();
				game.players[gamepad].dead = true;
				game.players[gamepad].canmove = false;
				game.players[gamepad].marker.visible = false;
				game.players[gamepad].body.SetActive(false);
			}

			if(game.gameReady()) {
				this.updateStatus('press start to play', true, 200);				
			} else {
				this.updateStatus('waiting for players', true, 40);
			}
		},

		setActive : function(active) {
			if(active) {

				if(!this.active) {
					this.status.show();
					this.split.enabled = true;
					this.teamtwo_two.show();
					this.teamtwo.show();
					this.teamone_one.show();
					this.teamone.show();	
					game.menu.updateStatus('waiting for players', true, 40);
					this.active = true;
					this.controllers.each(function(item){
						
					});
				}			
			} else {

				this.status.stoppulse();
				this.status.hide();
				this.split.enabled = false;
				this.teamtwo_two.hide();
				this.teamtwo.hide();
				this.teamone_one.hide();
				this.teamone.hide();
				this.controllers.each(function(item){
					item.hide();
				});
				
			}

			this.active = active;	
		},



		updateStatus : function( text, pulse, speed ) {
			
			var mid = phoenix.resolution.x / 2;
			this.status.text = text;
			//this.status.pos( vec2( mid - (game.font.widthOf(text, 0.5)/2), this.status._txt.pos.y) );	
			if(pulse) {
				this.status.pulse(0.1,1,speed);
			}
		},

		

		update : function(dt) {
			
		}
	});

	core.global.Game = new Class({
		initialize: function() {			

			game = this;		
			game.updateme = true;
			
			game.collisionBodies = [];

			game.types = {};
			game.types.json = { ext:'json', icon:'data/icons/json.png' };
			game.types.js = { ext : 'js', icon:'data/icons/script.png' };
			game.types.png = { ext : 'png', icon:'data/icons/png.png' };
			game.types.jpg = { ext : 'jpg', icon:'data/icons/jpg.png' };
			game.types.psd = { ext : 'psd', icon:'data/icons/psd.png' };
			game.types.folder = { ext : '', icon:'data/icons/folder.png' };
			game.types.parentfolder = { ext : '', icon:'data/icons/parentfolder.png' };

			game.pths = [];
			
			game.depths = {
				debug : 501,
				sprites : 601,
				hud : 999,
			};

			game.groups = {
				debug 		: 999,
				light 		: 401,
				entity 		: 501,
				objects 		: 601,
				trigger		: 701,
				collision 	: 801,
				sprites 		: 901,
				ignore 		: 902,
				other 		: 905,
				hud			: 909,
			};
		
			exec('src/','statemachine').end();
			if(true) {
				exec('src/editor/', 'editor').end();
				exec('src/editor/', 'editor.modes').end();
			}

			exec('src/game/', '*').end();
			exec('src/', 'entity levels').end();
			exec('src/parcycle/particle');
	
			game.font = new font('data/dont.fnt');
			game.physics = new Physics();
			game.physics.createWorld( vec2( 0, 0 ), false, false );

			game.cam = new camera('game.cam');			

			game.weaponTypes = [
				{
					name : 'pistol',
					description : '',
					velocity : 2000,
					shootdelay : 500,
					damage : 55,
					ammo : 9,
					clipammo : 9,
					imgindex : 0,
				},
				{
					name : 'sub\nmachine gun',
					description : '',
					velocity : 35,
					shootdelay : 100,
					damage : 15,
					reloadtime : 1500,
					ammo : 10,
					clipammo : 10,
					imgindex : 1,
				},
				{
					name : 'assault\nrifle',
					description : '',
					velocity : 25,
					shootdelay : 200,
					damage : 20,
					ammo : 16,
					clipammo : 16,
					reloadtime : 1000,
					imgindex : 2,
				},		
				{
					name : 'grenade\nlauncher',
					description : '',
					velocity : 7,
					reloadtime : 800,
					shootdelay : 800,
					ammo : 5,
					clipammo : 5,
					damage : 100,
					imgindex : 3,
				},						
			];

			game.itemTypes = [
				{
					count : 0,
					name : 'none',
					image : 'data/knife'
				},
				{
					name : 'health pack',
					count : 2,
					fixed : true,
					size : vec2(30,14),
					candie : true,
					AOEtime : 200,
					AOEtarget : 0.5,
					AOEamount : 2,
					AOElasttime : 0,
					AOEHealth : 60,
					AOETeam : true,
					AOEonce : false,
					AOE : 90,
						onAOE : function(player,owner,item) {							
							var c = core.gettime(); 							
							if(core.gettime() > this.AOEtarget) {
								if(player.health < 100) {									
									player.health += this.AOEamount;
									var p = player.health / 100;
									player.healthbar.size = vec2( 140*p, 5);
									this.AOElasttime = core.gettime();
									this.AOEtarget = this.AOElasttime + (this.AOEtime);									
									this.AOEHealth -= this.AOEamount;
									if(this.AOEHealth <= 0) {
										owner.items.erase(item);
										game.physics.world.DestroyBody( item.body );
										item.drop();
										delete item;
									}
									//core.echo(this.health);
								}								
							}
						},
					health : 100,
					team : true,
					depth : 0,
					imagesize : vec2(64,64),
					dothrow : vec2(180, 180),
					image : 'data/healthpack'
				},
				{
					count : 1,
					candie : true,
					health : 100,
					fixed : true,
					dothrow : vec2(150,90),
					name : 'fast clips',
					team : true,
					depth : -1,
					size : vec2(39,25),
					image : 'data/beacon',
					imagesize : vec2(64,64),
					anims : { 
						idle: {
							cellsize:{ x:64, y:64 },
							frames: [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2],
							pingpong:true,
							loop: true,
							speed: 30
						}
					},
					AOEtime : 200,
					AOEtarget : 0.5,
					AOEamount : 2,
					AOElasttime : 0,
					AOEHealth : 60,
					AOETeam : true,
					AOEonce : true,
					AOE : 90,
						offAOE : function(player,owner,item) {
							player.reloadmultiplier = 1;							
						},

						onDie : function(owner) {
							this.inrange.each(function(item){
								item.reloadmultiplier = 1;
							})								
						},

						onAOE : function(player,owner,item) {		
							player.reloadmultiplier = this.AOEamount;							
						},
				},
				{
					count: 2,
					candie : true,
					health : 300,
					fixed : true,
					size : vec2(89,20),
					name : 'create cover',
					image : 'data/cover',
					rotate : true,
					dothrow : vec2(0,0),
					imagesize : vec2(128,64),
					/*anims : { 
						place: {
							cellsize:{ x:64, y:64 },
							frames: [1],
							pingpong:false,
							loop: false,
							speed: 20
						},
						idle: {
							cellsize:{ x:64, y:64 },
							frames: [1],
							pingpong:false,
							loop: false,
							speed: 20
						}
					},*/
					placeanim : 'place',
				}
			];

			game.classTypes = [
				{
					name : 'assault',
					primaryweapon : game.weaponTypes[2],
					secondaryweapon : game.weaponTypes[0],
					item : game.itemTypes[1], 
				},
				{
					name : 'recon',
					primaryweapon : game.weaponTypes[1],
					secondaryweapon : game.weaponTypes[0],
					item : game.itemTypes[2], 
				},
				{
					name : 'engineer',
					primaryweapon : game.weaponTypes[3],
					secondaryweapon : game.weaponTypes[0],
					item : game.itemTypes[3], 
				}
			];			

			this.cam.addGroups( 
				[
					game.groups.light, 
					game.groups.objects,
					game.groups.trigger,
					game.groups.collision, 
					game.groups.sprites, 
					game.groups.entity, 
					game.groups.other
				] );

				this.controllers = [];
				this.players = [
					new Player(0),
					new Player(1),
					new Player(2),
					new Player(3),
				];
			
			this.collisions = [];
			this.pths = [];
			this.entities = [];
			this.entityTypes = [];
			this.npcTypes = [];

			game.physics.addCollideHandler( this.handleCollision );

			this.ingameoverlay = new sprite(false,vec2(),0,false);
			this.ingameoverlay.size = phoenix.resolution;
			this.ingameoverlay.group = game.groups.other;
			this.ingameoverlay.depth = 9;
			this.ingameoverlay.state = new TextItem( 'GAME OVER', phoenix.resolution.div(2));
			this.ingameoverlay.state.scale = 1.5; 
			this.ingameoverlay.state.depth = 10;
			this.ingameoverlay.state.group = game.groups.other;
			this.ingameoverlay.state.align = 1;

			this.ingameoverlay.state.hide();
			this.ingameoverlay.color = color(0,0,0,0);
			this.ingameoverlay.alpha = 0;

			this.score = {
				red : 0,
				blue : 0
			};

			
			this.bulletpoolsize = 10;
			this.bullets = [];
			this.activebullets = [];
			this.screen = rect(0,0,phoenix.resolution.x, phoenix.resolution.y);
			this.currentbullet = 0;

			for(var i = 0; i < this.bulletpoolsize; ++i ) {
				this.bullets.push( new sprite('data/bullet.png') );
				this.bullets[i].pos = phoenix.resolution.div(2);
				this.bullets[i].group = game.groups.other ;
				this.bullets[i].depth = 4;
				this.bullets[i].visible = false;
				this.bullets[i].body = game.physics.spawn( vec2(-1000,-1000), vec2(5,5) , 0, false, 'box', { linearDamping : 0.0 }, false );
				this.bullets[i].body.SetAwake(false);
				this.bullets[i].body.SetBullet(true);
			}

			this.showStatus =function( text, pulse, speed ) {
								
				this.ingameoverlay.fade({to:0.85, time:200});
				this.showingscore = true;
				var mid = phoenix.resolution.x / 2;
				this.ingameoverlay.state.set(text);
				this.ingameoverlay.state.pos( vec2( mid - (game.font.widthOf(text, 1.5)/2), this.ingameoverlay.state._txt.pos.y) );	

				if(pulse) {
					this.ingameoverlay.state._txt.pulse(0.1,1,speed);
				}

				this.players.each(function(item) {
					item.canmove = false;
				});
			};		
			this.hideStatus = function(  ) {
				
				this.ingameoverlay.fade({to:0, time:200});
				this.ingameoverlay.state.hide();	
				game.showingscore = false;			

			};	

			this.currentparticle = 0;

			/*time.schedule( 33,true,function(){
				this.activeparticles.each(function(item) {
					item.update( 0.033 );
				});			
			}.bind(this));*/

			this.menu = new Menu();	
			
		},

		

		restartRound : function() {

			//if the game is over, we quit back to the menu
			if(game.over) {
				game.quitToMenu();
			} else {
				game.players.each(function(item) {
					if(item.playing) {
						item.respawn(null, true);	
					}
				});				
			}
						
		},

		unload : function() {

			this.collisionBodies.each(function(item) {
					this.physics.world.DestroyBody( item );
			}.bind(this));
			
			delete this.collisions;
			this.collisions = [];

			if(levels.current.loaded) {
				levels.unload();
			}
			
			this.loaded = false;
			//this.unbindKeys();
			this.levelcurrent = {};
		},
		
		handleCollision : function( a_ud, b_ud, a, b, contact ) { /*fixtureA.GetBody().GetUserData(), fixtureB.GetBody().GetUserData(), fixtureA, fixtureB, contact */
				
			var localpoint = contact.GetManifold().m_points[0].m_localPoint;
			var worldpoint = a.GetBody().GetWorldPoint(localpoint);
			var hitpoint = vec2( game.physics.m2pix(worldpoint.x) , game.physics.m2pix(worldpoint.y) )
			
			var selfpos = game.physics.bodypos(a.GetBody());
			var otherpos = game.physics.bodypos(b.GetBody());			

			var self = a_ud;
			var other = b_ud;

			var dir = 270 - Math.abs( selfpos.rotationTo(otherpos) ) ;
			
			var ddir = otherpos.rotationTo(selfpos);

			//core.echo(ddir)

			if(self && other) {
				if(self.type && other.type) {
					//core.echo(self.type + ' ' + other.type)
					if(self.type == 'bullet' && other.type == 'player') {
						var offset = otherpos.directionTo(self.from.sprite.pos).normalised();
						if(other.ready && other.team != self.from.team) {													
							other.takeDamage(self.from.weapon);	
							time.schedule(20, false, function(){
								var bdir = 90 - self.from.sprite.pos.rotationTo(self.pos);
								//core.echo(bdir)
								other.doParticles(  100 ,  other.bloodparticles, self.pos , 100, {
									angle : -bdir, 
									rotation : -bdir,
									positionOffset : vec2(),
								} );				
							
								other.doParticles(  100 ,  other.smallblood, self.pos , 100, {
									angle : 0, 
									rotation : -bdir,
									depth : 6,
									positionOffset : vec2(),
								} );

								other.doParticles(  300 ,  other.smallblooddrops, self.pos , 300, {
									angle : -bdir, 
									positionOffset : offset.mul(16),
								} );
							});								
							
							self.removeme = true;											
						} else {
							//core.echo('cant shoot dead guys or team mate');
							contact.SetEnabled(false);
						}
					} //bullet + player 
					else if(self.type == 'bullet' && other.type == 'item') {
						var offset = otherpos.directionTo(self.from.sprite.pos).normalised();
						if(other.fromteam != self.from.team) {
							time.schedule(20, false, function(){
								self.from.doParticles(  100 ,  self.from.sparkparticles, self.pos , 300, {
									angle : 0,
									maxParticles : 1,
									rotation : dir,
									depth : 6,
									positionOffset : vec2(),//offset.mul(-8),
								});
							});	
							other.takeDamage(self.from.weapon);
							self.removeme =  true;
						} else {
							//cant shoot own equipment
							contact.SetEnabled(false);
						}
						
					} //shooting items
					else if(self.type == 'bullet' && other.type == 'world') {
						var offset = otherpos.directionTo(self.from.sprite.pos).normalised();
						time.schedule(20, false, function(){
							self.from.doParticles(  100 ,  self.from.sparkparticles, self.pos , 300, {
								angle : 0,
								maxParticles : 5,
								rotation : dir,
								positionOffset : vec2(),//offset.mul(-8),
							});		
						});						
						self.removeme = true;
					} //shooting walls
					else if(self.type == 'player' && other.type == 'player') {	
						if(!other.dead && !self.dead) {
							//core.echo('colliding with players' + '(player: ' + (self.gamepad+1) + ' defib: '+self.defib+' ) '  +  '(player: ' + (other.gamepad+1) + ' defib: '+other.defib+' ) ' )					
							if(self.knife.visible) {
								//stabbing him									
								if(other.team != self.team) {
									if((dir > - 45 && dir < 45) || (dir > 135 && dir < 225)) {
										other.takeDamage({name:'knife', damage:100});
										other.doParticles(  100 ,  other.bloodparticles, otherpos , 100, {
											angle : dir, 
											rotation : dir,
											positionOffset : vec2(),
										} );				
										other.doParticles(  100 ,  other.smallblood, otherpos , 100, {
											angle : 0, 
											rotation : dir,
											positionOffset : vec2(),
										} );
										other.doParticles(  1000 ,  other.smallblooddrops, otherpos , 500, {
											angle : -90, 
											gravity : vec2(0,8),										
											speed : 2.5,
											depth: 5,											
										} );
									}
								}
							} 
							if(other.knife.visible) {
								
								if(self.team != other.team) {
									if((dir > - 45 && dir < 45) || (dir > 135 && dir < 225)) {
										self.takeDamage({name:'knife', damage:100});
										self.doParticles(  100 ,  other.bloodparticles, otherpos , 100, {
											angle : dir, 
											rotation : dir,
											positionOffset : vec2(),
										} );				
										self.doParticles(  100 ,  other.smallblood, otherpos , 100, {
											angle : 0, 
											rotation : dir,
											positionOffset :vec2(),
										} );
										self.doParticles(  1000 ,  other.smallblooddrops, otherpos , 500, {
											angle : -90, 											
											gravity : vec2(0,8),										
											depth: 5,
											speed : 2.5,
										} );									
									}
								}
							}

							if(self.defib && other.ready  && (self.team != other.team)) {								
								if((dir > - 45 && dir < 45) || (dir > 135 && dir < 225)) {
									other.takeDamage({name:'defib', damage:100});									
										other.doParticles(  300 ,  other.shockparticles, otherpos , 200, {
											angle : dir, 
											rotation : dir,
											positionOffset : vec2(),
										} );				
										other.doParticles(  100 ,  other.smallblood, otherpos , 100, {
											angle : 0, 
											rotation : dir,
											positionOffset : vec2(),
										} );
										other.doParticles(  1000 ,  other.smallblooddrops, otherpos , 500, {
											angle : -90, 											
											gravity : vec2(0,8),										
											depth: 5,
											speed : 2.5,
										} );
								}
							}
							if(other.defib && self.ready && (self.team != other.team)) {
								if((dir > - 45 && dir < 45) || (dir > 135 && dir < 225)) {
									self.takeDamage({name:'defib', damage:100});
										other.doParticles(  300 ,  other.shockparticles, otherpos , 200, {
											angle : dir, 
											rotation : dir,
											positionOffset : vec2(),
										} );				
										self.doParticles(  100 ,  other.smallblood, hitpoint , 100, {
											angle : 0, 
											rotation : dir,
											positionOffset : vec2(),
										} );
										self.doParticles(  1000 ,  other.smallblooddrops, otherpos , 500, {
											angle : -90, 
											gravity : vec2(0,8),
											depth: 5,
											speed : 2.5,
										} );																		
								}
							}
						} 
						//if() {
						if(self.defib && !other.ready && (self.team == other.team)) {
							other.revive(self);
						} else if(other.defib && !self.ready && (self.team == other.team)) {
							self.revive(other);
						}
						//}


					} //player vs player					
				} //type
			} //if passed in a user data  

		},		
			
		updateControllers : function( controllers ) {
			this.controllers = controllers;
			
			if(this.menu && this.menu.active) {
				this.controllers.each(function(item, index){
					if(index < 4) {
						if(item.connected) {
							this.menu.controllers[index].alpha = 1;
						} else {
							this.menu.controllers[index].alpha = 0.25;
						}
					}
				}.bind(this));	 //for each controller
			} //if menu and menu active
		},

		quitToMenu : function() {
			this.unload();

			game.over = true;
			game.players.each(function(item){
				item.dead = true;
				item.canmove = false;
				item.ready = false;
				item.sprite.anim.set('menu').play();
				item.sprite.visible = true;
				item.knife.visible = false;
				item.marker.visible = false;
				item.flag.visible = true;
				item.die(true,true);
				item.spriteweapon.texture = item.weaponimages[4];
				item.spriteweapon.depth = item.sprite.depth - 1;
				item.spriteweapon.geom.update();
				item.setItemText(item.activeclass.item.name);
				item.setWeaponText(item.weapon.name);
			});
			
			game.score.red = 0;
			game.score.blue = 0;
			game.hideStatus();
			game.loading = false;

			game.menu.resetPlayerPositions();
			game.menu.setActive(true);
		},	

		checkPlayerReady : function( gamepad ) {
			//core.echo('checking a player ready ' + gamepad);
			this.players[gamepad].ready = !this.players[gamepad].ready;
			this.menu.readyChanged( gamepad, this.players[gamepad].ready );
		},

		_startGame : function() {
			//core.echo('level started');
			game.menu.setActive(false);
			game.menu.updateStatus(game.score.blue + ' blue    :    red '  + game.score.red);
			game.loading = false;
		},

		_loadGame : function() {
			
			game.currentlevel = '01.exposure';
			this.menu.updateStatus('LOADING', false, 50);			
			levels.load('01.exposure','./levels/01.exposure/',function(){
				this._startGame();
				game.createEntities();
				game.createCollision();

				game.spawnpoints = {};
				game.spawnpoints.red = []
				game.spawnpoints.blue = []
				game.entities.each(function(item,index){					
					if(item.entity.instance.properties.team == 1) {
						game.spawnpoints.blue.push(item);
					} else if(item.entity.instance.properties.team == 2) {
						game.spawnpoints.red.push(item);
					}
				});
				game.players.each(function(item){
					if(item.ready && item.playing) {
						item.respawn(null, true); 
					} else {
						item.sprite.visible = false;
						item.knife.visible = false;
						item.spriteweapon.visible = false;
						item.flag.visible = false;						
					}
				});

			}.bind(this));
		},

		startGame : function( gamepad ) {

			if( game.loading ) return;
			if(!this.gameReady()) return;
		
			if(game.menu.active) {

				gamepad += 1;		
				game.loading = true;	
				this.menu.updateStatus('player ' + gamepad + ' started the game', true, 300);
				time.schedule(1000, false, function(){
					this.menu.updateStatus('2', true, 50);
					time.schedule(1000, false, function(){
						this.menu.updateStatus('1', true, 50);
						time.schedule(1000, false, function() {
							game._loadGame();	
						});
					}.bind(this));
				}.bind(this));

			} else {
				//in game pause
			}
					
		},

		gameReady : function() {
			var ready = false;
				
				return true;
				var teamoneready = 0;
				var teamtwoready = 0;

				if(game.players[0].ready) teamoneready++;
				if(game.players[2].ready) teamoneready++;

				if(game.players[1].ready) teamtwoready++;
				if(game.players[3].ready) teamtwoready++;

				if(teamoneready > 0 && teamtwoready > 0) {
					ready = true;
				}

			return ready;	
		},

		update: function(dt) {
			
			this.mouse = vec2(mouse).add(game.cam.pos).div( this.cam.zoomAmount );

			
			if(this.menu.active) {
				this.menu.update(dt);	
			}
			//p.report('menu')

			this.players.each(function(player){				
				player.update(dt);				
			}.bind(this));
			//p.report('players')

			//var p = time.measure('loop');
			
			//p.report('particles');

			var toremove = [];
			this.activebullets.each(function(item){
				if(item.body.IsAwake()) {
					item.pos = game.physics.bodypos( item.body );					
					if(  !this.screen.contains(item.pos) || item.removeme ) {					
						item.body.SetAwake(false);
						item.body.SetActive(false);				
						item.body.SetLinearVelocity( new b2Vec2( 0, 0 ) );											
						item.body.SetUserData(null);
						item.visible = false;
						item.active = false;
						toremove.push(item);
					}
				}

				/**/
			}.bind(this)); //each bullet
					
			if(toremove.length) {
				toremove.each(function(item) {					
					this.activebullets.erase(item);
				}.bind(this));
			}			
			//p.report('bullets')

			if(this.physics) {
				this.physics.update(dt);
			}
			//p.report('physics')

		}
	});

	

	var Player = new Class({
		initialize : function(id) {
			
			this.flag = new sprite('data/flag.png');
			this.sprite = new sprite('data/player.png');
			this.spriteweapon = new sprite('data/ammo.png');
			this.knife = new sprite('data/knife.png');
			this.marker = new sprite('data/marker.png');

			this.weaponimages = [
				phoenix.texture('data/pistol.png'),
				phoenix.texture('data/smg.png'),
				phoenix.texture('data/m4.png'),
				phoenix.texture('data/GL.png'),
				phoenix.texture('data/ammo.png')
			];
			
			this.sprite.visible = true;
			this.sprite.depth = 3;
			this.sprite.group = game.groups.other + id;
			this.spriteweapon.group = game.groups.other + id;
			this.spriteweapon.depth = 2.9;
 +			this.sprite.addchild(this.spriteweapon);
			this.sprite.addchild(this.flag);

			this.flag.depth = 3;
			this.flag.group = game.groups.other + id;
			
			this.knife.visible = false;
			this.knife.depth = 3;
			this.knife.group = game.groups.other + id;

			this.marker.depth = 3;
			this.marker.group = game.groups.other + id;

			/*this.cam = new camera('cam.player.' + id);
			this.cam.addGroups( 
				[
					//game.groups.light, 
					//game.groups.objects,
					//game.groups.trigger,
					//game.groups.collision, 
					//game.groups.sprites, 
					//game.groups.entity, 
					game.groups.other + id
				] );
			switch(id) {
				case 0: 
					this.cam.screenpos = vec2(0,0);
					this.cam.screensize = phoenix.resolution.div(2);
				break;
				case 1: 
					this.cam.screenpos = vec2(phoenix.resolution.x/2,0);
					this.cam.screensize = phoenix.resolution.div(2);					
				break;
				case 2: 
					this.cam.screenpos = vec2(0,phoenix.resolution.y/2);
					this.cam.screensize = phoenix.resolution.div(2);									
				break;
				case 3: 
					this.cam.screenpos = vec2(phoenix.resolution.x/2,phoenix.resolution.y/2);
					this.cam.screensize = phoenix.resolution.div(2);									
				break;
			}*/

			var playeranims = { 			
				idle : {
					cellsize:{ x:64, y:64 },
					frames: 1,
					pingpong:false,
					loop: false,
					speed: 30
				},
				menu : {
					cellsize:{ x:64, y:64 },
					frames: [22],
					pingpong:false,
					loop: false,
					speed: 60
				},				
				die : {
					cellsize:{ x:64, y:64 },
					frames: [2,3,4,5,6,7,16,17],
					pingpong:false,
					loop: false,
					speed: 20					
				},
				diedie : {
					cellsize:{ x:64, y:64 },
					frames: [2,3,4,5,6,7,16,17,17,17,17,17,17,17,17,17,17,18,19,20,21,22],
					pingpong:false,
					loop: false,
					speed: 20					
				},
				dead : {
					cellsize:{ x:64, y:64 },
					frames: [17,17,18,18,19,19,20,20, 21,21,22,22],
					pingpong:false,
					loop: false,
					speed: 20					
				},				
				defib : {
					cellsize:{ x:64, y:64 },
					frames: [13,14,15],
					pingpong:false,
					loop: true,
					speed: 30					
				},		
				downdefib : {
					cellsize:{ x:64, y:64 },
					frames: [23,24,25],
					pingpong:false,
					loop: true,
					speed: 30					
				},								
				revived : {
					cellsize:{ x:64, y:64 },
					frames: [9,10,11,12],
					pingpong:false,
					loop: true,
					speed: 20			
				},
				trauma: {
					cellsize:{ x:64, y:64 },
					frames: [16,17,18,19],
					pingpong:false,
					loop: false,
					speed: 20			
				}				
			};
		
			this.sprite.anim.create( playeranims ).set('menu').play();
			this.sprite.size = vec2(64,64)			
			
			this.gamepad = id;
			this.movespeed = 4;
			this.sprintspeed = 7;	
			this.sprite.pos = phoenix.resolution.div(2);				
			this.movement = vec2();
			this.direction = vec2();
			this.xvelocity = 0;
			this.yvelocity = 0;
			this.drag = 20;
			this.stoplimit = 0.08;
			this.sprinting = true;
			this.currentWeapon = 0;	
			this.ready = false;	
			this.reloadmultiplier = 1;
			this.reloadcounter = 0;
			this.reloading = false;
			this.team = 0;
			this.mx = 0;
			this.my = 0;
			this.rx = 0;
			this.defib = false;			;
			this.currentClass = 0;
			this.ry = 0;
			this.dead = true;
			this.playing = false;
			this.canmove = false;
			this.activeclass = game.classTypes[this.currentClass];
			this.activeitem = Object.clone(this.activeclass.item);
			this.allowedWeapons = [
				this.activeclass.primaryweapon,
				this.activeclass.secondaryweapon,
			];
			this.weapon = Object.clone(this.activeclass.primaryweapon);			
			this.lastshot = 0;
			this.lastreviveattempt = 0;
			this.cursordistance = 50;
			this.aimdirection = vec2(50, 0);
			this.lookdirection = vec2(50, 0);
			this.items = [];
			this.itemstoremove = [];
			this.resethelditem = true;
			this.rotation = 0;
			this.health = 100;
			//this.healthbar.size = vec2( 140*p, 5);

			var x1, y1,c, x2, y2, x3 = 0, y3 = 0, x4, y4;
			switch(this.gamepad) {
				case 0: 
					x1 = 100; y1 = 30; c =  color().RGB(80,173,238,1); 
					x2 = 100; y2 = 90; 
					x3 = 100; y3 = 60; 
					x4 = 100; y4 = 110;
				break; 
				case 2: 
					x1 = 100; y1 = phoenix.resolution.y - 100;  c =  color().RGB(80,173,238,1); 
					x2 = 100; y2 = phoenix.resolution.y - 40; 
					x3 = 100; y3 = phoenix.resolution.y - 70; 
					x4 = 100; y4 = phoenix.resolution.y - 20; 
				break;
				case 1: 
					x1 = phoenix.resolution.x - 100 ; y1 = 30; c = color().RGB(208,20,20,1); 
					x2 = phoenix.resolution.x - 100 ; y2 = 90; 
					x3 = phoenix.resolution.x - 100 ; y3 = 60; 
					x4 = phoenix.resolution.x - 100 ; y4 = 110; 
				break;				
				case 3: 
					x1 = phoenix.resolution.x - 100 ; y1 = phoenix.resolution.y - 100; c =  color().RGB(208,20,20,1);
					x2 = phoenix.resolution.x - 100 ; y2 = phoenix.resolution.y - 40;
					x3 = phoenix.resolution.x - 100 ; y3 = phoenix.resolution.y - 70;
					x4 = phoenix.resolution.x - 100 ; y4 = phoenix.resolution.y - 20; 
				break;
			}

			this.weapontext = new Text( 'pistol', vec2( x1, y1 ), 0.5, c , 1, game.groups.ignore, game.font, phoenix.aligncenter );			
			this.weapontext.initialpos = vec2(x1,y1);
			this.itemtext = new Text( 'none', vec2( x2, y2 ), 0.5, color(1,1,1,1) , 1, game.groups.ignore, game.font, phoenix.aligncenter );			
			this.itemtext.initialpos = vec2(x2,y2);
			this.setItemText(this.activeclass.item.name);
			this.setWeaponText(this.weapon.name);

			this.healthbar = new sprite(false, vec2(2,2 ), 0, false );
			this.healthbar.size = vec2(140, 5);					
			this.healthbar.depth = 10; this.healthbar.group = game.groups.ignore;

			this.healthbarholder = new sprite(false, vec2(x4 - 72, y4-2 ), 0, false );
			this.healthbarholder.size = vec2(144, 9);					
			this.healthbarholder.color = color(0,0,0,0.8);
			this.healthbarholder.depth = 9; this.healthbarholder.group = game.groups.ignore;
			this.healthbarholder.addchild(this.healthbar);

			
			this.classtext = new Text( 'assault', vec2( x3, y3 ), 1, color(1,1,1,1) , 1, game.groups.ignore, game.font, phoenix.aligncenter );			
			this.classtext.initialpos = vec2(x3,y3);
			this.setClassText('assault');

			/*if(id == 0){
				events.connect('mouse::left::down', function(e){
					this.doParticles(  300 ,  this.shockparticles, mouse , 200, {} );
				}.bind(this))
				events.connect('mouse::right::down', function(e){
					this.doParticles(  1000 ,  this.smallblooddrops, mouse , 300, {} );
				}.bind(this))
			}	*/

			this.bloodparticles = {
				particleImage : 'data/blood.png',
				positionOffset : vec2(5, 0),
				positionRandom : vec2(),
				size : 60,
				sizeRandom : 0,
				depth : this.depth+1,
				startSize : vec2(10,10),
				startSizeRandom : vec2(0,0),
				endSize : vec2(100,100),
				endSizeRandom : vec2(0,0),
				speed : 0.9,
				maxParticles : 1,
				speedRandom : 0,
				emissionTime : 1000,
				lifeSpan : 100,
				lifeSpanRandom : 0,
				angle : 0,
				angleRandom : 0,
				rotation : 0,
				rotationRandom : 0,
				rotationOffset : 180,
				gravity : vec2(0, 0),
				startColor : color(1,1,1,1),
				startColorRandom : color(0,0,0,0),
				finishColor : color(1,1,1,0),
				finishColorRandom : color(0,0,0,0),
			};

			this.smallblood = {
				particleImage : 'data/smallblood.png',
				positionOffset : vec2(0, -8),
				positionRandom : vec2(),
				size : 60,
				sizeRandom : 0,
				depth : this.depth+1,
				startSize : vec2(10,10),
				startSizeRandom : vec2(0,0),
				endSize : vec2(50,50),
				endSizeRandom : vec2(0,0),
				speed : 0.0,
				speedRandom : 0,
				emissionTime : 1000,
				lifeSpan : 100,
				maxParticles : 2,
				lifeSpanRandom : 0,
				angle : 0,
				angleRandom : 0,
				rotation : 0,
				rotationRandom : 0,
				rotationOffset : 0,
				gravity : vec2(0, 0),
				startColor : color(1,1,1,1),
				startColorRandom : color(0,0,0,0),
				finishColor : color(1,1,1,0),
				finishColorRandom : color(0,0,0,0),
			};

			this.smallblooddrops = {
				particleImage : 'data/drop.png',
				positionRandom : vec2(10,10),
				size : 60,
				sizeRandom : 0,
				depth : this.depth+1,
				startSize : vec2(1,1),
				startSizeRandom : vec2(0,0),
				endSize : vec2(15,15),
				endSizeRandom : vec2(5,5),	
				speed : 6.0,
				speedRandom : 1,
				maxParticles : 10,
				emissionTime : 50,
				lifeSpan : 600,
				lifeSpanRandom : 0,
				angle : 1,
				angleRandom : 10,
				rotation : 0,
				rotationRandom : 360,
				rotationOffset : 0,
				gravity : vec2(0, 1),
				startColor : color(1,1,1,1),
				startColorRandom : color(0,0,0,0),
				finishColor : color(1,1,1,0),
				finishColorRandom : color(0,0,0,0),
			};

			this.sparkparticles = {
				particleImage : 'data/spark.png',
				positionOffset : vec2(0, 0),
				positionRandom : vec2(),
				size : 60,
				sizeRandom : 0,
				startSize : vec2(10,10),
				startSizeRandom : vec2(0,0),
				endSize : vec2(50,50),
				endSizeRandom : vec2(0,0),
				speed : 0.2,
				depth : this.depth+1,
				speedRandom : 0,
				emissionTime : 1000,
				maxParticles : 2,
				lifeSpan : 100,
				lifeSpanRandom : 0,
				angle : 0,
				angleRandom : 0,
				rotation : 0,
				rotationRandom : 0,
				rotationOffset : 0,
				gravity : vec2(0, 0),
				startColor : color(1,1,1,1),
				startColorRandom : color(0,0,0,0),
				finishColor : color(1,1,1,0),
				finishColorRandom : color(0,0,0,0),
			};			

			this.shockparticles = {
				particleImage : 'data/shock.png',
				positionOffset : vec2(0, 0),
				positionRandom : vec2(10,10),
				size : 60,
				sizeRandom : 0,
				startSize : vec2(0,0),
				startSizeRandom : vec2(0,0),
				endSize : vec2(20,20),
				endSizeRandom : vec2(20,20),
				speed : 0.1,
				depth : 5,
				speedRandom : 0,
				emissionTime : 10,
				maxParticles : 10,
				lifeSpan : 50,
				lifeSpanRandom : 150,
				angle : 0,
				angleRandom : 0,
				rotation : 0,
				rotationRandom : 360,
				rotationOffset : 0,
				gravity : vec2(0, -8),
				startColor : color(1,1,1,1),
				startColorRandom : color(0,0,0,0.4),
				finishColor : color(1,0,0,0.8),
				finishColorRandom : color(1,0,0,1),
			};

			

			this.body = game.physics.spawn( this.sprite.pos, vec2(10,18) , 0, false, 'box', 0, false );
			//pos, size, a, f, type, props, trigger
			this.body.SetFixedRotation(true);
			this.body.SetActive(false);
			this.type = 'player';
			this.body.SetUserData(this);

			this.activeparticles= [];
			this.emitterpool = [];
			this.emitterindex = 0;
			this.emitterpoolsize = 20;

			this.reloading = false;			

		},

		doParticles : function( duration, type, pos , life, other ) {

			//game.doParticles(duration, type, pos, life, other);
			//doParticles : function( duration, type, pos , life, other ) {
				var newparticles;
			if(this.emitterpool[this.emitterindex]) {
				newparticles = this.emitterpool[this.emitterindex];
				newparticles.init();
				//core.echo('using existing emitter ' + this.emitterindex)
			} else {
				//core.echo('using new emitter ' + this.emitterindex)
				newparticles = this.emitterpool[this.emitterindex] = new cParticleEmitter();
				newparticles.init( );
			}

			++this.emitterindex;
			if(this.emitterindex > this.emitterpoolsize - 1) this.emitterindex = 0;

			Object.merge(newparticles, type);
			Object.merge(newparticles, other);

			newparticles.position = pos;
			newparticles.lifeSpan = life;					
			newparticles.emit(duration);

			this.activeparticles.push(newparticles);
			var that  = this;
			newparticles.onStop = function(){
				that.activeparticles.erase(this);
			}.bind(newparticles);

			//},			

		},
		
		useItem : function( itemtouse ) {

			if(!itemtouse) {

				if(this.activeitem.count) {
					this.holdingtime = core.gettime();
					this.holdingitem = true;			
					if(this.resethelditem) {
						this.helditem = new sprite(this.activeitem.image + '.png');
						this.helditem.depth = 3;
						this.helditem.group = game.groups.other + this.gamepad;						
						if(this.activeitem.team) {
							//core.echo('added team coloring to item');
							this.helditem.teambadge = new sprite(this.activeitem.image + '_team.png');
							this.helditem.teambadge.color = this.flag.color;
							this.helditem.teambadge.depth = this.helditem.depth + this.activeitem.depth;
							this.helditem.teambadge.group = this.helditem.group;
							this.helditem.teambadge.size = this.activeitem.imagesize;
							this.helditem.addchild(this.helditem.teambadge);
						}

						if(this.activeitem.anims) {
							this.helditem.anim.create(this.activeitem.anims).set('idle').play();							
						}

						this.helditem.size = this.activeitem.imagesize;
						this.resethelditem = false;
					}

					if(this.activeitem.rotate) {
						
						this.helditem.pos = vec2(); 
							this.helditem.rotation = this.marker.rotation + 270;
						this.helditem.pos = this.sprite.pos.add( this.aimdirection.mul(this.cursordistance) );//vec2(this.sprite.pos.x, this.marker.pos.y);
						// this.sprite.pos.add( this.lookdirection.mul(this.cursordistance) );
					} else {
						if(this.sprite.hflip) {
							this.helditem.pos = this.sprite.pos.add( vec2(-25, -10) );
						} else {
							this.helditem.pos = this.sprite.pos.add( vec2(25, -10) );	
						}
					}

				}  else {
					this.setItemText('EMPTY', true, 300, 600);
				}//no more
			} else {				

				this.holdingitem = false;
				if(this.helditem) {
					this.resethelditem = true;
					if(this.activeitem.dothrow) {												
						this.helditem.currentvelocity = vec2(this.activeitem.dothrow);						
						//if(this.sprite.hflip) {
						//	this.helditem.currentvelocity.x = -this.helditem.currentvelocity.x;
						//} 
						var xamount = this.lookdirection.x;
						if(xamount > 0 && xamount < 0.4) xamount = 0.4;						
						if(xamount < 0 && xamount > -0.4) xamount = -0.4;						
						var dir = vec2( xamount * this.helditem.currentvelocity.y, this.lookdirection.y * this.helditem.currentvelocity.y);
						this.helditem.currentvelocity = dir;
						//core.echo(dir.str())
						this.helditem.yline = this.sprite.pos.y;
						this.helditem.moving = true;
						this.helditem.instance = Object.clone(this.activeitem);
						this.helditem.instance.inrange = [];
					}
					
					this.items.push(this.helditem);
					core.echo('this.items length' + this.items.length)

					//use up the item here.
					this.activeitem.count -= 1;
					//core.echo('using up ' + this.activeitem.name + ' now i have ' + this.activeitem.count + ' left' );
					if(this.activeitem.count <= 0) {
						this.setItemText('EMPTY', true, 50);
					}

				}
			}			
		},

		respawn : function(option, reset) {

			this.ready = true;
			this.dead = false;
			this.sprite.anim.set('idle').play();
			this.flag.rotation = 0;

			//find a spawn point
			if(option) {
				
			} else {
				var start = this.team == 2 ? 'red' : 'blue';
				var sp = Math.floor(Math.random() * 14);
				//core.echo( sp + ' ' + start + game.spawnpoints[start].length)
				this.spawnpos = vec2(game.spawnpoints[start][sp].entity.instance.pos);
				this.setpos(this.spawnpos);
				this.canmove = true;
				this.health = 100;
				this.healthbar.size = vec2( 140, 5);
				this.spriteweapon.texture = this.weaponimages[this.weapon.imgindex];
				this.spriteweapon.visible = true;
				this.spriteweapon.depth = this.sprite.depth + 1;
			}

			if(reset) {
				this.weapon = Object.clone(this.activeclass.primaryweapon);					
					//set position todo
				this.activeitem = Object.clone(this.activeclass.item);
			} 

			this.setItemText(this.activeitem.name);
			this.setWeaponText(this.weapon.name);
			this.setClassText('ammo ' + this.weapon.ammo);

			this.body.SetActive(true);
			if(!game.menu.active) {
				game.physics.bodystatic(this.body, false);
			}

		},

		revive : function(bywho) {

			//core.echo('trying to revive ' + this.canrevive)
			if( !(core.gettime() > this.lastreviveattempt + 500)) {
				return;
			}

			this.lastreviveattempt = core.gettime();
			this.doParticles(  300 ,  this.shockparticles, this.sprite.pos.subtract(0,10) , 200, {
				angle : 0, 
				positionOffset : vec2(),
			} );			
			
			core.echo('can revive? ' + this.canrevive)	

			if(this.canrevive) {
				this.defib = false;
				this.ready = true;
				this.health = 50;
				this.healthbar.size = vec2( 70, 5);
				this.sprite.anim.set('revived').play(); //set to respawn anim
				time.unschedule(this.respawnSchedule);
				time.unschedule(this.rsc3);
				time.unschedule(this.rsc2);
				time.unschedule(this.rsc1);
				time.unschedule(this.rsc0);
				time.schedule(300,false, function() {
					this.sprite.anim.set('idle').play();
				}.bind(this))
				this.spriteweapon.texture = this.weaponimages[this.weapon.imgindex];
				this.spriteweapon.geom.update();
				if(!game.menu.active) {
					game.physics.bodystatic(this.body, false);
				} else {
					var rem = [];
					this.items.each(function(item){
						core.echo('checking to kill items ' + item.instance.name)
						if(item.instance.name == 'fast clips') rem.push(item);
					}.bind(this))
					core.echo('killing ' + rem.length + ' items')
					rem.each(function(item){
						if(item.instance.onDie) item.instance.onDie();
						this.items.erase(item);
						game.physics.world.DestroyBody( item.body );
						item.drop();
						delete item;  
					}.bind(this));
				}
			} else {
				this.sprite.anim.set('trauma').play(); //set to respawn anim
			}

			//0861 462 273
		},

		die : function(amenu,menu) {

			this.canrevive = false;
			this.setWeaponText('dead', true, 20);
			this.sprite.anim.set('dead').play();
			game.physics.bodystatic( this.body, true );
			
			this.flag.rotation = 20;
			this.dead = true;
			this.defib = false;

			var rem = [];
			this.items.each(function(item){
				if(item.name == 'fast clips') rem.push(item);
			}.bind(this))
			rem.each(function(item){
				this.items.erase(item);
				game.physics.world.DestroyBody( item.body );
				item.drop();
				delete item;
			}.bind(this));

			if(!menu && !game.menu.active) {
				var winners = this.team == 1 ? 'red' : 'blue';			
				var losers = this.team == 1 ? 'blue' : 'red';			
				if(this.teammate.playing) {
					if(this.teammate.dead) {
						game.score[winners] += 1;
						if(game.score[winners] >= 3) {
							game.showStatus('GAME OVER\n' + winners + ' WINS\nB:MENU' );
							game.over = true;
						} else {
							game.showStatus('ROUND OVER\nRED: ' + game.score.red  + ' BLUE: ' + game.score.blue + '\nB:MENU\nA:NEXT ROUND' );
							game.menu.updateStatus(game.score.blue + ' blue    :    red '  + game.score.red);
						}
						
					} else {
						//warning?
					}
				} else {
					//playing alone
					//core.echo('alone with no team mates');
						game.score[winners] += 1;
						if(game.score[winners] >= 3) {
							game.showStatus('GAME OVER\n' + winners + ' WINS\nB:MENU' );
							game.over = true;
						} else {
							game.showStatus('ROUND OVER\nRED: ' + game.score.red  + ' BLUE: ' + game.score.blue + '\nB:MENU\nA:NEXT ROUND' );
							game.menu.updateStatus(game.score.blue + ' blue    :    red '  + game.score.red);
						}
				}
			} //dont do this when quitting to menu

			time.unschedule(this.respawnSchedule);
			time.unschedule(this.rsc3);
			time.unschedule(this.rsc2);
			time.unschedule(this.rsc1);
			time.unschedule(this.rsc0);
		},

		checkHealth : function() {
			if(this.health <= 0) {
				this.ready = false;
				if(!game.menu.active) {
					this.sprite.anim.set('die').play();
				} else {
					this.sprite.anim.set('diedie').play();
					this.canrevive = true;
				}

				this.spriteweapon.texture = this.weaponimages[4];
				this.spriteweapon.depth = this.sprite.depth - 1;
				this.spriteweapon.geom.update();
				//game.physics.bodysetsize(this.body, vec2(18, 10));
				//game.physics.bodystatic(this.body, true);
				if(game.menu.active) {
					this.canrevive = true;
					this.respawnSchedule = time.schedule(1000, false, this.revive.bind(this));
				} else {
					this.respawnSchedule = time.schedule(5000, false, this.die.bind(this));
					this.canrevive = true;
					//game.menu.readyChanged(this.gamepad, false);
					this.setWeaponText('man down', true, 300);
					this.rsc3 = time.schedule(2000, false, function(){
						this.setWeaponText('dead\nspawn 3', true, 20);
						this.rsc2 = time.schedule(1000, false, function(){
							this.setWeaponText('dead\nspawn 2', true, 20);
							this.rsc1 = time.schedule(1000, false, function(){
								this.setWeaponText('dead\nspawn 1', true, 20);
							}.bind(this));
						}.bind(this));
					}.bind(this));	
					this.setItemText('REVIVE ME', true, 100);	
				}
			}
		},

		takeDamage : function(weapon) {			
			this.health -= weapon.damage;
			if(this.health < 0) this.health = 0;
			this.checkHealth();
			var p = this.health / 100;
			this.healthbar.size = vec2( 140*p, 5);
		},

		setClassText : function( text, pulse, speed, duration ) {
			
			var pos = this.classtext.initialpos;
			this.classtext.set(text);
			this.classtext.pos( vec2( pos.x , pos.y) );	
			this.classtext._txt.alpha = 0.2;
			if(pulse) {
				this.classtext._txt.pulse(0.1,1,speed, duration);
			}
		},

		setWeaponText : function( text, pulse, speed, duration ) {
			
			var pos = this.weapontext.initialpos;
			this.weapontext.set(text);
			this.weapontext.pos( vec2( pos.x , pos.y) );	

			if(pulse) {
				this.weapontext._txt.pulse(0.1,1,speed, duration);
			}
		},

		setItemText : function( text, pulse, speed, duration ) {
			
			var pos = this.itemtext.initialpos;
			this.itemtext.set(text);
			this.itemtext.pos( vec2( pos.x, pos.y) );	

			if(pulse) {
				this.itemtext._txt.pulse(0.1,1,speed, duration);
			}
		},		

		switchClass : function() {
			
			if(game.menu.active) {
				if(!this.ready)  return;
				this.currentClass++;
				if(this.currentClass > 2)	 this.currentClass = 0;
				this.activeclass = game.classTypes[this.currentClass];			
				var w = game.weaponTypes.indexOf( this.activeclass.primaryweapon );
				//core.echo('class uses weapon ' + w);
				this.switchWeapon( w );
				this.setClassText(this.activeclass.name);//, true, 50, 1000);
				this.allowedWeapons = [
					this.activeclass.primaryweapon,
					this.activeclass.secondaryweapon,
				]

				this.activeitem = Object.clone(this.activeclass.item);
				this.setItemText( this.activeitem.name, true, 50, 1000 );
				this.items.each(function(item){					
					game.physics.world.DestroyBody( item.body );
					item.drop();
				}.bind(this))
				if(this.helditem) this.helditem.drop();
				this.holdingitem = false;
				this.resethelditem = true;
				delete this.helditem;
				delete this.items;
				this.items = [];

			} else {
				//this.respawn(null, true);
			}
		},

		setpos : function(p) {
			this.sprite.pos = p;			
			this.knife.pos = this.sprite.pos;
			this.marker.pos = this.sprite.pos;
			game.physics.bodysetpos( this.body, this.sprite.pos );
		},

		switchWeapon : function( w ) {
			if(!this.ready)  return;

			if(!game.menu.active) {
				this.currentWeapon += 1;				
				if(this.currentWeapon > 1) this.currentWeapon = 0;
				this.weapon = Object.clone(this.allowedWeapons[ this.currentWeapon ]);
				this.setWeaponText(this.weapon.name, true, 300, 1000);	
				this.spriteweapon.texture = this.weaponimages[this.weapon.imgindex];			
				this.spriteweapon.geom.update();
			} else {
				if(w) {
					this.weapon = Object.clone(game.weaponTypes[w]);
					this.setWeaponText(this.weapon.name, true, 40, 1000);
					this.spriteweapon.texture = this.weaponimages[this.weapon.imgindex];
					this.spriteweapon.geom.update();
				} /*else {
					this.currentWeapon += 1;
					core.echo('this.weapon ' + this.currentWeapon);
					if(this.currentWeapon > (game.weaponTypes.length - 1) ) this.currentWeapon = 0;
					this.weapon = game.weaponTypes[this.currentWeapon];
					this.setWeaponText(this.weapon.name, true, 40, 1000);
				}*/
			}

		},

		stab : function() {
			if(!this.ready)  return;			
			if(!this.knife.visible) {
				this.knife.visible = true;
				this.knife.pos = this.sprite.pos.add( !this.sprite.hflip ? 20 : -20, 0);
				this.knife.moveto(this.sprite.pos.add( !this.sprite.hflip ? 30 : -30, 0 ), 50, Fx.Transitions.Quad.EaseOut, function(){
					this.knife.moveto(this.sprite.pos.add( !this.sprite.hflip ? 20 : -20, 0 ), 50, Fx.Transitions.Quad.EaseOut, function(){
						this.knife.visible = false;
					}.bind(this));
				}.bind(this));

			}	
		},

		shoot : function( x ) {
			if(!this.ready)  return;
			if(!this.canmove) return;
				//RT
			if(x < 0) {
				
				//core.echo(x)
				if(this.reloading) return;
				var tt = core.gettime();
				if(tt - this.lastshot > this.weapon.shootdelay) {
					this.lastshot = core.gettime();
					
					var dir = this.aimdirection.normalised();
					game.bullets[game.currentbullet].pos = this.sprite.pos.add( dir.mul(30));	
					game.bullets[game.currentbullet].group = this.sprite.group;
					game.bullets[game.currentbullet].rotation = this.marker.rotation;
					game.bullets[game.currentbullet].visible = true;

					//core.echo('bullet body defined '  +  ' ' + (game.bullets[game.currentbullet].body != null))
					game.physics.bodysetpos( game.bullets[game.currentbullet].body , game.bullets[game.currentbullet].pos );
					game.bullets[game.currentbullet].body.SetAwake(true);				
					game.bullets[game.currentbullet].body.SetActive(true);				
					game.bullets[game.currentbullet].body.SetLinearVelocity( new b2Vec2( dir.x * this.weapon.velocity, dir.y * this.weapon.velocity) );											
					game.bullets[game.currentbullet].from = this;
					game.bullets[game.currentbullet].visible = true;
					game.bullets[game.currentbullet].type = 'bullet';
					game.bullets[game.currentbullet].removeme = false;
					game.bullets[game.currentbullet].body.SetUserData( game.bullets[game.currentbullet] );
									
					if(!game.bullets[game.currentbullet].active) {
						game.activebullets.push( game.bullets[game.currentbullet] );
						game.bullets[game.currentbullet].active = true;
					}

					//core.echo(this.activebullets.length + ' ' + game.currentbullet);
					game.currentbullet++;
					if(game.currentbullet > game.bulletpoolsize - 1) game.currentbullet = 0;		

					this.weapon.ammo--;
					this.setClassText('ammo ' + this.weapon.ammo)
					if(this.weapon.ammo <= 0) {
						this.reloading = true;
						this.reloadstart = core.gettime();
						this.setWeaponText('reloading', true, 400);
						/*time.schedule(this.weapon.reloadtime, false, function(){
							this.reloading = false;
							this.weapon.ammo = this.weapon.clipammo;
							this.setWeaponText(this.weapon.name, false, 200);
							this.setClassText('ammo ' + this.weapon.ammo)
						}.bind(this))*/
					}
				}
				

			} else {
					//LT
				this.useItem();
			}
		},

		movex : function( x ) {

			if(!this.ready)  return;				
				var spd = this.movespeed;
				if(this.sprinting) spd = this.sprintspeed;
				this.movement.x = parseFloat(x) ;
				var xvel = (this.movement.x * spd);
				if(this.canmove) {
					this.xvelocity = xvel;
				}
				if(xvel > 0) { 
					if(this.sprite.hflip) {
						this.sprite.flipx(); 
						this.knife.flipx(); 
						this.spriteweapon.flipx();
					}
				} else {
					if(!this.sprite.hflip) {
						this.sprite.flipx();
						this.knife.flipx();
						this.spriteweapon.flipx();
					}
				}
		}, //movex

		movey : function( y ) {
			if(!this.ready)  return;

			var spd = this.movespeed;
			if(this.sprinting) spd = this.sprintspeed;
			this.movement.y = parseFloat(y) ;
			if(this.canmove) {
				this.yvelocity = (this.movement.y * spd);
			}
		}, //movey

		rotatex : function(x) {
			if(!this.ready)  return;
			//if(x > 0.0 || x < -0.0) {
				
				this.direction.x = x;
				var mid = this.sprite.pos;
				var end = this.sprite.pos.add(this.direction.x, this.direction.y);
				var dir = mid.directionTo(end).normalised();
				this.aimdirection = vec2(-dir.y, -dir.x);
				this.lookdirection = vec2(-dir.y, -dir.x);
				if(this.lookdirection.x < 0.8 && this.lookdirection.x > 0) this.lookdirection.x = 0.8;
				if(this.lookdirection.x > -0.8 && this.lookdirection.x < 0) this.lookdirection.x = -0.8;
				this.rotation = 360 + end.rotationTo(this.sprite.pos);
				this.marker.rotation = -this.rotation;
				this.marker.pos = this.sprite.pos.add(dir.mul( this.cursordistance ));
			//}
		},

		rotatey : function(y) {
			if(!this.ready)  return;
			//if(y > 0.0 || y < -0.0) {

				this.direction.y = y;
				var mid = this.sprite.pos;
				var end = this.sprite.pos.add(this.direction.x, this.direction.y);
				var dir = mid.directionTo(end).normalised();
				this.aimdirection = vec2(-dir.y, -dir.x);				
				this.lookdirection = vec2(-dir.y, -dir.x);
				if(this.lookdirection.y < 0.8 && this.lookdirection.y > 0) this.lookdirection.y = 0.8;
				if(this.lookdirection.y > -0.8 && this.lookdirection.y < 0) this.lookdirection.y = -0.8;
				this.rotation = 360 + end.rotationTo(this.sprite.pos);						
				this.marker.rotation = -this.rotation;
				this.marker.pos = this.sprite.pos.add(dir.mul( this.cursordistance ));
			//}
		},
		
		update : function(dt) {						
			//var p = time.measure('player');

			if(this.leftdown) { this.movex( -0.6 ); }
			if(this.rightdown) { this.movex( 0.6 ); }
			if(this.updown) { this.movey( 0.6 ); }
			if(this.downdown) { this.movey( -0.6 ); }
			if(this.mouseleftdown) { this.shoot(-1); }
			if(this.mouserightdown) { this.shoot(1); }

			if(this.gamepad == 0) { //pc
				this.rotation = 270 + this.sprite.pos.rotationTo(game.mouse);
				this.marker.rotation = this.rotation;
				this.aimdirection = game.mouse.directionTo(this.sprite.pos).normalised();
				this.lookdirection = vec2(this.aimdirection);
				if(this.lookdirection.x < 0.8 && this.lookdirection.x > 0) this.lookdirection.x = 0.8;
				if(this.lookdirection.x > -0.8 && this.lookdirection.x < 0) this.lookdirection.x = -0.8;
			}

			var spd = this.movespeed;
			if(this.sprinting) spd = this.sprintspeed;
			if(this.yvelocity) { 
				if(this.yvelocity > 0) {
					this.yvelocity -= (this.drag * dt);
				} else {
					this.yvelocity += (this.drag * dt);
				}
			}
			//p.report('speed')

			//core.echo(this.xvelocity + ' ' + this.yvelocity)
			if(this.xvelocity > 0 && this.xvelocity < (this.stoplimit)) this.xvelocity = 0;
			if(this.xvelocity < 0 && this.xvelocity > -(this.stoplimit)) this.xvelocity = 0;
			if(this.xvelocity) {								

				if(this.xvelocity > 0) {
					this.xvelocity -= (this.drag * dt);
				} else {
					this.xvelocity += (this.drag * dt);
				}
			}			

			if(this.yvelocity > 0 && this.yvelocity < (this.stoplimit)) this.yvelocity = 0;
			if(this.yvelocity < 0 && this.yvelocity > -(this.stoplimit)) this.yvelocity = 0;

			//p.report('velocity')

			this.body.SetAwake(true);
			this.body.SetLinearVelocity( new b2Vec2( this.xvelocity, -this.yvelocity) );	

			//p.report('setphysics')
			
			this.sprite.pos = game.physics.bodypos( this.body );		
			
			//p.report('spritepos')	
			//this.knife.rotation = this.marker.rotation; 

			this.marker.pos = this.sprite.pos.add(this.aimdirection.mul(this.cursordistance));

			//p.report('marker')

			if(this.holdingitem) {
				var diff = core.gettime() - this.holdingtime;								
				if(diff > 60) {					
					this.useItem( this.activeitem );										
					this.holdingitem = false;
				} 
			}


			this.activeparticles.each(function(item) {
				item.update( dt );
			});		
			
			//update reload timers
			if(this.reloading) {
				this.reloadcounter += (dt*1000) * this.reloadmultiplier;
				//core.echo(this.reloadcounter + ' ' +this.weapon.reloadtime)
				if(this.reloadcounter > this.weapon.reloadtime ) {
					this.reloading = false;
					this.reloadcounter = 0;
					this.weapon.ammo = this.weapon.clipammo;
					this.setWeaponText(this.weapon.name, false, 200);
					this.setClassText('ammo ' + this.weapon.ammo)					
				}
			}
			
			//update items
			
			this.items.each(function(item){

				if(item.moving) {
					if(item.currentvelocity.x > 0) {		
						item.currentvelocity.x = item.currentvelocity.x - (160*dt);
						if(item.currentvelocity.x < 0.5 )  item.currentvelocity.x = 0;
					} else {
						item.currentvelocity.x = item.currentvelocity.x + (160*dt);					
						if(item.currentvelocity.x > -0.5 )  item.currentvelocity.x = 0;
					}
					if(item.currentvelocity.y) {					
						item.currentvelocity.y = item.currentvelocity.y + (380*dt);					
						if(item.currentvelocity.y > 150 )  {
							item.currentvelocity.y = 150;
						}
					}


					//core.echo(item.currentvelocity.str() );
					item.pos = item.pos.add(item.currentvelocity.mul(dt));
					if(item.pos.y > item.yline) {
						item.pos = vec2(item.pos.x, item.yline);
						item.currentvelocity.y = 0;							
					} 		
					
					if(item.currentvelocity.x == 0 && item.currentvelocity.y == 0) {
						item.moving = false;
						core.echo('spawning a collision for item');
						item.type = 'item';
						item.fromteam = this.team;
						item.body = game.physics.spawn( item.pos, this.activeitem.size.div(2) , 0, this.activeitem.fixed, 'box', { linearDamping : 0 }, false );
						item.body.SetUserData(item);
						item.takeDamage = function(weapon){
							if(item.instance.candie) {
								item.instance.health -= weapon.damage;
								core.echo('item taking damage! ' + item.instance.health + ' ' + weapon.damage);
								if(item.instance.health <= 0) {
									core.echo('dead omg no')								
									this.itemstoremove.push(item);								
								}
							}
						}.bind(this)
					}
				} else { //moving 
					if(item.instance.AOE) {
						var d = item.pos.distanceTo(this.sprite.pos);						
						if(d < item.instance.AOE) {
							if(item.instance.inrange.indexOf(this) == -1) {
								item.instance.inrange.push(this);
								if(item.instance.AOEonce) {
									item.instance.onAOE(this, this, item);
								}
							}
							//core.echo(item.instance.inrange.length)
							if(item.instance.onAOE && !item.instance.AOEonce) {
								item.instance.onAOE(this, this, item);
							}
						} else {
							if(item.instance.inrange.indexOf(this) != -1) {
								item.instance.inrange.erase(this);
								//core.echo(item.instance.inrange.length)
								if(item.instance.offAOE) {
									item.instance.offAOE(this, this, item);
								}								
							}
						}

						if(item.instance.AOETeam && this.teammate.playing && !this.teammate.dead) {
							var d = item.pos.distanceTo(this.teammate.sprite.pos);
							if(d < item.instance.AOE) {
								if(item.instance.inrange.indexOf(this.teammate) == -1) {
									item.instance.inrange.push(this.teammate);
									if(item.instance.AOEonce) {
										item.instance.onAOE(this.teammate, this, item);
									}
								}
								//core.echo(item.instance.inrange.length)
								if(item.instance.onAOE && !item.instance.AOEonce) {									
									item.instance.onAOE(this.teammate, this, item);
								}
							} else {	
								if(item.instance.inrange.indexOf(this.teammate) != -1) {
									item.instance.inrange.erase(this.teammate);
									//core.echo(item.instance.inrange.length)
									if(item.instance.offAOE) {
										item.instance.offAOE(this.teammate, this, item);
									}								
								}							
							}
						}
					}
				}


				//check if we are in effective range
			}.bind(this)); //update all items
		//p.report('items')
			
			this.itemstoremove.each(function(item) {						
				this.items.erase(item);
				game.physics.world.DestroyBody( item.body );
				item.drop();
				delete item;
			}.bind(this));

			
			if(this.itemstoremove.length) {
				core.echo('removing items ' + this.itemstoremove.length )
				this.itemstoremove = [];
			}

			//this.cam.pos = this.sprite.pos.subtract(phoenix.resolution.div(4));

		}, //update

	});

		//Called once at the start of the game.
	events.connect('onReady', function() {
	
		phoenix.setClearColor( color(0.145, 0.145, 0.145, 1) );   
              
              //bg = new sprite('bg.png', vec2(0,0), 0, false);
              game = new Game();
         
	});

	/*var controls = [
		'axis0' : 'move.x',
		'axis1' : 'move.y',
		'axis3' : 'direction.x',
		'axis4' : 'direction.y',
	];*/

	events.connect('gamepad::status', function(e) {
		//core.print(e);
		var count = 16; //undo hardcode
		var controllers = [];
		for(var i = 0; i < count; ++i) {
			var controller = {
				index : i,
				name : name = 'gamepad' + i,
			};
			
			controller.buttons = e[controller.name + ':buttons'];
			controller.axis = e[controller.name + ':axis'];
			controller.connected = e[controller.name + ':connected'];

			controllers.push(controller);
		}

		game.updateControllers(controllers);
		//core.echo('\t :: Input :: found '  + e.connected + ' controllers')
	});

	
	var filterk = 0.1;
	var filterfunc = function(val, input) {
		val = input * filterk + val * (1.0 - filterk);
		return val;
	}

	events.connect('key::r::down', function(e){
		if(game.menu && game.menu.active) {
				game.checkPlayerReady(0);
			} else {								
				if(game.showingscore && !game.over) {
					game.hideStatus();
					game.restartRound();
				}
			}
	});
	events.connect('key::leftshift::down', function(e){
		game.players[0].sprinting = false;
	});
	events.connect('key::leftshift::up', function(e){
		game.players[0].sprinting = true;
	});

	events.connect('key::c::up', function(e){
		if(game.menu.active) {
			game.players[0].switchClass();
		}
	});
	events.connect('key::enter::up', function(e){
		if(game.menu && game.menu.active) {
			game.startGame(0);
		}
	});

	events.connect('key::w::down', function(e){
		game.players[0].updown = true;
	});
	events.connect('key::w::up', function(e){
		game.players[0].updown = false;
	});
	events.connect('key::s::down', function(){
		game.players[0].downdown = true;	
	});
	events.connect('key::s::up', function(){
		game.players[0].downdown = false;	
	});
	events.connect('key::a::down', function(){
		game.players[0].leftdown = true;
	});
	events.connect('key::a::up', function(){
		game.players[0].leftdown = false;
	});
	events.connect('key::d::down', function(){
		game.players[0].rightdown = true;
	});
	events.connect('key::d::up', function(){
		game.players[0].rightdown = false;
	});
	events.connect('mouse::left::down', function(){
		game.players[0].mouseleftdown = true;
	});
	events.connect('mouse::left::up', function(){
		game.players[0].mouseleftdown = false;
	});
	events.connect('mouse::right::down', function(){
		game.players[0].mouserightdown = true;
	});
	events.connect('mouse::right::up', function(){
		game.players[0].mouserightdown = false;
	});

	var deadzone = 0.15;
	events.connect('gamepad::axis::moved', function(e) {
		if(e.axis0) {
			//movement axis x
			if(game.players[e.gamepad]) {
				var axx = parseFloat(e.axis0);
				game.players[e.gamepad].lastinput = axx;
				var outofdeadzone = false;
				if(axx > 0) { if(axx > deadzone) outofdeadzone = true; } else { if(axx < -deadzone) outofdeadzone = true; }
				if(outofdeadzone) {
					game.players[e.gamepad].mx = filterfunc( game.players[e.gamepad].mx, game.players[e.gamepad].lastinput );				
					game.players[e.gamepad].movex( game.players[e.gamepad].mx );
				} //outofdeadzone
			} //if gamepad
		}
		if(e.axis1) {
			//movement axis y
			if(game.players[e.gamepad]) {
				var axy = parseFloat(e.axis1);				
				var outofdeadzone = false;
				if(axy > 0) { if(axy > deadzone) outofdeadzone = true; } else { if(axy < -deadzone) outofdeadzone = true; }	
				if(outofdeadzone) {
					game.players[e.gamepad].my = filterfunc( game.players[e.gamepad].my, axy );					
					game.players[e.gamepad].movey( game.players[e.gamepad].my );				
				}
			}
		} 
		if(e.axis3) {			
			//facing axis
			if(game.players[e.gamepad]) {
				game.players[e.gamepad].rx = filterfunc( game.players[e.gamepad].rx, parseFloat(e.axis3) );				
				game.players[e.gamepad].rotatex( game.players[e.gamepad].rx );				
			}
		} 
		if(e.axis4) {			
			//facing axis
			if(game.players[e.gamepad]) {
				game.players[e.gamepad].ry = filterfunc( game.players[e.gamepad].ry, parseFloat(e.axis4) );				
				game.players[e.gamepad].rotatey( game.players[e.gamepad].ry );				
			}
		}

		if(e.axis2) {
			if(game.players[e.gamepad]) {
				game.players[e.gamepad].shoot(parseFloat(e.axis2));
			}
		} 
	});

	events.connect('gamepad::buttons::pressed', function(e){
		if(e.button8) { 
			if(game.players[e.gamepad]) {
				game.players[e.gamepad].sprinting = false; 
				/*game.players[e.gamepad].sprintschedule = time.schedule(2000, false, function(){
					game.players[e.gamepad].sprinting = false;
				});*/
			} 
		}

		if(e.button4) {
			if(game.players[e.gamepad]) {
				if(!game.players[e.gamepad].defib && !game.players[e.gamepad].dead) {
					game.players[e.gamepad].defib = true; 
					game.players[e.gamepad].predefibanim = game.players[e.gamepad].sprite.anim.currentanimname;
					//core.echo(game.players[e.gamepad].predefibanim)
					if(game.players[e.gamepad].ready) {
						game.players[e.gamepad].spriteweapon.visible = false;
						game.players[e.gamepad].sprite.anim.set('defib').play()
					} else {
						game.players[e.gamepad].sprite.anim.set('downdefib').play()
					}
				}
			}
		}
	});

	events.connect('gamepad::buttons::released', function(e){
		if(e.button8) { 
			if(game.players[e.gamepad]) {
				game.players[e.gamepad].sprinting = true; 
			}
			time.unschedule(game.players[e.gamepad].sprintschedule);
		}

		if(e.button0) { 		
			if(game.menu && game.menu.active) {
				game.checkPlayerReady(e.gamepad);				
			} else {				
				core.echo('aa + ' + game.over)
				if(game.showingscore && !game.over) {
					game.hideStatus();
					core.echo('dd');
					game.restartRound();
				}
			}
		}

		if(e.button7) {
			//core.echo(game.menu.active)
			if(game.menu && game.menu.active) {
				game.startGame(e.gamepad);
			}
		}

		if(e.button3) { 
			if(game.players[e.gamepad]) {
				if(game.menu.active) {
					game.players[e.gamepad].switchClass(); 
				} else { 
					game.players[e.gamepad].switchWeapon(); 
				}
			}
		}	


		if(e.button6) { 
			if(!game.menu.active) {
				game.quitToMenu();
			}
		}			

		if(e.button1) {
			if(game.showingscore) {
				game.quitToMenu();
			}
		}

		if(e.button2) { 			
			if(game.players[e.gamepad]) {
				
			}
		}	

		if(e.button5) { 			
			if(game.players[e.gamepad]) {
				game.players[e.gamepad].stab(); 
			}
		}

		if(e.button4) {
			if(game.players[e.gamepad]) {
				if(game.players[e.gamepad].defib) {
					game.players[e.gamepad].defib = false; 	
					game.players[e.gamepad].spriteweapon.visible = true;
					game.players[e.gamepad].sprite.anim.set(game.players[e.gamepad].predefibanim).play(); 
				}
			}
		}
	});

	game.lastdt = 16.6;
	events.connect('key::f10::up', function(){
		var s = core.gettime();
		game.update(game.lastdt);
		var e = core.gettime() - s;
		game.lastdt = e;
	})
	
		//Called each update from the engine
	core.onUpdate = function(dt) {		

		if(game && game.updateme) {
			game.update(dt);
		}
		//f.drawText( true, phoenix.getavgfps() , vec2( 10 , 100 ) , color(1,0,0,1) , 1, 20);	
		//gamelab.font.drawText( true, core.gettime() , vec2( 10 , 100 ) , color(1,0,0,1) , 0.5, 20, 0, 1);	
	};



		Game.implement('enablecam' , function() {	
		
			this.cam.draggable = false;
			this.cam.zoomable = false;			
			
			this.cam.zoom( this.oldcamzoom );
			this.cam.pos = this.oldcampos;
			
		}); 
		
		Game.implement('disablecam' ,  function() {
		
			this.cam.draggable = true;
			this.cam.zoomable = true;
			this.cam.dragButton = 'right';
			
			this.oldcampos = this.cam.pos;
			this.oldcamzoom = this.cam.zoomAmount;
			
		});

	// 360 controller
	// axis 0 = LS x
	// axis 1 = LS y
	// axis 2 = Triggers (LT 0 ~ 1 ) (RT 0 ~ -1)
	// axis 3 = RS y
	// axis 4 = RS x
	// dpadleft, dpadright, dpadup, dpaddown
	// button 6 = back
	// button 7 = start
	// button 4 = LB
	// button 5 = RB
	// button 0 = A
	// button 1 = B
	// button 2 = X
	// button 3 = Y
	// button 8 = ls in
	// button 9 = rs in
