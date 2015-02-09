
import luxe.States;
import Luxe.Ev;

class Parrott {

    public var state:States;

        //This is a simple manager that holds a state system

    public function new() {

        state = new States({ name:'machine' });

        state.add( new TextView(this) );
        state.add( new TileView(this) );

            //This lets you wait until
            //the init functions are called,
            //allowing timing to make sense
        Luxe.on(Ev.init, function(_) {

                //setting a state makes it an active base state,
                //and calls onenter and onleave when the state is changed
                //this would be similar to a "game" state,
                //and then the pause state is added "on top"
            state.set('tileview');

                //if a state is enabled - it's stacked on top of the current active state
                //which is "added" and can be enabled/disabled to stop events/updates.
                //for these - onenabled and ondisabled will be called (init this example pressing t)

                //a simple example of this, is a in game dialog state.
                //It co-exists with the game state, so the game still runs, but so does the dialog
            state.enable('textview');

        }); //on init

    } //new

}

