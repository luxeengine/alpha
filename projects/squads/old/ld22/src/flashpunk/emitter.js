	/**
	 * Particle emitter used for emitting and rendering particle sprites.
	 * Good rendering performance with large amounts of particles.
	 */

	 var RANDM1TO1 = function(){ return Math.random() * 2 - 1; };
	var Emitter = new Class({
		/**
		 * Constructor. Sets the source image to use for newly added particle types.
		 * @param	source			Source image.
		 * @param	frameWidth		Frame width.
		 * @param	frameHeight		Frame height.
		 */
		initialize : function( sourceimg , frameWidth, frameHeight) 
		{
			this.setSource(source, frameWidth, frameHeight);
			this.active = true;

			this.__defineGetter__("particleCount", function(){ return this._particleCount; });


				this._types =  { };
				this._particle = new Particle();
				this._cache = new Particle();
				this._particleCount = 0;

				// Source information.
				this._source = '';
				this._width = 0;
				this._height = 0 ;
				this._frameWidth = 0;
				this._frameHeight= 0;
				this._frameCount = 0;

				// Drawing information.
				this._p = vec2();
				this._tint = color();

		},

		/**
		 * Changes the source image to use for newly added particle types.
		 * @param	source			Source image.
		 * @param	frameWidth		Frame width.
		 * @param	frameHeight		Frame height.
		 */
		setSource :  function (sourceimg , frameWidth , frameHeight )
		{
			this._source = source;
			this._width = this._source.width;
			this._height = this._source.height;
			this._frameWidth = frameWidth ? frameWidth : this._width;
			this._frameHeight = frameHeight ? frameHeight : this._height;
			this._frameCount = (this._width / this._frameWidth) * this._height /this._frameHeight;
		},

		update : function(dt) 
		{
			// quit if there are no particles
			if (!this._particle) return;

			// particle info
			var e = dt;
			var p = this._particle,
			var n = new Particle();

			// loop through the particles
			while (p)
			{
				// update time scale
				p._time += e;

				// remove on time-out
				if (p._time >= p._duration)
				{
					if (p._next) p._next._prev = p._prev;
					if (p._prev) p._prev._next = p._next;
					else _particle = p._next;
					n = p._next;
					p._next = _cache;
					p._prev = null;
					_cache = p;
					p = n;
					_particleCount --;
					continue;
				}

				// get next particle
				p = p._next;
			}
		},

		/**
		 * Creates a new Particle type for this Emitter.
		 * @param	name		Name of the particle type.
		 * @param	frames		Array of frame indices for the particles to animate.
		 * @return	A new ParticleType object.
		 */
		newType : function (name , frames ) //particleType
		{
			if (! frames) frames = [0];
			if ( this._types[name]) core.echo("Cannot add multiple particle types of the same name");
			return (this._types[name] = new ParticleType(name, frames, this._source, this._frameWidth, this._frameHeight));
		},


		/**
		 * Defines the motion range for a particle type.
		 * @param	name			The particle type.
		 * @param	angle			Launch Direction.
		 * @param	distance		Distance to travel.
		 * @param	duration		Particle duration.
		 * @param	angleRange		Random amount to add to the particle's direction.
		 * @param	distanceRange	Random amount to add to the particle's distance.
		 * @param	durationRange	Random amount to add to the particle's duration.
		 * @param	ease			Optional easer function.
		 * @return	This ParticleType object.
		 */
		setMotion :function (name, angle, distance, duration, angleRange = 0, distanceRange = 0, durationRange = 0, ease = null) //particleType
		{
			return this._types[name].setMotion(angle, distance, duration, angleRange, distanceRange, durationRange, ease);
		},

		/**
		 * Sets the gravity range for a particle type.
		 * @param	name			The particle type.
		 * @param	gravity			Gravity amount to affect to the particle y velocity.
		 * @param	gravityRange	Random amount to add to the particle's gravity.
		 * @return	This ParticleType object.
		 */
		setGravity : function (name:String, gravity = 0, gravityRange = 0) //ParticleType
		{
			return this._types[name].setGravity(gravity, gravityRange);
		},

		/**
		 * Sets the alpha range of the particle type.
		 * @param	name		The particle type.
		 * @param	start		The starting alpha.
		 * @param	finish		The finish alpha.
		 * @param	ease		Optional easer function.
		 * @return	This ParticleType object.
		 */
		setAlpha : function (name, start = 1, finish = 0, ease = null) //ParticleType
		{
			return _types[name].setAlpha(start, finish, ease);
		},

			/**
		 * Sets the color range of the particle type.
		 * @param	name		The particle type.
		 * @param	start		The starting color.
		 * @param	finish		The finish color.
		 * @param	ease		Optional easer function.
		 * @return	This ParticleType object.
		 */
		setColor : function (name, start , finish , ease = null) //ParticleType
		{
			return _types[name].setColor(start, finish, ease);
		},

		/**
		 * Emits a particle.
		 * @param	name		Particle type to emit.
		 * @param	x			X point to emit from.
		 * @param	y			Y point to emit from.
		 * @return
		 */
		emit : function (name, x, y) //Particle
		{
			if (!this._types[name]) return core.echo("Particle type \"" + name + "\" does not exist.");

			var p , type = _types[name];

			if (this._cache)
			{
				p = this._cache;
				this._cache = p._next;
			}
			else p = new Particle();
			p._next = this._particle;
			p._prev = null;
			if (p._next) p._next._prev = p;

			p._type = type;
			p._time = 0;
			p._duration = type._duration + type._durationRange * RANDM1TO1();
			var a = type._angle + type._angleRange * RANDM1TO1(),
				d = type._distance + type._distanceRange * RANDM1TO1();
			p._moveX = Math.cos(a) * d;
			p._moveY = Math.sin(a) * d;
			p._x = x;
			p._y = y;
			p._gravity = type._gravity + type._gravityRange * RANDM1TO1();
			this._particleCount ++;
			return (this._particle = p);
		},

		render :  function (target, point, camera) 
		{
			// quit if there are no particles
			if (!this._particle) return;

			// get rendering position
			this._point.x = point.x + x - camera.x;// * scrollX;
			this._point.y = point.y + y - camera.y;// * scrollY;

			// particle info
			var t, td,
				p = this._particle,
				type,
				rrect,

			// loop through the particles
			while (p)
			{
				// get time scale
				t = p._time / p._duration;

				// get particle type
				type = p._type;
				rect = type._frame;

				// get position
				td = (type._ease == null) ? t : type._ease(t);
				_p.x = _point.x + p._x + p._moveX * td;
				_p.y = _point.y + p._y + p._moveY * td;

				// stops particles from moving when gravity is enabled
				// and if emitter.active = false (for game pausing for example)
				if (this.active)
				{
					p._moveY += p._gravity * td;
				}

				// get frame
				rrect.x = rrect.width * type._frames[ (td * type._frameCount) ];
				rrect.y = (rrect.x / type._width) * rrect.height;
				rrect.x %= type._width;

				// draw particle
				/*if (type._buffer)
				{
					// get alpha
					this._tint.alphaMultiplier = type._alpha + type._alphaRange * ((type._alphaEase == null) ? t : type._alphaEase(t));

					// get color
					td = (type._colorEase == null) ? t : type._colorEase(t);
					this._tint.r = type._red + type._redRange * td;
					this._tint.g = type._green + type._greenRange * td;
					this._tint.b  = type._blue + type._blueRange * td;
					//type._buffer.fillRect(type._bufferRect, 0);
					//type._buffer.copyPixels(type._source, rect, FP.zero);
					//type._buffer.colorTransform(type._bufferRect, _tint);

					// draw particle
					//target.copyPixels(type._buffer, type._bufferRect, _p, null, null, true);
				}*/
				//else 
				//target.copyPixels(type._source, rect, _p, null, null, true);
				

				// get next particle
				p = p._next;
			}
		}


	});
	
		

		

		
		/** @private Renders the particles. */
		


