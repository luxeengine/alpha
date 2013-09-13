
//if(modules.depends('Box2D')) {

var Physics = new Class({

	initialize : function() {
			
		this.gravity = new b2Vec2 (0.0, 9.8);
		this.doSleep = true;
		this.worldbounds = rect();
		this.velocityIterations = 4;
		this.positionIterations = 4;
		this.mpratio = 30;
		this.debug = false;
		this.updateables = [];
		this.updateids = [];
		this.triggerHandler = null;
		this.bodies = [];
	},

	update : function(dt) {
	
		var d = 1.0/60.0;
		//if( dt > d ) dt = d;
		
				//update box2d world
			if(this.world != undefined) {
				this.world.ClearForces();
				this.world.Step(dt, this.velocityIterations, this.positionIterations);
			}
			
			if(this.updateables.length) {				
				this.updateables.each( function(item, index) {
					item.fn();
				});
			}
		
	},
	
		//circles - size is a number. 
	spawnfixture : function( body, size, type, trigger, flags ) {
		var shape;
		if(type == 'box') {
			shape = new b2PolygonShape.AsBox(size.x, size.y);
		} else if(type == 'circle') {
			shape = new b2CircleShape(size/2);
		} else if(type == 'triangle') {
			var sx = [];
			size.each(function(item) {
				sx.push( new b2Vec2(this.pix2m(item.x), this.pix2m(item.y)));
			}.bind(this));
			shape = new b2PolygonShape();
			shape.SetAsArray( sx, sx.length );
		} else {
			core.echo('the ' + type  +  ' type is not supported in gamelab.physics currently');
		}
		
		var fixtureDef = new b2FixtureDef();

		flags = flags || {};
		flags.restitution = flags.restitution || 0.1;
		flags.density = flags.density || 5;
		flags.friction = flags.friction || 0.2;
		flags.filter = flags.filter || null;

		fixtureDef.restitution = flags.restitution;
		fixtureDef.density = flags.density;
		fixtureDef.friction = flags.friction;		
		
		if(trigger) {	
			fixtureDef.isSensor = true;
		}

		fixtureDef.shape = shape;
		body.CreateFixture(fixtureDef);
		return body;
		
	},
	
	spawn: function(pos, size, a, f, type, flags, trigger) {

		if(type == undefined) type = 'box';
		if(trigger == undefined) trigger = false;
		var bodyDef = new b2BodyDef();
		if(f) {
			bodyDef.type = b2Body.b2_staticBody;		
		} else {		
			bodyDef.type = b2Body.b2_dynamicBody;		
		}
		
		if(!flags) flags = {};
		flags.linearDamping = flags.linearDamping || 1;
		flags.angularDamping = flags.angularDamping || 1;

		bodyDef.linearDamping = flags.linearDamping;
		//core.echo('linear damping set to ' + flags.linearDamping)
		bodyDef.angularDamping = flags.angularDamping;
		
		bodyDef.position.Set(this.pix2m(pos.x), this.pix2m(pos.y));
		if(a === undefined) a =  0;
		bodyDef.angle = a *Math.PI/180.0;
		var body = this.world.CreateBody(bodyDef);
		if(typeOf(size) == 'object') {
			body.w = this.pix2m(size.x);
			body.h = this.pix2m(size.y);
			
			var s = vec2( body.w, body.h );
			if( type == 'circle' ) s = body.w;
			
			this.spawnfixture( body, s, type, trigger, flags);
		} else {
			this.spawnfixture( body, size, type, trigger, flags);
		}
		
		/*var shape;
		if(type == 'box') {
			shape = new b2PolygonShape.AsBox(body.w, body.h);
		} else if(type == 'circle') {
			shape = new b2CircleShape(body.w/2);
		} else {
			core.echo('the ' + type  +  ' type is not supported in gamelab.physics currently');
		}
		var fixtureDef = new b2FixtureDef();
		fixtureDef.restitution = 0.1;
		fixtureDef.density = 2.0;
		fixtureDef.friction = 4;
		fixtureDef.angularDamping = 0.6;
		
		if(trigger) {	
			fixtureDef.isSensor = true;
		}

		fixtureDef.shape = shape;
		body.CreateFixture(fixtureDef);*/		
		
		if(this.debug) {	
			var cc = color(1.0, 0.0, 0.0, 0.4);
			if(trigger) cc = color(1.0, 0.0, 0.0, 0.4);
			//if(f) {
				if(type == 'box') {
					var a = phoenix.drawRectangle( false, rect(-size.x, -size.y, size.x*2, size.y*2), cc );
					//var a = phoenix.drawRectangle( false, rect(pos.x-(size.x), pos.y-(size.y), size.x*2, size.y*2), cc );
					a.depth = 500; a.group = 801;
					body.debugshape = new sprite();
					body.debugshape.geom.drop();
					body.debugshape.geom = a;
					body.debugshape.group = 801;
					body.debugshape.depth = 500;
					body.debugshape.pos = vec2(pos.x - size.x, pos.y - size.y)
					body.debugshape.color = cc;
					//body.debugshape.size = size;

					//body.debugshape.pos = vec2(pos.x, pos.y)
				} else if(type == 'circle') {
					var a = phoenix.drawCircle( false, pos, size.x/2, cc, 8, 500, 801);
					a.depth = 500; a.group = 801;
					body.debugshape = new sprite();
					body.debugshape.geom.drop();
					body.debugshape.geom = a;
					body.debugshape.group = 801;
					body.debugshape.depth = 500;
					body.debugshape.pos = pos;
					body.debugshape.color = cc;
					//body.debugshape.size = size;					
				}
			//}
			//
		}

		this.bodies.push(body);
		
		return body;

	},
	
	addCollideHandler : function( fn ) {
		if(this.collideHandlers) { 
			this.collideHandlers.push(fn);
		} else {
			this.collideHandlers = [];
			this.collideHandlers.push(fn);
		}
	},
	
	createWorld : function( gravity, walls, debug ) {
		
		/* insane defaults for box2d (but it will work at least) */
		if(debug == true) this.debug = true;
		
		if(gravity != undefined) {
			if( typeOf(gravity) != 'object') {
				core.echo('\t :x: World assuming gravity is on the Y Axis? (you could use vec2)');
				this.gravity = vec2(0, gravity);
			} else {
				this.gravity = gravity;
			}
		} 
		
		this.world = new b2World( this.gravity, this.doSleep );	
		//this.world.SetContinuousPhysics(false); //speed? Makes the simulation crap though.		
		
		//Create a contact listener
		this.triggerHandler = new b2ContactListener(); 
		this.triggerHandler.BeginContact = function(contact) {
			
				var fixtureA = contact.GetFixtureA();
				var fixtureB = contact.GetFixtureB();
			
				if(fixtureA.IsSensor() || fixtureB.IsSensor()) {
					if(fixtureB.IsSensor()) {
						//fixtureB.GetBody().SetUserData("remove");
						var objp  = fixtureB.GetBody().GetUserData();						
						var otherp = fixtureA.GetBody().GetUserData();						
						if(!otherp) { otherp = {name:'', type:''} }
						if(objp) {
							events.fire('level::trigger::enter', { name: objp.name, type: objp.type, othername: otherp.name, othertype:otherp.type  });
							events.fire('level::trigger::' + objp.type, { name: objp.name });
							events.fire('level::trigger::' + objp.type + '::enter', { name: objp.name });
							//core.echo('oh snap! you entered a trigger named ' + objp.name +'(a ' + objp.type + ')');
						}
					}
					if (fixtureA.IsSensor()) {
						var objp = fixtureA.GetBody().GetUserData();
						var otherp = fixtureB.GetBody().GetUserData();
						if(!otherp) { otherp = {name:'', type:''} }
						if(objp) {
							//core.echo('1111 oh snap! you entered a trigger named ' + objp.name +'(a ' + objp.type + ')');
							events.fire('level::trigger::enter', { name: objp.name, type: objp.type, othername: otherp.name, othertype:otherp.type  });
							events.fire('level::trigger::' + objp.type + '::enter', { name: objp.name });
							events.fire('level::trigger::' + objp.type, { name: objp.name });
						}
					}
				}	

								
				if(this.collideHandlers) {
					if(this.collideHandlers.length) {
						this.collideHandlers.each( function(item) {
							item( fixtureA.GetBody().GetUserData(), fixtureB.GetBody().GetUserData(), fixtureA, fixtureB, contact );
						});
					}
				}
				
			}.bind(this) //begincontact

			
			this.triggerHandler.EndContact = function(contact) {
			
				var fixtureA = contact.GetFixtureA();
				var fixtureB = contact.GetFixtureB();
			
				if(fixtureB.IsSensor()) {
					//fixtureB.GetBody().SetUserData("remove");
					var objp  = fixtureB.GetBody().GetUserData();
					var otherp  = fixtureA.GetBody().GetUserData();
					if(!otherp) { otherp = {name:'', type:''} }
					if(objp) {						
						events.fire('level::trigger::' + objp.type + '::leave', { name: objp.name });						
						events.fire('level::trigger::leave', { name: objp.name, type: objp.type, othername: otherp.name, othertype:otherp.type  });
					}
				}
				if (fixtureA.IsSensor()) {
					var objp = fixtureA.GetBody().GetUserData();
					var otherp = fixtureB.GetBody().GetUserData();
					if(!otherp) { otherp = {name:'', type:''} }
					if(objp) {
						events.fire('level::trigger::' + objp.type + '::leave', { name: objp.name });
						events.fire('level::trigger::leave', { name: objp.name, type: objp.type, othername: otherp.name, othertype:otherp.type  });
					}
				}

				
			}.bind(this) //endcontact			
			
		this.world.SetContactListener(this.triggerHandler);

		if(this.debug) {
			this.addupdatefunc( 'internaldebug', function(){
				this.bodies.each(function(item){
					item.debugshape.pos = this.bodypos(item);
				}.bind(this));				
			}.bind(this));
		}			
		
		core.echo('\t ::: Physics world created. Gravity is currently (' + this.gravity.x + ' , ' + this.gravity.y + ')');
	
	},
	
	addupdatefunc:  function ( id,  func ) {
	
		if(this.updateids.indexOf(id) == -1) {
			this.updateables.push( {fn:func, id:id } );
			this.updateids.push(id);
		} 
	},
	
	removeupdatefunc: function(id) {
		var idind = this.updateids.indexOf(id);
		if(idind != -1) {
			var remind = -1;
			this.updateables.each(function(item, index) {
				if(item.id == id) {
					remind = index;
				}
			});
			
			if(remind != -1) {
				this.updateables.remove(remind);
				this.updateids.remove(idind);
			}
		} 		
	},
	
	addtrigger: function( name, ttype, pos, size, a, f, type, flags ) {
		
		core.echo('<<<< :: adding trigger : ' + name + ' ' + ttype);
		
		if(!name) return;
		
		var thebody = this.spawn(pos, size, a, f, type, flags, true);
		var uprop = {};
			uprop.name = name;
			uprop.type = ttype;
		
			thebody.SetUserData( uprop );

		return thebody;
	},
	
	pix2m : function( pixels ) { 
		return pixels / this.mpratio;
	},
	
	m2pix : function( meters ) { 
		return meters * this.mpratio;
	},
	
	createWalls : function (bnds, gap) { 
	
		if(gap == undefined) gap = 1;
		
		//just create some dummy walls for us to keep the world sane

		var left = rect( bnds.x + gap ,  bnds.y + gap, gap  , bnds.h - gap );
		var right = rect( bnds.x + bnds.w - gap , bnds.y + gap, gap  , bnds.h - gap );
		var top = rect(	bnds.x + gap , bnds.y + gap, bnds.w - gap , gap );
		var bot = rect(	bnds.x + gap , bnds.y + bnds.h - gap, bnds.w - gap , gap );
								
		this.spawn( vec2(left)	, vec2( left.w, 	left.h ), 0, true);
		this.spawn( vec2(right),  vec2( right.w, 	right.h ), 0,  true);
		this.spawn( vec2(top) , 	vec2( top.w, 	top.h ) , 0,  true);
		this.spawn( vec2(bot) , 	vec2( bot.w, 	bot.h ) , 0,  true);
		
	},
	
		//Make a body static, true or false
	bodystatic : function( bd , val ) {
		if(!val) {
				bd.SetType(b2Body.b2_dynamicBody);
				bd.ResetMassData();			
		} else {
				bd.SetType(b2Body.b2_staticBody);
				bd.ResetMassData();					
		}
	},
	
	bodysetpos : function( bd, pos ) {
		if(pos) {
			bd.SetPosition( new b2Vec2( this.pix2m(pos.x), this.pix2m(pos.y) ) );
		}
	},
	
	bodysetrotation : function( bd, rot ) {
		if(rot) {
			var p = bd.GetPosition();
			rot = rot * Math.PI/180.0;
			bd.SetPositionAndAngle( p, rot );
		}
	},
	
	bodysetsize : function( bd, size ) {
	
		if(size) {
			var  item = bd.GetFixtureList();
			var type = item.GetShape().GetType();
			//0 is circle, 1 is a polygon (square)
			if(type == 0) {
				bd.DestroyFixture( item ) ;
				var trigger = false;
				if(item.m_isSensor ) trigger = true;
				size = this.pix2m(size);
				this.spawnfixture( bd, size, 'circle', trigger);
				bd.ResetMassData();	
			} else if(type == 1) {
				//So just delete this fixture and recreate it at the new size 
				bd.DestroyFixture( item );
				var trigger = false;
				if(item.m_isSensor ) trigger = true;
				var psize = vec2(  this.pix2m(size.x),   this.pix2m(size.y));
				core.print(psize)
				this.spawnfixture( bd, psize, 'box', trigger);
				bd.ResetMassData();
				if(this.debug) {
					bd.debugshape.size = size.mul(2);
					bd.debugshape.pos = this.bodypos(bd);
				}
			}
			
		}
	},
	
	bodypos : function(bd) {		
		var bp = bd.GetPosition();
		return vec2( this.m2pix ( bp.x ), this.m2pix(bp.y) );
	},
	
	bodyrot : function(bd) {
			return bd.GetAngle()  ;
	},
	
	bodyrotdeg : function(bd) {
		return bd.GetAngle() * 180.0/Math.PI;
	}
	
});
	
	
//} //depends on Box2D