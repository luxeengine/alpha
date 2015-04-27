
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


    override function ready() {

        Luxe.showConsole(true);

            //Global events connections
        Luxe.events.listen( 'global event' , function(e){
            trace("Global Event Fired");
        });

            //Connect global to local event
        Luxe.events.listen( 'local event' , function(e){
            trace("Should not print");
        });

            //Local to entity event connections
        entity = new Entity({name:'temp'});


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

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

        if(e.keycode == Key.space) {

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


} //Main
