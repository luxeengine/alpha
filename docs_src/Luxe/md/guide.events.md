
[![Logo](http://luxeengine.com/images/logo.png)](index.html)

###[Back to feature guide](guide.html#events)
###[View all guides](guide.html)

---
## Events, Signals, Messages?
---

One common method of communicating between game systems, a very powerful method of development, is called _event driven design_.   

Event drive design, often also referred to as _signals and slots_, or _messaging systems_ are simple in principle. 
They allow code to _listen_ for messages/events/signals from elsewhere in the code, without needing an explicit reference to origin of the message. 
This allows _encapsulation_ and _decoupling_ systems from each other, and allows quite adaptive approaches to be conceived over the regular methods of communicating between code.

This may seem quite complex, but let us look at a simple example instead.

## The player is losing health
---

Imagine a game where your player can take damage from a projectile, an arrow fired by an enemy. Here is some pseudo code to imagine what would happen, when the player has collided with the arrow.
	
	//in the arrow update code
	//check if we are going to hit something?
	for( entity in range_of_collision ) {

		if( entity.collides_with( this ) ) {

			//we have hit an entity!
			//we can assume this is the player and convert it
			var player : Player = cast entity;
			player.take_damage( damage_amount );

			//... 
		} 

	}


Now, what if the entity was another enemy? What if we don't want to do maximum damage to other enemies?

	if( entity.collides_with( this ) ) {

		//we have hit an entity!
		
		if( Std.is(entity, Player) ) {

			var player : Player = cast entity;
			player.take_damage( damage_amount );

		} else if( Std.is(entity, Enemy) ) {

			var enemy : Enemy = cast entity;
			enemy.take_damage( damage_amount * 0.5 );

		}

	} 

Now what happens when the arrow hits a wall entity? What if there are different types of walls? Or different types of enemies? This can quickly spiral into many needless checks and make this code very "specific", it has code to handle every single case, and if you are reaching the end of the development of a game, any possible new features might get shunned due to code complexity or risk of introducing bugs.

## The player is losing health event
---

Events make this problem a lot more elegant and flexible. Instead of handlings specifics, let's use the entity events to send it a message.

	if( entity.collides_with( this ) ) {

		entity.events.fire('take_damage', { from:this, amount:damage_amount });

	}

Now, no matter what the entity is - it is up to the entity (encapsulated, decoupled from the arrow!) to handle the situation.

	//Inside the Player class
	public function init() {

		events.listen('takes_damage', on_take_damage );

	}

	function on_take_damage( data:DamageEvent ) {
		//from, and amount are available
		health -= data.amount;
		check_health();
	}

And how about on the walls?	

		//When taking damage, handle the arrow differently by wall type.

	function on_take_damage( data:DamageEvent ) {
		switch(wall_type) {
			case 'reflective':
					//assuming the arrow class has a reflect capability
				data.from.reflect();
			case 'normal':
				data.from.explode();
		}
	}

## Important notes
---

**Take note** that you can of course assign many listeners to a single event! This means that when you send an event globally for example (more on that later), many listeners can be waiting for that event, and will respond to it.

There are two ways to fire and event, `events.fire` will immediately call any listeners, and `events.queue` will store the event in a queue for the next frame update. The distinction is important for ordering, as well as immediacy of events (like an input event is more important than other events).

You can remove a listener from an event using the unique ID that the listen function returns. This is important to manage your events so that you don't end up accidentally handling events at the wrong time - like the player shooting arrows while the menu is open because the event remained connected.
	
		//connect a listener
	var listen_id = events.listen('event', function(){ } );

			//this will remove just this listener
		events.disconnect( listen_id );

## Being more specific
---

This example could use some more specifics, for example, the player will handle a 'takes_damage' event from more than just arrow projectiles.   

For this, you can use event namespaces, and wildcards in the events. Let's make this more specific, first.

		//From the arrow collision check
	entity.events.fire('take_damage.arrow', { from:this, amount:damage_amount });

	...

		//Inside the Player class
	public function init() {

		events.listen('takes_damage.arrow', on_take_damage_from_arrow );
		events.listen('takes_damage.explosion', on_take_damage_from_explosion );

	}

	function on_take_damage_from_arrow( data:ArrowDamageEvent ) {
		health -= data.amount;
		check_health();
	}

	function on_take_damage_from_explosion( data:ExplosionDamageEvent ) {
		...
	}

## Being less specific
---

If you wanted to listen for all the takes_damage events , you can use wildcards.

	events.listen('takes_damage.*', on_take_damage_from_any );

You can also use the wildcard elsewhere, like this : 
		
		//game.player.ui, game.menu.ui, game.health.ui 
	events.listen('game.*.ui', on_any_ui_events );	

They can even be used for more complex event listeners, like "player enters swamp",

	events.listen('(player)*(swamp)', on_entering_swamp );


## Global vs Local events
---

A good example of a global event is when the user presses the pause key.
This single action has ramifications across the entire code base, right down to the animation system and in the menu code and the game logic - an easy way to tell every system that want's to know when the game is paused, is by using events.

	Luxe.events.queue('game.pause');
	Luxe.events.queue('game.unpause');

	...

	Luxe.events.listen( 'game.pause', on_game_pause );
	Luxe.events.listen( 'game.unpause', on_game_unpause );

As mentioned above, many listeners can listen for a single event, and can react accordingly.

All of the above examples were sending events directly INTO an entity, only that entity would see it. There is also a way to send messages globally, for every class/function to listen for in the entire game. Let's go back to the example of the player taking damage from anything, and tell the entire game that there was damage lost.

		//In the player class
	public function init() {			
		events.listen('takes_damage.*', on_take_damage_from_anything );
	}

	function on_take_damage_from_anything( e:Dynamic ) {
		

			//now we use the GLOBAL events to tell the entire game
			//and pass the information along
		Luxe.events.fire('game.player.damage', e );
	}

		//In the UI class, for example
	Luxe.events.listen('game.player.damage', on_player_hurt );

	...

	function on_player_hurt( e:Dynamic ) {
		
		//Flash the screen red, etc
		...
		//shake the camera 10% of the damage amount
		Luxe.camera.shake( e.amount * 0.1 ); 
	}


## Wrapping up 
---

As you can see, events are powerful and meaningful and can be used for almost anything. You can always create your own instance of `luxe.Events` and have many local events systems (though, entities already have one built in!).

## Advanced in depth details

If you are wonder just exactly what happens with the filtering, here is what it is doing,

	public function does_filter_event( _filter:String, _event:String ) {

        var _replace_stars : EReg = ~/\*/gi;
        var _final_filter : String = _replace_stars.replace( _filter, '.*?' );
        var _final_search : EReg = new EReg(_final_filter, 'gi');

        return _final_search.match( _event );
    
    } //does_filter_event

Below are some more examples in a test case to demonstrate more uses of the event system.


### examples
---

Since event names are string, you can group events by a delimeter,   
i.e `Luxe.events.listen('game.player.*')`, which can be used to filter events by type.


	import luxe.Vector;
	import luxe.Input;
	import luxe.Entity;

	typedef HealthEvent = {
	    amount : Float
	}
	typedef DiedEvent = {
	    attacker : String
	}
	typedef SpawnEvent = {
	    spawn_node : String
	}

	class Main extends luxe.Game {

	    var entity : Entity;

	    public function ready() {

	            //Global events connections
	        Luxe.events.listen( 'global event' , function(e){
	            trace("Global Event Fired");
	        });

	            //Connect global to local event
	        Luxe.events.listen( 'local event' , function(e){
	            trace("Should not print");
	        });

	            //Local to entity event connections
	        entity = Luxe.scene.create(Entity,'temp');


	        entity.events.listen('local event', function(e){
	            trace("Local Event Fired");
	        });

	        entity.events.listen('player.*', function(e){
	            trace('player event happened! it was `' + e._event_name_ + '` which has ' + e._event_connection_count_ + ' listeners!');
	        });

	        entity.events.listen('player.health.loss', function( e:HealthEvent ){
	            trace(' ouch! I lost ' + e.amount + ' health :(');
	        });
	        entity.events.listen('player.health.gain', function( e:HealthEvent ){
	            trace(' woo! I got ' + e.amount + ' hp');
	        });
	        entity.events.listen('player.died', function( e:DiedEvent ){
	            trace(' oh snap! I was killed by ' + e.attacker );
	        });
	        entity.events.listen('player.spawn', function( e:Main.SpawnEvent ){
	            trace(' ok, letsdoodis, now at ' + e.spawn_node );
	        });

	        trace('PRESS SPACE TO FIRE EVENTS');

	            //Events class exposes this filter function to test/learn the events

	        trace( Luxe.events.does_filter_event('game.*', 'game.player.test') );
	        trace( Luxe.events.does_filter_event('game:player:*', 'game:player:health') );
	        trace( Luxe.events.does_filter_event('game.*.player', 'game.ui.player') );
	        trace( Luxe.events.does_filter_event('game.*.player', 'game.death.player') );
	        trace( Luxe.events.does_filter_event('game.*.player', 'game.death.test') );
	        trace( Luxe.events.does_filter_event('*.player', 'ui.player') );
	        trace( Luxe.events.does_filter_event('*.player', 'health.player') );
	        trace( Luxe.events.does_filter_event('*.player', 'derp.plea') );
	        trace( Luxe.events.does_filter_event('(player)*(house)', 'player inside house') );

	    } //ready
	  
	    public function onkeyup(e) {

	        if(e.value == Input.Keys.escape) {
	            Luxe.shutdown();
	        }

	        if(e.value == Input.Keys.space) {
	            
	            Luxe.events.fire( 'global event' );
	            entity.events.fire( 'local event' );

	            entity.events.fire('player.health.gain', {amount:10});
	            entity.events.fire('player.health.gain', {amount:23});
	            entity.events.fire('player.health.loss', {amount:60});
	            entity.events.fire('player.died', {attacker:'xKillerx'});
	            entity.events.fire('player.spawn', {spawn_node:'spawn12'});
	            entity.events.fire('player.health.gain', {amount:'100'});

	        } //space

	    } //onkeyup

	}




### More examples
---

		var event_id = Luxe.events.listen('debug:event1', function(e) { trace('event listener 1 : ' + e); });

        Luxe.events.listen( 'debug:event1' , function(e){ trace('event listener 2 : ' + e); });
        Luxe.events.listen( 'debug:event1' , function(e){ trace('event listener 3 : ' + e); });

        trace( 'registered debug:event1 ' + event_id ); 

        Luxe.events.fire('debug:event1', {

            name : 'test event',
            date : Date.now()

        });

            //remove one of them
        Luxe.events.disconnect( event_id );

            //now only two listeners
        Luxe.events.fire('debug:event1', {

            name : 'test event',
            date : Date.now()

        });

            //fire next frame
        Luxe.events.queue('debug:event1');
            
            //fire two seconds from now
        Luxe.events.schedule( 2.0 , 'debug:event1');

---

&nbsp;   

###[Back to feature guide](guide.html#events)
###[View all guides](guide.html)

&nbsp;   
&nbsp;   
&nbsp;   