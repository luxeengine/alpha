
	/**
	 * Used by the Emitter class to track an existing Particle.
	 */
	var Particle = new Class({
		// Particle information.
		_type : null,
		_time : null,
		_duration : null,

		// Motion information.
		_x : null,
		_y : null,
		_moveX : null,
		_moveY : null,

		// Gravity information.
		_gravity : null,

		// List information.
		_prev : null,
		_next : null,
				
		initialize : function() {

		}

	});
