/* 
	Parcycle: by Mr Speaker - www.mrspeaker.net
	v: 1.0
	
	Particle Emitter classes based on the code from 71squared.com iPhone tutorials
*/

// Individual particle
function cParticle(){
	this.position = vec2();
	this.direction = vec2();
	this.size = vec2(50,50);
	this.timeToLive = 0;
	this.color = color(1,1,1,1);
	this.deltaColor = color(1,1,1,1);
}

// The particle emitter.
function cParticleEmitter(){
	this.maxParticles = 5;
	this.particles = [];
	//this.activeparticles = [];
	this.active = true;

	// Properties
	this.position = phoenix.resolution.div(2);
	this.positionOffset = vec2(5, 0)
	this.positionRandom = vec2(); //x + y = spread
	this.size = 60;
	this.sizeRandom = 0;
	this.startSize = vec2(10,10);
	this.startSizeRandom = vec2(0,0);
	this.endSize = vec2(100,100);
	this.endSizeRandom = vec2(0,0);
	this.speed = 0.9;
	this.speedRandom = 0;
	this.emissionTime = 1000;
	this.lifeSpan = 100;
	this.lifeSpanRandom = 0;
	this.angle = 0;
	this.angleRandom = 0;
	this.rotation = 0;
	this.rotationRandom = 0;
	this.rotationOffset = 180;
	this.gravity = vec2(0, 0);
	this.startColor = color(1,1,1,1);
	this.startColorRandom = color(0,0,0,0);
	this.finishColor = color(1,1,1,0);
	this.finishColorRandom = color(0,0,0,0);

	this.particleCount = 0;
	this.elapsedTime = 0;
	this.duration = -1;
	this.emissionRate = 0;
	this.emitCounter = 0;
	this.particleIndex = 0;

	this.particlePool = [];
	this.poolsize = 20;
	this.poolindex = 0;
	
	this.init = function( ){
		this.emissionRate = this.maxParticles / this.lifeSpan;	
		this.emissionRate = 1 / this.emissionRate ;
		this.emitCounter = 0;
		this.emitLast = 0;
		this.emitNext = 0;

		/*for(var i = 0; i < this.poolsize; ++i) {
			var s = new sprite( false, vec2(), 0 );
			this.particlePool.push(s);
		}*/
	};

	this.emit = function(time) {
		this.duration = time;
		this.active = true;
		this.emitLast = 0;
		this.emitCounter = 0;
		this.emitNext = 0;		
		//core.print(this)
	}
	
	this.addParticle = function(){
		if(this.particleCount == this.maxParticles) {
			return false;
		}
		
		// Take the next particle out of the particle pool we have created and initialize it	
		var particle = new cParticle();
		this.initParticle( particle );
		//this.activeparticles.push(particle);
		this.particles[ this.particleCount ] = particle;
		// Increment the particle count
		this.particleCount++;

		return true;
	};
	var RANDM1TO1 = function(){ return Math.random() * 2 - 1; };
	this.initParticle = function( particle ){

		//var p = vec2(this.position.x + this.positionRandom.x * RANDM1TO1(), this.position.y + this.positionRandom.y * RANDM1TO1() );
		//core.echo('lol ' + p.str())

		particle.rotation = (this.rotation + this.rotationRandom * RANDM1TO1()) + this.rotationOffset;
		//core.echo(this.rotation + ' ' + this.rotationRandom + ' ' + particle.rotation)
		particle.position.x = (this.position.x + this.positionRandom.x * RANDM1TO1()) + this.positionOffset.x;
		particle.position.y = (this.position.y + this.positionRandom.y * RANDM1TO1()) + this.positionOffset.y;		

		if(this.particlePool[this.poolindex]) {
			particle.sprite = this.particlePool[this.poolindex];//new sprite( this.particleImage, vec2(), particle.rotation );	
		} else {
			particle.sprite = new sprite( this.particleImage, vec2(), particle.rotation );	
			this.particlePool[this.poolindex] = particle.sprite;
		}
		
		++this.poolindex;
		if(this.poolindex > this.poolsize - 1) {
			this.poolindex = 0;
		}

		//core.echo(this.poolindex + ' / ' + this.poolsize);

		particle.sprite.group = game.groups.other;	
		particle.sprite.depth = this.depth;					
		particle.sprite.pos = vec2(particle.position.x, particle.position.y);		
		particle.sprite.rotation = particle.rotation;	
		
		if(particle.sprite.texture.name != this.particleImage) {
			particle.sprite.texture = phoenix.texture(this.particleImage);
			particle.sprite.srcrect = rect(0,0,particle.sprite.texture.width,particle.sprite.texture.height);			
		} 
		
		var vector = vec2();
		if(this.angle) {
			var newAngle = (this.angle + this.angleRandom * RANDM1TO1() ) * ( Math.PI / 180 ); // convert to radians
			vector = vec2( Math.cos( newAngle ), Math.sin( newAngle ) ); // Could move to lookup for speed
		}

		var vectorSpeed = this.speed + this.speedRandom * RANDM1TO1();
		//core.echo('vectorSpeed '+vectorSpeed);
		particle.direction = vector.mul( vectorSpeed );

		particle.startSize = vec2();
		particle.endSize = vec2();
		particle.startSize.x = this.startSize.x + this.startSizeRandom.x * RANDM1TO1();
		particle.startSize.y = this.startSize.y + this.startSizeRandom.y * RANDM1TO1();
		particle.endSize.x = this.endSize.x + this.endSizeRandom.x * RANDM1TO1();
		particle.endSize.y = this.endSize.y + this.endSizeRandom.y * RANDM1TO1();
		particle.size.x = particle.startSize.x < 0 ? 0 : ~~particle.startSize.x;
		particle.size.y = particle.startSize.y < 0 ? 0 : ~~particle.startSize.y;

		particle.timeToLive = ((this.lifeSpan + this.lifeSpanRandom * RANDM1TO1()) / 1000) ;
		//core.echo('particle time to live ' + particle.timeToLive);

		particle.deltaSize = vec2();
		particle.deltaSize.x = ( this.endSize.x - this.startSize.x ) / particle.timeToLive;
		particle.deltaSize.y = ( this.endSize.y - this.startSize.y ) / particle.timeToLive;

		particle.sprite.size = vec2(particle.startSize.x,particle.startSize.y);		

		var startcolor = color( this.startColor.r + this.startColorRandom.r * RANDM1TO1() , this.startColor.g + this.startColorRandom.g * RANDM1TO1(), this.startColor.b + this.startColorRandom.b * RANDM1TO1(), this.startColor.a + this.startColorRandom.a * RANDM1TO1() );

	    particle.color = startcolor;
	    particle.deltaColor = color(0,0,0,0);

		particle.deltaColor.r = ( this.finishColor.r - this.startColor.r ) / particle.timeToLive;
		particle.deltaColor.g = ( this.finishColor.g - this.startColor.g ) / particle.timeToLive;
		particle.deltaColor.b = ( this.finishColor.b - this.startColor.b ) / particle.timeToLive;
		particle.deltaColor.a = ( this.finishColor.a - this.startColor.a ) / particle.timeToLive;

		//	core.echo(particle.sprite.pos.str() )
		//core.echo(particle.sprite.srcrect.w + ' ' + particle.sprite.srcrect.h + ' ' + this.particleImage)
		//core.print(particle.sprite.srcrect)

		particle.sprite.color = particle.color;
	};
	
	this.update = function( dt ){

		if( this.active && this.emissionRate > 0 ) {

			this.emitCounter += dt;
			if( this.emitCounter > this.emitNext ) {				
				this.emitNext = (this.emitCounter ) + (this.emissionTime / 1000.0);				
				this.emitLast = (this.emitCounter);				
				this.addParticle() ;
			}

			this.elapsedTime += dt * 1000;
			//core.echo(this.elapsedTime)

			if( this.duration != -1 && this.duration < this.elapsedTime ){
				this.stopParticleEmitter();				
			}

		} //if active and still emitting

		/*//var pa = time.measure('each');
		var toremove = [];
		var removing = false;
		this.activeparticles.each(function(p){
		//var c = this.activeparticles.length;
		//for(var i = 0; i < c; ++i) {
			//p = this.activeparticles[i];
			if( p.timeToLive > 0 ) {

				p.direction = p.direction.add(this.gravity.mul(dt));
				p.position = p.position.add(p.direction);
				p.timeToLive -= dt;

				var r = p.color.r += ( p.deltaColor.r * dt );
				var g = p.color.g += ( p.deltaColor.g * dt );
				var b = p.color.b += ( p.deltaColor.b * dt );
				var a = p.color.a += ( p.deltaColor.a * dt );

				if(a < 0) a = 0;
				var xx = p.size.x += ( p.deltaSize.x * dt );
				var yy = p.size.y += ( p.deltaSize.y * dt );				

				p.sprite.pos = p.position = vec2( p.position.x, p.position.y );
				//core.echo( particle.sprite.pos.str() );
				p.sprite.size = p.size = vec2( xx, yy );
				//core.echo(p.sprite.size.str())
				p.sprite.color = p.color = color( r, g, b, a);

			} else {

				toremove.push(p);
				removing = true;
				//p.sprite.visible = false;
			}
		} .bind(this))		
		//pa.report('end')	

		if(removing) {
			toremove.each(function(item) {				
				this.activeparticles.erase(item);
				item.sprite.visible = false;
			}.bind(this));
		}		
		//pa.report('cleanup')	*/

		this.particleIndex = 0;
		while( this.particleIndex < this.particleCount ) {

			var currentParticle = this.particles[ this.particleIndex ];

			// If the current particle is alive then update it
			if( currentParticle.timeToLive > 0 ) {

				// Calculate the new direction based on gravity
				currentParticle.direction = currentParticle.direction.add(this.gravity.mul(dt));
				currentParticle.position = currentParticle.position.add(currentParticle.direction);
				currentParticle.timeToLive -= dt;

				// Update colours based on delta
				var r = currentParticle.color.r += ( currentParticle.deltaColor.r * dt );
				var g = currentParticle.color.g += ( currentParticle.deltaColor.g * dt );
				var b = currentParticle.color.b += ( currentParticle.deltaColor.b * dt );
				var a = currentParticle.color.a += ( currentParticle.deltaColor.a * dt );

				var xx = currentParticle.size.x += ( currentParticle.deltaSize.x * dt );
				var yy = currentParticle.size.y += ( currentParticle.deltaSize.y * dt );

				//core.echo(xx,yy)

				if(a < 0) a = 0;
				currentParticle.drawColor = color( r, g, b, a);
				currentParticle.drawSize = vec2(xx,yy);
				
				this.particleIndex++;

			} else {
				// Replace particle with the last active 
				if( this.particleIndex != this.particleCount - 1 ){
					this.particles[ this.particleIndex ] = this.particles[ this.particleCount-1 ];
				}
				currentParticle.sprite.visible = false;
				//currentParticle.sprite.drop();
				//delete currentParticle.sprite;
				this.particleCount--;
			}

		} //while

		if(this.particleCount <= 0 ) {
			if(this.onStop) {
				//core.echo('onstopping')
				this.onStop();
			}
		}

		for( var i = 0, j = this.particleCount; i < j; i++ ){
			var particle = this.particles[ i ];
			var size = particle.drawSize;
			//core.echo(size.str())
			var x = ~~particle.position.x;
			var y = ~~particle.position.y;

			particle.sprite.pos = vec2( particle.position.x, particle.position.y );
			//core.echo( particle.sprite.pos.str() );
			particle.sprite.size = vec2( size.x, size.y );
			//core.echo(particle.sprite.size.str())
			particle.sprite.color = particle.drawColor;			
			//core.echo(particle.sprite.color.r + ' ' + particle.sprite.color.g + ' ' + particle.sprite.color.b + ' ' + particle.sprite.color.a)
					
		}
	};
	
	this.stopParticleEmitter = function(){
		this.active = false;
		this.elapsedTime = 0;
		this.emitCounter = 0;
	};
	
}

/* Vector Helper */
var Vector = {
	create : function( x, y ){
		return {
			"x" : x || -1,
			"y" : y || -1
		};
	},
	multiply : function( vector, scaleFactor ){
		vector.x *= scaleFactor; 
		vector.y *= scaleFactor;
		return vector;
	},
	add : function( vector1, vector2 ){ 
		vector1.x += vector2.x; 
		vector1.y += vector2.y;
		return vector1;
	}
};
